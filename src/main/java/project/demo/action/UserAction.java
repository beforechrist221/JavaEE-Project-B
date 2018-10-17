package project.demo.action;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.ibatis.session.SqlSession;
import org.jasypt.util.password.StrongPasswordEncryptor;
import project.demo.model.User;
import project.demo.model.UserInfo;
import project.demo.util.MyBatisSession;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet(urlPatterns = "/user")
public class UserAction extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        switch (action) {
            case "signUp":
                signUp(req, resp);
                break;
            case "signIn":
                signIn(req, resp);
                break;
            case "signOut":
                signOut(req, resp);
                break;
            case "checkEmail":
                checkEmail(req, resp);
                break;
            default:
                break;
        }
    }

    private void checkEmail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email").trim();
        resp.setContentType("application/json, charset=UTF-8");
        String json = "{\"isEmailExisted\": true}";
        if (queryUserByEmail(email) == null) {
            json = "{\"isEmailExisted\": false}";
        }
        resp.getWriter().write(json);
    }

    private User queryUserByEmail(String email) {
        try (SqlSession sqlSession = MyBatisSession.getSqlSession(false)) {
            return sqlSession.selectOne("user.queryUserByEmail", email);
        }
    }

    private void signOut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getSession().invalidate();
        resp.sendRedirect("index.jsp");
    }

    private void signIn(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email").trim();

        User user = queryUserByEmail(email);
        if (user != null) {
            String password = req.getParameter("password");
            String encryptedPassword = user.getPassword();
            StrongPasswordEncryptor strongPasswordEncryptor = new StrongPasswordEncryptor();
            if (strongPasswordEncryptor.checkPassword(password, encryptedPassword)) {
                user.setPassword(null); // ***
                req.getSession().setAttribute("user", user);

                UserInfo userInfo = user.getUserInfo();
                SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                String updateTime = simpleDateFormat.format(new Date());
                userInfo.setUpdateTime(updateTime);
                userInfo.setUpdateIp(req.getRemoteAddr());
                try (SqlSession sqlSession = MyBatisSession.getSqlSession(true)) {
                    sqlSession.update("userInfo.signInUpdate", userInfo);
                }

                resp.sendRedirect("/portal/home.jsp");
                return;
            }
        }

        req.setAttribute("message", "Invalid Email or password.");
        req.getRequestDispatcher("sign-in.jsp").forward(req, resp);
    }

    private void signUp(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email").trim();
        if (queryUserByEmail(email) != null) {
            req.setAttribute("message", "Email is existed.");
            req.getRequestDispatcher("sign-up.jsp").forward(req, resp);
            return;
        }
        String password = req.getParameter("password");
        StrongPasswordEncryptor strongPasswordEncryptor = new StrongPasswordEncryptor();
        password = strongPasswordEncryptor.encryptPassword(password);

        try (SqlSession sqlSession = MyBatisSession.getSqlSession(true)) {
            User user = new User(email, password);
            sqlSession.insert("user.signUp", user);

            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String createTime = simpleDateFormat.format(new Date());

            UserInfo userInfo = new UserInfo(createTime, user.getId());
            sqlSession.insert("userInfo.create", userInfo);
        }
        resp.sendRedirect("index.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
