package pw.bookaholic.user;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import pw.bookaholic.author.AuthorMin;
import pw.bookaholic.book.BookMin;
import pw.bookaholic.bookGenre.GenreMin;

import java.util.Collection;
import java.util.UUID;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserBaseResponse {
    private UUID id;
    private String email;
    private String name;
    private String username;
    private String avatar;
    private String bio;
    private Long createdAt;
    private Long updatedAt;
    private Collection<BookMin> books;
    private Collection<AuthorMin> authors;
    private Collection<GenreMin> genres;
}
