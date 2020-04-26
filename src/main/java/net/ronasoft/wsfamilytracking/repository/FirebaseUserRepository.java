package net.ronasoft.wsfamilytracking.repository;


import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import net.ronasoft.wsfamilytracking.model.FirebaseUser;

@Repository
public interface FirebaseUserRepository extends CrudRepository<FirebaseUser, String> {

    FirebaseUser findByEmail(String email);
}
