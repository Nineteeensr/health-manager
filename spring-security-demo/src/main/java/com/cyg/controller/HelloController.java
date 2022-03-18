package com.cyg.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author CuiYuangeng
 * @create 2022-03-09 13:59
 */
@RestController
@RequestMapping("/hello")
public class HelloController {

    /**
     * 调用此方法要求当前用户必须具有add权限
     * @return
     */
    @RequestMapping("/add")
    @PreAuthorize("hasAuthority('add')")
    public String add(){
        return "success";
    }
}
