package jpa;

import jakarta.persistence.*;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "PERSONAL")
public class Personal {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(nullable = false)
    private Long id;

    @Size(max = 20)
    @Column(name = "VNAME", length = 20)
    private String vname;

    @Size(max = 20)
    @Column(name = "NNAME", length = 20)
    private String nname;

    @Column(name = "GEBJAHR")
    private Short gebjahr;

    @Size(max = 30)
    @Column(name = "STRASSE", length = 30)
    private String strasse;

    @Size(max = 30)
    @Column(name = "ORT", length = 30)
    private String ort;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getVname() {
        return vname;
    }

    public void setVname(String vname) {
        this.vname = vname;
    }

    public String getNname() {
        return nname;
    }

    public void setNname(String nname) {
        this.nname = nname;
    }

    public Short getGebjahr() {
        return gebjahr;
    }

    public void setGebjahr(Short gebjahr) {
        this.gebjahr = gebjahr;
    }

    public String getStrasse() {
        return strasse;
    }

    public void setStrasse(String strasse) {
        this.strasse = strasse;
    }

    public String getOrt() {
        return ort;
    }

    public void setOrt(String ort) {
        this.ort = ort;
    }

/*
 TODO [Reverse Engineering] create field to map the 'MANAGER' column
 Available actions: Define target Java type | Uncomment as is | Remove column mapping
    @Column(name = "MANAGER", columnDefinition = "PERSON")
    private Object manager;
*/
}