package ic.project.ArtDuParfum.exception;

public class UserNotFoundException extends RuntimeException {
    public UserNotFoundException() {
        this("User not found!");
    }

    public UserNotFoundException(String message) {
        super(message);
    }
}
