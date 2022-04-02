package com.cyg.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.cyg.constant.MessageConstant;
import com.cyg.entity.PageResult;
import com.cyg.entity.QueryPageBean;
import com.cyg.entity.Result;
import com.cyg.pojo.CheckItem;
import com.cyg.service.CheckItemService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author CuiYuangeng
 * @create 2022-02-17 20:47
 */
@RequestMapping("/checkitem")
@RestController
public class CheckItemController {

    @Reference
    private CheckItemService checkItemService;

    /**
     * 添加
     * @param checkItem
     * @return
     */
    @RequestMapping("/add")
    @PreAuthorize("hasAuthority('CHECKITEM_ADD')")
    public Result add(@RequestBody CheckItem checkItem) {
        try {
            checkItemService.add(checkItem);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.ADD_CHECKITEM_FAIL);
        }
        return new Result(true, MessageConstant.ADD_CHECKITEM_SUCCESS);
    }

    /**
     * 分页模糊查询
     * @param queryPageBean
     * @return
     */
    @RequestMapping("/findPage")
    @PreAuthorize("hasAuthority('CHECKITEM_QUERY')")
    public PageResult findPage(@RequestBody QueryPageBean queryPageBean) {
        PageResult pageResult = checkItemService.pageQuery(queryPageBean);
        return pageResult;
    }

    /**
     * 删除
     * @param id
     * @return
     */
    @PreAuthorize("hasAuthority('CHECKITEM_DELETE')")
    @DeleteMapping("/delete")
    public Result del(@RequestParam("id") Integer id) {
        try {
            checkItemService.deleteById(id);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.DELETE_CHECKITEM_FAIL);
        }
        return new Result(true, MessageConstant.DELETE_CHECKITEM_SUCCESS);
    }

    /**
     * 根据id查询检查项
     * @param id
     * @return
     */
    @GetMapping("/findById")
    @PreAuthorize("hasAuthority('CHECKITEM_QUERY')")
    public Result getCheckItemById(@RequestParam("id") Integer id) {
        CheckItem checkItem = null;
        try {
            checkItem = checkItemService.queryCheckItemById(id);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.QUERY_CHECKITEM_FAIL);
        }
        return new Result(true, MessageConstant.QUERY_CHECKITEM_SUCCESS, checkItem);
    }

    /**
     * 修改
     * @param checkItem
     * @return
     */
    @PutMapping("/edit")
    @PreAuthorize("hasAuthority('CHECKITEM_EDIT')")
    public Result updateInfo(@RequestBody CheckItem checkItem) {
        try {
            checkItemService.updateInfo(checkItem);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.EDIT_CHECKITEM_FAIL);
        }
        return new Result(true, MessageConstant.EDIT_CHECKITEM_SUCCESS);
    }

    /**
     * 查询全部检查项
     * @return
     */
    @GetMapping("/findAll")
    @PreAuthorize("hasAuthority('CHECKITEM_QUERY')")
    public Result findAll() {
        List<CheckItem> checkItemList = checkItemService.findAll();
        if (!CollectionUtils.isEmpty(checkItemList)) {
            return new Result(true, MessageConstant.QUERY_CHECKITEM_SUCCESS, checkItemList);
        }
        return new Result(false, MessageConstant.QUERY_CHECKITEM_FAIL);
    }

}
