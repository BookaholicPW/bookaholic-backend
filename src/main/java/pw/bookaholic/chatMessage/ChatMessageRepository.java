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
                    select * from chat_message
                    where (first_user_id = ?1 and second_user_id = ?2)
                    or (first_user_id = ?2 and second_user_id = ?1)
                    """,
            nativeQuery = true
    )
    List<ChatMessage> findAllByFirstUserAndSecondUser(UUID id1, UUID id2);
    @Query(
            value = """
                    select * from chat_message where chat_id = ?1
                    and time <= (select time from chat_message where id = ?2)
                    order by time desc
                    limit 25
                    """,
            nativeQuery = true
    )
    List<ChatMessage> find25LatestMessage(UUID id, UUID lastMessageId);
    @Query(
            value = """
                    select * from chat_message where chat_id = ?1
                    order by time desc
                    limit 25
                    """,
            nativeQuery = true
    )
    List<ChatMessage> find25LatestMessage(UUID id);
    @Query(
            value = """
                    select * from chat_message where chat_id = ?1
                    and time <= (select time from chat_message where id = ?2)
                    order by time asc
                    limit 25
                    """,
            nativeQuery = true
    )
    List<ChatMessage> find25LatestMessageUntil(UUID id, UUID lastMessageId);

    Optional<ChatMessage> findTopByChatIdOrderByTimeDesc(UUID id);
}
