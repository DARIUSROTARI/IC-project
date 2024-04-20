package artduparfum.ArtDuParfum.repository.entity;

import artduparfum.ArtDuParfum.repository.enums.Essences;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Entity
public class ParfumEssence {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    private Parfum parfum;

    private Essences essence;

    public ParfumEssence() {
    }

}
