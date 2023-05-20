package pw.bookaholic.bookCharacter;

import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface BookCharacterMapper {
    BookCharacter bookCharDtoToBookChar(BookCharacterDTO characterDTO);

    BookCharacterDTO bookCharToBookCharDto (BookCharacter character);


}
