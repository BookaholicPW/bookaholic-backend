package pw.bookaholic.bookGenre;

import jakarta.validation.constraints.NotNull;
import lombok.*;
import pw.bookaholic.book.Book;
import pw.bookaholic.book.BookDTO;

import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

@Data
@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class GenreDTO {
    private UUID id;
    @NotNull
    String name;
    private Set<Book> books;
}
