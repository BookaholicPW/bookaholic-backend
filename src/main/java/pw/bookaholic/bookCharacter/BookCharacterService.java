package pw.bookaholic.bookCharacter;

import jakarta.persistence.NoResultException;
import jakarta.transaction.Transactional;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import pw.bookaholic.book.BookRepository;

import static pw.bookaholic.utils.Utils.response;

import java.util.NoSuchElementException;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
public class BookCharacterService {

    private BookCharacterRepository bookCharacterRepo;
    private BookRepository bookRepository;
    private final BookCharacterMapper bookCharacterMapper;

    public Object getListCharacters() {
        return response(bookCharacterRepo.findAll().stream().map(bookCharacterMapper::bookCharToBookCharDto).collect(Collectors.toList()),
                "Successfully found book characters");
    }

    public Object getCharacterById(UUID id) {
        BookCharacter bookCharacter = bookCharacterRepo.findById(id).orElseThrow(() -> new NoSuchElementException("Not found character with this id"));
        return response(bookCharacterMapper.bookCharToBookCharDto(bookCharacter), "Successfully found character");
    }

    public Object getCharacterByName(String name) {
        return response(bookCharacterRepo.findAllByNameContainsIgnoreCase(name).stream().map(bookCharacterMapper::bookCharToBookCharDto).collect(Collectors.toList()),
                "Successfully found all characters with this name");
    }

    public Object addBookCharacter(BookCharacterDTO characterDTO) {
        if (characterDTO.getBook() != null && bookRepository.getBookById(characterDTO.getBook().getId()).isEmpty()) {
            throw new NoSuchElementException("Not found book with this id");
        }
        return response(bookCharacterMapper.bookCharToBookCharDto(bookCharacterRepo.save(bookCharacterMapper.bookCharDtoToBookChar(characterDTO))),
                "Successfully created new character");
    }


}
