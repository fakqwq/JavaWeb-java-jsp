package servlet;

import dao.StudentD;
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


@WebServlet("/update_teacher")
public class update_teacher extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // 设置响应的内容类型和编码方式
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");

        // 获取输出流和会话对象
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();

        // 创建TeacherD对象
        TeacherD teacherD = new TeacherD();

        // 获取表单数据
        String uid = request.getParameter("uid");
        String name = request.getParameter("name");
        String sex = request.getParameter("sex");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            // 更新教师信息
            Teacher teacher = teacherD.updateTeacher(uid, name, sex, email, password);

            // 将更新后的教师信息存储在会话中，并输出保存成功的提示信息
            session.setAttribute("info", teacher);
            out.print("<script>alert(\"保存成功！\");location.href = \"PersonInfo.jsp\";</script>");
        }
        catch (Exception e){
            // 如果发生异常，则将异常信息输出到响应中
            out.print(e);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
