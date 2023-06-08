package servlet;

import dao.StudentD;
import vo.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.regex.Pattern;

@WebServlet("/one_page_student")
public class one_page_student extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        this.doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");

        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();

        String key = request.getParameter("key");

        if (key == null || key.equals("")) { // 如果key为null或空
            try {
                StudentD sdao = new StudentD(); // 创建一个新的StudentD对象
                ArrayList<Student> stus = sdao.getOnePage(); // 获取当前页面的学生列表
                session.setAttribute("onePageStudent", stus); // 将学生列表设置为会话属性
                response.sendRedirect("main.jsp"); // 重定向到main.jsp页面
            } catch (Exception e) {
                out.print(e); // 打印异常
            }
        }
        else {

            StudentD studentD = new StudentD();
            String pattern = "^\\d+"; // 匹配数字的正则表达式
            boolean isMatch = Pattern.matches(pattern, key); // 判断key是否匹配正则表达式
            if (isMatch) { // 如果匹配
                try {
                    Student student = studentD.findWithId(key); // 根据Key查找学生
                    ArrayList<Student> students = new ArrayList<>();
                    students.add(student);
                    session.setAttribute("onePageStudent", students); // 将学生列表设置为会话属性
                    response.sendRedirect("main.jsp"); // 重定向到main.jsp页面
                } catch (Exception e) {
                    out.print(e); // 打印异常
                }
            } else { // 如果不匹配
                try {
                    ArrayList<Student> stus = studentD.findWithName(key); // 根据姓名查找学生
                    session.setAttribute("onePageStudent", stus); // 将学生列表设置为会话属性
                    response.sendRedirect("main.jsp"); // 重定向到main.jsp页面
                } catch (Exception e) {
                    out.print(e); // 打印异常
                }
            }
        }
    }
}
