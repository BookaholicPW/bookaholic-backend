package pw.bookaholic.matching;

import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import pw.bookaholic.user.User;
import pw.bookaholic.user.UserRepository;
import pw.bookaholic.user.UserService;

import java.util.List;
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
        System.out.println("Get match first user");
        List<Matching> matchFirst = matchingRepository
                .findByFirstUser(findUserByEmail.getId());
        System.out.println("Get match second user");
        List<Matching> matchSecond = matchingRepository
                .findBySecondUser(findUserByEmail.getId());
        System.out.println("Check first users");
        if (!matchFirst.isEmpty())
            return matchFirst.get((int) (Math.random() * matchFirst.size()));
        System.out.println("Check second users");
        if (!matchSecond.isEmpty())
            return matchSecond.get((int) (Math.random() * matchSecond.size()));
        System.out.println("Find random!!!");
        User randomUser = userService.getMatchUser(findUserByEmail.getId());
        System.out.println("Find new match!!!");
        if (randomUser == null)
            throw new IllegalStateException("No more users to match!");
        Matching newMatch = new Matching(UUID.randomUUID(), findUserByEmail, randomUser, null, null);
        return matchingRepository.save(newMatch);
    }
}
