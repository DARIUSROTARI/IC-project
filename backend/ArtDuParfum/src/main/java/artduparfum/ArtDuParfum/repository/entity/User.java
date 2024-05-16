package artduparfum.ArtDuParfum.repository.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "\"users\"")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {

    @Id
    @GeneratedValue(
            strategy = GenerationType.AUTO
    )
    private Long id;
    private String lastName;
    private String firstName;
    private String dateOfBirth;
    @Column(unique = true, nullable = false)
    private String email;
    private String password;

    // un user poate avea mai multe parfumuri
    @OneToMany(
            mappedBy = "user",
            cascade = CascadeType.ALL,
            orphanRemoval = true
    )
    private List<Parfum> favouriteParfumes = new ArrayList<>();

    @OneToMany(
            mappedBy = "user2",
            cascade = CascadeType.ALL,
            orphanRemoval = true
    )
    private List<Parfum> cart = new ArrayList<>();

    @OneToMany(
            mappedBy = "user",
            cascade = CascadeType.ALL,
            orphanRemoval = true,
            fetch = FetchType.EAGER
    )
    private List<Order> orders = new ArrayList<>();

}
