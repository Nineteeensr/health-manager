package com.cyg.jobs;


import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * @author CuiYuangeng
 * @create 2022-02-20 17:03
 */
public class App {

    public static void main(String[] args) {
        new ClassPathXmlApplicationContext("spring-job.xml");
    }
}
