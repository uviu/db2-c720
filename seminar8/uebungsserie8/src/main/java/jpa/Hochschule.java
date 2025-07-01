package jpa;

import jakarta.persistence.*;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "HOCHSCHULE")
public class Hochschule {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(nullable = false)
    private Long id;

    @Size(max = 5)
    @Column(name = "FBEZ", length = 5)
    private String fbez;

    @Size(max = 50)
    @Column(name = "ADRESSE", length = 50)
    private String adresse;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFbez() {
        return fbez;
    }

    public void setFbez(String fbez) {
        this.fbez = fbez;
    }

    public String getAdresse() {
        return adresse;
    }

    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

/*
 TODO [Reverse Engineering] create field to map the 'STUDGAENGE' column
 Available actions: Define target Java type | Uncomment as is | Remove column mapping
    @Column(name = "STUDGAENGE", columnDefinition = "SG_TABLE_TYPE")
    private Object studgaenge;
*/
}