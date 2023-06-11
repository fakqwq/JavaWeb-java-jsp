package servlet;

import com.google.gson.Gson;
import dao.StudentD;
import vo.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.regex.Pattern;

import static java.lang.System.out;

@WebServlet ("/searchStudent")
public class searchStudent extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json;charset=UTF-8");

        BufferedReader reader = req.getReader();
        String key = reader.readLine();
        Gson gson = new Gson();

        StudentD studentD = new StudentD();
        String pattern = "^\\d+"; // 匹配数字的正则表达式
        boolean isMatch = Pattern.matches(pattern, key); // 判断key是否匹配正则表达式
        if (isMatch) { // 如果匹配
            try {
                Student student = studentD.findWithId(key); // 根据Key查找学生
                ArrayList<Student> students = new ArrayList<>();
                students.add(student);
                resp.getWriter().write(gson.toJson(students));
            } catch (Exception e) {
                out.print(e); // 打印异常
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
