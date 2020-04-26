package net.ronasoft.wsfamilytracking.config.auth;

import java.util.UUID;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import net.ronasoft.wsfamilytracking.model.FirebaseUser;
import net.ronasoft.wsfamilytracking.model.User;
import net.ronasoft.wsfamilytracking.services.UserService;

@Service
public class TechnovationSlpAuthenticationManager implements AuthenticationManager {

    private UserService userService;

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        UserDetails userDetails;
        try {
            userDetails = userService.loadUserByUsername(authentication.getName());
        } catch (UsernameNotFoundException ex) {
            userDetails = tryToRegister((TokenInfo) authentication.getDetails());
        }

        return new TechnovationSlpAuthenticationToken(authentication, userDetails.getAuthorities(), true);
    }

    private UserDetails tryToRegister(TokenInfo details) {

        User user = User.builder()
                .id(UUID.randomUUID())
                .name(details.getName())
                .preferredEmail(details.getEmail())
                .pictureUrl(details.getPictureUrl())
                .enabled(false)
                .validated(false)
                .build();

        FirebaseUser firebaseUser = FirebaseUser.builder()
                .uid(details.getUid())
                .email(details.getEmail())
                .user(user)
                .build();

        return userService.register(firebaseUser);
    }

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }
}
