package com.jonaspetrauskas.dev.repository.komentarai;

import com.jonaspetrauskas.dev.model.ResponseKomentaras;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ResponseKomentaraiRep extends JpaRepository<ResponseKomentaras,Long> {
}
