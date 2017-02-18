package com.cj.controller;

import ch.qos.logback.classic.Logger;
import com.cj.bean.Product;
import com.cj.common.bean.ControllerResult;
import com.cj.common.bean.Pager4EasyUI;
import com.cj.service.ProductService;
import org.apache.ibatis.annotations.Param;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by interface on 2017/2/16.
 */
@Controller
@RequestMapping("/product")
public class ProductController {
    @Resource
    private ProductService productService;
    private Logger logger =(Logger) LoggerFactory.getLogger(ProductController.class);
    @RequestMapping("show")
    public String showPager(){
        return "layout_full_screen";
    }
    @RequestMapping("showProduct")
    public String ProductPager(){
        return "products";
    }
    @ResponseBody
    @RequestMapping(value="pager",method= RequestMethod.GET)
    public Pager4EasyUI queryPager(@Param("page")String page, @Param("rows")String rows){
        logger.info("分页查询所有产品");
        Pager4EasyUI<Product> pager = new Pager4EasyUI<Product>();
        pager.setPageNo(Integer.valueOf(page));
        pager.setPageSize(Integer.valueOf(rows));
        Product product = new Product();
        //product.setName("2");
        pager = productService.queryByPagerAndCriteria(pager,product);
        return pager;
    }
    @ResponseBody
    @RequestMapping(value="add",method=RequestMethod.POST)
    public ControllerResult AddProduct(Product product){
        productService.add(product);
        logger.info("添加商品");
        return ControllerResult.getSuccessResult("添加商品成功");
    }

    @ResponseBody
    @RequestMapping(value="update",method=RequestMethod.POST)
    public ControllerResult UpdateProduct(Product product){
        productService.update(product);
        logger.info("更新商品");
        return ControllerResult.getSuccessResult("更新商品成功");
    }
    @ResponseBody
    @RequestMapping(value="deleteProduct",method=RequestMethod.GET)
    public ControllerResult DeleteUpdate(Product product,int id){
        productService.deleteById(id);
        logger.info("删除商品");
        return ControllerResult.getSuccessResult("删除产品成功");
    }
}
