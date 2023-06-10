package servlet;

import com.google.gson.Gson;
import dao.StudentD;
import vo.Score;
import vo.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

import static java.lang.System.out;

@WebServlet("/getStudent")
public class getStudent extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json;charset=UTF-8");
        StudentD sdao = new StudentD(); // 创建一个新的StudentD对象
        Gson gson = new Gson();
        try {
            ArrayList<Student> stus = sdao.getOnePage(); // 获取当前页面的学生列表
            out.println(stus);
            resp.getWriter().write(gson.toJson(stus));
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
