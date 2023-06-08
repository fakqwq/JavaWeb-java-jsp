package servlet;

import dao.ScoreD;
import dao.StudentD;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/update_student")
public class update_student extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // 设置响应的内容类型和编码方式
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");

        // 获取输出流和StudentD对象
        PrintWriter out = response.getWriter();
        StudentD studentD = new StudentD();

        // 获取表单数据
        String stuno = request.getParameter("stuno");
        String stuname = request.getParameter("stuname");
        String stusex = request.getParameter("stusex");
        String stumajor = request.getParameter("stumajor");

        try {
         // 更新学生信息
            studentD.updateStudentInfo(stuno, stuname, stusex, stumajor);
        }
        catch (Exception e){
            out.print(e);
        }

        // 重定向到学生信息页面
        response.sendRedirect("one_page_student");
    }
}
