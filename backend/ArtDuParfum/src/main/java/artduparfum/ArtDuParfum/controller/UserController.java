package artduparfum.ArtDuParfum.controller;

import artduparfum.ArtDuParfum.repository.dto.request.UserLoginDTO;
import artduparfum.ArtDuParfum.repository.dto.request.UserRegisterDTO;
import artduparfum.ArtDuParfum.repository.dto.response.UserLoginResponseDTO;
import artduparfum.ArtDuParfum.repository.dto.response.UserRegisterResponseDTO;
import artduparfum.ArtDuParfum.service.UserService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/users")
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @PostMapping("/registration")
    public ResponseEntity<UserRegisterResponseDTO> registerUser(@RequestBody UserRegisterDTO userRegisterDTO) {
        return new ResponseEntity<>(userService.register(userRegisterDTO), HttpStatus.CREATED);
    }

    @PostMapping("/login")
    public ResponseEntity<UserLoginResponseDTO> loginUser(@RequestBody UserLoginDTO userLoginDTO) {
        return new ResponseEntity<>(userService.login(userLoginDTO), HttpStatus.OK);
    }
}
