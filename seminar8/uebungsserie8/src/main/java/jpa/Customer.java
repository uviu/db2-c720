package jpa;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

import java.math.BigDecimal;

@Entity
@Table(name = "CUSTOMER")
public class Customer {
    @Id
    @Column(name = "CUSTID", nullable = false)
    private Integer id;

    @Size(max = 45)
    @Column(name = "NAME", length = 45)
    private String name;

    @Size(max = 40)
    @Column(name = "ADDRESS", length = 40)
    private String address;

    @Size(max = 30)
    @Column(name = "CITY", length = 30)
    private String city;

    @Size(max = 2)
    @Column(name = "STATE", length = 2)
    private String state;

    @Size(max = 9)
    @Column(name = "ZIP", length = 9)
    private String zip;

    @Column(name = "AREA")
    private Short area;

    @Size(max = 9)
    @Column(name = "PHONE", length = 9)
    private String phone;

    @NotNull
    @Column(name = "REPID", nullable = false)
    private Short repid;

    @Column(name = "CREDITLIMIT", precision = 9, scale = 2)
    private BigDecimal creditlimit;

    @Lob
    @Column(name = "COMMENTS")
    private String comments;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getZip() {
        return zip;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }

    public Short getArea() {
        return area;
    }

    public void setArea(Short area) {
        this.area = area;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Short getRepid() {
        return repid;
    }

    public void setRepid(Short repid) {
        this.repid = repid;
    }

    public BigDecimal getCreditlimit() {
        return creditlimit;
    }

    public void setCreditlimit(BigDecimal creditlimit) {
        this.creditlimit = creditlimit;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

}