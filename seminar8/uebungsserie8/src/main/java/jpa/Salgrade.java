package jpa;

import jakarta.persistence.*;

@Entity
@Table(name = "SALGRADE")
public class Salgrade {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(nullable = false)
    private Long id;

    @Column(name = "GRADE")
    private Long grade;

    @Column(name = "LOSAL")
    private Long losal;

    @Column(name = "HISAL")
    private Long hisal;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getGrade() {
        return grade;
    }

    public void setGrade(Long grade) {
        this.grade = grade;
    }

    public Long getLosal() {
        return losal;
    }

    public void setLosal(Long losal) {
        this.losal = losal;
    }

    public Long getHisal() {
        return hisal;
    }

    public void setHisal(Long hisal) {
        this.hisal = hisal;
    }

}