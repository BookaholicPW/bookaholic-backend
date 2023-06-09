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

    @GetMapping("/{id}")
    public ResponseEntity<Object> getAuthorById(@PathVariable("id") UUID id) {
        return ResponseEntity.ok().body(authorService.getAuthorById(id));
    }

    @GetMapping("/find")
    public ResponseEntity<Object> findAuthors(@RequestParam("name") String name) {
        return ResponseEntity.ok().body(authorService.getAuthorListByName(name));
    }

    @PostMapping()
    public ResponseEntity<Object> postAuthor(@RequestBody AuthorDTO authorDTO) throws AlreadyExistsException {
        return ResponseEntity.ok().body(authorService.addNewAuthor(authorDTO));
    }
}
