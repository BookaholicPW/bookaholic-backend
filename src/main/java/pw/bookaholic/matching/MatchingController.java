package pw.bookaholic.matching;

import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@AllArgsConstructor
@RestController
@SecurityRequirement(name = "Bearer Authentication")
@RequestMapping("/matching/suggested-profile")
public class MatchingController {
    @Autowired
    private final MatchingService matchingService;

    @GetMapping
    public ResponseEntity<Object> getSuggestedProfile(@RequestHeader HttpHeaders headers) {
        return ResponseEntity.ok().body(matchingService.getSuggestedProfile(headers));
    }

    @PostMapping("/answer")
    public ResponseEntity<Object> answerSuggestedProfile(@RequestHeader HttpHeaders headers, @RequestBody MatchingBaseRequest matchingBaseRequest) {
        return ResponseEntity.ok().body(matchingService.answerSuggestedProfile(headers, matchingBaseRequest));
    }
}
