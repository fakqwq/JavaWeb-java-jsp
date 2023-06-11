package servlet;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dao.TeacherD;
import vo.Teacher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/check_login")
public class check_login extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        this.doGet(request, response);
    }

    protected void doGet (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 设置编码格式
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");

        // 从请求体中获取 JSON 数据
        String requestBody = request.getReader().readLine();
        // 解析 JSON 数据
        JsonObject json = new Gson().fromJson(requestBody, JsonObject.class);
        String user = json.get("user").getAsString();
        String password = json.get("password").getAsString();

        // 获取输出流
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();

        // 创建数据库操作对象
        TeacherD teacherD = new TeacherD();
        Teacher teacher = null;

        try {
            // 判断用户身份
            teacher = teacherD.checkAccount(user, password);
        }
        catch (Exception e) {
            out.print(e);
        }

        if (teacher != null) {
            //向session中添加用户信息
            session.setAttribute("info", teacher);
            System.out.println("登录成功！");

            response.getWriter().write("success");
        }
        else {
            out.print("<script>alert(\"用户名或密码错误！\");");
        }
    }
}
