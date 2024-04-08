package artduparfum.ArtDuParfum.exception;

public class InvalidCredentialsException extends RuntimeException {
    public InvalidCredentialsException() {
        this("Invalid credentials");
    }

    public InvalidCredentialsException(String message) {
        super(message);
    }
}
