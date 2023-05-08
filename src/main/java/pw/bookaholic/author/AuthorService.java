package pw.bookaholic.author;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pw.bookaholic.exceptions.AlreadyExistsException;

import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;

import static pw.bookaholic.utils.Utils.response;

@Service
@RequiredArgsConstructor
public class AuthorService {

    private final AuthorRepository authorRepository;
    private final AuthorMapper authorMapper;


    public Object getListAuthors() {
        return response(authorRepository.findAll().stream()
                .map(authorMapper::authorToAuthorDto)
                .collect(Collectors.toList()), "Successfully found authors");

    }

    public Object getAuthorById(UUID id) {
        if (authorRepository.existsById(id)) {
            return response(authorRepository.findById(id).map(authorMapper::authorToAuthorDto),
                    "Successfully found author");
        }
        throw new NoSuchElementException("Not found author with this id");
    }

    public Object addNewAuthor(AuthorDTO authorDTO) throws AlreadyExistsException {
        if ((authorRepository.findAuthorByName(authorDTO.getName())) != null) {
            throw new AlreadyExistsException("This author is already added");
        }
        return response(authorMapper.authorToAuthorDto(authorRepository.save(authorMapper.authorDtoToAuthor(authorDTO))),
                "Successfully added new author");
    }
}
