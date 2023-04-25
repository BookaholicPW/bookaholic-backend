package pw.bookaholic.user;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserDto {
    private Long id;
    private String email;
    private String password;
    private String name;
    private String avatar;
    private String bio;
    private Long createdAt;
    private Long updatedAt;
}
