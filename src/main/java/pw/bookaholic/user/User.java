package pw.bookaholic.user;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.*;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import pw.bookaholic.author.Author;
import pw.bookaholic.book.Book;
import pw.bookaholic.bookGenre.Genre;

import java.util.Collection;
import java.util.List;
import java.util.UUID;

@Builder
@Entity
@Table(name = "users")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class User implements UserDetails {
    @Id
    private UUID id;
    @NotNull
    private String email;
    @NotNull
    private String password;
    private String name;
    @Column(unique = true)
    private String username_;
    private String avatar;
    private String bio;
    private Long createdAt;
    private Long updatedAt;
    @ManyToMany(fetch = FetchType.EAGER)
//    @JoinTable(name = "user_book")
    private List<Book> books;
    @ManyToMany(fetch = FetchType.EAGER)
//    @JoinTable(name = "user_author")
    private List<Author> authors;
    @ManyToMany(fetch = FetchType.EAGER)
//    @JoinTable(name = "user_genre")
    private List<Genre> genres;

    public List<Book> getFavoriteBooks() {
        return books;
    }

    public List<Author> getFavoriteAuthors() {
        return authors;
    }

    public List<Genre> getFavoriteGenres() {
        return genres;
    }

    public void setFavoriteBooks(List<Book> books) {
        this.books = books;
    }

    public void setFavoriteAuthors(List<Author> authors) {
        this.authors = authors;
    }

    public void setFavoriteGenres(List<Genre> genres) {
        this.genres = genres;
    }

    private boolean verified = false;

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return null;
    }

    @Override
    public String getUsername() {
        return email;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return verified;
    }
}
