package com.service;

import com.dao.ProductMapper;
import com.pojo.Page;
import com.pojo.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

/**
 * @author junkma
 * @date 2019-11-28-16:59
 **/
@Service
public class ProductServiceImp implements ProductService {
    @Autowired
    ProductMapper productMapper;
    @Override
    public List<Product> selectAllProducts() {
        return productMapper.selectAllProducts();
    }

    @Override
    public List<Product> selectAllByPage(int page) {
        return productMapper.selectAllByPage(page);
    }

    @Override
    public List<Product> selectbyChildId(int catechildid) {
        return productMapper.selectbyChildId(catechildid);
    }

    @Override
    public List<Product> selectByPage(int catechildid, int page) {
        return productMapper.selectByPage(catechildid,page);
    }

    @Override
    public Product selectByPrimaryKey(Integer id) {
        return productMapper.selectByPrimaryKey(id);
    }


    public int insertSelective(Product product) {
        return productMapper.insertSelective(product);
    }


    public int updateByPrimaryKeySelective(Product product) {
        return productMapper.updateByPrimaryKeySelective(product);
    }

    public int deleteByPrimaryKey(Integer id) {
        return productMapper.deleteByPrimaryKey(id);
    }

    public int PageCount() {
        return productMapper.PageCount();
    }

    public Page<Product> findByPage(int currentPage) {
        HashMap<String, Object> map = new HashMap<String, Object>();
        Page<Product> pageBean = new Page<Product>();

        //封装当前页数
        pageBean.setCurrPage(currentPage);

        //每页显示的数据
        int pageSize = 5;
        pageBean.setPageSize(pageSize);

        //封装总记录数
        int totalCount = productMapper.PageCount();
        pageBean.setTotalCount(totalCount);

        //封装总页数
        double tc = totalCount;
        Double num = Math.ceil(tc / pageSize);//向上取整
        pageBean.setTotalPage(num.intValue());

        map.put("start", (currentPage - 1) * pageSize);
        map.put("size", pageBean.getPageSize());
        //封装每页显示的数据
        List<Product> lists = productMapper.findByPage(map);
        pageBean.setLists(lists);

        return pageBean;
    }



}
