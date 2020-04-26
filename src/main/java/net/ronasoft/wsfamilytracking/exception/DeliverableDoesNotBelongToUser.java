package net.ronasoft.wsfamilytracking.exception;

public class DeliverableDoesNotBelongToUser extends RuntimeException {
    public DeliverableDoesNotBelongToUser(String message) {
        super(message);
    }
}
