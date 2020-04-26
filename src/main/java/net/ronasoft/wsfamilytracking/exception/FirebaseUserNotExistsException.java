package net.ronasoft.wsfamilytracking.exception;

import org.springframework.security.authentication.AuthenticationCredentialsNotFoundException;

public class FirebaseUserNotExistsException extends AuthenticationCredentialsNotFoundException {

    public FirebaseUserNotExistsException() {
        super("User Not Fount");
    }
}
