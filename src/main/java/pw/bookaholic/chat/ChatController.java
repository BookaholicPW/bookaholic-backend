package pw.bookaholic.chat;

import com.google.gson.Gson;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

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
                                          @RequestParam(value = "lastMessageId", required = false) UUID lastMessageId,
                                          @RequestParam(value = "isUntil", required = false) Boolean isUntil) {
        return ResponseEntity.ok().body(chatService.getChat(headers, id, lastMessageId, isUntil));
    }

    @PostMapping(value = "{id}/messages", consumes = {"multipart/form-data"})
    public ResponseEntity<Object> sendMessage(@RequestHeader HttpHeaders headers,
                                              @PathVariable("id") UUID id,
                                              @RequestPart("message") String messageStr,
                                              @RequestPart(value = "file", required = false) MultipartFile file) {
        Gson gson = new Gson();
        Message message = gson.fromJson(messageStr, Message.class);
        return ResponseEntity.ok().body(chatService.sendMessage(headers, id, message, file));
    }
}
