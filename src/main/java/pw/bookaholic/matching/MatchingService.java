package pw.bookaholic.matching;

import jakarta.persistence.NoResultException;
import lombok.AllArgsConstructor;
import org.modelmapper.convention.MatchingStrategies;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import pw.bookaholic.chat.ChatService;
import pw.bookaholic.user.User;
import pw.bookaholic.user.UserBaseResponse;
import pw.bookaholic.user.UserRepository;
import pw.bookaholic.user.UserService;

import java.util.*;

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
    @Autowired
    private final ChatService chatService;

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
                        new NoSuchElementException("User not found!"));
        Optional<Matching> matchFirst = matchingRepository
                .findByFirstUser(findUserByEmail.getId());
        Optional<Matching> matchSecond = matchingRepository
                .findBySecondUser(findUserByEmail.getId());
        if (matchFirst.isPresent())
            return response(convertEntityToBase(matchFirst.get()), "Suggested profile found!");
        if (matchSecond.isPresent()) {
            return response(convertEntityToBase(matchSecond.get()), "Suggested profile found!");
        }
        User randomUser = userService.getMatchUser(findUserByEmail.getId());
        if (randomUser == null)
            throw new NoResultException("No more users to match!");
        Matching newMatch = new Matching(UUID.randomUUID(), findUserByEmail, randomUser, null, null);
        return response(convertEntityToBase(matchingRepository.save(newMatch)), "Suggested profile found!");
    }

    public Object answerSuggestedProfile(HttpHeaders headers, MatchingBaseRequest matchingBaseRequest) {
        String email = getEmailFromToken(headers);
        User findUserByEmail = userRepository
                .findByEmail(email)
                .orElseThrow(() ->
                        new NoResultException("User not found!"));
        Matching matching = matchingRepository
                .findById(matchingBaseRequest.getId())
                .orElseThrow(() ->
                        new NoResultException("Matching not found!"));
        if (!(matching.getFirstUser().getId().equals(findUserByEmail.getId()) || matching.getSecondUser().getId().equals(findUserByEmail.getId())))
            throw new IllegalStateException("User are not permitted to answer this matching!");
        if (matchingBaseRequest.getAnswer().equals("like")) {
            if (matching.getFirstUser().getId().equals(findUserByEmail.getId()))
                matching.setFirstUserLiked(true);
            else
                matching.setSecondUserLiked(true);
        }
        else if (matchingBaseRequest.getAnswer().equals("dislike")) {
            if (matching.getFirstUser().getId().equals(findUserByEmail.getId()))
                matching.setFirstUserLiked(false);
            else
                matching.setSecondUserLiked(false);
        }
        else
            throw new RuntimeException("Answer is not valid!");
        matchingRepository.save(matching);
        Map<String, Boolean> result = new HashMap<>();
        if (matching.getFirstUserLiked() == Boolean.TRUE && matching.getSecondUserLiked() == Boolean.TRUE) {
            chatService.createChat(matching.getFirstUser(), matching.getSecondUser());
            result.put("matched", Boolean.TRUE);
            return response(result, "Matched!");
        }
        result.put("matched", Boolean.FALSE);
        return response(result, "Not matched!");
    }
}
