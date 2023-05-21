package pw.bookaholic.chatMessage;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class ChatMessageService {

    private ChatMessageRepository repository;

    private ChatMessageMapper mapper;



}
