package pw.bookaholic.author;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Collection;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
public interface AuthorRepository extends JpaRepository<Author, UUID> {

    Optional<Author> findAuthorByName(String name);

    List<Author> findAllByNameContainsIgnoreCase(String name);
}
