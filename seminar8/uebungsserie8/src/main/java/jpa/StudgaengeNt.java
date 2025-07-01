package jpa;

import jakarta.persistence.*;

@Entity
@Table(name = "STUDGAENGE_NT")
public class StudgaengeNt {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(nullable = false)
    private Long id;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
//TODO [Reverse Engineering] generate columns from DB
}