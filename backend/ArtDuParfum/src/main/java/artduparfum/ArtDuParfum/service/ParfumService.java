package artduparfum.ArtDuParfum.service;

import artduparfum.ArtDuParfum.repository.dto.request.ParfumDTO;
import artduparfum.ArtDuParfum.repository.dto.response.ParfumResponseDTO;

public interface ParfumService {
    ParfumResponseDTO createParfum(ParfumDTO parfumDTO);
}
