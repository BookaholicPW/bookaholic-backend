package pw.bookaholic.author;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.*;
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
public class Author {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private UUID id;
    @NotNull
    private String name;
    private String avatar;
    private Long born;
    private Long died;

    @ManyToMany
    @JoinTable(name = "book_author",
            joinColumns = @JoinColumn(name = "author_id"),
            inverseJoinColumns = @JoinColumn(name = "book_id"))
    private Set<Book> books = new HashSet<>();

    private String nationality;
    private String originalLanguage;
}
