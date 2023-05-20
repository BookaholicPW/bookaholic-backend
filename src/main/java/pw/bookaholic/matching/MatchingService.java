package pw.bookaholic.matching;

import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import pw.bookaholic.user.User;
import pw.bookaholic.user.UserRepository;
import pw.bookaholic.user.UserService;

import java.util.UUID;

import static pw.bookaholic.user.UserService.getEmailFromToken;

@Service
@AllArgsConstructor
public class MatchingService {
    @Autowired
    private final MatchingRepository matchingRepository;
    @Autowired
    private final UserRepository userRepository;
    @Autowired
    private final UserService userService;

    public Object getSuggestedProfile(HttpHeaders headers) {
        String email = getEmailFromToken(headers);
        User findUserByEmail = userRepository
                .findByEmail(email)
                .orElseThrow(() ->
                        new IllegalStateException("User not found!"));
        Matching matchFirst = matchingRepository
                .findByFirstUser(findUserByEmail.getId())
                .orElseThrow(null);
        System.out.println("Find matchFirst!!!");
        Matching matchSecond = matchingRepository
                .findBySecondUser(findUserByEmail.getId())
                .orElseThrow(null);
        System.out.println("Find matchSecond!!!");
        if (matchFirst != null)
            return matchFirst;
        if (matchSecond != null)
            return matchSecond;
        User randomUser = userService.getMatchUser(findUserByEmail.getId());
        System.out.println("Find new match!!!");
        if (randomUser == null)
            throw new IllegalStateException("No more users to match!");
        Matching newMatch = new Matching(UUID.randomUUID(), findUserByEmail, randomUser, null, null);
        return matchingRepository.save(newMatch);
    }
}
