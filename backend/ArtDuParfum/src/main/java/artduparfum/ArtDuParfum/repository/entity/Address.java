package artduparfum.ArtDuParfum.repository.entity;

import jakarta.persistence.*;
import lombok.*;

@Setter
@Getter
@Table(name = "\"addresses\"")
@Entity
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Address {

    @Id
    @GeneratedValue(
            strategy = GenerationType.AUTO
    )
    private Long id;

    private String country;
    private String region;
    private String city;
    private String postCode;
    private String address;
    private String phone;

    @OneToOne
    private Order order;
}
