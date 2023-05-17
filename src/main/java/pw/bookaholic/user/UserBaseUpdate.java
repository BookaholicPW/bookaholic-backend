package pw.bookaholic.user;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserBaseUpdate {
    private String name;
    private String avatar;
    private String bio;
}
