package pw.bookaholic.verification;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.Optional;

@Service
@AllArgsConstructor
public class VerificationService {

    private final VerificationRepository repository;

    public void saveVerificationToken(VerificationToken token){
        repository.save(token);
    }

    public Optional<VerificationToken> getToken(String token){
        return repository.findByToken(token);
    }

    public void setConfirmedAt(VerificationToken verToken) {
        repository.updateConfirmedAt(verToken, LocalDateTime.now());
    }
}
