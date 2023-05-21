package pw.bookaholic.matching;

import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@AllArgsConstructor
@RestController
@SecurityRequirement(name = "Bearer Authentication")
@RequestMapping("/matching")
public class MatchingController {
    @Autowired
    private final MatchingService matchingService;

    @GetMapping("/suggested-profile")
    public ResponseEntity<Object> getSuggestedProfile(@RequestHeader HttpHeaders headers) {
        return ResponseEntity.ok().body(matchingService.getSuggestedProfile(headers));
    }
}
