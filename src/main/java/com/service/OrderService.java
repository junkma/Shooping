package com.service;

import com.pojo.Order;
import com.pojo.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author junkma
 * @date 2019-12-02-14:53
 **/
public interface OrderService {

    int insertSelective(Order record);

    Order selectByTime();


    int updateByPrimaryKeySelective(Order order);
    Order selectByPrimaryKey(Integer id);
    int PageCount();
    Page<Order> findByPage(int currentPage);
    int deleteByPrimaryKey(Integer id);
    int updateByPrimaryKey(Order record);
    List<Order> selectby(@Param("serialnumber") String serialnumber, @Param("username") String username);
}
