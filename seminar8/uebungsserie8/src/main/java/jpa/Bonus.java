package jpa;

import jakarta.persistence.*;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "BONUS")
public class Bonus {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(nullable = false)
    private Long id;

    @Override
    public String toString() {
        return "Bonus{" +
                "id=" + id +
                ", ename='" + ename + '\'' +
                ", job='" + job + '\'' +
                ", sal=" + sal +
                ", comm=" + comm +
                '}';
    }

    @Size(max = 10)
    @Column(name = "ENAME", length = 10)
    private String ename;

    @Size(max = 9)
    @Column(name = "JOB", length = 9)
    private String job;

    @Column(name = "SAL")
    private Long sal;

    @Column(name = "COMM")
    private Long comm;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getEname() {
        return ename;
    }

    public void setEname(String ename) {
        this.ename = ename;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public Long getSal() {
        return sal;
    }

    public void setSal(Long sal) {
        this.sal = sal;
    }

    public Long getComm() {
        return comm;
    }

    public void setComm(Long comm) {
        this.comm = comm;
    }

}