package net.ronasoft.wsfamilytracking.config.auth.firebase;

import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseToken;

import net.ronasoft.wsfamilytracking.config.auth.FirebaseService;
import net.ronasoft.wsfamilytracking.config.auth.TokenInfo;
import net.ronasoft.wsfamilytracking.exception.FirebaseTokenInvalidException;

@Service
@Profile("!fake-token-granter")
public class FirebaseServiceImpl implements FirebaseService {

    @Override
    public TokenInfo parseToken(String firebaseToken) {

        if (StringUtils.isEmpty(firebaseToken)) {
            throw new IllegalArgumentException("FirebaseTokenBlank");
        }

        try {
            FirebaseToken token = FirebaseAuth.getInstance().verifyIdToken(firebaseToken);

            return TokenInfo.builder()
                    .uid(token.getUid())
                    .name(token.getName())
                    .email(token.getEmail())
                    .pictureUrl(token.getPicture())
                    .build();

        } catch (Exception e) {
            throw new FirebaseTokenInvalidException(e.getMessage());
        }
    }
}
