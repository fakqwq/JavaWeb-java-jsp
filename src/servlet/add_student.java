package servlet;

import dao.ScoreD;
import dao.StudentD;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DatabaseMetaData;
import java.sql.Date;

@WebServlet("/add_student")
//这个servlet用于添加学生
public class add_student extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=utf-8"); //设置响应内容类型为HTML，并设置编码为UTF-8
        response.setCharacterEncoding("utf-8"); //设置响应编码为UTF-8
        request.setCharacterEncoding("utf-8"); //设置请求编码为UTF-8

        PrintWriter out = response.getWriter(); //获取响应输出流

        StudentD studentD = new StudentD(); //创建StudentD对象
        ScoreD scoreD = new ScoreD(); //创建ScoreD对象

        String id = request.getParameter("id"); //获取请求参数id
        String name = request.getParameter("name"); //获取请求参数name
        String sex = request.getParameter("sex"); //获取请求参数sex
        String major = request.getParameter("major"); //获取请求参数major
        String school_date = request.getParameter("school_date"); //获取请求参数school_date

        try {
            studentD.insertStudent(id, name, sex, school_date, major); //调用StudentD对象的insertStudent方法插入学生信息
            scoreD.insertScore(id); //调用ScoreD对象的insertScore方法插入学生成绩信息
        }
        catch (Exception e){
            out.print(e); //输出异常信息
        }
        response.sendRedirect("one_page_student"); //重定向到one_page_student页面
    }
}
