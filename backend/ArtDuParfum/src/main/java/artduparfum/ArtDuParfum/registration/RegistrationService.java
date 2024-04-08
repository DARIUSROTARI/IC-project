//package artduparfum.ArtDuParfum.registration;
//
//import artduparfum.ArtDuParfum.appuser.AppUser;
//import artduparfum.ArtDuParfum.appuser.AppUserRole;
//import artduparfum.ArtDuParfum.appuser.AppUserService;
//import lombok.AllArgsConstructor;
//import org.springframework.stereotype.Service;
//
//@Service
//@AllArgsConstructor
//public class RegistrationService {
//    private final AppUserService appUserService;
//    private final EmailValidator emailValidator;
//    public String register(RegistrationRequest request) {
//       boolean isValidEmail = emailValidator.test(request.getEmail());
//
//       if(!isValidEmail){
//           throw new IllegalStateException("email not valid");
//       }
//
//        return appUserService.signUpUser(
//                new AppUser(
//                        request.getLastName(),
//                        request.getFirstName(),
//                        request.getDateOfBirth(),
//                        request.getEmail(),
//                        request.getPassword(),
//                        AppUserRole.USER
//                )
//        );
//    }
//
//
//}
