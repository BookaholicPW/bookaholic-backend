package pw.bookaholic.matching;

import lombok.AllArgsConstructor;
import org.modelmapper.convention.MatchingStrategies;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import pw.bookaholic.user.User;
import pw.bookaholic.user.UserBaseResponse;
import pw.bookaholic.user.UserRepository;
import pw.bookaholic.user.UserService;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

import static pw.bookaholic.config.ApplicationConfig.modelMapper;
import static pw.bookaholic.user.UserService.getEmailFromToken;
import static pw.bookaholic.utils.Utils.response;

@Service
@AllArgsConstructor
public class MatchingService {
    @Autowired
    private final MatchingRepository matchingRepository;
    @Autowired
    private final UserRepository userRepository;
    @Autowired
    private final UserService userService;

    public static MatchingBase convertEntityToBase(Matching matching) {
        modelMapper.getConfiguration().setMatchingStrategy(MatchingStrategies.LOOSE);
        MatchingBase matchingBase = modelMapper.map(matching, MatchingBase.class);
        matchingBase.setFirstUser(UserService.convertEntityToBase(matching.getFirstUser()));
        matchingBase.setSecondUser(UserService.convertEntityToBase(matching.getSecondUser()));
        return matchingBase;
    }

    public Object getSuggestedProfile(HttpHeaders headers) {
        String email = getEmailFromToken(headers);
        User findUserByEmail = userRepository
                .findByEmail(email)
                .orElseThrow(() ->
                        new IllegalStateException("User not found!"));
        Optional<Matching> matchFirst = matchingRepository
                .findByFirstUser(findUserByEmail.getId());
        Optional<Matching> matchSecond = matchingRepository
                .findBySecondUser(findUserByEmail.getId());
        if (matchFirst.isPresent())
            return response(convertEntityToBase(matchFirst.get()), "Suggested profile found!");
        if (matchSecond.isPresent())
            return response(convertEntityToBase(matchSecond.get()), "Suggested profile found!");
        User randomUser = userService.getMatchUser(findUserByEmail.getId());
        if (randomUser == null)
            throw new IllegalStateException("No more users to match!");
        Matching newMatch = new Matching(UUID.randomUUID(), findUserByEmail, randomUser, null, null);
        return response(convertEntityToBase(matchingRepository.save(newMatch)), "Suggested profile found!");
    }
}
