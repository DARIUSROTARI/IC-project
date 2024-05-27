package artduparfum.ArtDuParfum.repository.dto.response;

import lombok.Data;

@Data
public class UserLoginResponseDTO {
    private String lastName;
    private String firstName;
    private String dateOfBirth;
    private String email;
    private Long id;
}
