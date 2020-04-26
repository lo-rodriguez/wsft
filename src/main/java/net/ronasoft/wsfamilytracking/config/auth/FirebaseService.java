package net.ronasoft.wsfamilytracking.config.auth;


public interface FirebaseService {

    TokenInfo parseToken(String idToken);

}
