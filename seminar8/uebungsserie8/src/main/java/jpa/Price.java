package jpa;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;

import java.math.BigDecimal;
import java.time.LocalDate;

@Entity
@Table(name = "PRICE")
public class Price {
    @NotNull
    @Column(name = "PRODID", nullable = false)
    private Integer prodid;

    @Column(name = "STDPRICE", precision = 8, scale = 2)
    private BigDecimal stdprice;

    @Column(name = "MINPRICE", precision = 8, scale = 2)
    private BigDecimal minprice;

    @Column(name = "STARTDATE")
    private LocalDate startdate;

    @Column(name = "ENDDATE")
    private LocalDate enddate;
    @Id
    private Long id;

    public Integer getProdid() {
        return prodid;
    }

    public void setProdid(Integer prodid) {
        this.prodid = prodid;
    }

    public BigDecimal getStdprice() {
        return stdprice;
    }

    public void setStdprice(BigDecimal stdprice) {
        this.stdprice = stdprice;
    }

    public BigDecimal getMinprice() {
        return minprice;
    }

    public void setMinprice(BigDecimal minprice) {
        this.minprice = minprice;
    }

    public LocalDate getStartdate() {
        return startdate;
    }

    public void setStartdate(LocalDate startdate) {
        this.startdate = startdate;
    }

    public LocalDate getEnddate() {
        return enddate;
    }

    public void setEnddate(LocalDate enddate) {
        this.enddate = enddate;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }
}