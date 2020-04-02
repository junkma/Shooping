package com.dao;

import com.pojo.Comment;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

public interface CommentMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Comment record);

    //用户提交留言
    int insertSelective(Comment record);

    Comment selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Comment record);

    int updateByPrimaryKey(Comment record);

    //分页查看留言
    List<Comment> selectCommentPage(int page);
    //查询所有留言
    List<Comment> selectComments();

    Comment selectBy(@Param("nickname") String nickname, @Param("content") String content);
    int PageCount();
    List<Comment> findByPage(HashMap<String,Object> map);
}