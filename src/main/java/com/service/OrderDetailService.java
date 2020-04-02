package com.service;

import com.pojo.OrderDetail;

/**
 * @author junkma
 * @date 2019-12-02-15:33
 **/
public interface OrderDetailService {
    int insertSelective(OrderDetail record);
}
