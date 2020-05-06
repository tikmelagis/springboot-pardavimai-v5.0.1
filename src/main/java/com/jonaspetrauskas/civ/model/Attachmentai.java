package com.jonaspetrauskas.civ.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;

@Entity
@Table(name="attachments")
public class Attachmentai {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String title;
    private String description;
    @Transient
    private MultipartFile multipartFile;

    private String ikelimoData;
    private String filePath;

    @ManyToOne
    @JoinColumn(name = "pardavimo_id")
    private PardavimaiLent pardavimas;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User vartotojas;




    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public MultipartFile getMultipartFile() {
        return multipartFile;
    }

    public void setMultipartFile(MultipartFile multipartFile) {
        this.multipartFile = multipartFile;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public PardavimaiLent getPardavimas() {
        return pardavimas;
    }

    public void setPardavimas(PardavimaiLent pardavimas) {
        this.pardavimas = pardavimas;
    }

    public String getIkelimoData() {
        return ikelimoData;
    }

    public void setIkelimoData(String ikelimoData) {
        this.ikelimoData = ikelimoData;
    }

    public User getVartotojas() {
        return vartotojas;
    }

    public void setVartotojas(User vartotojas) {
        this.vartotojas = vartotojas;
    }
}
