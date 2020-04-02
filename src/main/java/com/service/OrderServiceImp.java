package com.service;

import com.dao.OrderMapper;
import com.pojo.Order;
import com.pojo.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

/**
 * @author junkma
 * @date 2019-12-02-14:54
 **/
@Service
public class OrderServiceImp implements OrderService {
    @Autowired
    OrderMapper orderMapper;
    @Override
    public int insertSelective(Order record) {
        return orderMapper.insertSelective(record);
    }

    @Override
    public Order selectByTime() {
        return orderMapper.selectByTime();
    }

    public int updateByPrimaryKeySelective(Order order) {
        return orderMapper.updateByPrimaryKeySelective(order);
    }

    public Order selectByPrimaryKey(Integer id) {
        return orderMapper.selectByPrimaryKey(id);
    }

    public int PageCount() {
        return orderMapper.PageCount();
    }

    public Page<Order> findByPage(int currentPage) {
        HashMap<String,Object> map = new HashMap<String,Object>();
        Page<Order> pageBean = new Page<Order>();

        //封装当前页数
        pageBean.setCurrPage(currentPage);

        //每页显示的数据
        int pageSize=5;
        pageBean.setPageSize(pageSize);

        //封装总记录数
        int totalCount = orderMapper.PageCount();
        pageBean.setTotalCount(totalCount);

        //封装总页数
        double tc = totalCount;
        Double num =Math.ceil(tc/pageSize);//向上取整
        pageBean.setTotalPage(num.intValue());

        map.put("start",(currentPage-1)*pageSize);
        map.put("size", pageBean.getPageSize());
        //封装每页显示的数据
        List<Order> lists = orderMapper.findByPage(map);
        pageBean.setLists(lists);

        return  pageBean;
    }

    public int deleteByPrimaryKey(Integer id) {
        return  orderMapper.deleteByPrimaryKey(id);
    }

    public int updateByPrimaryKey(Order record) {
        return orderMapper.updateByPrimaryKeySelective(record);
    }

    public List<Order> selectby(String serialnumber, String username) {
        return orderMapper.selectby(serialnumber,username);
    }
}
