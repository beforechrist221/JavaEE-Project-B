package project.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import project.demo.model.Address;
import project.demo.model.User;
import project.demo.service.AddressService;

@Controller
@RequestMapping("address")
public class AddressController extends BaseController {

    private final AddressService addressService;

    @Autowired
    public AddressController(AddressService addressService) {
        this.addressService = addressService;
    }

    @RequestMapping("create")
    private String create(Address address) {
        User user = (User) session.getAttribute("user");
        address.setUserId(user.getId());
        addressService.create(address);
        if (address.getStatus() == 1) {
            unsetDefaultAddress(address.getId());
        }
        return "redirect:/address/queryAll";
    }

    @RequestMapping("setDefault/{id}")
    private String setDefault(@PathVariable int id) {
        setDefaultAddress(id);
        unsetDefaultAddress(id);
        return "redirect:/address/queryAll";
    }


    /**
     *
     * @param id 要设为默认地址的 ID
     *
     * 把当前地址设置为默认
     */
    private void setDefaultAddress(int id) {
        addressService.modify("setDefaultAddress", id);
    }

    /**
     *
     * @param id 新创建的默认地址的 ID
     *
     * 把其他地址之设置为非默认
     */
    private void unsetDefaultAddress(int id) {
        addressService.modify("unsetDefaultAddress", id);
    }

    @RequestMapping("remove/{id}")
    private String remove(@PathVariable("id") Integer id) {
        addressService.remove(id);
        return "redirect:/address/queryAll";
    }

    @RequestMapping("modify")
    private String modify(Address address) {
        addressService.modify(address);
        if (address.getStatus() == 1) {
            unsetDefaultAddress(address.getId());
        }
        return "redirect:/address/queryAll";
    }

    @RequestMapping("queryAll")
    private String queryAll() {
        session.setAttribute("list", addressService.queryAll());
        return "redirect:/portal/address/list.jsp";
    }

    @RequestMapping("queryById/{id}")
    private String queryById(@PathVariable("id") Integer id) {
        session.setAttribute("address", addressService.queryById(id));
        return "redirect:/portal/address/edit.jsp";
    }
}