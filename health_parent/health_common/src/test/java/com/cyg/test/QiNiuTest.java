package com.cyg.test;

import org.junit.Test;

/**
 * @author CuiYuangeng
 * @create 2022-02-19 15:14
 */
public class QiNiuTest {
    @Test
    public void test01() {
        ////构造一个带指定 Region 对象的配置类
        //Configuration cfg = new Configuration(Region.region1());
        ////...其他参数参考类注释
        //UploadManager uploadManager = new UploadManager(cfg);
        ////...生成上传凭证，然后准备上传
        //String accessKey = "4Jl9W-HUGe47jLy5bUagweZJSjvhDV2W9bRCYCcF";
        //String secretKey = "kGYaBhRDA8rOT1D4mbFQCStuaGAmtSOeORXyves8";
        //String bucket = "health-space-cyg";
        ////如果是Windows情况下，格式是 D:\\qiniu\\test.png
        //String localFilePath = "F:\\qiniu\\test\\test01.jpg";
        ////默认不指定key的情况下，以文件内容的hash值作为文件名
        //String key = null;
        //Auth auth = Auth.create(accessKey, secretKey);
        //String upToken = auth.uploadToken(bucket);
        //try {
        //    Response response = uploadManager.put(localFilePath, key, upToken);
        //    //解析上传成功的结果
        //    DefaultPutRet putRet = new Gson().fromJson(response.bodyString(), DefaultPutRet.class);
        //    System.out.println(putRet.key);
        //    System.out.println(putRet.hash);
        //} catch (QiniuException ex) {
        //    Response r = ex.response;
        //    System.err.println(r.toString());
        //    try {
        //        System.err.println(r.bodyString());
        //    } catch (QiniuException ex2) {
        //        //ignore
        //    }
        //}
    }

    @Test
    public void test02() {
        //QiNiuUtil.upload2Qiniu("F:\\qiniu\\test\\test02.jpg", "abc.jpg");
        ////QiNiuUtil.deleteFileFromQiniu("abc.jpg");
    }
}
