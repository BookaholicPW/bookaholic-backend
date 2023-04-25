package pw.bookaholic.user;

import lombok.AllArgsConstructor;
import org.modelmapper.ModelMapper;
import org.modelmapper.convention.MatchingStrategies;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import static pw.bookaholic.utils.Utils.response;

@Service
@AllArgsConstructor
public class UserService {
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final ModelMapper modelMapper;

    private UserDto convertEntityToDto(User user) {
        modelMapper.getConfiguration().setMatchingStrategy(MatchingStrategies.LOOSE);
        return modelMapper.map(user, UserDto.class);
    }

    public Object saveUser(User user) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        return convertEntityToDto(userRepository.save(user));
    }

    public Object getUsers() {
        return response(userRepository.findAll().stream()
                .map(this::convertEntityToDto).toList(), "Successful fetching data");
    }
}
