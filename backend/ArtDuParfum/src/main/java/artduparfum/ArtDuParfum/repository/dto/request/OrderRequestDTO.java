package artduparfum.ArtDuParfum.repository.dto.request;

import artduparfum.ArtDuParfum.repository.enums.DeliveryMethod;
import artduparfum.ArtDuParfum.repository.enums.PaymentMethod;
import lombok.Data;

@Data
public class OrderRequestDTO {
    private AddressDTO addressDTO;
    private DeliveryMethod deliveryMethod;
    private PaymentMethod paymentMethod;
}
