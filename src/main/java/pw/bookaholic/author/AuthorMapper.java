package pw.bookaholic.author;

import org.mapstruct.InheritInverseConfiguration;
import org.mapstruct.Mapper;
import org.springframework.stereotype.Component;

@Mapper(componentModel = "spring")
public interface AuthorMapper {
    Author authorDtoToAuthor(AuthorDTO authorDTO);

    AuthorDTO authorToAuthorDto(Author author);
}
