package com.bigdeal.service;

import com.bigdeal.dao.AccountDAO;
import com.bigdeal.entity.Account;
import com.bigdeal.form.EmailForm;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ClassPathResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

@Service
public class EmailService {

    private static Logger log = LoggerFactory.getLogger(EmailService.class);

    @Autowired
    private AccountDAO accountDAO;

    @Autowired
    private JavaMailSender emailSender;

    @Value("${spring.mail.username}")
    private String from;

    @Autowired
    @Qualifier("emailConfigBean")
    private Configuration emailConfig;

    public String sendEmail(String email, String userName) throws MessagingException, IOException, TemplateException {
        Account account = accountDAO.findAccount(userName);
        if (account != null) {
            Map model = new HashMap();
            EmailForm emailForm = new EmailForm();
            emailForm.setTo(email);
            String codeRandom = generateCode();
            emailForm.setContent("Using " + generateCode() + " to reset your password.");
            emailForm.setSubject("Reset Password");
            model.put("name", account.getUserName());
            model.put("location", "Big Deal");
            model.put("content", emailForm.getContent());
            emailForm.setModel(model);
            log.info("Sending Email to: " + emailForm.getTo());
            MimeMessage message = emailSender.createMimeMessage();
            MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(message, MimeMessageHelper.MULTIPART_MODE_MIXED_RELATED, StandardCharsets.UTF_8.name());
            mimeMessageHelper.addInline("logo.png", new ClassPathResource("classpath:/techmagisterLogo.png"));

            Template template = emailConfig.getTemplate("email.ftl");
            String html = FreeMarkerTemplateUtils.processTemplateIntoString(template, emailForm.getModel());

            mimeMessageHelper.setTo(emailForm.getTo());
            mimeMessageHelper.setText(html, true);
            mimeMessageHelper.setSubject(emailForm.getSubject());
            mimeMessageHelper.setFrom(from);
            emailSender.send(message);
            return codeRandom;
        } else {
            return null;
        }
    }

    private String generateCode() {
        Random random = new Random();
         int kq = random.nextInt(10000);
        return String.valueOf(kq);
    }

}
