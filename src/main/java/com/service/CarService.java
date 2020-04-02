package com.service;

import com.pojo.Car;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author junkma
 * @date 2019-11-30-10:57
 **/
public interface CarService {
    int insertCar(Car car);
    //查看购物车
    List<Car> selectCars(int userid);
    List<Car> selectCarsByPage(@Param("id") int userid, @Param("page") int page);
    //修改购物车商品数量
    int updateNum(int carid);

    int deleteCar(int id);

    //根据userid删除购物车
    int deleteByUserId(int userid);

    //使购物车中商品数量减一
    int minCar(int id);
    //判断用户购物车中有无此商品
    Car selectByProductId(@Param("userid") int userid,@Param("productid") int productid);
}
