package pw.bookaholic.chatMessage;

import lombok.Builder;
import lombok.Data;
import pw.bookaholic.user.User;

import java.util.Date;
import java.util.UUID;

@Data
@Builder
public class ChatMessageDTO {

    private UUID id;
    private Date time;
    private User sender;
    private String content;
    private String imageUrl;

}
