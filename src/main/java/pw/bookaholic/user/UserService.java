package pw.bookaholic.user;

import lombok.AllArgsConstructor;
import org.modelmapper.convention.MatchingStrategies;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import pw.bookaholic.author.Author;
import pw.bookaholic.book.Book;
import pw.bookaholic.bookGenre.Genre;
import pw.bookaholic.matching.MatchingRepository;

import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.UUID;

import static pw.bookaholic.config.ApplicationConfig.modelMapper;
import static pw.bookaholic.config.JwtService.extractUserEmail;
import static pw.bookaholic.utils.Utils.response;

@Service
@AllArgsConstructor
public class UserService {
    @Autowired
    private final UserRepository userRepository;
    @Autowired
    private final MatchingRepository matchingRepository;

    public static UserBaseResponse convertEntityToBase(User user) {
        modelMapper.getConfiguration().setMatchingStrategy(MatchingStrategies.LOOSE);
        UserBaseResponse userBase = modelMapper.map(user, UserBaseResponse.class);
        userBase.setUsername(user.getUsername_());
        return userBase;
    }

    public static String getEmailFromToken(HttpHeaders headers) {
        String token = Objects.requireNonNull(headers.getFirst("authorization")).substring("Bearer ".length());
        return extractUserEmail(token);
    }

    public User getMatchUser(UUID id) {
        List<UUID> userIdsToMatch = new java.util.ArrayList<>(matchingRepository.findFirstUserIds(id).stream().map(m -> m.getFirstUser().getId()).toList());
        userIdsToMatch.addAll(matchingRepository.findSecondUserIds(id).stream().map(m -> m.getSecondUser().getId()).toList());
        List<UUID> userIds = new java.util.ArrayList<>(userRepository.findAll().stream().map(User::getId).toList());
        userIdsToMatch.add(id);
        userIds.removeAll(userIdsToMatch);
        if (userIds.size() == 0)
            return null;
        // get a random UUID from userIds
//        UUID randomUserId = userIds.get((int) (Math.random() * userIds.size()));
        User baseUser = userRepository.findById(id).orElseThrow(() -> new IllegalStateException("User not found!"));
        List<UUID> baseBooks = baseUser.getBooks().stream().map(Book::getId).toList();
        List<UUID> baseAuthors = baseUser.getAuthors().stream().map(Author::getId).toList();
        List<UUID> baseGenres = baseUser.getGenres().stream().map(Genre::getId).toList();
        List<User> targetUsers = userRepository.findAllById(userIds);
        targetUsers.sort((o1, o2) -> {
            List<UUID> books1 = o1.getBooks().stream().map(Book::getId).toList();
            List<UUID> books2 = o2.getBooks().stream().map(Book::getId).toList();
            List<UUID> authors1 = o1.getAuthors().stream().map(Author::getId).toList();
            List<UUID> authors2 = o2.getAuthors().stream().map(Author::getId).toList();
            List<UUID> genres1 = o1.getGenres().stream().map(Genre::getId).toList();
            List<UUID> genres2 = o2.getGenres().stream().map(Genre::getId).toList();
            int score = 0;
            for (UUID book : baseBooks) {
                if (books1.contains(book))
                    score++;
                if (books2.contains(book))
                    score--;
            }
            for (UUID author : baseAuthors) {
                if (authors1.contains(author))
                    score++;
                if (authors2.contains(author))
                    score--;
            }
            for (UUID genre : baseGenres) {
                if (genres1.contains(genre))
                    score++;
                if (genres2.contains(genre))
                    score--;
            }
            if (score == 0)
                return 0;
            return score > 0 ? -1 : 1;
        });
        return targetUsers.get(targetUsers.size()-1);
    }

    public Object updateUser(HttpHeaders headers, UserBaseUpdate user) {
        String email = getEmailFromToken(headers);
        Optional<User> findUserByEmail = userRepository.findByEmail(email);
        if (findUserByEmail.isEmpty())
            throw new IllegalStateException("User not found!");
        User userToUpdate = findUserByEmail.get();
        userToUpdate.setName(user.getName());
        userToUpdate.setUsername_(user.getUsername());
        userToUpdate.setBio(user.getBio());
        userToUpdate.setAvatar(user.getAvatar());
//        userToUpdate.setBooks();
        userToUpdate.setUpdatedAt(System.currentTimeMillis());
        // favoritebook, favoriteauthor, favoritegenre
        User savedUser = userRepository.save(userToUpdate);
        return response(convertEntityToBase(savedUser), "Successfully updated user info");
    }

    public Object getUserInfo(HttpHeaders headers) {
        String email = getEmailFromToken(headers);
        Optional<User> findUserByEmail = userRepository.findByEmail(email);
        if (findUserByEmail.isEmpty())
            throw new IllegalStateException("User not found!");
        return response(convertEntityToBase(findUserByEmail.get()), "Successfully get user info");
    }
}
