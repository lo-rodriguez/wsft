package net.ronasoft.wsfamilytracking.config.auth;

import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.oauth2.common.DefaultOAuth2AccessToken;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.security.oauth2.provider.token.TokenEnhancer;
import org.springframework.stereotype.Component;

import net.ronasoft.wsfamilytracking.model.User;
import net.ronasoft.wsfamilytracking.services.UserService;

@Component
public class AdditionalJWTInformation implements TokenEnhancer {

    static final String EMAIL_KEY = "email";
    static final String NAME_KEY = "name";
    static final String ENABLED_KEY = "enabled";
    static final String VALIDATED_KEY = "validated";
    static final String USER_ID_KEY = "userId";
    static final String USER_NAME_KEY = "user_name";
    static final String CLIENT_ID_KEY = "client_id";
    private static final String PICTURE_URL = "picture_url";
    private static final String ROLES_KEY = "roles";
    private UserService userService;

    @Override
    public OAuth2AccessToken enhance(OAuth2AccessToken oAuth2AccessToken, OAuth2Authentication oAuth2Authentication) {
        Map<String, Object> info = new HashMap<>();
        User user = userService.findByUsername(oAuth2Authentication.getName()).orElseThrow();

        info.put(EMAIL_KEY, user.getPreferredEmail());
        info.put(NAME_KEY, user.getName());
        info.put(ENABLED_KEY, user.isEnabled());
        info.put(VALIDATED_KEY, user.isValidated());
        info.put(USER_ID_KEY, user.getId());
        info.put(PICTURE_URL, user.getPictureUrl());
        info.put(ROLES_KEY, oAuth2Authentication.getAuthorities().stream().map(GrantedAuthority::getAuthority).collect(Collectors.toList()));

        ((DefaultOAuth2AccessToken) oAuth2AccessToken).setAdditionalInformation(info);

        return oAuth2AccessToken;
    }

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }
}
