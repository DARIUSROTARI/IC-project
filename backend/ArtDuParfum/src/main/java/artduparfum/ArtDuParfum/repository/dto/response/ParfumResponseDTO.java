package artduparfum.ArtDuParfum.repository.dto.response;

import artduparfum.ArtDuParfum.repository.entity.User;
import artduparfum.ArtDuParfum.repository.enums.Category;
import artduparfum.ArtDuParfum.repository.enums.Essences;
import artduparfum.ArtDuParfum.repository.enums.Quantity;
import artduparfum.ArtDuParfum.repository.enums.Types;
import lombok.Data;

@Data
public class ParfumResponseDTO {
    private Category category;
    private Types type;
    private Quantity quantity;
    private Essences[] parfumEssences;
    private Long id;
}
