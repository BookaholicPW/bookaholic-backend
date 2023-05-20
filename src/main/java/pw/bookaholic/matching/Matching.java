package pw.bookaholic.matching;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import pw.bookaholic.user.User;

import java.util.UUID;

@Builder
@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Matching {
    @Id
    private UUID id;
    @ManyToOne
    @OnDelete(action = OnDeleteAction.CASCADE)
    private User firstUser;
    @ManyToOne
    @OnDelete(action = OnDeleteAction.CASCADE)
    private User secondUser;
    private Boolean firstUserLiked;
    private Boolean secondUserLiked;
}
