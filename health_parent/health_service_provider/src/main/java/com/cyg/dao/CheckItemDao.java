package com.cyg.dao;

import com.cyg.pojo.CheckItem;
import com.github.pagehelper.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author CuiYuangeng
 * @create 2022-02-17 20:57
 */
public interface CheckItemDao {
    void add(CheckItem checkItem);

    Page<CheckItem> selectAllCheckItem(@Param("keyword") String keyword);

    void deleteById(Integer id);

    void updateCheckItem(CheckItem checkItem);

    CheckItem queryCheckItem(Integer id);

    long findCountByCheckItemId(Integer id);

    List<CheckItem> findAll();
    List<CheckItem> findCheckItemById(Integer id);
}
