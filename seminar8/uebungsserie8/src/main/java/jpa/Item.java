package jpa;

import jakarta.persistence.*;

import java.math.BigDecimal;

@Entity
@Table(name = "ITEM")
public class Item {
    @EmbeddedId
    private ItemId id;

    @MapsId("ordid")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "ORDID", nullable = false)
    private Ord ordid;

    @Column(name = "PRODID")
    private Integer prodid;

    @Column(name = "ACTUALPRICE", precision = 8, scale = 2)
    private BigDecimal actualprice;

    @Column(name = "QTY")
    private Integer qty;

    @Column(name = "ITEMTOT", precision = 8, scale = 2)
    private BigDecimal itemtot;

    public ItemId getId() {
        return id;
    }

    public void setId(ItemId id) {
        this.id = id;
    }

    public Ord getOrdid() {
        return ordid;
    }

    public void setOrdid(Ord ordid) {
        this.ordid = ordid;
    }

    public Integer getProdid() {
        return prodid;
    }

    public void setProdid(Integer prodid) {
        this.prodid = prodid;
    }

    public BigDecimal getActualprice() {
        return actualprice;
    }

    public void setActualprice(BigDecimal actualprice) {
        this.actualprice = actualprice;
    }

    public Integer getQty() {
        return qty;
    }

    public void setQty(Integer qty) {
        this.qty = qty;
    }

    public BigDecimal getItemtot() {
        return itemtot;
    }

    public void setItemtot(BigDecimal itemtot) {
        this.itemtot = itemtot;
    }

}