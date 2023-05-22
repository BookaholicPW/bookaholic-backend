package pw.bookaholic.chatMessage;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import pw.bookaholic.book.Book;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
public interface ChatMessageRepository extends JpaRepository<ChatMessage, UUID> {

    Optional<ChatMessage> findById(UUID id);

    @Query(
            value = """
                    select * from chatmessage
                    where (first_user_id = ?1 and second_user_id = ?2)
                    or (first_user_id = ?2 and second_user_id = ?1)
                    """,
            nativeQuery = true
    )
    List<ChatMessage> findAllByFirstUserAndSecondUser(UUID id1, UUID id2);
}
