package pw.bookaholic.bookGenre;


import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import pw.bookaholic.exceptions.AlreadyExistsException;

import java.util.UUID;

@RestController
@RequestMapping("/book-genres")
@SecurityRequirement(name = "Bearer Authentication")
@AllArgsConstructor
public class GenreController {
    private final GenreService genreService;

    @GetMapping()
    public ResponseEntity<Object> getAllGenres() {
        return ResponseEntity.ok().body(genreService.getListGenres());
    }

    @GetMapping("/{id}")
    public ResponseEntity<Object> getGenreById(@PathVariable("id") UUID id) {
        return ResponseEntity.ok().body(genreService.getGenreById(id));
    }

    @PostMapping()
    public ResponseEntity<Object> postGenre(@RequestBody GenreDTO genreDTO) throws AlreadyExistsException {
        return ResponseEntity.ok().body(genreService.addNewGenre(genreDTO));
    }

}
