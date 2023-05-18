package pw.bookaholic.verification.email;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import lombok.AllArgsConstructor;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class EmailService implements EmailSender{

    private final JavaMailSender mailSender;

    @Override
    @Async
    public void send(String to, String link) {
        try{
            MimeMessage mimeMessage = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, "utf-8");
            helper.setText(emailBody(link), true);
            helper.setTo(to);
            helper.setSubject("Account Confirmation.");
            mailSender.send(mimeMessage);
        } catch (MessagingException e){
            throw new IllegalStateException("Failed to send email.");
        }
    }

    private String emailBody(String link){
        String body = "Verify account: \n" + link;
        return body;
    }
}
