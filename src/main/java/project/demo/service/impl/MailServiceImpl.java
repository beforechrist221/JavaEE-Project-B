package project.demo.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import project.demo.model.Mail;
import project.demo.service.MailService;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.util.Date;

@Service
public class MailServiceImpl implements MailService {

    private JavaMailSender javaMailSender;
    private MimeMessage mimeMessage;

    @Autowired
    public void setJavaMailSender(JavaMailSender javaMailSender) {
        this.javaMailSender = javaMailSender;
    }

    @Autowired
    public void setMimeMessage(MimeMessage mimeMessage) {
        this.mimeMessage = mimeMessage;
    }

    @Override
    public void sendAttachMail(Mail mail) {
        try {
            MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(this.mimeMessage, true, "UTF-8");
            mimeMessageHelper.setFrom(mail.getFromAddress());
            mimeMessageHelper.setSubject(mail.getSubject());
            mimeMessageHelper.setSentDate(new Date());
            mimeMessageHelper.setText(mail.getContent(), true);

            String[] toAddresses = mail.getToEmails().split(";");
            for (String toAddress : toAddresses) {
                mimeMessageHelper.setTo(toAddress);

                this.javaMailSender.send(this.mimeMessage);
                System.out.println("Send to: " + toAddress);
            }

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
