package com.service;

import com.dao.ProductCategoryMapper;
import com.pojo.ProductCategory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author junkma
 * @date 2019-11-28-17:38
 **/
@Service
public class ProductCategoryServiceImp implements ProductCategoryService {
@Autowired
    ProductCategoryMapper productCategoryMapper;
    @Override
    public List<ProductCategory> selectParentCategorys() {
        return productCategoryMapper.selectParentCategorys();
    }

    public int deleteByPrimaryKey(Integer id) {
        return productCategoryMapper.deleteByPrimaryKey(id);
    }

    public int insertSelective(ProductCategory record) {
        return productCategoryMapper.insertSelective(record);
    }

    public ProductCategory selectByPrimaryKey(Integer id) {
        return productCategoryMapper.selectByPrimaryKey(id);
    }

    public int updateByPrimaryKeySelective(ProductCategory record) {
        return productCategoryMapper.updateByPrimaryKeySelective(record);
    }
}
