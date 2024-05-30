package artduparfum.ArtDuParfum.repository.dto.response;

import artduparfum.ArtDuParfum.repository.entity.User;
import artduparfum.ArtDuParfum.repository.enums.Category;
import artduparfum.ArtDuParfum.repository.enums.Essences;
import artduparfum.ArtDuParfum.repository.enums.Quantity;
import artduparfum.ArtDuParfum.repository.enums.Types;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ParfumResponseDTO {
    private Category category;
    private Types type;
    private Quantity quantity;
    private Essences[] parfumEssences;
    private Long id;
}
