package pw.bookaholic.bookCharacter;

import jakarta.persistence.NoResultException;
import jakarta.transaction.Transactional;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import pw.bookaholic.book.BookMapper;

import java.awt.print.Book;
import java.util.Optional;

@Service
@AllArgsConstructor
public class BookCharacterService {

    private BookCharacterRepository bookCharacterRepo;
    private final BookCharacterMapper bookCharacterMapper;

    @Transactional
    public ResponseEntity<Void> addBookCharacter(BookCharacterDTO bookCharDTO){
        BookCharacter bookCharacter = new BookCharacter(
                bookCharDTO.getId(),
                bookCharDTO.getName(),
                bookCharDTO.getBook());
        bookCharacterRepo.save(bookCharacter);

        return ResponseEntity.ok().build();
    }

    public ResponseEntity<Void> editBookCharacterName(BookCharacterDTO editedChar){
        Optional<BookCharacter> optBookChar = bookCharacterRepo.findById(editedChar.getId());
        if(optBookChar.isPresent()){
            return ResponseEntity.badRequest().build();
        }
        BookCharacter bookCharacter = optBookChar.get();
        bookCharacter.setName(editedChar.getName());
        return ResponseEntity.ok().build();
    }

    public BookCharacterDTO getBookCharByName(String name){
        Optional<BookCharacter> optBookChar = bookCharacterRepo.findByName(name);
        if(optBookChar.isPresent()){
            throw new NoResultException("Book Character not found!");
        }
        BookCharacter bookCharacter = optBookChar.get();
        return bookCharacterMapper.bookCharToBookCharDto(bookCharacter);
    }


}
