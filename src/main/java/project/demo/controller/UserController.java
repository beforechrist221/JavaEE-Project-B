package project.demo.controller;

import org.apache.commons.codec.digest.DigestUtils;
import org.jasypt.util.password.StrongPasswordEncryptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import project.demo.model.Mail;
import project.demo.model.User;
import project.demo.model.UserInfo;
import project.demo.service.CartService;
import project.demo.service.MailService;
import project.demo.service.UserInfoService;
import project.demo.service.UserService;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("user")
public class UserController extends BaseController {

    private UserService userService;
    private UserInfoService userInfoService;
    private MailService mailService;
    private CartService cartService;

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @Autowired
    public void setUserInfoService(UserInfoService userInfoService) {
        this.userInfoService = userInfoService;
    }

    @Autowired
    public void setMailService(MailService mailService) {
        this.mailService = mailService;
    }

    @Autowired
    public void setCartService(CartService cartService) {
        this.cartService = cartService;
    }

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

    @RequestMapping("checkEmailForRestPassword")
    private String checkEmailForRestPassword(@RequestParam String email) {
        User user = userService.queryUserByEmail(email);
        if (user != null) {
            StrongPasswordEncryptor strongPasswordEncryptor = new StrongPasswordEncryptor();
            String token = strongPasswordEncryptor.encryptPassword(email);
            long tokenTime = new Date().getTime();

            UserInfo userInfo = new UserInfo();
            userInfo.setToken(token);
            userInfo.setTokenTime(tokenTime);
            userInfo.setUserId(user.getId()); // user id

            userInfoService.modify("updateToken", userInfo);

            token = DigestUtils.md5Hex(token);

            String link = "http://localhost:8080/user/resetPassword/" + user.getId() + "/" + token;

            Mail mail = new Mail();
            mail.setFromAddress("hunjitianya@qq.com");
            mail.setToEmails(email);
            mail.setSubject("重置密码");
            mail.setContent(link);

            mailService.sendAttachMail(mail);

            session.setAttribute("message", "邮件已经发送至您的邮箱");
            return "redirect:/email.jsp";
        }
        request.setAttribute("errorMessage", "邮箱不存在");
        return "/email.jsp";
    }

    @RequestMapping("resetPassword/{id}/{token}")
    private String resetPassword(@PathVariable int id, @PathVariable String token) {
        UserInfo userInfo = userInfoService.queryOne("queryUserInfoByUserId", id);
        String tokenString = userInfo.getToken();
        long tokenTime = userInfo.getTokenTime();
        if (tokenString.equals(token)) {
            long currentTime = System.currentTimeMillis();
            if ((currentTime - tokenTime) / 1000 / 60 / 60 < 1) {
                session.setAttribute("id", id);
                return "redirect:/resetPassword.jsp";
            }
        }
        request.setAttribute("message", "链接失效");
        return "/error.jsp";
    }

    @RequestMapping("modifyPassword")
    private String modifyPassword(@RequestParam String password) {
        StrongPasswordEncryptor strongPasswordEncryptor = new StrongPasswordEncryptor();
        password = strongPasswordEncryptor.encryptPassword(password);
        User user = new User();
        user.setId((Integer) session.getAttribute("id"));
        user.setPassword(password);
        userService.modify("modifyPassword", user);
        return "redirect:/sign-in.jsp";
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
            int cartNumber = (int) cartService.query("queryCartNumber", user.getId());
            session.setAttribute("cartNumber", cartNumber);
            return "redirect:/index.jsp";
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
