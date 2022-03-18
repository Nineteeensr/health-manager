package com.cyg.utils;

import com.zhenzi.sms.ZhenziSmsClient;

import java.util.HashMap;
import java.util.Map;

/**
 * 榛子云短信平台
 *
 * @author CuiYuangeng
 * @create 2022-02-24 0:43
 */
public class ZhenZiYunSMSUtils {

    private final static String APIURL = "https://sms_developer.zhenzikj.com";

    private final static String APPID = "110214";

    private final static String APPSECRET = "f1821afe-a875-4c09-864d-3dbec9a4bad8";
    /**
     * 发送短信验证码
     */
    public static final String VALIDATE_CODE = "7076";
    /**
     * 体检预约成功通知 8347
     */
    public static final String ORDER_NOTICE = "8347";


    public static void sendMessage(String templateCode, String phoneNumber, Map param) {
        ZhenziSmsClient client = new ZhenziSmsClient(APIURL, APPID, APPSECRET);
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("number", phoneNumber);
        // 短信模板编号
        params.put("templateId", templateCode);
        if (templateCode == VALIDATE_CODE) {
            String[] validateCodeTemplateParams = new String[2];
            validateCodeTemplateParams[0] = param.get("validateCode").toString();
            validateCodeTemplateParams[1] = "5";
            params.put("templateParams", validateCodeTemplateParams);
        } else if (templateCode == ORDER_NOTICE) {
            String[] orderNoticeTemplateParams = new String[4];
            String memberName = (String) param.get("memberName");
            String orderDate = (String) param.get("orderDate");
            String year = orderDate.substring(0, 4);
            String month = orderDate.substring(5, 7);
            String day = orderDate.substring(8, 10);
            System.out.printf("%s年%s月%s日", year, month, day);
            orderNoticeTemplateParams[0] = memberName;
            orderNoticeTemplateParams[1] = year;
            orderNoticeTemplateParams[2] = month;
            orderNoticeTemplateParams[3] = day;
            params.put("templateParams", orderNoticeTemplateParams);
        }
        String result = "";
        try {
            result = client.send(params);
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("result = " + result);
    }

}
