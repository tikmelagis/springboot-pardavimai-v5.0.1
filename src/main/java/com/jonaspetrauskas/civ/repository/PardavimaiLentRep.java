package com.jonaspetrauskas.civ.repository;

import com.jonaspetrauskas.civ.model.BusinessUnit;
import com.jonaspetrauskas.civ.model.PardavimaiLent;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PardavimaiLentRep extends JpaRepository<PardavimaiLent,Integer> {

   public List<PardavimaiLent> findAllByUseriukas_IdAndKetvirtisAndMetai(Long id,String ketvirtis, String metai);
   public List<PardavimaiLent> findAllByUseriukas_Id(Long id);
   public List<PardavimaiLent> findAllByUseriukas_IdAndMetai(Long id,String metai);
   public List<PardavimaiLent> findAllByUseriukas_IdAndPlanuojamaAtlikimoDataContains(Long id, String metai);
   public List<PardavimaiLent> findAllByUseriukas_UnitasAndMetai(BusinessUnit unit, String metai);
   public List<PardavimaiLent> findAllByUseriukas_Unitas(BusinessUnit unit);

}
