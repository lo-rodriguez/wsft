package net.ronasoft.wsfamilytracking.services;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;

import net.ronasoft.wsfamilytracking.dto.UsersByRoleDTO;
import net.ronasoft.wsfamilytracking.model.FirebaseUser;
import net.ronasoft.wsfamilytracking.model.User;


public interface UserService extends UserDetailsService {
    Optional<User> findByUsername(String username);

    UserDetails register(FirebaseUser firebaseUser);

    List<User> findByValidated(boolean b);

    User activate(User user);

    List<User> findAll();

    User findById(UUID uuid);

    User save(User user);

    List<UsersByRoleDTO> getUsersByRole(String roleName);

    void updateProfilePicture(String pictureUrl, UUID userId);
}
