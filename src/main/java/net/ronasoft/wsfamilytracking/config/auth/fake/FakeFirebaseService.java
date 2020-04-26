package net.ronasoft.wsfamilytracking.config.auth.fake;

import java.util.Map;

import org.springframework.context.annotation.Profile;
import org.springframework.security.oauth2.common.exceptions.InvalidTokenException;
import org.springframework.stereotype.Service;

import net.ronasoft.wsfamilytracking.config.auth.FirebaseService;
import net.ronasoft.wsfamilytracking.config.auth.TokenInfo;

@Service
@Profile("fake-token-granter")
public class FakeFirebaseService implements FirebaseService {

    public static final String FAKE_PICTURES_URL = "/fake-pictures/";
    private static final String PICTURE_EXT = ".jpg";
    private FakeTokenProperties fakeTokenProperties;

    public FakeFirebaseService(FakeTokenProperties fakeTokenProperties) {
        this.fakeTokenProperties = fakeTokenProperties;
    }

    @Override
    public TokenInfo parseToken(String idToken) {
        Map<String, FakeToken> tokens = fakeTokenProperties.getFakeTokens();

        if (!tokens.containsKey(idToken)) {
            throw new InvalidTokenException("Invalid token. See application-fake-token-granter.yml");
        }

        FakeToken fakeToken = tokens.get(idToken);

        return TokenInfo.builder()
                .email(fakeToken.getEmail())
                .name(fakeToken.getName())
                .uid(idToken)
                .pictureUrl(FAKE_PICTURES_URL + fakeToken.getName() + PICTURE_EXT)
                .build();

    }
}
