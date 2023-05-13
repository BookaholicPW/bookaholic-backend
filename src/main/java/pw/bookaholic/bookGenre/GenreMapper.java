package pw.bookaholic.bookGenre;

import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface GenreMapper {
    GenreDTO genreToGenreDto(Genre bookGenre);

    Genre genreDtoToGenre(GenreDTO bookGenreDTO);
}
