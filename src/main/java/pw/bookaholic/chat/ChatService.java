package pw.bookaholic.chat;

import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import pw.bookaholic.user.User;
import pw.bookaholic.user.UserRepository;

import java.util.NoSuchElementException;

import static pw.bookaholic.user.UserService.getEmailFromToken;
import static pw.bookaholic.utils.Utils.response;

@Service
@AllArgsConstructor
public class ChatService {
    @Autowired
    private final ChatRepository chatRepository;
    @Autowired
    private final UserRepository userRepository;

    public Object getAllchats(HttpHeaders headers) {
        String email = getEmailFromToken(headers);
        User findUserByEmail = userRepository
                .findByEmail(email)
                .orElseThrow(() ->
                        new NoSuchElementException("User not found!"));
        return response(chatRepository.findAllByFirstUserOrSecondUser(findUserByEmail.getId()), "All chats found!");
    }
}
