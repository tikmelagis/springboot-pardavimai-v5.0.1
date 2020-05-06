package com.jonaspetrauskas.civ.repository;

import com.jonaspetrauskas.civ.model.Biudzetas;
import com.jonaspetrauskas.civ.model.BusinessUnit;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BiudzetasRep extends JpaRepository<Biudzetas, Long> {

    public List<Biudzetas> findAllByMetai(String metai);

    public List<Biudzetas> findAllByMetaiAndBusinessUnitAndMenuo(String metai, BusinessUnit bu, String menuo);

    public boolean existsByMetaiAndMenuoAndBusinessUnit(String metai, String menuo, BusinessUnit unitas);

    public Biudzetas findBiudzetasByMetaiEqualsAndMenuoEqualsAndBusinessUnitEquals(String metai, String Menuo, BusinessUnit unitas);
}
