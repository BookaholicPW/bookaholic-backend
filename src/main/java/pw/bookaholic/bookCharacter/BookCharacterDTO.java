package pw.bookaholic.bookCharacter;


import lombok.*;
import pw.bookaholic.book.Book;

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
    private Book book;
    //private List<Book> books;

}
