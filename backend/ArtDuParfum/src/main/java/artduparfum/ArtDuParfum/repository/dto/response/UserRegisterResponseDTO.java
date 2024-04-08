package artduparfum.ArtDuParfum.repository.dto.response;

import lombok.Data;

@Data
public class UserRegisterResponseDTO {
    private Long id;
    private String lastName;
    private String firstName;
    private String dateOfBirth;
    private String email;
}
