package artduparfum.ArtDuParfum.service;

import artduparfum.ArtDuParfum.repository.dto.request.UserLoginDTO;
import artduparfum.ArtDuParfum.repository.dto.request.UserRegisterDTO;
import artduparfum.ArtDuParfum.repository.dto.response.UserLoginResponseDTO;
import artduparfum.ArtDuParfum.repository.dto.response.UserRegisterResponseDTO;

public interface UserService {
    UserRegisterResponseDTO register(UserRegisterDTO userRegisterDTO);

    UserLoginResponseDTO login(UserLoginDTO userLoginDTO);

}
