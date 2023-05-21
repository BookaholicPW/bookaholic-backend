package pw.bookaholic.book;

import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.UUID;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
public class BookMin {
    private UUID id;
    @NotNull
    private String title;
    private String description;
    private String cover;
    private Integer pages;
    private Long published;
}
