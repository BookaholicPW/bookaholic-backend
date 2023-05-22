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

//    public void createMessage(User firstUser, User secondUser, String content){
//        repository.save(new ChatMessage(UUID.randomUUID(), System.currentTimeMillis(), firstUser, content));
//    }
//
//    public void createMessage(User firstUser, User secondUser, String content, String imagleUrl){
//        repository.save(new ChatMessage(UUID.randomUUID(), new Date(), firstUser, secondUser, content, imagleUrl));
//    }

    public static ChatMessageDTO convertChatMessageToResponse(ChatMessage message){
        if (message == null) return null;
        return new ChatMessageDTO(
                message.getId(),
                message.getTime(),
                convertEntityToBase(message.getSender()),
                message.getContent(),
                message.getType()
        );
    }

    public ChatMessage findLastMessage(UUID id) {
        return repository.findTopByChatIdOrderByTimeDesc(id).orElse(null);
    }
}
