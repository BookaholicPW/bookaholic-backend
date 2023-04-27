package pw.bookaholic.auth;

import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import pw.bookaholic.config.JwtService;
import pw.bookaholic.user.User;
import pw.bookaholic.user.UserRepository;

import java.util.UUID;

import static pw.bookaholic.user.UserService.convertEntityToBase;
import static pw.bookaholic.utils.Utils.response;

@Service
@RequiredArgsConstructor
public class AuthenticationService {
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final JwtService jwtService;
    private final AuthenticationManager authenticationManager;

    public Object register(RegisterRequest request) {
        if (userRepository.existsByEmail(request.getEmail()))
            throw new RuntimeException("Email already exists");
        if (!request.getEmail().matches("^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$"))
            throw new RuntimeException("Invalid email");
        if (!(request.getPassword().length() >= 8))
            throw new RuntimeException("Password must be at least 8 characters");
        var user = User.builder()
                .email(request.getEmail())
                .password(passwordEncoder.encode(request.getPassword()))
                .build();
        user.setCreatedAt(System.currentTimeMillis());
        user.setUpdatedAt(System.currentTimeMillis());
        user.setId(UUID.randomUUID());
        User savedUser = userRepository.save(user);
        return response(convertEntityToBase(savedUser), "Successfully registered");
    }

    public Object authenticate(AuthenticationRequest request) {
        authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(
                        request.getEmail(),
                        request.getPassword()
                )
        );
        var user = userRepository.findByEmail(request.getEmail())
                .orElseThrow();
        var jwtToken = jwtService.generateToken(user);
        return response(AuthenticationResponse.builder()
                .token(jwtToken)
                .build(), "Successfully authenticated");
//        return AuthenticationResponse.builder()
//                .token(jwtToken)
//                .build();
    }
}
