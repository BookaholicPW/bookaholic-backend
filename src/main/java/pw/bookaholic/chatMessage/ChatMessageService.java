package pw.bookaholic.chatMessage;

import lombok.AllArgsConstructor;
import lombok.Data;
import org.springframework.stereotype.Service;
import pw.bookaholic.user.User;
import pw.bookaholic.user.UserBaseResponse;

import java.util.*;
import java.util.stream.Collectors;

import static pw.bookaholic.user.UserService.convertEntityToBase;
import static pw.bookaholic.utils.Utils.response;

@Service
@AllArgsConstructor
public class ChatMessageService {

    private ChatMessageRepository repository;

    public void createMessage(User firstUser, User secondUser, String content){
        repository.save(new ChatMessage(UUID.randomUUID(), new Date(), firstUser, secondUser, content));
    }

    public void createMessage(User firstUser, User secondUser, String content, String imagleUrl){
        repository.save(new ChatMessage(UUID.randomUUID(), new Date(), firstUser, secondUser, content, imagleUrl));
    }

    public static ChatMessageDTO convertEntityToResponse(UUID id, Date time, User user, String content, String imageUrl){
        return new ChatMessageDTO(id, time, convertEntityToBase(user), content, imageUrl);
    }

    public ChatMessage findLatestByUsers(UUID id1, UUID id2){
        List<ChatMessage> messages = repository.findAllByFirstUserAndSecondUser(id1, id2);
        return messages.stream().max(Comparator.comparing(ChatMessage::getTime)).orElse(null);
    }

}
