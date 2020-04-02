package com.dao;

import com.pojo.Browse;

import java.util.List;

public interface BrowseMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Browse record);
//加入最近浏览
    int insertSelective(Browse record);

    Browse selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Browse record);

    int updateByPrimaryKey(Browse record);

    //查看用户最近浏览
    List<Browse> selectByUserId(int userid);

    //查看是否有浏览过的商品
    Browse selectByProductId(int productid);
}