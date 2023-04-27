package pw.bookaholic.author;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;
import lombok.*;

import java.util.UUID;

@Builder
@Entity
@Table
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class Author {
    @Id
    private UUID id;
    @NotNull
    private String name;
    private String avatar;
    private Long born;
    private Long died;
    // private List<Book> books;
    private String nationality;
    private String originalLanguage;
}
