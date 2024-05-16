package artduparfum.ArtDuParfum.repository.entity;

import artduparfum.ArtDuParfum.repository.enums.DeliveryMethod;
import artduparfum.ArtDuParfum.repository.enums.PaymentMethod;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@Table(name = "orders")
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @OneToOne(
            mappedBy = "order",
            cascade = CascadeType.ALL,
            orphanRemoval = true
    )
    private Address address;

    @ManyToOne(fetch = FetchType.EAGER)
    private User user;

    private PaymentMethod paymentMethod;;

    private DeliveryMethod deliveryMethod;
}
