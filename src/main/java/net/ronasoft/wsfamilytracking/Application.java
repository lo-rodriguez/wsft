package net.ronasoft.wsfamilytracking;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableAuthorizationServer;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableResourceServer;

/**
 * The type Application.
 *
 * @author Givantha Kalansuriya
 */
@SpringBootApplication
@EnableAuthorizationServer
@EnableResourceServer
public class Application extends SpringBootServletInitializer{

  /**
   * The entry point of application.
   *
   * @param args the input arguments
   */
	private static final Logger logger = LogManager.getLogger(Application.class);
  public static void main(String[] args) {
	  logger.info("Init...");
		SpringApplication.run(Application.class, args);
	}
}
