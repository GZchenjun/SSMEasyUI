package com.cj.serviceImpl;

import com.cj.bean.Product;
import com.cj.common.bean.Pager4EasyUI;
import com.cj.dao.ProductDAO;
import com.cj.service.ProductService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.Serializable;
import java.util.List;

/**
 * Created by interface on 2017/2/16.
 */
@Service
public class ProductServiceImpl implements ProductService {
    @Resource
    private ProductDAO productDAO;
    @Override
    public List<Product> queryAll() {

        return productDAO.queryAll();
    }

    @Override
    public Product queryById(Serializable id) {
        return null;
    }

    @Override
    public void add(Product product) {
        productDAO.add(product);
    }

    @Override
    public void update(Product product) {
        productDAO.update(product);
    }

    @Override
    public void deleteById(Serializable id) {
        productDAO.deleteById(id);
    }

    @Override
    public Pager4EasyUI<Product> queryByPagerAndCriteria(Pager4EasyUI<Product> pager, Product product) {
        List<Product> products = productDAO.queryByPagerAndCriteria(pager,product);
        pager.setRows(products);
        pager.setTotal(productDAO.countByCriteria(product));
        return pager;
    }

    @Override
    public int countByCriteria(Product product) {
        return productDAO.countByCriteria(product);
    }

    @Override
    public Product queryByLogin(Product product) {
        return null;
    }
}
