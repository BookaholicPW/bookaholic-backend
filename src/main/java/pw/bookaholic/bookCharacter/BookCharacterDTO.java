package pw.bookaholic.bookCharacter;


import lombok.*;
import pw.bookaholic.book.Book;
import pw.bookaholic.book.BookDTO;

import java.util.List;
import java.util.UUID;

@Data
@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class BookCharacterDTO {
    private UUID id;
    private String name;
    private Book book;

}
