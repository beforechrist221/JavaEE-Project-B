package project.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import project.demo.model.User;
import project.demo.service.UserInfoService;
import project.demo.service.UserService;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("user")
public class UserController extends BaseController {

    private UserService userService;
    private UserInfoService userInfoService;

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @Autowired
    public void setUserInfoService(UserInfoService userInfoService) {
        this.userInfoService = userInfoService;
    }

    /**
     * Spring MVC JSON Jackson
     * jackson-core
     * jackson-databind
     * javason-annotation
     *
     * @param email
     * @return
     */
    @RequestMapping("checkEmail")
    @ResponseBody
    public Map<String, Boolean> checkEmail(String email) {
        Map<String, Boolean> data = new HashMap<>();
        data.put("isEmailExisted", false);
        if (userService.queryUserByEmail(email) != null) {
            data.put("isEmailExisted", true);
        }
        return data;
    }

    @RequestMapping("signUp")
    public String signUp(User user) {
        if (userService.signUp(user)) {
            return "redirect:/index.jsp";
        }
        request.setAttribute("message", "Email existed.");
        return "/sign-up.jsp";
    }

    @RequestMapping("signIn")
    public String signIn(User user) {
        user = userService.signIn(user);
        if (user != null) {
            session.setAttribute("user", user);
            return "redirect:/portal/home.jsp";
        }
        request.setAttribute("message", "Invalid Email or password.");
        return "/sign-in.jsp";
    }

    @RequestMapping("signOut")
    public String signOut() {
        session.invalidate();
        return "redirect:/index.jsp";
    }
}
