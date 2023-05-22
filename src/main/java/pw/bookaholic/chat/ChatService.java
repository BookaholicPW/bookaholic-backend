package pw.bookaholic.chat;

import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import pw.bookaholic.chatMessage.ChatMessage;
import pw.bookaholic.chatMessage.ChatMessageService;
import pw.bookaholic.user.User;
import pw.bookaholic.user.UserRepository;

import java.util.List;
import java.util.NoSuchElementException;
import java.util.UUID;

import static pw.bookaholic.user.UserService.convertEntityToBase;
import static pw.bookaholic.user.UserService.getEmailFromToken;
import static pw.bookaholic.utils.Utils.response;

@Service
@AllArgsConstructor
public class ChatService {
    @Autowired
    private final ChatRepository chatRepository;
    @Autowired
    private final UserRepository userRepository;

    @Autowired
    private final ChatMessageService messageService;

    public static ChatResponse convertEntityToResponse(UUID id, User user, ChatMessage lastChatMessage, Boolean seen) {
        return new ChatResponse(
                id,
                convertEntityToBase(user),
                lastChatMessage,
                seen
        );
    }

    public Object getAllChats(HttpHeaders headers) {
        String email = getEmailFromToken(headers);
        User baseUser = userRepository
                .findByEmail(email)
                .orElseThrow(() ->
                        new NoSuchElementException("User not found!"));
        List<Chat> chats = chatRepository.findAllByFirstUserOrSecondUser(baseUser.getId());
        List<ChatResponse> chatResponses = chats.stream().map(c -> {
            //ChatMessage lastChatMessage = null; // TODO: implement last-chat-message
            ChatMessage lastChatMessage = messageService.findLatestByUsers(c.getFirstUser().getId(), c.getSecondUser().getId());
            User user = baseUser.getId().equals(c.getFirstUser().getId()) ? c.getSecondUser() : c.getFirstUser();
            return convertEntityToResponse(c.getId(), user, lastChatMessage, c.getSeen());
        }).toList();
        return response(chatResponses, "All chats found!");
    }

    public void createChat(User firstUser, User secondUser) {
        if (chatRepository.existsByFirstUserAndSecondUser(firstUser.getId(), secondUser.getId()).isEmpty())
            chatRepository.save(new Chat(UUID.randomUUID(), firstUser, secondUser, null, false));
    }
}
