package project.demo.controller;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.multipart.MultipartFile;
import project.demo.model.Product;
import project.demo.service.CategoryService;
import project.demo.service.ProductService;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

@Controller
@RequestMapping("product")
public class ProductController extends BaseController {

    private static final String COVER_FILE_PATH = "/admin/product/pictures/cover/";

    private ProductService productService;
    private CategoryService categoryService;

    @Autowired
    public void setProductService(ProductService productService) {
        this.productService = productService;
    }

    @Autowired
    public void setCategoryService(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    @RequestMapping("create")
    private String create(
            Product product,
            @RequestParam MultipartFile coverPictureFile,
            @RequestParam MultipartFile[] slidePictureFiles,
            @RequestParam MultipartFile[] detailPictureFiles
    ) {
        productService.create(productService.getProductWithPictures(
                product,
                coverPictureFile,
                slidePictureFiles,
                detailPictureFiles));
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
        session.setAttribute("categories", categoryService.queryList("queryCategoryTree", null));
        return "redirect:/admin/product/list.jsp";
    }

    @RequestMapping("queryAll/{currentPage}")
    private String queryAll(@PathVariable int currentPage) {
        session.setAttribute("pagination", productService.queryAll(currentPage));
        session.setAttribute("categories", categoryService.queryList("queryCategoryTree", null));
        return "redirect:/admin/product/list.jsp";
    }

    @RequestMapping("queryAllPages")
    private String queryAllPages() {
        return queryAll(1);
    }

    @RequestMapping("queryById/{id}")
    private String queryById(@PathVariable("id") Integer id) {
        session.setAttribute("product", productService.queryById(id));
        return "redirect:/admin/product/edit.jsp";
    }

    @RequestMapping("add")
    private String add() {
        session.setAttribute("categories", categoryService.queryList("queryCategoryTree", null));
        return "redirect:/admin/product/add.jsp";
    }

    @RequestMapping("index")
    @ResponseBody
    private List<Product> index() {
        return productService.queryList("queryIndexProducts", null);
    }

    @RequestMapping("detail/{id}")
    private String detail(@PathVariable int id) {
        session.setAttribute("product", productService.queryById(id));
        return "redirect:/detail.jsp";
    }
}