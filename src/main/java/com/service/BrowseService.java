package com.service;

import com.pojo.Browse;

import java.util.List;

/**
 * @author junkma
 * @date 2019-12-02-17:19
 **/
public interface BrowseService {
    int insertSelective(Browse record);
    List<Browse> selectByUserId(int userid);

    //查看是否有浏览过的商品
    Browse selectByProductId(int productid);
}
