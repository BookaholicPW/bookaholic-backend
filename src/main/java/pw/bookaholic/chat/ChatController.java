package pw.bookaholic.chat;

import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@AllArgsConstructor
@RestController
@SecurityRequirement(name = "Bearer Authentication")
@RequestMapping("/chats")
public class ChatController {
    @Autowired
    private final ChatService chatService;

    @GetMapping
    public ResponseEntity<Object> getAllChats(@RequestHeader HttpHeaders headers) {
        return ResponseEntity.ok().body(chatService.getAllChats(headers));
    }

    @GetMapping("{id}")
    public ResponseEntity<Object> getChat(@RequestHeader HttpHeaders headers,
                                          @PathVariable("id") UUID id,
                                          @RequestParam(value = "lastMessageId", required = false) UUID lastMessageId) {
        return ResponseEntity.ok().body(chatService.getChat(headers, id, lastMessageId));
    }

    @PostMapping("{id}/messages")
    public ResponseEntity<Object> sendMessage(@RequestHeader HttpHeaders headers,
                                               @PathVariable("id") UUID id,
                                               @RequestBody Message message) {
        return ResponseEntity.ok().body(chatService.sendMessage(headers, id, message));
    }
}
