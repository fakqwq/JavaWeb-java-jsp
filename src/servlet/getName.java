package servlet;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dao.ScoreD;
import dao.StudentD;
import vo.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/getName")
public class getName extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        StudentD sdao = new StudentD();
        Student student = null;

        resp.setContentType("text/html;charset=utf-8");
        resp.setCharacterEncoding("utf-8");
        req.setCharacterEncoding("utf-8");

        // 从请求体中获取 JSON 数据
        String requestBody = req.getReader().readLine();
        // 解析 JSON 数据
        JsonObject json = new Gson().fromJson(requestBody, JsonObject.class);
        String user = json.get("user").getAsString();
        String password = json.get("password").getAsString();
        System.out.println(user + password);

        try {
            student = sdao.checkAccount(user, password);
            System.out.println(student + "---------------");
            resp.getWriter().write(student.getName());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }
}
