package pw.bookaholic.bookGenre;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.*;
import org.hibernate.annotations.GenericGenerator;
import pw.bookaholic.book.Book;

import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

@Builder
@Entity
@Table
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class Genre {
    @Id
    @GeneratedValue(generator = "UUID")
    @GenericGenerator(name = "UUID", strategy = "org.hibernate.id.UUIDGenerator")
    private UUID id = UUID.randomUUID();
    @NotNull
    String name;

    @ManyToMany(fetch = FetchType.EAGER,
            cascade = {
                    CascadeType.MERGE
            },
            mappedBy = "genres")
    @JsonIgnore
    private Set<Book> books = new HashSet<>();



}
