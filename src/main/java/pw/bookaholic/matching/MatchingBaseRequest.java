package pw.bookaholic.matching;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.UUID;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MatchingBaseRequest {
    private UUID id;
    private Boolean firstUserLiked;
    private Boolean secondUserLiked;
}
