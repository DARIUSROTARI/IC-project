package ic.project.ArtDuParfum.repository;

import ic.project.ArtDuParfum.entity.Parfum;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ParfumRepository extends JpaRepository<Parfum, Long> {
}
