package pw.bookaholic.bookCharacter;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.*;

import java.util.UUID;

@Builder
@Entity
@Table
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class BookCharacter {

    @Id
    private UUID id;

    private String name;

    //private List<Book> books;
}
