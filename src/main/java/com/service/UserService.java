package com.service;

import com.pojo.Page;
import com.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author junkma
 * @date 2019-11-27-8:36
 **/
public interface UserService {
    //用户登录
    User selectLogin(@Param("name") String loginname, @Param("pwd") String password);
    //注册用户
    int insertSelective(User record);

    int PageCount();
    Page<User> findByPage(int currentPage);
    User selectByPrimaryKey(Integer id);
    int updateByPrimaryKeySelective(User easybuy_user);
    int deleteByPrimaryKey(Integer id);

    List<User> selectAll();
}
