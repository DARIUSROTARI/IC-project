package ic.project.ArtDuParfum.service;

import ic.project.ArtDuParfum.entity.User;

public interface UserService {
    User create(User user);

    User read(Long id);

    void delete(Long id);

    User update(Long id, User user);
}
