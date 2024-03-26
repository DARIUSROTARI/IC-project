package ic.project.ArtDuParfum.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "parfum")
public class Parfum {
    @Id
    private Long id;
}
