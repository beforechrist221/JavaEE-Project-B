package project.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import project.demo.model.Cart;
import project.demo.service.CartService;

@Controller
@RequestMapping("cart")
public class CartController extends BaseController {

    private final CartService cartService;

    @Autowired
    public CartController(CartService cartService) {
        this.cartService = cartService;
    }

    @RequestMapping("create")
    private String create(Cart cart) {
        cartService.create(cart);
        return "redirect:/cart/queryAll";
    }

    @RequestMapping("remove/{id}")
    private String remove(@PathVariable("id") Integer id) {
        cartService.remove(id);
        return "redirect:/cart/queryAll";
    }

    @RequestMapping("modify")
    private String modify(Cart cart) {
        cartService.modify(cart);
        return "redirect:/cart/queryAll";
    }

    @RequestMapping("queryAll")
    private String queryAll() {
        session.setAttribute("list", cartService.queryAll());
        return "redirect:/cart/list.jsp";
    }

    @RequestMapping("queryById/{id}")
    private String queryById(@PathVariable("id") Integer id) {
        session.setAttribute("cart", cartService.queryById(id));
        return "redirect:/cart/edit.jsp";
    }
}