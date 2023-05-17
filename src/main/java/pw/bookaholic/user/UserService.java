package pw.bookaholic.user;

import lombok.AllArgsConstructor;
import org.modelmapper.convention.MatchingStrategies;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;

import java.util.Objects;
import java.util.Optional;

import static pw.bookaholic.config.ApplicationConfig.modelMapper;
import static pw.bookaholic.config.JwtService.extractUserEmail;
import static pw.bookaholic.utils.Utils.response;

@Service
@AllArgsConstructor
public class UserService {
    private final UserRepository userRepository;

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
