package com.jonaspetrauskas.dev.repository;

import com.jonaspetrauskas.dev.model.BusinessUnit;
import com.jonaspetrauskas.dev.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
    List<User> findAllByUnitas_Id(Long buId);
    List<User> findAllByUnitasInAndRoles_Name(List<BusinessUnit> bunit, String role);
    List<User> findAllByRoles_Name(String role);
    List<User> findAllByRoles_NameAndUnitas(String role, BusinessUnit unitas);
}
