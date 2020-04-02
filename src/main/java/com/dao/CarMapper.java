package com.dao;

import com.pojo.Car;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author junkma
 * @date 2019-11-30-10:54
 **/
public interface CarMapper {
    //加入购物车
    int insertCar(Car car);
    //查看购物车
    List<Car> selectCars(int userid);
    //分页查看购物车
    List<Car> selectCarsByPage(@Param("id") int userid, @Param("page") int page);

    //修改购物车商品数量加一
    int updateNum(int carid);

    //删除购物车
    int deleteCar(int id);

    //根据userid删除购物车
    int deleteByUserId(int userid);

    //使购物车中商品数量减一
    int minCar(int id);

    //判断用户购物车中有无此商品
    Car selectByProductId(@Param("userid") int userid,@Param("productid") int productid);

}
