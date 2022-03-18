package com.cyg.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.cyg.constant.MessageConstant;
import com.cyg.entity.PageResult;
import com.cyg.entity.QueryPageBean;
import com.cyg.entity.Result;
import com.cyg.pojo.CheckGroup;
import com.cyg.service.CheckGroupService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

/**
 * @author CuiYuangeng
 * @create 2022-02-18 17:15
 */
@RestController
@RequestMapping("/checkgroup")
public class CheckGroupController {

    @Reference
    private CheckGroupService checkGroupService;

    /**
     * 添加
     *
     * @param checkGroup
     * @param checkitemIds
     * @return
     */
    @RequestMapping("/add")
    @PreAuthorize("hasAuthority('CHECKGROUP_ADD')")
    public Result add(@RequestBody CheckGroup checkGroup, Integer[] checkitemIds) {
        try {
            checkGroupService.add(checkGroup, checkitemIds);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.ADD_CHECKGROUP_FAIL);
        }
        return new Result(true, MessageConstant.ADD_CHECKGROUP_SUCCESS);
    }

    /**
     * 分页查询
     *
     * @param queryPageBean
     * @return
     */
    @RequestMapping("/findPage")
    @PreAuthorize("hasAuthority('CHECKGROUP_QUERY')")
    public PageResult findPage(@RequestBody QueryPageBean queryPageBean) {
        PageResult pageResult = checkGroupService.findPage(queryPageBean);
        return pageResult;
    }

    /**
     * 根据id查询检查组信息
     *
     * @param id
     * @return
     */
    @RequestMapping("/findById")
    @PreAuthorize("hasAuthority('CHECKGROUP_QUERY')")
    public Result findById(@RequestParam Integer id) {
        CheckGroup checkGroup = null;
        try {
            checkGroup = checkGroupService.findById(id);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.QUERY_CHECKGROUP_FAIL);
        }
        return new Result(true, MessageConstant.QUERY_CHECKGROUP_SUCCESS, checkGroup);
    }

    /**
     * 根据检查组id查询对应的检查项
     *
     * @param id
     * @return
     */
    @RequestMapping("/findCheckItemIdsByCheckGroupId")
    @PreAuthorize("hasAnyAuthority('CHECKGROUP_QUERY','CHECKITEM_QUERY')")
    public Result findCheckItemIdsByCheckGroupId(Integer id) {
        List<Integer> list = new ArrayList<>();
        try {
            list = checkGroupService.findCheckItemIdsByCheckGroupId(id);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.QUERY_CHECKITEM_FAIL);
        }
        return new Result(true, MessageConstant.QUERY_CHECKITEM_SUCCESS, list);
    }

    /**
     * 修改
     *
     * @param checkGroup
     * @param checkitemIds
     * @return
     */
    @RequestMapping("/edit")
    @PreAuthorize("hasAuthority('CHECKGROUP_EDIT')")
    public Result edit(@RequestBody CheckGroup checkGroup, Integer[] checkitemIds) {
        try {
            checkGroupService.edit(checkGroup, checkitemIds);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.EDIT_CHECKGROUP_FAIL);
        }
        return new Result(true, MessageConstant.EDIT_CHECKGROUP_SUCCESS);
    }

    /**
     * 删除
     *
     * @param id
     * @return
     */
    @DeleteMapping("/delById")
    @PreAuthorize("hasAuthority('CHECKGROUP_DELETE')")
    public Result delById(Integer id) {
        try {
            checkGroupService.delById(id);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.DELETE_CHECKGROUP_FAIL);
        }
        return new Result(true, MessageConstant.DELETE_CHECKGROUP_SUCCESS);
    }

    @RequestMapping("/findAll")
    @PreAuthorize("hasAuthority('CHECKGROUP_QUERY')")
    public Result findAll() {
        List<CheckGroup> list = null;
        try {
            list = checkGroupService.findAll();
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.QUERY_CHECKGROUP_FAIL);
        }
        return new Result(true, MessageConstant.QUERY_CHECKGROUP_SUCCESS, list);
    }
}
