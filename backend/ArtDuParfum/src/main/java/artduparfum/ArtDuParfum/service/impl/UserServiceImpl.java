package artduparfum.ArtDuParfum.service.impl;

import artduparfum.ArtDuParfum.exception.EmailAlreadyExistException;
import artduparfum.ArtDuParfum.exception.InvalidCredentialsException;
import artduparfum.ArtDuParfum.repository.UserRepository;
import artduparfum.ArtDuParfum.repository.dto.request.UserLoginDTO;
import artduparfum.ArtDuParfum.repository.dto.request.UserRegisterDTO;
import artduparfum.ArtDuParfum.repository.dto.response.UserLoginResponseDTO;
import artduparfum.ArtDuParfum.repository.dto.response.UserRegisterResponseDTO;
import artduparfum.ArtDuParfum.repository.entity.User;
import artduparfum.ArtDuParfum.service.UserService;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;
    private final ModelMapper modelMapper;

    public UserServiceImpl(UserRepository userRepository, ModelMapper modelMapper) {
        this.userRepository = userRepository;
        this.modelMapper = modelMapper;
    }

    @Override
    public UserRegisterResponseDTO register(UserRegisterDTO userRegisterDTO) {
        if (userRepository.findByEmail(userRegisterDTO.getEmail()) != null) {
            throw new EmailAlreadyExistException();
        }
        User user = modelMapper.map(userRegisterDTO, User.class);
        return modelMapper.map(userRepository.save(user), UserRegisterResponseDTO.class);
    }

    @Override
    public UserLoginResponseDTO login(UserLoginDTO userLoginDTO) {
        User user = userRepository.findByEmail(userLoginDTO.getEmail());
        if (user == null) {
            throw new InvalidCredentialsException();
        }
        if (!user.getPassword().equals(userLoginDTO.getPassword())) {
            throw new InvalidCredentialsException();
        }
        return modelMapper.map(user, UserLoginResponseDTO.class);
    }

}
