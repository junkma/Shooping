package com.pojo;

public class Product {
    private Integer id;

    private String name;

    private String description;

    private Float price;

    private Integer stock;

    private Integer cateid;

    private Integer catechildid;

    private String filename;

    private Integer isdelete;

    private String catename;

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
        this.name = name == null ? null : name.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public Integer getCateid() {
        return cateid;
    }

    public void setCateid(Integer cateid) {
        this.cateid = cateid;
    }

    public Integer getCatechildid() {
        return catechildid;
    }

    public void setCatechildid(Integer catechildid) {
        this.catechildid = catechildid;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename == null ? null : filename.trim();
    }

    public Integer getIsdelete() {
        return isdelete;
    }

    public void setIsdelete(Integer isdelete) {
        this.isdelete = isdelete;
    }

    public String getCatename() {
        return catename;
    }

    public void setCatename(String catename) {
        this.catename = catename;
    }

    public Product(Integer id, String name, String description, Float price, Integer stock, Integer cateid, Integer catechildid, String filename, Integer isdelete, String catename) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.stock = stock;
        this.cateid = cateid;
        this.catechildid = catechildid;
        this.filename = filename;
        this.isdelete = isdelete;
        this.catename = catename;
    }

    public Product() {
        super();
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", price=" + price +
                ", stock=" + stock +
                ", cateid=" + cateid +
                ", catechildid=" + catechildid +
                ", filename='" + filename + '\'' +
                ", isdelete=" + isdelete +
                ", catename='" + catename + '\'' +
                '}';
    }
}