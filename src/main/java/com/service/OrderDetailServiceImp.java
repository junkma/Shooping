package com.service;

import com.dao.OrderDetailMapper;
import com.pojo.OrderDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author junkma
 * @date 2019-12-02-15:33
 **/
@Service
public class OrderDetailServiceImp implements OrderDetailService {
    @Autowired
    OrderDetailMapper orderDetailMapper;
    @Override
    public int insertSelective(OrderDetail record) {
        return orderDetailMapper.insertSelective(record);
    }
}
