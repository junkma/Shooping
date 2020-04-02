package com.dao;

import com.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);
//注册用户
    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
//登录验证
    User selectLogin(@Param("name") String loginname, @Param("pwd") String password);

    int PageCount();
    List<User> findByPage(HashMap<String,Object> map);

    List<User> selectAll();
}