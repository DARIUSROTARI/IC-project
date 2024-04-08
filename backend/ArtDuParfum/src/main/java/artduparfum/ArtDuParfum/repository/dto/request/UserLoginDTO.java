package artduparfum.ArtDuParfum.repository.dto.request;

import lombok.Data;

@Data
public class UserLoginDTO {
    private String email;
    private String password;
}
