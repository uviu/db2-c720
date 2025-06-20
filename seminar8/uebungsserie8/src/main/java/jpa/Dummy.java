package jpa;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;

@Entity
@Table(name = "DUMMY")
public class Dummy {
    @Column(name = "DUMMY")
    private Long dummy;

    public Long getDummy() {
        return dummy;
    }

    public void setDummy(Long dummy) {
        this.dummy = dummy;
    }

    //TODO [Reverse Engineering] generate columns from DB
}