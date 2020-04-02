package com.pojo;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Order {
    private Integer id;

    private Integer userid;

    private String loginname;

    private String useraddress;
    @JSONField(format = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date createtime;

    private Float cost;

    private int status;

    private String serialnumber;

    private  String username;

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

    public String getLoginname() {
        return loginname;
    }

    public void setLoginname(String loginname) {
        this.loginname = loginname == null ? null : loginname.trim();
    }

    public String getUseraddress() {
        return useraddress;
    }

    public void setUseraddress(String useraddress) {
        this.useraddress = useraddress == null ? null : useraddress.trim();
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Float getCost() {
        return cost;
    }

    public void setCost(Float cost) {
        this.cost = cost;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getSerialnumber() {
        return serialnumber;
    }

    public void setSerialnumber(String serialnumber) {
        this.serialnumber = serialnumber;
    }

    public Order(Integer userid, String loginname, String useraddress, Date createtime, Float cost,  String serialnumber) {
        this.userid = userid;
        this.loginname = loginname;
        this.useraddress = useraddress;
        this.createtime = createtime;
        this.cost = cost;
        this.serialnumber = serialnumber;
    }

    public Order() {
        super();
    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", userid=" + userid +
                ", loginname='" + loginname + '\'' +
                ", useraddress='" + useraddress + '\'' +
                ", createtime=" + createtime +
                ", cost=" + cost +
                ", status=" + status +
                ", serialnumber='" + serialnumber + '\'' +
                ", username='" + username + '\'' +
                '}';
    }
}