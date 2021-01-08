package com.jonaspetrauskas.dev.repository.komentarai;

import com.jonaspetrauskas.dev.model.Attachmentai;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AttachmentaiRep extends JpaRepository<Attachmentai, Long> {

    public List<Attachmentai> findAllByPardavimas_Id(Integer pardavimoid);
}
