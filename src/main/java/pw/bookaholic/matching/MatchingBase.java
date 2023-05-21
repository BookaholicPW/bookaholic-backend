package pw.bookaholic.matching;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import pw.bookaholic.user.UserBaseResponse;

import java.util.UUID;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MatchingBase {
    private UUID id;
    private UserBaseResponse firstUser;
    private UserBaseResponse secondUser;
    private Boolean firstUserLiked;
    private Boolean secondUserLiked;
}
