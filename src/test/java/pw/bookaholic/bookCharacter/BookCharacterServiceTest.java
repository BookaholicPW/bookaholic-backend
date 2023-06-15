package pw.bookaholic.bookCharacter;

import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import pw.bookaholic.author.*;

import javax.security.auth.callback.CallbackHandler;
import java.util.*;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;

@SpringBootTest
@RunWith(SpringJUnit4ClassRunner.class)
public class BookCharacterServiceTest {

    @Autowired
    BookCharacterService service;
    @Autowired
    BookCharacterRepository repository;
    @Autowired
    BookCharacterMapper mapper;

    @Test
    public void testGetCharacterById() {
        BookCharacter character = BookCharacter.builder()
                .id(UUID.fromString("5c666e02-0b76-11ee-98bc-9cfce8633327"))
                .name("Captain Flint")
                .build();
        repository.save(character);
        Object response = service.getCharacterById(UUID.fromString("5c666e02-0b76-11ee-98bc-9cfce8633327"));
        Map<String, Object> expected = new HashMap<>();
        expected.put("success", true);
        expected.put("data", mapper.bookCharToBookCharDto(character));
        expected.put("message", "Successfully found character");
        assertThat(response).usingRecursiveComparison().isEqualTo(expected);
    }

    @Test
    void testGetCharacters() {
        List<BookCharacterDTO> characterDTOS = new ArrayList<>();
        BookCharacter character1 = BookCharacter.builder()
                .id(UUID.fromString("5c666e02-0b76-11ee-98bc-9cfce8633327"))
                .name("Captain Flint")
                .build();
        BookCharacter character2 = BookCharacter.builder()
                .id(UUID.fromString("5c666a99-0b76-11ee-98bc-9cfce8633327"))
                .name("Long John Silver")
                .build();
        repository.save(character1);
        repository.save(character2);
        Object resp = service.getListCharacters();
        characterDTOS.add(mapper.bookCharToBookCharDto(character1));
        characterDTOS.add(mapper.bookCharToBookCharDto(character2));
        Map<String, Object> expected = new HashMap<>();
        expected.put("success", true);
        expected.put("data", characterDTOS);
        expected.put("message", "Successfully found book characters");
        assertThat(resp).usingRecursiveComparison().isEqualTo(expected);
    }

}