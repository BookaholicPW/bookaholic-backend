package pw.bookaholic.bookCharacter;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pw.bookaholic.user.User;

import java.util.Optional;
import java.util.UUID;

@Repository
public interface BookCharacterRepository extends  JpaRepository<BookCharacter, UUID>{
    Optional<BookCharacter> findById(String id);

    Optional<BookCharacter> findByName(String name);

}
