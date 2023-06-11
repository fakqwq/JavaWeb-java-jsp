package servlet;

import com.google.gson.Gson;
import dao.ScoreD;
import vo.Score;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.util.ArrayList;

import static java.lang.System.out;

@WebServlet("/getScore")
public class getScore extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json;charset=UTF-8");

        BufferedReader reader = req.getReader();
        String paramID = reader.readLine();
        Gson gson = new Gson();

        if (paramID != null){
            ScoreD scoreD = new ScoreD();
            try {
                Score score = scoreD.findWithId(paramID);
                ArrayList<Score> scores = new ArrayList<>();
                scores.add(score);
                out.println(scores);
                resp.getWriter().write(gson.toJson(scores));
            } catch (Exception e) {
                out.print(e);
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
