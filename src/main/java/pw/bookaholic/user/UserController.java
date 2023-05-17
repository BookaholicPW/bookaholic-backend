package pw.bookaholic.user;

import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@AllArgsConstructor
@RequestMapping("/account")
@SecurityRequirement(name = "Bearer Authentication")
public class UserController {
    private final UserService userService;

    @PutMapping()
    public ResponseEntity<Object> updateUser(@RequestHeader HttpHeaders headers, @RequestBody UserBaseUpdate user) {
        return ResponseEntity.ok().body(userService.updateUser(headers, user));
    }

    @GetMapping()
    public ResponseEntity<Object> getUserInfo(@RequestHeader HttpHeaders headers) {
        return ResponseEntity.ok().body(userService.getUserInfo(headers));
    }
}
