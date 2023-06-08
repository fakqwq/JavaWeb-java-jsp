package dao;

import vo.Teacher;

import java.sql.*;


public class TeacherD {
    private Connection conn = null;

    //检查账号密码是否正确
    public Teacher checkAccount(String id, String password) throws Exception {
        initConnection();
        String sql = "SELECT * FROM teacher WHERE id = ? AND password = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, id);
        ps.setString(2, password);
        ResultSet rs = ps.executeQuery();
        Teacher tea = getTeacher(rs);
        closeConnection();
        return tea;
    }

    //通过id获取教师信息
    public Teacher findWithId(String id) throws Exception {
        initConnection();
        String sql = "SELECT * FROM teacher WHERE id = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, id);
        ResultSet rs = ps.executeQuery();
        Teacher tea = getTeacher(rs);
        closeConnection();
        return tea;
    }
    //插入教师信息
    public Teacher insertTeacher(String id, String password, String email) throws Exception {
        initConnection();
        String sql = "insert into teacher(id, password, email) values(?, ?, ?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, id);
        ps.setString(2, password);
        ps.setString(3, email);
        ps.executeUpdate();
        Teacher teacher = findWithId(id);
        closeConnection();
        return teacher;
    }

    //更新教师信息
    public Teacher updateTeacher(String id, String name, String sex, String email, String password) throws Exception{

        initConnection();
        String sql = "update teacher set name=?, sex=?, email=?, password=? where id=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, name);
        ps.setString(2, sex);
        ps.setString(3, email);
        ps.setString(4, password);
        ps.setString(5, id);
        ps.executeUpdate();
        Teacher teacher = findWithId(id);
        closeConnection();
        return teacher;
    }

    //获取教师信息
    private Teacher getTeacher(ResultSet rs) throws SQLException {
        Teacher tea = null;
        if (rs.next()) {
            tea = new Teacher();
            tea.setId(rs.getString("id"));
            tea.setPassword(rs.getString("password"));
            tea.setName(rs.getString("name"));
            tea.setEmail(rs.getString("email"));
            tea.setSex(rs.getString("sex"));
        }
        return tea;
    }

    private void initConnection() throws Exception {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/aa?useSSL=false", "root", "123456");
    }

    private void closeConnection() throws Exception {
        conn.close();
    }
}
