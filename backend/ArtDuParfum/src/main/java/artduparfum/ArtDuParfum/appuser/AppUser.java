//package artduparfum.ArtDuParfum.appuser;
//
//import jakarta.persistence.*;
//import lombok.EqualsAndHashCode;
//import lombok.Getter;
//import lombok.NoArgsConstructor;
//import lombok.Setter;
//import org.springframework.security.core.GrantedAuthority;
//import org.springframework.security.core.authority.SimpleGrantedAuthority;
//import org.springframework.security.core.userdetails.UserDetails;
//
//import java.util.Collection;
//import java.util.Collections;
//
//@Getter
//@Setter
//@EqualsAndHashCode
//@NoArgsConstructor
//@Entity
//public class AppUser implements UserDetails {
//
//    @SequenceGenerator(
//            name = "user_sequence",
//            sequenceName = "user_sequence",
//            allocationSize = 1
//    )
//    @Id
//    @GeneratedValue(
//            strategy = GenerationType.SEQUENCE,
//            generator = "user_sequence"
//
//    )
//    private Long id;
//    @Getter
//    private String lastName;
//    @Getter
//    private String firstName;
//    @Getter
//    private String dateOfBirth;
//    private String email;
//    private String password;
//    @Enumerated(EnumType.STRING)
//    private AppUserRole appUserRole;
//    private Boolean locked;
//    private Boolean enabled;
//
//    public AppUser(String lastName, String firstName, String dateOfBirth, String email, String password, AppUserRole appUserRole) {
//        this.lastName = lastName;
//        this.firstName = firstName;
//        this.dateOfBirth = dateOfBirth;
//        this.email = email;
//        this.password = password;
//        this.appUserRole = appUserRole;
//    }
//
//    @Override
//    public Collection<? extends GrantedAuthority> getAuthorities() {
//        SimpleGrantedAuthority authority =
//                new SimpleGrantedAuthority(appUserRole.name());
//        return Collections.singletonList(authority);
//    }
//
//    @Override
//    public String getPassword() {
//        return password;
//    }
//
//    @Override
//    public String getUsername() {
//        return email;
//    }
//
//    @Override
//    public boolean isAccountNonExpired() {
//        return true;
//    }
//
//    @Override
//    public boolean isAccountNonLocked() {
//        return !locked;
//    }
//
//    @Override
//    public boolean isCredentialsNonExpired() {
//        return true;
//    }
//
//    @Override
//    public boolean isEnabled() {
//        return enabled;
//    }
//}
