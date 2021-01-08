package com.jonaspetrauskas.dev.repository.komentarai;

import com.jonaspetrauskas.dev.model.Komentarai;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface KomentaraiRep extends JpaRepository<Komentarai, Long> {

    public List<Komentarai> findAllByPardavimas_Id(Integer pardavimoid);
}
