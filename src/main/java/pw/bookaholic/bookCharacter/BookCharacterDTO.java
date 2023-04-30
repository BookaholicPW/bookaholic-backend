package pw.bookaholic.bookCharacter;


import lombok.*;

import java.util.List;
import java.util.UUID;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
public class BookCharacterDTO {
    private UUID id;
    private String name;

    //private List<Book> books;

}
