package artduparfum.ArtDuParfum.service;

import artduparfum.ArtDuParfum.repository.dto.request.ParfumDTO;
import artduparfum.ArtDuParfum.repository.dto.response.ParfumResponseDTO;
import artduparfum.ArtDuParfum.repository.enums.Destination;

import java.util.List;

public interface ParfumService {
    ParfumResponseDTO createParfum(Long id, ParfumDTO parfumDTO, Destination destination);

    List<ParfumResponseDTO> getCart(Long id);

    List<ParfumResponseDTO> getFavourite(Long id);
    void deleteFromCart(Long userId, Long parfumId);
    void deleteFromFavourite(Long userId, Long parfumId);
    void moveFromFavouriteToCart(Long userId, Long parfumId);
}
