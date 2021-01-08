package com.jonaspetrauskas.dev.repository;

import com.jonaspetrauskas.dev.model.BusinessUnit;
import com.jonaspetrauskas.dev.model.PardavimaiLent;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PardavimaiLentRep extends JpaRepository<PardavimaiLent,Integer> {

   public List<PardavimaiLent> findAllByUseriukas_IdAndKetvirtisAndMetaiAndBunitas(Long id,String ketvirtis, String metai, BusinessUnit unit);
   public List<PardavimaiLent> findAllByUseriukas_IdAndMetaiAndBunitas(Long id,String metai, BusinessUnit unit);
   public List<PardavimaiLent> findAllByUseriukas_IdAndBunitas(Long id, BusinessUnit unit);

   public List<PardavimaiLent> findAllByUseriukas_IdAndPlanuojamaAtlikimoDataContainsAndBunitas(Long id, String metai, BusinessUnit unit);
   public List<PardavimaiLent> findAllByUseriukas_IdAndPlanuojamaAtlikimoData2ContainsAndBunitas(Long id, String metai, BusinessUnit unit);
   public List<PardavimaiLent> findAllByUseriukas_IdAndPlanuojamaAtlikimoData3ContainsAndBunitas(Long id, String metai, BusinessUnit unit);
   public List<PardavimaiLent> findAllByUseriukas_IdAndPlanuojamaAtlikimoData4ContainsAndBunitas(Long id, String metai, BusinessUnit unit);
   public List<PardavimaiLent> findAllByBunitas(BusinessUnit unit);



   //public List<PardavimaiLent> findAllByUseriukas_IdAndKetvirtisAndMetai(Long id,String ketvirtis, String metai);
   public List<PardavimaiLent> findAllByUseriukas_Id(Long id);
   //public List<PardavimaiLent> findAllByUseriukas_IdAndMetai(Long id,String metai);
   //public List<PardavimaiLent> findAllByUseriukas_IdAndPlanuojamaAtlikimoDataContains(Long id, String metai);
   //public List<PardavimaiLent> findAllByUseriukas_IdAndPlanuojamaAtlikimoData2Contains(Long id, String metai);
   public List<PardavimaiLent> findAllByUseriukas_UnitasAndMetai(BusinessUnit unit, String metai);
   //public List<PardavimaiLent> findAllByUseriukas_Unitas(BusinessUnit unit);

}
