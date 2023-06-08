package servlet;

import dao.TeacherD;
import vo.Teacher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/check_register")
//检查注册信息，如果注册成功，跳转到one_page_student.jsp，如果注册失败，跳转到register.jsp，并提示错误信息
public class check_register extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");

        String email = request.getParameter("email");
        String user = request.getParameter("user");
        String password = request.getParameter("password1");
        String code = request.getParameter("code");

        System.out.println(email + " " + user + " " + password + " " + code);
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();

        String randStr = (String) session.getAttribute("randStr");

        //判断验证码是否正确
        if (!code.equals(randStr)) {
            out.print("<script>alert(\"验证码错误！\");location.href = \"SignUp.jsp\";</script>");
        } else {
            TeacherD teacherD = new TeacherD();
            Teacher teacher = null;

            try {
                teacher = teacherD.insertTeacher(user, password, email);
            } catch (Exception e) {
                out.print(e);
            }
            if (teacher != null) {
                //向session中添加用户信息
                session.setAttribute("info", teacher);
                response.sendRedirect("one_page_student");
            } else {
                out.print("<script>alert(\"此用户已经注册！\");location.href = \"SignUp.jsp\";</script>");
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
