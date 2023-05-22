package pw.bookaholic.chat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import pw.bookaholic.chatMessage.ChatMessage;
import pw.bookaholic.user.UserBaseResponse;

import java.util.UUID;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ChatResponse {
    private UUID id;
    private UserBaseResponse user;
    private ChatMessage lastChatMessage;
    private Boolean seen;
}
