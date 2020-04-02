package com.service;

import com.dao.CommentMapper;
import com.pojo.Comment;
import com.pojo.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

/**
 * @author junkma
 * @date 2019-11-28-14:25
 **/
@Service
public class CommentServiceImp implements  CommentService {
    @Autowired
    CommentMapper commentMapper;

    @Override
    public List<Comment> selectCommentPage(int page) {
        return commentMapper.selectCommentPage(page);
    }

    @Override
    public List<Comment> selectComments() {
        return commentMapper.selectComments();
    }

    @Override
    public int insertSelective(Comment record) {
        return commentMapper.insertSelective(record);
    }


    public int PageCount() {
        return commentMapper.PageCount();
    }

    public Page<Comment> findByPage(int currentPage) {
        HashMap<String,Object> map = new HashMap<String,Object>();
        Page<Comment> pageBean = new Page<Comment>();

        //封装当前页数
        pageBean.setCurrPage(currentPage);

        //每页显示的数据
        int pageSize=5;
        pageBean.setPageSize(pageSize);

        //封装总记录数
        int totalCount = commentMapper.PageCount();
        pageBean.setTotalCount(totalCount);

        //封装总页数
        double tc = totalCount;
        Double num =Math.ceil(tc/pageSize);//向上取整
        pageBean.setTotalPage(num.intValue());

        map.put("start",(currentPage-1)*pageSize);
        map.put("size", pageBean.getPageSize());
        //封装每页显示的数据
        List<Comment> lists = commentMapper.findByPage(map);
        pageBean.setLists(lists);

        return  pageBean;
    }

    public Comment selectByPrimaryKey(Integer id) {
        return commentMapper.selectByPrimaryKey(id);
    }

    public int updateByPrimaryKey(Comment comment) {
        return commentMapper.updateByPrimaryKey(comment);
    }

    public int deleteByPrimaryKey(Integer id) {
        return commentMapper.deleteByPrimaryKey(id);
    }
}
