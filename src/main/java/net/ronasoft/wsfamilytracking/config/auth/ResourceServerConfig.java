package net.ronasoft.wsfamilytracking.config.auth;

import static net.ronasoft.wsfamilytracking.config.auth.SecurityServerConfig.FAKE_PICTURES_URL;
import static net.ronasoft.wsfamilytracking.config.auth.SecurityServerConfig.OAUTH_TOKEN_URL;

import javax.servlet.Filter;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableResourceServer;
import org.springframework.security.oauth2.config.annotation.web.configuration.ResourceServerConfigurerAdapter;
import org.springframework.security.web.authentication.www.BasicAuthenticationFilter;

@Configuration
@EnableResourceServer
public class ResourceServerConfig extends ResourceServerConfigurerAdapter {
	private static final Logger logger = LogManager.getLogger(ResourceServerConfig.class);
    @Override
    public void configure(HttpSecurity http) throws Exception {
    	logger.info("Here configure...");
        http
                .csrf().disable().authorizeRequests()
                .antMatchers(HttpMethod.OPTIONS, OAUTH_TOKEN_URL).permitAll()
                .antMatchers(HttpMethod.GET, FAKE_PICTURES_URL).permitAll()
                .anyRequest().authenticated()
                .and().addFilterAfter(userStatusFilter(), BasicAuthenticationFilter.class);
    }

    @Bean
    public Filter userStatusFilter() {
    	logger.info("Here userStatusFilter...");
        return new UserStatusFilter();
    }
}
