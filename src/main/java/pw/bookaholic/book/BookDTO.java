package pw.bookaholic.book;

import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import pw.bookaholic.author.Author;
import java.util.HashSet;
import pw.bookaholic.bookGenre.Genre;
import pw.bookaholic.bookCharacter.BookCharacter;

import java.util.Set;
import java.util.UUID;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
public class BookDTO {
    private UUID id;
    @NotNull
    private String title;
    private String description;
    private String cover;
    private Integer pages;
    private Long published;
    private Set<Author> authors;
    private Set<Genre> genres;
    private Set<BookCharacter> characters;
}
