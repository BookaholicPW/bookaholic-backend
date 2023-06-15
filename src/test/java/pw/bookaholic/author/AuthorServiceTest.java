package pw.bookaholic.author;

import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.jpa.domain.AbstractAuditable;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import pw.bookaholic.book.Book;


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
        Set<Book> books = new HashSet<>();
        Author newAuthor = new Author(UUID.fromString("348e3f3d-0ab3-11ee-98bc-9cfce8633327"), "Mark Twain",
                null, 1657526400L, 1271836800L, books, "American", "English");
        authorRepository.save(newAuthor);
        Object response = authorService.getAuthorById(UUID.fromString("348e3f3d-0ab3-11ee-98bc-9cfce8633327"));
        Map<String, Object> expected = new HashMap<>();
        expected.put("success", true);
        expected.put("data", authorMapper.authorToAuthorDto(newAuthor));
        expected.put("message", "Successfully found author");
        assertThat(response).usingRecursiveComparison().isEqualTo(expected);
    }

    @Test
    void testGetAuthors() {
        Set<Book> books = new HashSet<>();
        Author author1 = new Author(UUID.fromString("348e3f3d-0ab3-11ee-98bc-9cfce8633327"), "Mark Twain",
                null, 1657526400L, 1271836800L, books, "American", "English");
        Author author2 =new Author(UUID.fromString("348e3f3d-0ab3-11ee-98bc-9cfce8633328"), "Jules Verne",
                null, 1657526400L, 1271836800L, books, "French", "French");
        authorRepository.save(author1);
        authorRepository.save(author2);
        Object resp = authorService.getListAuthors();
        List<AuthorDTO> authorsExpected = new ArrayList<>();
        authorsExpected.add(authorMapper.authorToAuthorDto(author1));
        authorsExpected.add(authorMapper.authorToAuthorDto(author2));
        Map<String, Object> expected = new HashMap<>();
        expected.put("success", true);
        expected.put("data", authorsExpected);
        expected.put("message", "Successfully found authors");
        assertThat(resp).usingRecursiveComparison().isEqualTo(expected);
    }

}
