package pw.bookaholic.chat;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface ChatRepository extends JpaRepository<Chat, UUID> {
    @Query(
            value = """
                    select * from chat
                    where first_user_id = ?1 or second_user_id = ?1
                    """,
            nativeQuery = true
    )
    List<Chat> findAllByFirstUserOrSecondUser(UUID id);
}
