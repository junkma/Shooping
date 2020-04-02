package com.service;

import com.pojo.Comment;
import com.pojo.Page;

import java.util.List;

/**
 * @author junkma
 * @date 2019-11-28-14:25
 **/
public interface CommentService {
    //分页查看留言
    List<Comment> selectCommentPage(int page);
    //查询所有留言
    List<Comment> selectComments();
    int insertSelective(Comment record);


    int PageCount();
    Page<  Comment> findByPage(int currentPage);
    Comment selectByPrimaryKey(Integer id);
    int updateByPrimaryKey(Comment comment);
    int deleteByPrimaryKey(Integer id);
}
