package pw.bookaholic.user;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.UUID;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserBase {
    private UUID id;
    private String email;
    private String name;
    private String avatar;
    private String bio;
    private Long createdAt;
    private Long updatedAt;
}
