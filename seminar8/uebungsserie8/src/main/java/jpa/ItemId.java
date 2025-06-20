package jpa;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import jakarta.validation.constraints.NotNull;

import java.io.Serializable;
import java.util.Objects;

@Embeddable
public class ItemId implements Serializable {
    private static final long serialVersionUID = -187467262795863846L;
    @NotNull
    @Column(name = "ORDID", nullable = false)
    private Short ordid;

    @NotNull
    @Column(name = "ITEMID", nullable = false)
    private Short itemid;

    public Short getOrdid() {
        return ordid;
    }

    public void setOrdid(Short ordid) {
        this.ordid = ordid;
    }

    public Short getItemid() {
        return itemid;
    }

    public void setItemid(Short itemid) {
        this.itemid = itemid;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ItemId entity = (ItemId) o;
        return Objects.equals(this.itemid, entity.itemid) &&
                Objects.equals(this.ordid, entity.ordid);
    }

    @Override
    public int hashCode() {
        return Objects.hash(itemid, ordid);
    }

}