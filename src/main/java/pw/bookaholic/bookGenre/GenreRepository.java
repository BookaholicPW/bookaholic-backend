package pw.bookaholic.bookGenre;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Collection;
import java.util.List;
import java.util.UUID;

@Repository
public interface GenreRepository extends JpaRepository<Genre, UUID> {
    Genre findByName(String name);

    List<Genre> findAllByNameContainsIgnoreCase(String name);
}
