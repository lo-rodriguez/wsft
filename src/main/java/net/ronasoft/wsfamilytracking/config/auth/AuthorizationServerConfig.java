package net.ronasoft.wsfamilytracking.config.auth;

import java.util.Arrays;

import javax.sql.DataSource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.config.annotation.configurers.ClientDetailsServiceConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configuration.AuthorizationServerConfigurerAdapter;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableAuthorizationServer;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerEndpointsConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerSecurityConfigurer;
import org.springframework.security.oauth2.provider.token.TokenEnhancerChain;
import org.springframework.security.oauth2.provider.token.store.JwtAccessTokenConverter;
import org.springframework.util.Base64Utils;
import org.springframework.util.StringUtils;

import net.ronasoft.wsfamilytracking.config.auth.firebase.FirebaseTokenGranter;
import net.ronasoft.wsfamilytracking.services.UserService;


@Configuration
@EnableAuthorizationServer
public class AuthorizationServerConfig extends AuthorizationServerConfigurerAdapter {
	private static final Logger logger = LogManager.getLogger(AuthorizationServerConfig.class);

    private TechnovationSlpAuthenticationManager authenticationManager;

    private FirebaseService firebaseService;

    private AdditionalJWTInformation additionalJWTInformation;

    private JwtConfig jwtConfig;

    private DataSource dataSource;

    private UserService userService;

    @Override
    public void configure(AuthorizationServerSecurityConfigurer security) {
    	logger.info("Here configure...");
        security.tokenKeyAccess("permitAll()")
                .checkTokenAccess("isAuthenticated()");
    }

    @Override
    public void configure(ClientDetailsServiceConfigurer clients) throws Exception {
    	logger.info("Here configure...");
        clients.jdbc(dataSource).passwordEncoder(getPasswordEncoder());
    }

    @Override
    public void configure(AuthorizationServerEndpointsConfigurer endpoints) {
    	logger.info("Here configure...");
        TokenEnhancerChain tokenEnhancerChain = new TokenEnhancerChain();

        tokenEnhancerChain.setTokenEnhancers(Arrays.asList(additionalJWTInformation, accessTokenConverter()));

        FirebaseTokenGranter firebaseTokenGranter = new FirebaseTokenGranter(endpoints.getTokenServices(), endpoints.getClientDetailsService(), endpoints.getOAuth2RequestFactory(), firebaseService, authenticationManager);

        endpoints.accessTokenConverter(accessTokenConverter())
                .tokenGranter(firebaseTokenGranter)
                .tokenEnhancer(tokenEnhancerChain);
    }

    @Bean
    public JwtAccessTokenConverter accessTokenConverter() {
    	logger.info("Here accessTokenConverter...");
        if (StringUtils.isEmpty(jwtConfig.getPrivateKey()) || StringUtils.isEmpty(jwtConfig.getPublicKey())) {
            return null;
        }

        JwtAccessTokenConverter accessTokenConverter = new CustomJwtAccessTokenConverter(userService);
        byte[] privateKey = Base64Utils.decodeFromString(jwtConfig.getPrivateKey());
        byte[] publicKey = Base64Utils.decodeFromString(jwtConfig.getPublicKey());

        accessTokenConverter.setSigningKey(new String(privateKey));
        accessTokenConverter.setVerifierKey(new String(publicKey));

        return accessTokenConverter;
    }

    @Bean
    public PasswordEncoder getPasswordEncoder() {
    	logger.info("Here getPasswordEncoder...");
        return new BCryptPasswordEncoder();
    }


    @Autowired
    public void setAuthenticationManager(TechnovationSlpAuthenticationManager authenticationManager) {
    	logger.info("Here setAuthenticationManager...");
        this.authenticationManager = authenticationManager;
    }

    @Autowired
    public void setFirebaseService(FirebaseService firebaseService) {
    	logger.info("Here setFirebaseService...");
        this.firebaseService = firebaseService;
    }

    @Autowired
    public void setAdditionalJWTInformation(AdditionalJWTInformation additionalJWTInformation) {
    	logger.info("Here setAdditionalJWTInformation...");
        this.additionalJWTInformation = additionalJWTInformation;
    }

    @Autowired
    public void setJwtConfig(JwtConfig jwtConfig) {
    	logger.info("Here setJwtConfig...");
        this.jwtConfig = jwtConfig;
    }

    @Autowired
    public void setDataSource(DataSource dataSource) {
    	logger.info("Here setDataSource...");
        this.dataSource = dataSource;
    }

    @Autowired
    public void setUserService(UserService userService) {
    	logger.info("Here setUserService...");
        this.userService = userService;
    }
}
