package jpa;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

import java.math.BigDecimal;
import java.time.LocalDate;

@Entity
@Table(name = "EMP")
public class Emp {
    @Id
    @Column(name = "EMPNO", nullable = false)
    private Short id;

    @Size(max = 10)
    @Column(name = "ENAME", length = 10)
    private String ename;

    @Size(max = 9)
    @Column(name = "JOB", length = 9)
    private String job;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MGR")
    private Emp mgr;

    @Column(name = "HIREDATE")
    private LocalDate hiredate;

    @Column(name = "SAL", precision = 7, scale = 2)
    private BigDecimal sal;

    @Column(name = "COMM", precision = 7, scale = 2)
    private BigDecimal comm;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "DEPTNO", nullable = false)
    private Dept deptno;

    public Short getId() {
        return id;
    }

    public void setId(Short id) {
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

    public Emp getMgr() {
        return mgr;
    }

    public void setMgr(Emp mgr) {
        this.mgr = mgr;
    }

    public LocalDate getHiredate() {
        return hiredate;
    }

    public void setHiredate(LocalDate hiredate) {
        this.hiredate = hiredate;
    }

    public BigDecimal getSal() {
        return sal;
    }

    public void setSal(BigDecimal sal) {
        this.sal = sal;
    }

    public BigDecimal getComm() {
        return comm;
    }

    public void setComm(BigDecimal comm) {
        this.comm = comm;
    }

    public Dept getDeptno() {
        return deptno;
    }

    public void setDeptno(Dept deptno) {
        this.deptno = deptno;
    }

}