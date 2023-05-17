package pw.bookaholic.bookCharacter;

import jakarta.transaction.Transactional;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.awt.print.Book;
import java.util.Optional;

@Service
@AllArgsConstructor
public class BookCharacterService {

    private BookCharacterRepository bookCharacterRepo;

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
        if(optBookChar != null){
            return ResponseEntity.badRequest().build();
        }
        BookCharacter bookCharacter = optBookChar.get();
        bookCharacter.setName(editedChar.getName());
        return ResponseEntity.ok().build();
    }

    public BookCharacterDTO getBookCharByName(String name){
        Optional<BookCharacter> optBookChar = bookCharacterRepo.findByName(name);
        if(optBookChar != null){
            throw new IllegalStateException("Book Character not found!");
        }
        BookCharacter bookCharacter = optBookChar.get();

        return new BookCharacterDTO(bookCharacter.getId(), bookCharacter.getName(), bookCharacter.getBook());
    }


}
