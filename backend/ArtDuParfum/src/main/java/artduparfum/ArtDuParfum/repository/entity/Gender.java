package artduparfum.ArtDuParfum.repository.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.Data;


@Table(name = "\"gender\"")
@Data
public class Gender {

    private String gender;

}
