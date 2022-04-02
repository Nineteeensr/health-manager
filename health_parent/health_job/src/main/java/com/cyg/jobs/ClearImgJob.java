package com.cyg.jobs;

import com.cyg.constant.RedisConstant;
import com.cyg.utils.QiNiuUtil;
import org.springframework.beans.factory.annotation.Autowired;
import redis.clients.jedis.JedisPool;

import java.util.Set;

/**
 * 自定义job，实现定时清理垃圾图片
 *
 * @author CuiYuangeng
 * @create 2022-02-20 19:04
 */
public class ClearImgJob {
    @Autowired
    private JedisPool jedisPool;

    public void clearImg() {
        // 根据redis中保存的两个set集合进行差值计算，获得垃圾图片名称集合
        Set<String> set = jedisPool.getResource().
                sdiff(RedisConstant.SETMEAL_PIC_RESOURCES, RedisConstant.SETMEAL_PIC_DB_RESOURCES);
        if (set != null) {
            for (String picName : set) {
                // 删除七牛云服务器上的图片
                QiNiuUtil.deleteFileFromQiniu(picName);
                // 删除redis中图片名称
                jedisPool.getResource().srem(RedisConstant.SETMEAL_PIC_RESOURCES, picName);
                System.out.println(System.currentTimeMillis()+"：自定义任务执行，清理垃圾图片："+picName);
            }
        }
    }
}
