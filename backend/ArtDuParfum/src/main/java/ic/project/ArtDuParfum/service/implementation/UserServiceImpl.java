package ic.project.ArtDuParfum.service.implementation;

import ic.project.ArtDuParfum.entity.User;
import ic.project.ArtDuParfum.exception.EmailAlreadyExistException;
import ic.project.ArtDuParfum.exception.UserNotFoundException;
import ic.project.ArtDuParfum.repository.UserRepository;
import ic.project.ArtDuParfum.service.UserService;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;

    public UserServiceImpl(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public User create(User user) {
        if (userRepository.findByEmail(user.getEmail()) != null) {
            throw new EmailAlreadyExistException();
        }
        return userRepository.save(user);
    }

    @Override
    public User read(Long id) {
        return userRepository.findById(id).orElseThrow(UserNotFoundException::new);
    }

    @Override
    public void delete(Long id) {
        User user = userRepository.findById(id).orElseThrow(UserNotFoundException::new);
        userRepository.delete(user);
    }

    @Override
    public User update(Long id, User user) {
        User savedUser = userRepository.findById(id).orElseThrow(UserNotFoundException::new);
        if(user.getEmail() != null){
            savedUser.setEmail(user.getEmail());
        }
        if(user.getPassword() != null){
            savedUser.setPassword(user.getPassword());
        }
        if(user.getUsername() != null){
            savedUser.setUsername(user.getUsername());
        }
        return userRepository.save(savedUser);
    }
}
