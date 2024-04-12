package artduparfum.ArtDuParfum.exception;

public class InvalidGenderException extends RuntimeException{

    public InvalidGenderException() {
        this("Invalid gender");
    }

    public InvalidGenderException(String message) {
        super(message);
    }
}
