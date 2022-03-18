package com.cyg.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.cyg.constant.MessageConstant;
import com.cyg.entity.Result;
import com.cyg.pojo.OrderSetting;
import com.cyg.service.OrderSettingService;
import com.cyg.utils.POIUtils;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.*;

/**
 * 预约设置
 *
 * @author CuiYuangeng
 * @create 2022-02-21 14:15
 */
@RequestMapping("/ordersetting")
@RestController
public class OrderSettingController {

    @Reference
    OrderSettingService orderSettingService;

    /**
     * 批量导入预约设置数据
     *
     * @param excelFile
     * @return
     */
    @RequestMapping("/upload")
    @PreAuthorize("hasAuthority('ORDERSETTING')")
    public Result upload(@RequestParam("excelFile") MultipartFile excelFile) {
        try {
            List<String[]> excelList = POIUtils.readExcel(excelFile);
            List<OrderSetting> data = new ArrayList<>();
            for (String[] strings : excelList) {
                String orderDate = strings[0];
                String number = strings[1];
                OrderSetting orderSetting = new OrderSetting(new Date(orderDate), Integer.parseInt(number));
                data.add(orderSetting);
            }
            orderSettingService.add(data);
        } catch (IOException e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.IMPORT_ORDERSETTING_FAIL);
        }
        return new Result(true, MessageConstant.IMPORT_ORDERSETTING_SUCCESS);
    }

    @RequestMapping("/getOrderSettingByMonth")
    public Result getOrderSettingByMonth(@RequestParam("date") String date) {
        List<Map> list = new ArrayList<>();
        try {
            list = orderSettingService.getOrderSettingByMonth(date);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.GET_ORDERSETTING_FAIL);
        }
        return new Result(true, MessageConstant.GET_ORDERSETTING_SUCCESS, list);
    }


    @RequestMapping("/editNumberByDate")
    @PreAuthorize("hasAuthority('ORDERSETTING')")
    public Result editNumberByDate(@RequestBody OrderSetting orderSetting) {
        try {
            orderSettingService.editNumberByDate(orderSetting);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.ORDERSETTING_FAIL);
        }
        return new Result(true, MessageConstant.ORDERSETTING_SUCCESS);
    }

}
