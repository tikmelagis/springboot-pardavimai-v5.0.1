package com.jonaspetrauskas.civ.repository.komentarai;

import com.jonaspetrauskas.civ.model.ResponseKomentaras;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ResponseKomentaraiRep extends JpaRepository<ResponseKomentaras,Long> {
}
