package servlet;

import dao.ScoreD;
import vo.Score;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet("/one_page_score")
public class one_page_score extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        this.doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");

        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String key = request.getParameter("id");
        String paramID = (String) session.getAttribute("paramId");

        if (key == null) {
            //如果key为空，这个代码块尝试从数据库中查找所有的成绩，
            //将其添加到一个成绩列表中，并将该列表设置为会话属性，以便在JSP页面中显示。
            try {
                ScoreD scoD = new ScoreD();
                ArrayList<Score> stus = scoD.getOnePage();
                session.setAttribute("onePageScore", stus);
                //这行代码将请求重定向到Score.jsp页面。
                response.sendRedirect("Score.jsp");
            } catch (Exception e) {
                out.print(e);
            }
        } else {
            ScoreD scoreD = new ScoreD();
                // 这段代码尝试从数据库中查找一个特定的成绩，将其添加到一个成绩列表中，并将该列表设置为会话属性，以便在JSP页面中显示。
                try {
                    Score score = scoreD.findWithId(key);
                    ArrayList<Score> scores = new ArrayList<>();
                    scores.add(score);
                    session.setAttribute("onePageScore", scores);
                    response.sendRedirect("Score.jsp");
                    return;
                } catch (Exception e) {
                    out.print(e);
                }
        }

        //用来确保在查看单独学生成绩并进行修改后保持在该学生的成绩页面。
        if (paramID != null){
            ScoreD scoreD = new ScoreD();
            try {
                Score score = scoreD.findWithId(paramID);
                ArrayList<Score> scores = new ArrayList<>();
                scores.add(score);
                session.setAttribute("onePageScore", scores);
                response.reset();
                response.sendRedirect("Score.jsp");
            } catch (Exception e) {
                out.print(e);
            }
        }
        }
}
