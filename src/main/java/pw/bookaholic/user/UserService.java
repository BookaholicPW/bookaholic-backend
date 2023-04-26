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

    public static UserBase convertEntityToBase(User user) {
        modelMapper.getConfiguration().setMatchingStrategy(MatchingStrategies.LOOSE);
        return modelMapper.map(user, UserBase.class);
    }

    public static String getEmailFromToken(HttpHeaders headers) {
        String token = Objects.requireNonNull(headers.getFirst("authorization")).substring("Bearer ".length());
        return extractUserEmail(token);
    }

    public Object updateUser(HttpHeaders headers, UserBase user) {
        String email = getEmailFromToken(headers);
        Optional<User> findUserByEmail = userRepository.findByEmail(email);
        if (findUserByEmail.isEmpty())
            throw new IllegalStateException("User not found!");
        User userToUpdate = findUserByEmail.get();
        userToUpdate.setBio(user.getBio());
        userToUpdate.setAvatar(user.getAvatar());
        userToUpdate.setUpdatedAt(System.currentTimeMillis());
        // favoritebook, favoriteauthor, favoritegenre
        return response(convertEntityToBase(userRepository.save(userToUpdate)), "Successfully updated");
    }

    public Object getUserInfo(HttpHeaders headers) {
        String email = getEmailFromToken(headers);
        Optional<User> findUserByEmail = userRepository.findByEmail(email);
        if (findUserByEmail.isEmpty())
            throw new IllegalStateException("User not found!");
        return response(convertEntityToBase(findUserByEmail.get()), "Successfully get user info");
    }
}
