package artduparfum.ArtDuParfum.service.impl;

import artduparfum.ArtDuParfum.exception.UserNotFoundException;
import artduparfum.ArtDuParfum.repository.OrderRepository;
import artduparfum.ArtDuParfum.repository.UserRepository;
import artduparfum.ArtDuParfum.repository.dto.request.AddressDTO;
import artduparfum.ArtDuParfum.repository.dto.request.OrderRequestDTO;
import artduparfum.ArtDuParfum.repository.dto.response.OrderResponseDTO;
import artduparfum.ArtDuParfum.repository.dto.response.ParfumResponseDTO;
import artduparfum.ArtDuParfum.repository.entity.Address;
import artduparfum.ArtDuParfum.repository.entity.Order;
import artduparfum.ArtDuParfum.repository.entity.User;
import artduparfum.ArtDuParfum.repository.AddressRepository;
import artduparfum.ArtDuParfum.repository.enums.Essences;
import artduparfum.ArtDuParfum.service.OrderService;
import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.stereotype.Service;

import java.lang.reflect.Type;
import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {

    private final OrderRepository orderRepository;
    private final UserRepository userRepository;
    private final AddressRepository addressRepository;
    private final ModelMapper modelMapper;

    public OrderServiceImpl(OrderRepository orderRepository, UserRepository userRepository, AddressRepository addressRepository, ModelMapper modelMapper) {
        this.orderRepository = orderRepository;
        this.userRepository = userRepository;
        this.addressRepository = addressRepository;
        this.modelMapper = modelMapper;
    }

    @Override
    public OrderResponseDTO createOrder(Long id, OrderRequestDTO orderRequest) {
        User user = userRepository.findById(id).orElseThrow(UserNotFoundException::new);
        Address address = mapAddressDTOToAddress(orderRequest.getAddressDTO());
        Order order = Order.builder()
                        .paymentMethod(orderRequest.getPaymentMethod())
                        .deliveryMethod(orderRequest.getDeliveryMethod())
                        .address(address)
                        .user(user)
                        .build();
//        order.setUser(user);
        user.getOrders().add(order);
        address.setOrder(order);
        addressRepository.save(address);
        orderRepository.save(order);
        userRepository.save(user);
        return OrderResponseDTO.builder()
                .id(order.getId())
                .addressDTO(mapAddressDTOToAddress(order.getAddress()))
                .paymentMethod(order.getPaymentMethod())
                .deliveryMethod(order.getDeliveryMethod())
                .build();
    }

    @Override
    public List<OrderResponseDTO> getAllOrdersByUserId(Long id) {
        User user = userRepository.findById(id).orElseThrow(UserNotFoundException::new);
        return user.getOrders().stream()
                .map(order -> OrderResponseDTO.builder()
                        .id(order.getId())
                        .addressDTO(mapAddressDTOToAddress(order.getAddress()))
                        .paymentMethod(order.getPaymentMethod())
                        .deliveryMethod(order.getDeliveryMethod())
                        .parfums(order.getUser().getCart().stream()
                                .map(parfum -> ParfumResponseDTO.builder()
                                        .category(parfum.getCategory())
                                        .type(parfum.getType())
                                        .quantity(parfum.getQuantity())
                                        .parfumEssences(mapListToArrayEssences(parfum.getParfumEssences()))
                                        .id(parfum.getId())
                                        .build())
                                .toList()
                        )
                        .build()
                ).toList();
    }

    private Address mapAddressDTOToAddress(AddressDTO addressDTO) {
        return Address.builder()
                .country(addressDTO.getCountry())
                .city(addressDTO.getCity())
                .address(addressDTO.getAddress())
                .phone(addressDTO.getPhone())
                .region(addressDTO.getRegion())
                .postCode(addressDTO.getPostCode())
                .build();
    }

    private AddressDTO mapAddressDTOToAddress(Address address) {
        return AddressDTO.builder()
                .country(address.getCountry())
                .city(address.getCity())
                .address(address.getAddress())
                .phone(address.getPhone())
                .region(address.getRegion())
                .postCode(address.getPostCode())
                .build();
    }

    private Essences[] mapListToArrayEssences(List<Essences> essences) {
        int size = essences.size();
        Essences[] array = new Essences[size];
        for (int i = 0; i < size; i++) {
            array[i] = essences.get(i);
        }
        return  array;
    }
}
