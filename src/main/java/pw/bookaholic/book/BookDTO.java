package pw.bookaholic.book;

import jakarta.validation.constraints.NotNull;
import lombok.Builder;
import lombok.Data;

import java.util.UUID;

@Builder
@Data
public class BookDTO {
    private UUID id;
    @NotNull
    private String title;
    private String description;
    private String cover;
    private Integer pages;
    private Long published;
}
