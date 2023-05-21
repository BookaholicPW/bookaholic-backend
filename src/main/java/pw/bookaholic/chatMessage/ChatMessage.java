package pw.bookaholic.chatMessage;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.*;
import org.hibernate.annotations.GenericGenerator;
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

    @ManyToOne
    @JoinColumn(name="user_id")
    private User sender;

    @NotNull
    private String content;

    private String imgUrl;


}
