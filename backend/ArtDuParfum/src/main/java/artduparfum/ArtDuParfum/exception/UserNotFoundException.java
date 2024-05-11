package artduparfum.ArtDuParfum.exception;

public class UserNotFoundException extends RuntimeException{
    public UserNotFoundException(String message) {
        super(message);
    }

    public UserNotFoundException() {
        this("User not found");
    }
}
