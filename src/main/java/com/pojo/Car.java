package com.pojo;

import java.util.Date;

/**
 * @author junkma
 * @date 2019-11-30-10:51
 **/
public class Car {
    private int id;
    private int productid;
    private int userid;
    private Date createtime;
    private int number;
    private Product product;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProductid() {
        return productid;
    }

    public void setProductid(int productid) {
        this.productid = productid;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
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

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public Car(int productid, int userid, Date createtime,int number) {
        this.productid = productid;
        this.userid = userid;
        this.createtime = createtime;
        this.number=number;
    }

    public Car() {
        super();
    }

    @Override
    public String toString() {
        return "Car{" +
                "id=" + id +
                ", productid=" + productid +
                ", userid=" + userid +
                ", createtime=" + createtime +
                ", number=" + number +
                ", product=" + product +
                '}';
    }
}
