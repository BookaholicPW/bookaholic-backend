package pw.bookaholic.bookCharacter;

import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@RestController
@RequestMapping("/book-characters")
@SecurityRequirement(name = "Bearer Authentication")
@AllArgsConstructor
public class BookCharacterController {
    private final BookCharacterService characterService;

    @GetMapping()
    public ResponseEntity<Object> getAllCharacters() {
        return ResponseEntity.ok().body(characterService.getListCharacters());
    }

    @GetMapping("/{id}")
    public ResponseEntity<Object> getCharacterById(@PathVariable("id") UUID id) {
        return ResponseEntity.ok().body(characterService.getCharacterById(id));
    }

    @GetMapping("/find")
    public ResponseEntity<Object> findBooks(@RequestParam("name") String name) {
        return ResponseEntity.ok().body(characterService.getCharacterByName(name));
    }

    @PostMapping()
    public ResponseEntity<Object> postCharacter(@RequestBody BookCharacterDTO bookCharacterDTO) {
        return ResponseEntity.ok().body(characterService.addBookCharacter(bookCharacterDTO));
    }

}
