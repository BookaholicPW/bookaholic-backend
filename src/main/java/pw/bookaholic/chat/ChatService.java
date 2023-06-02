package pw.bookaholic.chat;

import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import pw.bookaholic.chatMessage.ChatMessage;
import pw.bookaholic.chatMessage.ChatMessageDTO;
import pw.bookaholic.chatMessage.ChatMessageRepository;
import pw.bookaholic.chatMessage.ChatMessageService;
import pw.bookaholic.user.User;
import pw.bookaholic.user.UserRepository;

import java.util.List;
import java.util.NoSuchElementException;
import java.util.UUID;

import static pw.bookaholic.chatMessage.ChatMessageService.convertChatMessageToResponse;
import static pw.bookaholic.user.UserService.convertEntityToBase;
import static pw.bookaholic.user.UserService.getEmailFromToken;
import static pw.bookaholic.utils.Utils.response;

@Service
@AllArgsConstructor
public class ChatService {
    @Autowired
    private final ChatRepository chatRepository;
    @Autowired
    private final UserRepository userRepository;

    @Autowired
    private final ChatMessageService messageService;
    private final ChatMessageRepository chatMessageRepository;

    public static ChatResponse convertEntityToResponse(UUID id, User sender, ChatMessage lastChatMessage, Boolean seen) {
        return new ChatResponse(
                id,
                convertEntityToBase(sender),
                convertChatMessageToResponse(lastChatMessage),
                seen
        );
    }

    public Object getAllChats(HttpHeaders headers) {
        String email = getEmailFromToken(headers);
        User baseUser = userRepository
                .findByEmail(email)
                .orElseThrow(() ->
                        new NoSuchElementException("User not found!"));
        List<Chat> chats = chatRepository.findAllByFirstUserOrSecondUser(baseUser.getId());
        List<ChatResponse> chatResponses = chats.stream().map(c -> {
//            ChatMessage lastChatMessage = messageService.findLastMessage(c.getLastChatMessage());
            User user = baseUser.getId().equals(c.getFirstUser().getId()) ? c.getSecondUser() : c.getFirstUser();
            return convertEntityToResponse(c.getId(), user, c.getLastChatMessage(), c.getSeen());
        }).toList();
        return response(chatResponses, "All chats found!");
    }

    public void createChat(User firstUser, User secondUser) {
        if (chatRepository.existsByFirstUserAndSecondUser(firstUser.getId(), secondUser.getId()).isEmpty())
            chatRepository.save(new Chat(UUID.randomUUID(), firstUser, secondUser, null, false));
    }

    public Object getChat(HttpHeaders headers, UUID id, UUID lastMessageId) {
        String email = getEmailFromToken(headers);
        User baseUser = userRepository
                .findByEmail(email)
                .orElseThrow(() ->
                        new NoSuchElementException("User not found!"));
        Chat chat = chatRepository.findById(id).orElseThrow(() -> new NoSuchElementException("Chat not found!"));
        if (!chat.getFirstUser().getId().equals(baseUser.getId()) && !chat.getSecondUser().getId().equals(baseUser.getId()))
            throw new NoSuchElementException("Chat not found!");
        chat.setSeen(true);
        chatRepository.save(chat);
        List<ChatMessage> chatMessages =
                lastMessageId == null ?
                        chatMessageRepository.find25LatestMessage(id) :
                        chatMessageRepository.find25LatestMessage(id, lastMessageId);
        List<ChatMessageDTO> chatMessagesDTO = chatMessages.stream().map(ChatMessageService::convertChatMessageToResponse).toList();
        return response(chatMessagesDTO, "Successfully get messages!");
    }

    public Object sendMessage(HttpHeaders headers, UUID id, Message message) {
        String email = getEmailFromToken(headers);
        User baseUser = userRepository
                .findByEmail(email)
                .orElseThrow(() ->
                        new NoSuchElementException("User not found!"));
        Chat chat = chatRepository.findById(id).orElseThrow(() -> new NoSuchElementException("Chat not found!"));
        if (!chat.getFirstUser().getId().equals(baseUser.getId()) && !chat.getSecondUser().getId().equals(baseUser.getId()))
            throw new NoSuchElementException("Chat not found!");
        if (!(message.getType().equals("text") || message.getType().equals("image")))
            throw new IllegalArgumentException("Message type not supported!");
        if (message.getContent().length() > 1000)
            throw new IllegalArgumentException("Message content too long!");
        ChatMessage chatMessage = new ChatMessage(UUID.randomUUID(), System.currentTimeMillis(), chat, baseUser, message.getContent(), message.getType());
        ChatMessage savedMessage = chatMessageRepository.save(chatMessage);
        chat.setLastChatMessage(savedMessage);
        chat.setSeen(false);
        Chat savedChat = chatRepository.save(chat);
        ChatMessage lastMessage = savedChat.getLastChatMessage();
        return response(convertChatMessageToResponse(lastMessage), "Message sent!");
//        return null;
    }
}
