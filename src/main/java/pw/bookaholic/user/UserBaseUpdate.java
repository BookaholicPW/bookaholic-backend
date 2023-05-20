package pw.bookaholic.user;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import pw.bookaholic.author.AuthorId;
import pw.bookaholic.book.BookId;
import pw.bookaholic.bookGenre.GenreId;

import java.util.Collection;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserBaseUpdate {
    private String name;
    private String username;
    private String avatar;
    private String bio;
    private Collection<BookId> books;
    private Collection<AuthorId> authors;
    private Collection<GenreId> genres;
}
