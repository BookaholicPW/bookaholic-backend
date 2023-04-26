package pw.bookaholic;

import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@SecurityRequirement(name = "Bearer Authentication")
public class Hello {
    @GetMapping("/")
    public String hello() {
        return "Hello World!";
    }
}
