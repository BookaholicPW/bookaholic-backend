package pw.bookaholic.genre;

import jakarta.transaction.Transactional;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import pw.bookaholic.author.*;
import pw.bookaholic.bookGenre.*;

import java.util.*;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;


@SpringBootTest
@RunWith(SpringJUnit4ClassRunner.class)
public class GenreServiceTest {

    @Autowired
    GenreService genreService;
    @Autowired
    GenreRepository genreRepository;
    @Autowired
    GenreMapper genreMapper;

    @Test
    @Transactional
    public void testGetGenreById() {
        Genre genre = Genre.builder()
                .id(UUID.fromString("5c48e0f7-0b76-11ee-98bc-9cfce8633327"))
                .name("Adventures")
                .books(new HashSet<>())
                .build();
        genreRepository.save(genre);
        Object response = genreService.getGenreById(UUID.fromString("5c48e0f7-0b76-11ee-98bc-9cfce8633327"));
        Map<String, Object> expected = new HashMap<>();
        expected.put("success", true);
        expected.put("data", genreMapper.genreToGenreDto(genre));
        expected.put("message", "Successfully found genre");
        assertThat(response).usingRecursiveComparison().isEqualTo(expected);
    }

    @Test
    @Transactional
    void testGetGenres() {
        List<GenreDTO> genreDTOS = new ArrayList<>();
        Genre genre1 = Genre.builder()
                .id(UUID.fromString("5c48e0f7-0b76-11ee-98bc-9cfce8633327"))
                .name("Adventures")
                .books(new HashSet<>())
                .build();
        Genre genre2 = Genre.builder()
                .id(UUID.fromString("5c5048e2-0b76-11ee-98bc-9cfce8633327"))
                .name("Fairy tale")
                .books(new HashSet<>())
                .build();
        genreRepository.save(genre1);
        genreRepository.save(genre2);
        Object resp = genreService.getListGenres();
        genreDTOS.add(genreMapper.genreToGenreDto(genre1));
        genreDTOS.add(genreMapper.genreToGenreDto(genre2));
        Map<String, Object> expected = new HashMap<>();
        expected.put("success", true);
        expected.put("data", genreDTOS);
        expected.put("message", "Successfully found genres");
        assertThat(resp).usingRecursiveComparison().isEqualTo(expected);
    }

}