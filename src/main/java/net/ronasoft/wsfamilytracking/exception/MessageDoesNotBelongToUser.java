package net.ronasoft.wsfamilytracking.exception;

public class MessageDoesNotBelongToUser extends RuntimeException {
    public MessageDoesNotBelongToUser(String message) {
        super(message);
    }
}
