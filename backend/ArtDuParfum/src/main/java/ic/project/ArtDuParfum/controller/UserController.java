package ic.project.ArtDuParfum.controller;

import ic.project.ArtDuParfum.entity.User;
import ic.project.ArtDuParfum.exception.EmailAlreadyExistException;
import ic.project.ArtDuParfum.exception.UserNotFoundException;
import ic.project.ArtDuParfum.service.UserService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController // for controller
@RequestMapping("/api/v1/users")
public class UserController {
    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/hello")
    public String hello() {
        return "Hello world!";
    }

    @PostMapping
    public ResponseEntity<User> create(@RequestBody User user) {
        return new ResponseEntity<>(userService.create(user), HttpStatus.CREATED);
    }

    @GetMapping("/{id}")
    public ResponseEntity<User> read(@PathVariable Long id) {
        return new ResponseEntity<>(userService.read(id), HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        userService.delete(id);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

    @PutMapping("{id}")
    public ResponseEntity<User> update(@PathVariable Long id,@RequestBody User user) {
        return new ResponseEntity<>(userService.update(id,user), HttpStatus.OK );
    }

    @ExceptionHandler(UserNotFoundException.class)
    public ResponseEntity<String> handleUserNotFound(UserNotFoundException userNotFoundException) {
        return new ResponseEntity<>(userNotFoundException.getMessage(), HttpStatus.NOT_FOUND);
    }

    @ExceptionHandler(EmailAlreadyExistException.class)
    public ResponseEntity<String> handleEmailAlreadyExist(EmailAlreadyExistException emailAlreadyExistException){
        return new ResponseEntity<>(emailAlreadyExistException.getMessage(), HttpStatus.BAD_REQUEST);
    }

}
