package dao;

import vo.Score;

import java.sql.*;
import java.util.ArrayList;

public class ScoreD {

    private Connection conn = null;

    //插入学生信息
    public boolean insertScore(String id) throws Exception{
        initConnection();
        String sql = "insert into score(id) values(?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, id);
        int i = ps.executeUpdate();
        closeConnection();
        return i == 1;
    }

    //删除信息
    public boolean deleteScore(String id) throws Exception{
        initConnection();
        Statement stat = conn.createStatement();
        String sql = "delete from score where id='"+id+"'";
        int i = stat.executeUpdate(sql);
        closeConnection();
        return i==1;
    }

    //通过id修改学生信息，用于修改学生信息
    public void updateScoreInfo(String id, String database, String android, String jsp) throws Exception{

        initConnection();
        String sql = "update score set dat=?, android=?, jsp=? where id=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, database);
        ps.setString(2, android);
        ps.setString(3, jsp);
        ps.setString(4, id);
        ps.executeUpdate();
        closeConnection();
    }

    // 通过id获取学生信息，存入Score对象，返回，用于修改，删除，查询，添加，登录，注册，等操作。
    public Score findWithId(String id) throws Exception{
        initConnection();
        Statement stat = conn.createStatement();
        String sql = "select * from score where id = '" + id + "'";
        ResultSet rs = stat.executeQuery(sql);
        Score stu = getScore(rs);
        closeConnection();
        return stu;
    }

    // 获取一页学生信息，存入ArrayList，返回，用于分页，查询，等操作，size为每页显示的学生数，page为当前页数
    public ArrayList<Score> getOnePage() throws Exception{
        ArrayList<Score> al = new ArrayList<>();
        initConnection();
        String sql = "SELECT * FROM score";
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs =  ps.executeQuery();
        while (rs.next()){
            Score score = new Score();
            // 从数据库中获取数据，存入Score对象
            score.setId(rs.getString("id"));
            score.setDatabase(rs.getString("dat"));
            score.setAndroid(rs.getString("android"));
            score.setJsp(rs.getString("jsp"));
            al.add(score);
        }
        closeConnection();
        return al;
    }

    // 获取单个学生信息，存入Score对象，返回，用于修改，删除，查询，添加，登录，注册，等操作。
    private Score getScore(ResultSet rs) throws SQLException {
        Score stu = null;
        if (rs.next()){
            stu = new Score();
            stu.setId(rs.getString("id"));
            stu.setDatabase(rs.getString("dat"));
            stu.setAndroid(rs.getString("android"));
            stu.setJsp(rs.getString("jsp"));
        }
        return stu;
    }

    // 初始化连接
    private void initConnection() throws Exception {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(ConnectionPool.DB_URL, ConnectionPool.DB_USER, ConnectionPool.DB_PASSWORD);
    }
    
    private void closeConnection() throws Exception{
        conn.close();
    }
}
