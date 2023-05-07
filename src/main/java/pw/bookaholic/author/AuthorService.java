package pw.bookaholic.author;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pw.bookaholic.exceptions.AlreadyExistsException;

import java.util.List;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class AuthorService {

    private final AuthorRepository authorRepository;
    private final AuthorMapper authorMapper;


    public List<AuthorDTO> getListAuthors() {
        return authorRepository.findAll().stream()
                .map(authorMapper::authorToAuthorDto)
                .collect(Collectors.toList());

    }

    public Optional<AuthorDTO> getAuthorById(UUID id) {
        return authorRepository.findById(id).map(authorMapper::authorToAuthorDto);
    }

    public AuthorDTO addNewAuthor(AuthorDTO authorDTO) throws AlreadyExistsException {
        if ((authorRepository.findAuthorByName(authorDTO.getName())) != null) {
            throw new AlreadyExistsException("This author is already added");
        }
        return authorMapper.authorToAuthorDto(authorRepository.save(authorMapper.authorDtoToAuthor(authorDTO)));
    }
}
