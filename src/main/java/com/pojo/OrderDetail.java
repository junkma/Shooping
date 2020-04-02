package com.pojo;

public class OrderDetail {
    private Integer id;

    private Integer orderid;

    private Integer productid;

    private Integer quantity;

    private Float cost;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getOrderid() {
        return orderid;
    }

    public void setOrderid(Integer orderid) {
        this.orderid = orderid;
    }

    public Integer getProductid() {
        return productid;
    }

    public void setProductid(Integer productid) {
        this.productid = productid;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Float getCost() {
        return cost;
    }

    public void setCost(Float cost) {
        this.cost = cost;
    }

    public OrderDetail( Integer orderid, Integer productid, Integer quantity, Float cost) {
        this.orderid = orderid;
        this.productid = productid;
        this.quantity = quantity;
        this.cost = cost;
    }

    public OrderDetail() {
        super();
    }

    @Override
    public String toString() {
        return "OrderDetail{" +
                "id=" + id +
                ", orderid=" + orderid +
                ", productid=" + productid +
                ", quantity=" + quantity +
                ", cost=" + cost +
                '}';
    }
}