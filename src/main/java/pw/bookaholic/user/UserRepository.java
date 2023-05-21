package pw.bookaholic.user;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Optional;
import java.util.UUID;

@Repository
public interface UserRepository extends JpaRepository<User, UUID> {
    Optional<User> findByEmail(String username);

    boolean existsByEmail(String email);

    @Query("select (count(u) > 0) from User u where username_ = ?1 and id != ?2")
    boolean existsByUsername_(String username, UUID id);
}
