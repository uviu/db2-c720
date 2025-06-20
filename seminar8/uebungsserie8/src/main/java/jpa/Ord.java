package jpa;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

import java.math.BigDecimal;
import java.time.LocalDate;

@Entity
@Table(name = "ORD")
public class Ord {
    @Id
    @Column(name = "ORDID", nullable = false)
    private Short id;

    @Column(name = "ORDERDATE")
    private LocalDate orderdate;

    @Size(max = 1)
    @Column(name = "COMMPLAN", length = 1)
    private String commplan;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "CUSTID", nullable = false)
    private Customer custid;

    @Column(name = "SHIPDATE")
    private LocalDate shipdate;

    @Column(name = "TOTAL", precision = 8, scale = 2)
    private BigDecimal total;

    public Short getId() {
        return id;
    }

    public void setId(Short id) {
        this.id = id;
    }

    public LocalDate getOrderdate() {
        return orderdate;
    }

    public void setOrderdate(LocalDate orderdate) {
        this.orderdate = orderdate;
    }

    public String getCommplan() {
        return commplan;
    }

    public void setCommplan(String commplan) {
        this.commplan = commplan;
    }

    public Customer getCustid() {
        return custid;
    }

    public void setCustid(Customer custid) {
        this.custid = custid;
    }

    public LocalDate getShipdate() {
        return shipdate;
    }

    public void setShipdate(LocalDate shipdate) {
        this.shipdate = shipdate;
    }

    public BigDecimal getTotal() {
        return total;
    }

    public void setTotal(BigDecimal total) {
        this.total = total;
    }

}