package com.pojo;

import java.util.Date;
public class Browse {
    private Integer id;

    private Integer userid;

    private Integer productid;

    private Date createtime;

    private Product product;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getProductid() {
        return productid;
    }

    public void setProductid(Integer productid) {
        this.productid = productid;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Browse(Integer userid, Integer productid, Date createtime) {
        this.userid = userid;
        this.productid = productid;
        this.createtime = createtime;
    }

    public Browse() {
        super();
    }

    @Override
    public String toString() {
        return "Browse{" +
                "id=" + id +
                ", userid=" + userid +
                ", productid=" + productid +
                ", createtime=" + createtime +
                '}';
    }
}