package com.service;

import com.pojo.Page;
import com.pojo.Product;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author junkma
 * @date 2019-11-28-16:58
 **/
public interface ProductService {
    List<Product> selectAllProducts();
    //分页查询所有商品
    List<Product> selectAllByPage(int page);

    List<Product> selectbyChildId(int catechildid);

    //分页查询商品
    List<Product> selectByPage(@Param("childid") int catechildid, @Param("page") int page);


    int insertSelective(Product product);

    Product selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Product product);

    int deleteByPrimaryKey(Integer id);
    int PageCount();
    Page<Product> findByPage(int currentPage);
}
