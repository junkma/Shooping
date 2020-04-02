package com.service;

import com.dao.UserMapper;
import com.pojo.Page;
import com.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

/**
 * @author junkma
 * @date 2019-11-27-8:37
 **/
@Service
public class UserServiceImp implements UserService{
    @Autowired
    UserMapper mapper;
    @Override
    public User selectLogin(String loginname, String password) {
        return mapper.selectLogin(loginname,password);
    }

    @Override
    public int insertSelective(User record) {
        return mapper.insertSelective(record);
    }


    public int PageCount() {
        return mapper.PageCount();
    }

    public Page<User> findByPage(int currentPage) {
        HashMap<String,Object> map = new HashMap<String,Object>();
        Page<User> pageBean = new Page<User>();

        //封装当前页数
        pageBean.setCurrPage(currentPage);

        //每页显示的数据
        int pageSize=5;
        pageBean.setPageSize(pageSize);

        //封装总记录数
        int totalCount = mapper.PageCount();
        pageBean.setTotalCount(totalCount);

        //封装总页数
        double tc = totalCount;
        Double num =Math.ceil(tc/pageSize);//向上取整
        pageBean.setTotalPage(num.intValue());

        map.put("start",(currentPage-1)*pageSize);
        map.put("size", pageBean.getPageSize());
        //封装每页显示的数据
        List<User> lists = mapper.findByPage(map);
        pageBean.setLists(lists);

        return  pageBean;
    }

    public User selectByPrimaryKey(Integer id) {
        return mapper.selectByPrimaryKey(id);
    }



    public int updateByPrimaryKeySelective(User easybuy_user) {
        return mapper.updateByPrimaryKeySelective(easybuy_user);
    }

    public int deleteByPrimaryKey(Integer id) {
        return mapper.deleteByPrimaryKey(id);
    }

    @Override
    public List<User> selectAll() {
        return mapper.selectAll();
    }
}
