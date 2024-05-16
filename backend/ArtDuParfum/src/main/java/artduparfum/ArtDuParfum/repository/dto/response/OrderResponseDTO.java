package artduparfum.ArtDuParfum.repository.dto.response;

import artduparfum.ArtDuParfum.repository.dto.request.AddressDTO;
import artduparfum.ArtDuParfum.repository.enums.DeliveryMethod;
import artduparfum.ArtDuParfum.repository.enums.PaymentMethod;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class OrderResponseDTO {
    private Long id;
    private AddressDTO addressDTO;
    private DeliveryMethod deliveryMethod;
    private PaymentMethod paymentMethod;
}
