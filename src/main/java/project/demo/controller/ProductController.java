package project.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import project.demo.model.Product;
import project.demo.service.ProductService;

@Controller
@RequestMapping("product")
public class ProductController extends BaseController {

    private final ProductService productService;

    @Autowired
    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @RequestMapping("create")
    private String create(Product product) {
        productService.create(product);
        return "redirect:/product/queryAll";
    }

    @RequestMapping("remove/{id}")
    private String remove(@PathVariable("id") Integer id) {
        productService.remove(id);
        return "redirect:/product/queryAll";
    }

    @RequestMapping("modify")
    private String modify(Product product) {
        productService.modify(product);
        return "redirect:/product/queryAll";
    }

    @RequestMapping("queryAll")
    private String queryAll() {
        session.setAttribute("list", productService.queryAll());
        return "redirect:/backend/product/list.jsp";
    }

    @RequestMapping("queryById/{id}")
    private String queryById(@PathVariable("id") Integer id) {
        session.setAttribute("product", productService.queryById(id));
        return "redirect:/backend/product/edit.jsp";
    }
}