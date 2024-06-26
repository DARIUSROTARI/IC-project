package artduparfum.ArtDuParfum.repository;

import artduparfum.ArtDuParfum.repository.entity.Address;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional(readOnly = true)
public interface AddressRepository extends JpaRepository<Address, Long> {
}
