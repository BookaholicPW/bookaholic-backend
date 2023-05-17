package pw.bookaholic.book;

import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@RestController
@RequestMapping("/books")
@SecurityRequirement(name = "Bearer Authentication")
@AllArgsConstructor
public class BookController {

    private final BookService bookService;
    @GetMapping()
    public ResponseEntity<Object> getAllBooks() {
        return ResponseEntity.ok().body(bookService.getListBooks());
    }

    @GetMapping("/{id}")
    public ResponseEntity<Object> getBookById(@PathVariable("id") UUID id) {
        return ResponseEntity.ok().body(bookService.getBookById(id));
    }

    @GetMapping("/find")
    public ResponseEntity<Object> findBooks(@RequestParam("term") String term) {
        return ResponseEntity.ok().body(bookService.findBooksByTitle(term));
    }

    @PostMapping()
    public ResponseEntity<Object> postBook(@RequestBody BookDTO bookDTO) throws Exception {
        return ResponseEntity.ok().body(bookService.addBook(bookDTO));
    }

}
