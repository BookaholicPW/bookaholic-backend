package pw.bookaholic.chatMessage;

import lombok.AllArgsConstructor;
import lombok.Data;
import org.springframework.stereotype.Service;
import pw.bookaholic.user.User;

import java.util.Date;
import java.util.NoSuchElementException;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;

import static pw.bookaholic.utils.Utils.response;

@Service
@AllArgsConstructor
public class ChatMessageService {

    private ChatMessageRepository repository;

    private ChatMessageMapper mapper;

    public Date getChatMessageTime(User user){
        ChatMessage message = repository.findBySender(user.getId());
        return message.getTime();
    }

    public Date getChatMessageTime(UUID id){
        ChatMessage message = repository.findById(id).orElseThrow(() -> new NoSuchElementException("No such message."));
        return message.getTime();
    }

    public Object getAllMessagesBySender(User user){
        return response(repository.findAllBySender(user.getId()).stream().map(mapper::chatMessageToChatMessageDto).collect(Collectors.toList()),
                        "Successfully found all messages from sender.");
    }


}
