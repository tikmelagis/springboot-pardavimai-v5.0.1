package com.jonaspetrauskas.dev.repository;

import com.jonaspetrauskas.dev.model.BusinessUnit;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BusinessUnitRep extends JpaRepository<BusinessUnit, Integer> {

    public BusinessUnit findByName(String name);
}
