package pw.bookaholic.chat;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import lombok.*;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import pw.bookaholic.chatMessage.ChatMessage;
import pw.bookaholic.user.User;

import java.util.UUID;

@Builder
@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Chat {
    @Id
    private UUID id;
    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
    @ManyToOne
    @OnDelete(action = OnDeleteAction.CASCADE)
    private User firstUser;
    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
    @ManyToOne
    @OnDelete(action = OnDeleteAction.CASCADE)
    private User secondUser;
    @OneToOne
    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
    private ChatMessage lastChatMessage;
    private Boolean seen;
}
