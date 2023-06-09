package pw.bookaholic.author;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.*;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.JdbcTypeCode;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import org.hibernate.type.SqlTypes;
import pw.bookaholic.book.Book;

import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

@Builder
@Entity
@Table
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class Author {
    @Id
//    @GeneratedValue(generator = "UUID")
//    @GenericGenerator(name = "UUID", strategy = "org.hibernate.id.UUIDGenerator")
//    @JdbcTypeCode(SqlTypes.BINARY)
//    @Column(length = 16, columnDefinition = "binary(16)", updatable = false, nullable = false)
    private UUID id;
    @NotNull
    private String name;
    private String avatar;
    private Long born;
    private Long died;

    @OneToMany(mappedBy = "author")
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JsonIgnore
    private Set<Book> books = new HashSet<>();

    private String nationality;
    private String originalLanguage;
}
