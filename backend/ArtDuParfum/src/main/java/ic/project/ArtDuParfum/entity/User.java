package ic.project.ArtDuParfum.entity;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "\"user\"")
@Data
public class User {
    @Id   // pentru primary key
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String username;
    @Column(unique = true)
    private String email;
    private String password;
}
