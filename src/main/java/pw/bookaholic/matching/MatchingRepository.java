package pw.bookaholic.matching;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
public interface MatchingRepository extends JpaRepository<Matching, UUID> {
    @Query(
            value = "select * from matching where first_user_id = ?1 and first_user_liked is null and second_user_liked = true limit 1",
            nativeQuery = true
    )
    Optional<Matching> findByFirstUser(UUID userId);

    @Query(
            value = "select * from matching where second_user_id = ?1 and first_user_liked = true and second_user_liked is null limit 1",
            nativeQuery = true
    )
    Optional<Matching> findBySecondUser(UUID userId);

    @Query(
            value = "select first_user_id from matching where second_user_id = ?1",
            nativeQuery = true
    )
    List<UUID> findFirstUserIds(UUID userId);

    @Query(
            value = "select second_user_id from matching where first_user_id = ?1",
            nativeQuery = true
    )
    List<UUID> findSecondUserIds(UUID userId);
}
