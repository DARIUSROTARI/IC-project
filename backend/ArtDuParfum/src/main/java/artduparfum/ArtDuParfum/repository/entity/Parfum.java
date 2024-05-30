package artduparfum.ArtDuParfum.repository.entity;

import artduparfum.ArtDuParfum.repository.enums.Category;
import artduparfum.ArtDuParfum.repository.enums.Essences;
import artduparfum.ArtDuParfum.repository.enums.Quantity;
import artduparfum.ArtDuParfum.repository.enums.Types;

import jakarta.persistence.*;
import lombok.*;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "\"parfumes\"")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Parfum {

    @Enumerated(EnumType.STRING)
    private Category category; //MALE, FEMALE, UNISEX

    @Enumerated(EnumType.STRING)
    private Types type; // EAU DE PARFUM, BODY OIL, ...

    @Enumerated(EnumType.STRING)
    private Quantity quantity; // ML_30, ML_50, ...

    private List<Essences> parfumEssences = new ArrayList<>();

    @Getter
    @Setter
    @Id
    @GeneratedValue(
            strategy = GenerationType.AUTO
    )
    @Column(unique = true, nullable = false)
    private Long id; // cheia primara pentru entitatea Parfum

    @ManyToOne
    private User user;

    @ManyToOne
    private User user2;

}
