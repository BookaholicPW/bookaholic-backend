package pw.bookaholic.verification;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import pw.bookaholic.user.User;

import java.time.LocalDateTime;


@Getter
@Setter
@NoArgsConstructor
@Entity
public class VerificationToken {

    // sequence
    @Id
    private Long id;
    @Column(nullable=false)
    private String token;
    @Column(nullable=false)
    private LocalDateTime createdAt;
    @Column(nullable=false)
    private LocalDateTime expiresAt;
    private LocalDateTime confirmedAt;

    @ManyToOne
    @JoinColumn(
            nullable = false,
            name= "user_id"
    )
    private User user;

    public VerificationToken(String token, LocalDateTime createdAt, LocalDateTime expiredAt, User user) {
        this.token = token;
        this.createdAt = createdAt;
        this.expiresAt = expiredAt;
        this.user = user;
    }

}
