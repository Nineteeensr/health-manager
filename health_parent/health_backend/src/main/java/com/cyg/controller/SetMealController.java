package com.cyg.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.cyg.constant.MessageConstant;
import com.cyg.constant.RedisConstant;
import com.cyg.entity.PageResult;
import com.cyg.entity.QueryPageBean;
import com.cyg.entity.Result;
import com.cyg.pojo.Setmeal;
import com.cyg.service.SetMealService;
import com.cyg.utils.QiNiuUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import redis.clients.jedis.JedisPool;

import java.io.IOException;
import java.util.UUID;

/**
 * 体检套餐管理
 *
 * @author CuiYuangeng
 * @create 2022-02-20 13:41
 */
@RequestMapping("/setmeal")
@RestController
public class SetMealController {
    @Reference
    private SetMealService setMealService;
    @Autowired
    private JedisPool jedisPool;

    /**
     * 文件上传
     */
    @RequestMapping("/upload")
    public Result upload(@RequestParam("imgFile") MultipartFile imgFile) {
        // 原始文件名
        String originalFilename = imgFile.getOriginalFilename();
        // 拿到扩展名的索引
        int lastDotIndex = originalFilename.lastIndexOf(".");
        // 包含点的扩展名
        String extention = originalFilename.substring(lastDotIndex - 1);
        // 动态拼接扩展名
        String fileName = UUID.randomUUID().toString() + extention;
        try {
            // 上传到七牛云服务器
            QiNiuUtil.upload2Qiniu(imgFile.getBytes(), fileName);
            // 将上传图片名称存入redis
            jedisPool.getResource().sadd(RedisConstant.SETMEAL_PIC_RESOURCES,fileName);
        } catch (IOException e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.PIC_UPLOAD_FAIL);
        }
        return new Result(true, MessageConstant.PIC_UPLOAD_SUCCESS, fileName);
    }

    /**
     * 添加
     * @param setMeal
     * @param checkgroupIds
     * @return
     */
    @RequestMapping("/add")
    @PreAuthorize("hasAuthority('SETMEAL_ADD')")
    public Result add(@RequestBody Setmeal setMeal, Integer[] checkgroupIds) {
        try {
            setMealService.add(setMeal, checkgroupIds);
        }catch (Exception e) {
            e.printStackTrace();
            return new Result(false,MessageConstant.ADD_SETMEAL_FAIL);
        }
        return new Result(true,MessageConstant.ADD_SETMEAL_SUCCESS);
    }

    /**
     * 分页查询
     * @param queryPageBean
     * @return
     */
    @RequestMapping("/findPage")
    @PreAuthorize("hasAuthority('SETMEAL_QUERY')")
    public PageResult findPage(@RequestBody QueryPageBean queryPageBean){
        PageResult pageResult = setMealService.pageQuery(queryPageBean);
        return pageResult;
    }
}
