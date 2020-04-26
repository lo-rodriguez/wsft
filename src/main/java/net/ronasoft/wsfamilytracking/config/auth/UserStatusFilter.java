package net.ronasoft.wsfamilytracking.config.auth;

import java.io.IOException;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.security.oauth2.provider.authentication.OAuth2AuthenticationDetails;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.filter.OncePerRequestFilter;

import com.google.gson.Gson;

import net.ronasoft.wsfamilytracking.config.controller.MainExceptionHandler;
import net.ronasoft.wsfamilytracking.exception.InactiveUserException;
import net.ronasoft.wsfamilytracking.exception.InvalidUserException;

public class UserStatusFilter extends OncePerRequestFilter {
	private static final Logger logger = LogManager.getLogger(UserStatusFilter.class);
    private Gson gson = new Gson();

    @Override
    protected void doFilterInternal(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, FilterChain filterChain) throws ServletException, IOException {
    	logger.info("Here doFilterInternal...");
        try {
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            if (authentication instanceof OAuth2Authentication) {
                OAuth2AuthenticationDetails details = (OAuth2AuthenticationDetails) authentication.getDetails();
                TokenInfo tokenInfo = (TokenInfo) details.getDecodedDetails();

                if (!tokenInfo.isValidated()) {
                    throw new InvalidUserException("User needs to be validated by administrators");
                }

                if (!tokenInfo.isEnabled()) {
                    throw new InactiveUserException("Inactive user");
                }
            }
        } catch (InactiveUserException | InvalidUserException ex) {
            prepareErrorResponse(ex, HttpStatus.FORBIDDEN, httpServletResponse);
            return;
        }

        filterChain.doFilter(httpServletRequest, httpServletResponse);
    }

    private void prepareErrorResponse(Exception ex, HttpStatus status, HttpServletResponse response) throws IOException {
    	logger.info("Here prepareErrorResponse...");
        response.setContentType(MimeTypeUtils.APPLICATION_JSON_VALUE);
        response.setStatus(status.value());

        try (OutputStream os = response.getOutputStream()) {
            MainExceptionHandler.Error error = new MainExceptionHandler.Error()
                    .message(ex.getMessage())
                    .exception(ex.getClass().getCanonicalName());

            os.write(gson.toJson(error).getBytes(StandardCharsets.UTF_8));
        }
    }
}
