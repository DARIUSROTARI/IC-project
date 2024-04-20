package artduparfum.ArtDuParfum.repository;

import artduparfum.ArtDuParfum.repository.entity.Parfum;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Repository
@Transactional(readOnly = true)
public interface ParfumRepository extends JpaRepository<Parfum, Long> {
    Optional<Parfum> findById(Long id);
}
