package pw.bookaholic.exceptions;

import jakarta.persistence.NoResultException;

public class AlreadyExistsException extends Exception {
    public AlreadyExistsException(String message) {
        super(message);
    }
}
