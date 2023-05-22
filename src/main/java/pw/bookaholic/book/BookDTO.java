package pw.bookaholic.book;

import jakarta.validation.constraints.NotNull;
import lombok.*;
import pw.bookaholic.author.Author;
import java.util.HashSet;

import pw.bookaholic.author.AuthorDTO;
import pw.bookaholic.bookCharacter.BookCharacterDTO;
import pw.bookaholic.bookCharacter.BookCharacterMapper;
import pw.bookaholic.bookGenre.Genre;
import pw.bookaholic.bookCharacter.BookCharacter;
import pw.bookaholic.bookGenre.GenreDTO;

import java.util.Set;
import java.util.UUID;

@Builder
@Data
@Getter
@Setter
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
    private AuthorDTO author;
    private Set<GenreDTO> genres;
    private Set<BookCharacterDTO> characters;
}
