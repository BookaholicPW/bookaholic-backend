package pw.bookaholic.author;

import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import pw.bookaholic.exceptions.AlreadyExistsException;

import java.util.UUID;

@RestController
@RequestMapping("/book-authors")
@SecurityRequirement(name = "Bearer Authentication")
public class AuthorController {

    private final AuthorService authorService;

    public AuthorController(AuthorService authorService) {
        this.authorService = authorService;
    }


    @GetMapping()
    public ResponseEntity<Object> getAllAuthors() {
        return ResponseEntity.ok().body(authorService.getListAuthors());
    }

    @GetMapping("/id")
    public ResponseEntity<Object> getAuthorById(@PathVariable("id") UUID id) {
        if( authorService.getAuthorById(id).isEmpty()) {
            throw new RuntimeException("not found id");
        }
        return ResponseEntity.ok().body(authorService.getAuthorById(id));
    }

    @PostMapping()
    public ResponseEntity<Object> postAuthor(@RequestBody AuthorDTO authorDTO) throws AlreadyExistsException {
        return ResponseEntity.ok().body(authorService.addNewAuthor(authorDTO));
    }
}
