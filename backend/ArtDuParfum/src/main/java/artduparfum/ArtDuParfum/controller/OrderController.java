package artduparfum.ArtDuParfum.controller;

import artduparfum.ArtDuParfum.repository.dto.request.OrderRequestDTO;
import artduparfum.ArtDuParfum.repository.dto.response.OrderResponseDTO;
import artduparfum.ArtDuParfum.service.OrderService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController("/api/v1/orders")
public class OrderController {
    private final OrderService orderService;

    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    @Transactional
    @PostMapping("/user-id={id}")
    public ResponseEntity<OrderResponseDTO> createOrder(@PathVariable Long id, @RequestBody OrderRequestDTO orderRequest) {
        return new ResponseEntity<>(orderService.createOrder(id, orderRequest), HttpStatus.CREATED);
    }

    @GetMapping("/all/user-id={id}")
    public ResponseEntity<List<OrderResponseDTO>> getAllOrdersByUserId(@PathVariable Long id) {
        return new ResponseEntity<>(orderService.getAllOrdersByUserId(id), HttpStatus.OK);
    }
}
