package pw.bookaholic.user;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
import java.util.UUID;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserBaseUpdate {
    private String name;
    private String username;
    private String avatar;
    private String bio;
    private List<UUID> favoriteBooks;
    private List<UUID> favoriteAuthors;
    private List<UUID> favoriteGenres;
}
