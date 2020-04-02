package com.service;

import com.dao.NewsMapper;
import com.pojo.News;
import com.pojo.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

/**
 * @author junkma
 * @date 2019-11-28-17:11
 **/
@Service
public class NewsServcieImp implements  NewsService {
    @Autowired
    NewsMapper newsMapper;
    @Override
    public List<News> selectNews() {
        return newsMapper.selectNews();
    }

    @Override
    public News selectByPrimaryKey(Integer id) {
        return newsMapper.selectByPrimaryKey(id);
    }

    public int PageCount() {
        return newsMapper.PageCount();
    }

    public Page<News> findByPage(int currentPage) {
        HashMap<String,Object> map = new HashMap<String,Object>();
        Page<News> pageBean = new Page<News>();

        //封装当前页数
        pageBean.setCurrPage(currentPage);

        //每页显示的数据
        int pageSize=5;
        pageBean.setPageSize(pageSize);

        //封装总记录数
        int totalCount = newsMapper.PageCount();
        pageBean.setTotalCount(totalCount);

        //封装总页数
        double tc = totalCount;
        Double num =Math.ceil(tc/pageSize);//向上取整
        pageBean.setTotalPage(num.intValue());

        map.put("start",(currentPage-1)*pageSize);
        map.put("size", pageBean.getPageSize());
        //封装每页显示的数据
        List<News> lists = newsMapper.findByPage(map);
        pageBean.setLists(lists);

        return  pageBean;
    }

    public int insertSelective(News news) {
        return newsMapper.insertSelective(news);
    }

    public int deleteByPrimaryKey(Integer id) {
        return newsMapper.deleteByPrimaryKey(id);
    }

    public int updateByPrimaryKeySelective(News news) {
        return newsMapper.updateByPrimaryKeySelective(news);
    }

}
