package pw.bookaholic.chatMessage;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pw.bookaholic.book.Book;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
public interface ChatMessageRepository extends JpaRepository<ChatMessage, UUID> {

    ChatMessage findBySender(UUID senderId);

    Optional<ChatMessage> findById(UUID id);

    List<ChatMessage> findAllBySender(UUID id);
}
