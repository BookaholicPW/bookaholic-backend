package pw.bookaholic.book;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.webjars.NotFoundException;
import pw.bookaholic.author.AuthorRepository;
import pw.bookaholic.bookGenre.Genre;
import pw.bookaholic.bookGenre.GenreDTO;
import pw.bookaholic.bookGenre.GenreRepository;

import java.util.NoSuchElementException;
import java.util.UUID;
import java.util.stream.Collectors;

import static pw.bookaholic.utils.Utils.response;

@AllArgsConstructor
@Service
public class BookService {
    private final BookRepository bookRepository;
    private final AuthorRepository authorRepository;
    private final GenreRepository genreRepository;
    private final BookMapper bookMapper;

    public Object getListBooks() {
        return response(bookRepository.findAll().stream().map(bookMapper::bookToBookDto).collect(Collectors.toList()),
                "Successfully found books");
    }

    public Object getBookById(UUID id) {
        Book book = bookRepository.findById(id).orElseThrow(() -> new NoSuchElementException("Not found book by this id"));
        return response(bookMapper.bookToBookDto(book), "Successfully found book");
    }

    public Object findBooksByTitle(String term) {
        return response(bookRepository.findAllByTitleContainsIgnoreCase(term).stream().map(bookMapper::bookToBookDto).collect(Collectors.toList()),
                "Successfully found all books with this word in title");
    }

    public Object addBook(BookDTO bookDTO) {
        if (bookDTO.getAuthor() != null && authorRepository.findById(bookDTO.getAuthor().getId()).isEmpty()) {
            throw new NoSuchElementException("Not found author with this id");
        }
        if (!bookDTO.getGenres().isEmpty() &&
                bookDTO.getGenres().size() != genreRepository.findAllById(bookDTO.getGenres().stream().map(GenreDTO::getId).toList()).size()) {
            throw new NoSuchElementException("Can not found genre with this id");
        }
        return response(bookMapper.bookToBookDto(bookRepository.save(bookMapper.bookDtoToBook(bookDTO))),
                "Successfully added new book");
    }
}
