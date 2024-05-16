package artduparfum.ArtDuParfum.repository.dto.request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class AddressDTO {
    private String country;
    private String region;
    private String city;
    private String postCode;
    private String address;
    private String phone;
}
