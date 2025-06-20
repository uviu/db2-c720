package jpa;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "DEPT")
public class Dept {
    @Id
    @Column(name = "DEPTNO", nullable = false)
    private Short id;

    @Size(max = 14)
    @Column(name = "DNAME", length = 14)
    private String dname;

    @Size(max = 13)
    @Column(name = "LOC", length = 13)
    private String loc;

    public Short getId() {
        return id;
    }

    public void setId(Short id) {
        this.id = id;
    }

    public String getDname() {
        return dname;
    }

    public void setDname(String dname) {
        this.dname = dname;
    }

    public String getLoc() {
        return loc;
    }

    public void setLoc(String loc) {
        this.loc = loc;
    }

}