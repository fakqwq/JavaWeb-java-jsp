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

@WebServlet("/delete_student")
//这个servlet用于删除学生
public class delete_student extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=utf-8"); //设置响应内容类型为HTML，字符编码为UTF-8
        response.setCharacterEncoding("utf-8"); //设置响应字符编码为UTF-8
        request.setCharacterEncoding("utf-8"); //设置请求字符编码为UTF-8

        PrintWriter out = response.getWriter(); //获取响应输出流
        StudentD studentD = new StudentD(); //创建学生数据访问对象
        ScoreD scoreD = new ScoreD(); //创建成绩数据访问对象

        String id = request.getParameter("id"); //获取请求参数中的学生ID
        try {
            studentD.deleteStudent(id); //删除学生
            scoreD.deleteScore(id); //删除学生成绩
            response.sendRedirect("one_page_student"); //重定向到学生列表页面
        }
        catch (Exception e){
            out.print(e); //输出异常信息
        }
    }
}
