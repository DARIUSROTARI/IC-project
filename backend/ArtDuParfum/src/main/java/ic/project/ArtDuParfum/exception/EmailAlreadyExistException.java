package ic.project.ArtDuParfum.exception;

public class EmailAlreadyExistException extends RuntimeException {
    public EmailAlreadyExistException() {
        this("Email already exist!");
    }

    public EmailAlreadyExistException(String message) {
        super(message);
    }
}
