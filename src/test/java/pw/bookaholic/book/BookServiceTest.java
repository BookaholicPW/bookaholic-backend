package pw.bookaholic.book;

import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import pw.bookaholic.author.*;

import java.util.*;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;


@SpringBootTest
@RunWith(SpringJUnit4ClassRunner.class)
public class BookServiceTest {

    @Autowired
    BookService bookService;
    @Autowired
    BookRepository bookRepository;
    @Autowired
    BookMapper bookMapper;

    @Test
    public void testGetBookById() {
        Book newBook = Book.builder()
                .id(UUID.fromString("5c49b605-0b76-11ee-98bc-9cfce8633327"))
                .title("The Adventures of Tom Sawyer")
                .published(204249600L)
                .genres(new HashSet<>())
                .characters(new HashSet<>())
                .build();
        bookRepository.save(newBook);
        Object response = bookService.getBookById(UUID.fromString("5c49b605-0b76-11ee-98bc-9cfce8633327"));
        Map<String, Object> expected = new HashMap<>();
        expected.put("success", true);
        expected.put("data", bookMapper.bookToBookDto(newBook));
        expected.put("message", "Successfully found book");
        assertThat(response).usingRecursiveComparison().isEqualTo(expected);
    }

    @Test
    void testGetBooks() {

        List<BookDTO> bookDTOS = new ArrayList<>();
        Book newBook1 = Book.builder()
                .id(UUID.fromString("5c49b605-0b76-11ee-98bc-9cfce8633327"))
                .title("The Adventures of Tom Sawyer")
                .published(204249600L)
                .genres(new HashSet<>())
                .characters(new HashSet<>())
                .build();
        Book newBook2 = Book.builder()
                .id(UUID.fromString("5c54c80f-0b76-11ee-98bc-9cfce8633327"))
                .title("The Lord of the Rings")
                .genres(new HashSet<>())
                .characters(new HashSet<>())
                .published(534950400L)
                .build();
        bookRepository.save(newBook1);
        bookRepository.save(newBook2);
        Object resp = bookService.getListBooks();
        bookDTOS.add(bookMapper.bookToBookDto(newBook1));
        bookDTOS.add(bookMapper.bookToBookDto(newBook2));
        Map<String, Object> expected = new HashMap<>();
        expected.put("success", true);
        expected.put("data", bookDTOS);
        expected.put("message", "Successfully found books");
        assertThat(resp).usingRecursiveComparison().isEqualTo(expected);
    }

}
