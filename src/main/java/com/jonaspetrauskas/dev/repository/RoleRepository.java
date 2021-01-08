package com.jonaspetrauskas.dev.repository;

import com.jonaspetrauskas.dev.model.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RoleRepository extends JpaRepository<Role, Long>{

    public List<Role> findAllByNameNotContains(String role);
}
