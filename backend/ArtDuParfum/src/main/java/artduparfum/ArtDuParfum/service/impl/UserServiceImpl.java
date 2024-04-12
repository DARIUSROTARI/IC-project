package artduparfum.ArtDuParfum.service.impl;

import artduparfum.ArtDuParfum.exception.EmailAlreadyExistException;
import artduparfum.ArtDuParfum.exception.InvalidCredentialsException;
import artduparfum.ArtDuParfum.exception.InvalidGenderException;
import artduparfum.ArtDuParfum.repository.UserRepository;
import artduparfum.ArtDuParfum.repository.dto.request.GenderDTO;
import artduparfum.ArtDuParfum.repository.dto.request.UserLoginDTO;
import artduparfum.ArtDuParfum.repository.dto.request.UserRegisterDTO;
import artduparfum.ArtDuParfum.repository.dto.response.GenderResponseDTO;
import artduparfum.ArtDuParfum.repository.dto.response.UserLoginResponseDTO;
import artduparfum.ArtDuParfum.repository.dto.response.UserRegisterResponseDTO;
import artduparfum.ArtDuParfum.repository.entity.Gender;
import artduparfum.ArtDuParfum.repository.entity.User;
import artduparfum.ArtDuParfum.service.UserService;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.Objects;

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

    @Override
    public GenderResponseDTO gender(GenderDTO genderDTO) {

      Gender gender = modelMapper.map(genderDTO, Gender.class);

       if(gender.getGender() == null){
           throw new InvalidGenderException();
       }

        if(gender.getGender().equals("male")){
            return modelMapper.map(gender, GenderResponseDTO.class);
        }
        else if(gender.getGender().equals("female")){
            return modelMapper.map(gender, GenderResponseDTO.class);
        }else{
            throw new InvalidGenderException();
        }
    }

}
