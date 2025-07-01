package jpa;

import jakarta.persistence.*;

@Entity
@Table(name = "DUMMY")
public class Dummy {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(nullable = false)
    private Long id;

    @Column(name = "DUMMY")
    private Long dummy;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getDummy() {
        return dummy;
    }

    public void setDummy(Long dummy) {
        this.dummy = dummy;
    }

    //TODO [Reverse Engineering] generate columns from DB
}