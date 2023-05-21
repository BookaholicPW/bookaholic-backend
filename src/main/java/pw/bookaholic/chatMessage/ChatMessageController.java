package pw.bookaholic.chatMessage;

import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import lombok.AllArgsConstructor;
import org.springframework.security.access.annotation.Secured;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping
@SecurityRequirement(name = "Bearer Authentication")
@AllArgsConstructor
public class ChatMessageController {

    private final ChatMessageService messageService;


}
