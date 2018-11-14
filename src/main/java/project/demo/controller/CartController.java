package project.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import project.demo.model.Cart;
import project.demo.model.User;
import project.demo.service.CartService;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("cart")
public class CartController extends BaseController {

    private final CartService cartService;

    @Autowired
    public CartController(CartService cartService) {
        this.cartService = cartService;
    }

    @RequestMapping("create")
    @ResponseBody
    private Map<String, Boolean> create(Cart cart) {
        User user = (User) session.getAttribute("user");
        cart.setUserId(user.getId());
        cartService.create(cart);
        Map<String, Boolean> map = new HashMap<>();
        map.put("result", true);
        return map;
    }

    @RequestMapping("remove/{id}")
    private String remove(@PathVariable("id") Integer id) {
        removeByProductId(id);
        return "redirect:/cart/queryAll";
    }

    private void removeByProductId(int productId) {
        cartService.remove(productId);
    }

    @RequestMapping("batchRemove")
    private String batchRemove(@RequestParam int[] productIds) {
        System.out.println(Arrays.toString(productIds));
        for (int productId : productIds) {
            removeByProductId(productId);
        }
        return "redirect:/cart/queryAll";
    }

    @RequestMapping("modify")
    private String modify(Cart cart) {
        cartService.modify(cart);
        return "redirect:/cart/queryAll";
    }

    @RequestMapping("queryAll")
    private String queryAll() {
        User user = (User) session.getAttribute("user");
        session.setAttribute("list", cartService.queryList("queryAll", user.getId()));
        return "redirect:/cart.jsp";
    }

    @RequestMapping("queryById/{id}")
    private String queryById(@PathVariable("id") Integer id) {
        session.setAttribute("cart", cartService.queryById(id));
        return "redirect:/cart/edit.jsp";
    }

    @RequestMapping("queryCartNumber")
    @ResponseBody
    private Map<String, Integer> queryCartNumber() {
        User user = (User) session.getAttribute("user");
        int cartNumber = (int) cartService.query("queryCartNumber", user.getId());
        Map<String, Integer> map = new HashMap<>();
        map.put("cartNumber", cartNumber);
        return map;
    }
}