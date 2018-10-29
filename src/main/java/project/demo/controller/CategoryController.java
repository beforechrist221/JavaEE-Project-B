package project.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import project.demo.model.Category;
import project.demo.service.CategoryService;

@Controller
@RequestMapping("category")
public class CategoryController extends BaseController {

    private final CategoryService categoryService;

    @Autowired
    public CategoryController(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    @RequestMapping("create")
    private String create(Category category) {
        categoryService.create(category);
        return "redirect:/category/queryAll";
    }

    @RequestMapping("remove/{id}")
    private String remove(@PathVariable("id") Integer id) {
        categoryService.remove(id);
        return "redirect:/category/queryAll";
    }

    @RequestMapping("modify")
    private String modify(Category category) {
        categoryService.modify(category);
        return "redirect:/category/queryAll";
    }

    @RequestMapping("queryAll")
    private String queryAll() {
        session.setAttribute("list", categoryService.queryAll());
        return "redirect:/category/list.jsp";
    }

    @RequestMapping("queryById/{id}")
    private String queryById(@PathVariable("id") Integer id) {
        session.setAttribute("category", categoryService.queryById(id));
        return "redirect:/category/edit.jsp";
    }
}