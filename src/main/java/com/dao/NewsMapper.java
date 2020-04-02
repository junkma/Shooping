package com.dao;

import com.pojo.News;

import java.util.HashMap;
import java.util.List;

public interface NewsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(News record);

    int insertSelective(News record);

    News selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(News record);

    int updateByPrimaryKey(News record);

    //查询所有新闻
    List<News> selectNews();

    int PageCount();
    List<News> findByPage(HashMap<String,Object> map);
}