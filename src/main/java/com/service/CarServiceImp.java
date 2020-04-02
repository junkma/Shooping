package com.service;

import com.dao.CarMapper;
import com.pojo.Car;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author junkma
 * @date 2019-11-30-10:57
 **/
@Service
public class CarServiceImp implements CarService {
    @Autowired
    CarMapper carMapper;
    @Override
    public int insertCar(Car car) {
        return carMapper.insertCar(car);
    }

    @Override
    public List<Car> selectCars(int userid) {
        return carMapper.selectCars(userid);
    }

    @Override
    public List<Car> selectCarsByPage(int userid, int page) {
        return carMapper.selectCarsByPage(userid,page);
    }

    @Override
    public int updateNum(int carid) {
        return carMapper.updateNum(carid);
    }

    @Override
    public int deleteCar(int id) {
        return carMapper.deleteCar(id);
    }

    @Override
    public int deleteByUserId(int userid) {
        return carMapper.deleteByUserId(userid);
    }

    @Override
    public int minCar(int id) {
        return carMapper.minCar(id);
    }

    @Override
    public Car selectByProductId(int userid, int productid) {
        return carMapper.selectByProductId(userid,productid);
    }

}
