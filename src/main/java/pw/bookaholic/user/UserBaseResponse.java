package pw.bookaholic.user;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.UUID;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserBaseResponse {
    private UUID id;
    private String email;
    private String name;
    private String username;
    private String avatar;
    private String bio;
    private Long createdAt;
    private Long updatedAt;
}
