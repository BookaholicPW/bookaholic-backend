package pw.bookaholic.user;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import pw.bookaholic.author.AuthorId;
import pw.bookaholic.book.BookId;
import pw.bookaholic.bookGenre.GenreId;

import java.util.Collection;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserBaseUpdate {
    private String name;
    private String username;
    private String avatar;
    private String bio;
    private List<BookId> books;
    private List<AuthorId> authors;
    private List<GenreId> genres;
}
