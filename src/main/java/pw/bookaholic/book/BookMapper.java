package pw.bookaholic.book;

import org.mapstruct.Mapper;

@Mapper
public interface BookMapper {
    Book bookDtoToBook(BookDTO bookDTO);

    BookDTO bookToBookDto(Book book);

}
