package artduparfum.ArtDuParfum.repository.dto.request;

import artduparfum.ArtDuParfum.repository.entity.User;
import artduparfum.ArtDuParfum.repository.enums.Category;
import artduparfum.ArtDuParfum.repository.enums.Essences;
import artduparfum.ArtDuParfum.repository.enums.Quantity;
import artduparfum.ArtDuParfum.repository.enums.Types;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter

public class ParfumDTO {
    private Category category;
    private Types type;
    private Quantity  quantity;
    private Essences[] parfumEssences;
    private User user;

}
