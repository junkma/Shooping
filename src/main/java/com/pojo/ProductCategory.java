package com.pojo;

import java.util.List;

public class ProductCategory {
    private Integer id;

    private String name;

    private Integer parentid;

    private List<ProductCategory> childname;


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

    public Integer getParentid() {
        return parentid;
    }

    public void setParentid(Integer parentid) {
        this.parentid = parentid;
    }

    public List<ProductCategory> getChildname() {
        return childname;
    }

    public void setChildname(List<ProductCategory> childname) {
        this.childname = childname;
    }

    public ProductCategory(Integer id, String name, Integer parentid, List<ProductCategory> childname) {
        this.id = id;
        this.name = name;
        this.parentid = parentid;
        this.childname = childname;
    }

    public ProductCategory() {
        super();
    }

    @Override
    public String toString() {
        return "ProductCategory{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", parentid=" + parentid +
                ", childname=" + childname +
                '}';
    }
}