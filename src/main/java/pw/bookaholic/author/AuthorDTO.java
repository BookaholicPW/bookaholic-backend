package pw.bookaholic.author;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.*;
import pw.bookaholic.book.Book;
import pw.bookaholic.book.BookDTO;

import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

@Builder
@Data
public class AuthorDTO {
    @Id
    private UUID id;
    @NotNull
    private String name;
    private String avatar;
    private Long born;
    private Long died;
    private Set<Book> books;
    private String nationality;
    private String originalLanguage;
}