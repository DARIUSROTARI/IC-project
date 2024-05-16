package artduparfum.ArtDuParfum.service;

import artduparfum.ArtDuParfum.repository.dto.request.OrderRequestDTO;
import artduparfum.ArtDuParfum.repository.dto.response.OrderResponseDTO;
import org.springframework.http.HttpStatusCode;

import java.util.List;

public interface OrderService {
    OrderResponseDTO createOrder(Long id, OrderRequestDTO orderRequest);

    List<OrderResponseDTO> getAllOrdersByUserId(Long id);
}
