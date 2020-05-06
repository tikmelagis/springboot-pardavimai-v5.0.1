package com.jonaspetrauskas.civ.repository;

import com.jonaspetrauskas.civ.model.BusinessUnit;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BusinessUnitRep extends JpaRepository<BusinessUnit, Integer> {

    public BusinessUnit findByName(String name);
}
