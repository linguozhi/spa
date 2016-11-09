package com.dazi.spa.console;

import com.dazi.spa.common.datatable.DataTable;
import com.dazi.spa.common.datatable.Order;
import com.dazi.spa.common.protocol.ResponseHelper;
import com.dazi.spa.common.utils.IntegerUtil;
import com.dazi.spa.modules.checkItem.model.CheckItem;
import com.dazi.spa.modules.checkItem.service.CheckItemService;
import com.dazi.spa.modules.product.model.Product;
import com.dazi.spa.modules.product.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("product")
public class ProductController {
    @Autowired
    private ProductService productService;

    @Autowired
    private CheckItemService checkItemService;

    @RequestMapping("/index")
    public String index() {
        return "product/product/index";
    }

    @RequestMapping("/getList")
    @ResponseBody
    public DataTable getList(Product product, Order order, int start, int length, int draw) {
        int total = productService.selectTotal(product);
        List<Product> list = null;
        if(total > 0) {
            list = productService.selectList(product, order, start, length);
        }

        return ResponseHelper.buildDataTable(draw, total, list);
    }



    @RequestMapping("/edit")
    public String edit(Integer id, Model model) {
        Product product = new Product();
        if(IntegerUtil.gtZero(id)) {
            product = productService.selectByPrimaryKey(id);
        }

        // 获取父品项列表
        List<CheckItem> itemList = checkItemService.getTopItemList();
        model.addAttribute("product", product);
        model.addAttribute("itemList", itemList);

        return "product/product/edit";
    }

    @RequestMapping("/save")
    @ResponseBody
    public Map save(Product product) {

        int total = productService.selectTotal(new Product());

        product.setCreateTime(new Date());
        if(productService.insertSelective(product) < 1) {
            return ResponseHelper.buildErrorResult("保存失败");
        }

        return ResponseHelper.buildSuccessResult();
    }

    @RequestMapping("/update")
    @ResponseBody
    public Map update(Product product) {
        Assert.notNull(product.getId(), "id不能为空");

        if(productService.updateByPrimaryKeySelective(product) < 1) {
            return ResponseHelper.buildErrorResult("保存失败");
        }

        return ResponseHelper.buildSuccessResult();
    }

    @RequestMapping("/del")
    @ResponseBody
    public Map delete(Integer id) {
        Assert.isTrue(IntegerUtil.gtZero(id) , "id不能小于1");

        if(productService.deleteByPrimaryKey(id) < 1) {
            return ResponseHelper.buildErrorResult("删除失败");
        }

        return ResponseHelper.buildSuccessResult();
    }

}