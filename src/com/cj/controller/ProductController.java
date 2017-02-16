package com.cj.controller;

import com.cj.bean.Product;
import com.cj.common.bean.ControllerResult;
import com.cj.common.bean.Pager4EasyUI;
import com.cj.common.bean.WebUtil;
import com.cj.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by interface on 2017/2/16.
 */
@Controller
@RequestMapping("/product")
public class ProductController {
    @Resource
    private ProductService productService;

    @RequestMapping("show")
    public String showPager(){
        return "layout_full_screen";
    }
    @RequestMapping("showProduct")
    public String ProductPager(){
        return "products";
    }
    @ResponseBody
    @RequestMapping("pager")
    public List<Product> PagerProduct(HttpServletRequest req){
        Pager4EasyUI<Product> pager4EasyUI = new Pager4EasyUI<Product>();
        pager4EasyUI.setPageSize(WebUtil.getPageSize(req));
        pager4EasyUI.setPageNo(WebUtil.getPageNo(req));
        Product p = new Product();
        productService.queryByPagerAndCriteria(pager4EasyUI,p);
        return pager4EasyUI.getRows();
    }
    @ResponseBody
    @RequestMapping("add")
    public ControllerResult AddProdcut(Product product){
        productService.add(product);
        return ControllerResult.getSuccessResult("添加商品成功");
    }

    @ResponseBody
    @RequestMapping("update")
    public ControllerResult UpdateProdcut(Product product){
        productService.update(product);
        return ControllerResult.getSuccessResult("更新商品成功");
    }
    @ResponseBody
    @RequestMapping("deleteProduct")
    public ControllerResult DeleteUpdate(Product product,int id){
        productService.deleteById(id);
        return ControllerResult.getSuccessResult("删除产品成功");
    }
}
