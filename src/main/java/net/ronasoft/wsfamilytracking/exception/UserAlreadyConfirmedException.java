package net.ronasoft.wsfamilytracking.exception;

public class UserAlreadyConfirmedException extends RuntimeException {

    public UserAlreadyConfirmedException(String message) {
        super(message);
    }
}
