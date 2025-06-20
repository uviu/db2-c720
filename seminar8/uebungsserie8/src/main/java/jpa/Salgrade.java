package jpa;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;

@Entity
@Table(name = "SALGRADE")
public class Salgrade {
    @Column(name = "GRADE")
    private Long grade;

    @Column(name = "LOSAL")
    private Long losal;

    @Column(name = "HISAL")
    private Long hisal;

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