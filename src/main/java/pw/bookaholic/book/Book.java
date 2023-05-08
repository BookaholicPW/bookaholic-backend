package pw.bookaholic.book;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.*;
import pw.bookaholic.author.Author;
import pw.bookaholic.bookCharacter.BookCharacter;

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
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private UUID id;
    @NotNull
    private String title;
    private String description;

    @ManyToMany
    @JoinTable(name = "book_author",
            joinColumns = @JoinColumn(name = "book_id"),
            inverseJoinColumns = @JoinColumn(name = "author_id"))
    private Set<Author> authors = new HashSet<>();

//    @ManyToMany
//    @JoinTable(name = "book_genre",
//            joinColumns = @JoinColumn(name = "book_id"),
//            inverseJoinColumns = @JoinColumn(name = "genre_id"))
//    private Set<Genre> genres = new HashSet<>();

//    @OneToMany(mappedBy = "book")
//    private Set<BookCharacter> characters = new HashSet<>();

    private String cover;
    private Integer pages;
    private Long published;

}
