package com.jonaspetrauskas.dev.repository;

import com.jonaspetrauskas.dev.model.MenesioPlanas;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MenesioPlanasRep extends JpaRepository<MenesioPlanas, Long> {

    public List<MenesioPlanas> findAllByPlanasMetaiAndPlanasUnit_IdAndPlanasUser_Id(Integer metai, Integer unitID, Long userID);

}
