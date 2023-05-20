package pw.bookaholic.author;

import jakarta.persistence.Id;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.UUID;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
public class AuthorMin {
    @Id
    private UUID id;
    @NotNull
    private String name;
    private String avatar;
    private Long born;
    private Long died;
    private String nationality;
    private String originalLanguage;
}
