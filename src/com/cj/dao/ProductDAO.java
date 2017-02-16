package com.cj.dao;

import com.cj.bean.Product;
import com.cj.common.bean.Pager4EasyUI;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by interface on 2017/2/16.
 */
@Repository
public interface ProductDAO extends BaseDAO<Product> {
    public List<Product> queryByPagerAndCriteria(@Param("pager")Pager4EasyUI<Product> pager, @Param("product")Product t);
    public int countByCriteria(Product t);
}
