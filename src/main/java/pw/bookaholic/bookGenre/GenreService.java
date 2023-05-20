package pw.bookaholic.bookGenre;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import pw.bookaholic.exceptions.AlreadyExistsException;

import java.util.NoSuchElementException;
import java.util.UUID;
import java.util.stream.Collectors;

import static pw.bookaholic.utils.Utils.response;

@Service
@AllArgsConstructor
public class GenreService {

    private GenreRepository genreRepository;
    private GenreMapper genreMapper;

    public Object getListGenres() {
        return response(genreRepository.findAll().stream().map(genreMapper::genreToGenreDto).collect(Collectors.toList()),
                "Successfully found genres");
    }

    public Object getGenreById(UUID id) {
        Genre genre = genreRepository.findById(id).orElseThrow(() -> new NoSuchElementException("Not found genre by this id"));
        return response(genreMapper.genreToGenreDto(genre), "Successfully found genre");
    }

    public Object addNewGenre(GenreDTO genreDTO) throws AlreadyExistsException {
        if (genreRepository.findByName(genreDTO.getName()) != null) {
            throw new AlreadyExistsException("Genre with this name already exists");
        }
        return response(genreRepository.save(genreMapper.genreDtoToGenre(genreDTO)), "Successfully added genre");
    }
}
