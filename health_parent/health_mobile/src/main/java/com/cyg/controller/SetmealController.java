package com.cyg.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.cyg.constant.MessageConstant;
import com.cyg.entity.Result;
import com.cyg.pojo.Setmeal;
import com.cyg.service.SetMealService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author CuiYuangeng
 * @create 2022-02-23 22:30
 */
@RequestMapping("/setmeal")
@RestController
public class SetmealController {
    @Reference
    SetMealService setMealService;

    /**
     * 查询所有套餐
     *
     * @return
     */
    @RequestMapping("/getSetmeal")
    public Result getSetmeal() {
        List<Setmeal> list = null;
        try {
            list = setMealService.findAll();
        }catch (Exception e) {
            return new Result(false, MessageConstant.GET_SETMEAL_LIST_FAIL);
        }
        return new Result(true,MessageConstant.GET_SETMEAL_LIST_SUCCESS,list);
    }

    @RequestMapping("/findById")
    public Result findById(Integer id){
        Setmeal setmeal = null;
        try {
            setmeal = setMealService.findById(id);
        }catch (Exception e){
            return new Result(false,MessageConstant.QUERY_SETMEAL_FAIL);
        }
        return new Result(true,MessageConstant.QUERY_SETMEAL_SUCCESS,setmeal);
    }
}
