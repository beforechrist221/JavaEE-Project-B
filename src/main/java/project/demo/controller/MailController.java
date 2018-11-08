package project.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import project.demo.model.Mail;
import project.demo.service.MailService;

@Controller
@RequestMapping("mail")
public class MailController {

    private MailService mailService;

    @Autowired
    public void setMailService(MailService mailService) {
        this.mailService = mailService;
    }

    @RequestMapping("send")
    @ResponseBody
    private void send() {
        Mail mail = new Mail();
        mail.setFromAddress("hunjitianya@qq.com");
        mail.setToEmails("hunjitianya@qq.com;675835357@qq.com");
        mail.setSubject("测试邮件标题...");
        mail.setContent("测试邮件正文..."); // TODO: 11/8/2018 link token?

        mailService.sendAttachMail(mail);
    }

    @RequestMapping("check")
    private String check(@RequestParam String email) {
        // TODO: 11/8/2018 check email existed?
        return null;
    }
}
