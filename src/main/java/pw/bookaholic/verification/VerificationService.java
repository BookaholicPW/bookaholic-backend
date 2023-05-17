package pw.bookaholic.verification;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class VerificationService {

    private final VerificationRepository repository;

    public void saveVerificationToken(VerificationToken token){
        repository.save(token);
    }

}
