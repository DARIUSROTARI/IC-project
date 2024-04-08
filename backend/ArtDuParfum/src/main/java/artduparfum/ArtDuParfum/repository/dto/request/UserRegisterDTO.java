package artduparfum.ArtDuParfum.repository.dto.request;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class UserRegisterDTO {
    private String lastName;
    private String firstName;
    private String dateOfBirth;
    private String email;
    private String password;
}
