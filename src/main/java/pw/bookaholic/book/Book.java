package pw.bookaholic.book;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.*;
import org.hibernate.annotations.GenericGenerator;
import pw.bookaholic.author.Author;
import pw.bookaholic.bookCharacter.BookCharacter;
import pw.bookaholic.bookGenre.Genre;

import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

@Entity
@Table
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Book {
    @Id
    @GeneratedValue(generator = "UUID")
    @GenericGenerator(name = "UUID", strategy = "org.hibernate.id.UUIDGenerator")
    private UUID id = UUID.randomUUID();

    @NotNull
    private String title;
    private String description;

    @ManyToOne
    @JoinColumn(name="author_id")
    private Author author;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "book_genre",
            joinColumns = @JoinColumn(name = "book_id"),
            inverseJoinColumns = @JoinColumn(name = "genre_id"))
    @JsonIgnore
    private Set<Genre> genres = new HashSet<>();

    @OneToMany(mappedBy = "book")
    @JsonIgnore
    private Set<BookCharacter> characters = new HashSet<>();

    private String cover;
    private Integer pages;
    private Long published;

}
