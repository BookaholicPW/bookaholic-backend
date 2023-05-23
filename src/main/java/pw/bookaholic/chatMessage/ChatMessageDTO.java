package pw.bookaholic.chatMessage;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import pw.bookaholic.user.User;
import pw.bookaholic.user.UserBaseResponse;

import java.util.Date;
import java.util.UUID;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ChatMessageDTO {
    private UUID id;
    private Long time;
    private UserBaseResponse sender;
    private String content;
    private String type;
}
