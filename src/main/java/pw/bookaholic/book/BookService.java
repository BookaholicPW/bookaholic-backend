package pw.bookaholic.book;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.NoSuchElementException;
import java.util.UUID;
import java.util.stream.Collectors;

import static pw.bookaholic.utils.Utils.response;

@AllArgsConstructor
@Service
public class BookService {
    private final BookRepository bookRepository;
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
        return response(bookRepository.save(bookMapper.bookDtoToBook(bookDTO)), "Successfully added new book");
    }
}
