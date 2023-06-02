package pw.bookaholic.book;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
public interface BookRepository extends JpaRepository<Book, UUID> {
    Book findByTitle(String title);

    Optional<Book> getBookById(UUID uuid);

    List<Book> findAllByTitleContainsIgnoreCase(String term);
}
