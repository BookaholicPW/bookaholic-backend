package pw.bookaholic.author;

import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import java.util.*;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;


@SpringBootTest
@RunWith(SpringJUnit4ClassRunner.class)
public class AuthorServiceTest {

    @Autowired
    AuthorService authorService;
    @Autowired
    AuthorRepository authorRepository;
    @Autowired
    AuthorMapper authorMapper;

    @Test
    public void testGetAuthorById() {
        Object response = authorService.getAuthorById(UUID.fromString("348e3f3d-0ab3-11ee-98bc-9cfce8633327"));
        Author newAuthor = new Author(UUID.fromString("348e3f3d-0ab3-11ee-98bc-9cfce8633327"), "Mark Twain",
                null, 1657526400L, 1271836800L, null, "American", "English");
        Map<String, Object> expected = new HashMap<>();
        expected.put("success", true);
        expected.put("data", authorMapper.authorToAuthorDto(newAuthor));
        expected.put("message", "Successfully found author");
        assertThat(response).usingRecursiveComparison().isEqualTo(expected);
    }

    @Test
    void testGetAuthors() {
        Object resp = authorService.getListAuthors();
        List<AuthorDTO> authors = new ArrayList<>();
        authors.add(new AuthorDTO(UUID.fromString("348e3f3d-0ab3-11ee-98bc-9cfce8633327"), "Mark Twain",
                null, 1657526400L, 1271836800L, null, "American", "English"));
        authors.add(new AuthorDTO(UUID.fromString("348e3f3d-0ab3-11ee-98bc-9cfce8633328"), "Jules Verne",
                null, 1657526400L, 1271836800L, null, "French", "French"));
        Map<String, Object> expected = new HashMap<>();
        expected.put("success", true);
        expected.put("data", authors);
        expected.put("message", "Successfully found authors");
        assertThat(resp).usingRecursiveComparison().isEqualTo(expected);
    }

}
