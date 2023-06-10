package servlet;

import dao.ScoreD;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/update_score")
public class update_score extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        this.doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // 设置响应的内容类型和编码方式
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");

        // 获取输出流和ScoreD对象
        PrintWriter out = response.getWriter();
        ScoreD scoreD = new ScoreD();

        // 获取表单数据
        String[] id = request.getParameterValues("id");
        String[] database = request.getParameterValues("database");
        String[] android = request.getParameterValues("android");
        String[] jsp = request.getParameterValues("jsp");

        String ID = request.getParameter("id");

        try {
            // 更新学生成绩信息
            for (int i=0; i<id.length; i++) {
                scoreD.updateScoreInfo(id[i], database[i], android[i], jsp[i]);
                System.out.println("id: " + id[i] + " database: " + database[i] + " android: " + android[i] + " jsp: " + jsp[i]);
            }

            // 在当前请求中设置属性
            request.getSession().setAttribute("paramId", ID);
            // 重定向到学生成绩信息页面
            response.sendRedirect("one_page_score");
        }
        catch (Exception e){
            // 如果发生异常，则将异常信息输出到响应中
            out.print(e);
        }
    }
}
