package pw.bookaholic.chatMessage;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.*;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import pw.bookaholic.user.User;

import java.util.Date;
import java.util.UUID;

@Builder
@Entity
@Table
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class ChatMessage {

    @Id
    @GeneratedValue(generator = "UUID")
    @GenericGenerator(name = "UUID", strategy = "org.hibernate.id.UUIDGenerator")
    private UUID id;

    @NotNull
    private Date time;

    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
    @ManyToOne
    @OnDelete(action = OnDeleteAction.CASCADE)
    private User firstUser;

    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
    @ManyToOne
    @OnDelete(action = OnDeleteAction.CASCADE)
    private User secondUser;

    @NotNull
    private String content;

    private String imgUrl;


    public ChatMessage(UUID randomUUID, Date date, User firstUser, User secondUser, String content) {
        this.id = randomUUID;
        this.time = date;
        this.firstUser = firstUser;
        this.secondUser = secondUser;
        this.content = content;
    }
}
