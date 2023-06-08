package dao;

import vo.Student;

import java.sql.*;
import java.util.ArrayList;

public class StudentD {

    private Connection conn = null;

    //通过id获取学生信息，存入Student对象，返回，用于修改，删除，查询，添加，登录，注册，等操作。
    public Student findWithId(String id) throws Exception{
        initConnection();
        Statement stat = conn.createStatement();
        String sql = "select * from student where id = '" + id + "'";
        ResultSet rs = stat.executeQuery(sql);
        Student stu = getStudent(rs);
        closeConnection();
        return stu;
    }

    //通过name获取学生信息，存入ArrayList，返回，用于分页，查询，等操作，size为每页显示的学生数，page为当前页数
    public ArrayList<Student> findWithName(String name) throws Exception{
        ArrayList<Student> al = new ArrayList<>();
        initConnection();
        Statement stat = conn.createStatement();
        String sql = "select * from student where name = '" + name + "'";
        ResultSet rs = stat.executeQuery(sql);
        while (rs.next()) {
            Student student = new Student();
            student.setId(rs.getString("id"));
            student.setName(rs.getString("name"));
            student.setMajor(rs.getString("major"));
            student.setSex(rs.getString("sex"));
            student.setSchool_date(rs.getString("school_date"));
            al.add(student);
        }
        closeConnection();
        return al;
    }

    //插入学生信息
    public boolean insertStudent(String id, String name, String sex, String school_date, String major) throws Exception{
        initConnection();
        String sql = "insert into student(id, name, sex, school_date, major) values(?, ?, ?, ?, ?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, id);
        ps.setString(2, name);
        ps.setString(3, sex);
        ps.setString(4, school_date);
        ps.setString(5, major);
        int i = ps.executeUpdate();
        closeConnection();
        return i == 1;
    }

    //删除信息
    public boolean deleteStudent(String id) throws Exception{

        initConnection();
        Statement stat = conn.createStatement();
        String sql = "delete from student where id='"+id+"'";
        int i = stat.executeUpdate(sql);
        closeConnection();
        return i==1;
    }

    public ArrayList<Student> getOnePage() throws Exception{
        ArrayList<Student> al = new ArrayList<>();
        initConnection();
        String sql = "SELECT * FROM student";
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs =  ps.executeQuery();
        while (rs.next()) {
            Student student = new Student();
            student.setId(rs.getString("id"));
            student.setName(rs.getString("name"));
            student.setMajor(rs.getString("major"));
            student.setSex(rs.getString("sex"));
            student.setSchool_date(rs.getString("school_date"));
            al.add(student);
        }
        closeConnection();
        return al;
    }

    //修改学生信息
    public void updateStudentInfo(String id, String name, String sex, String major) throws Exception{

        initConnection();
        String sql = "update student set name=?, sex=?, major=? where id=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, name);
        ps.setString(2, sex);
        ps.setString(3, major);
        ps.setString(4, id);
        ps.executeUpdate();
        closeConnection();
    }

    //用来获取信息
    private Student getStudent(ResultSet rs) throws SQLException {
        Student stu = null;
        if (rs.next()){
            stu = new Student();
            stu.setId(rs.getString("id"));
            stu.setPassword(rs.getString("password"));
            stu.setName(rs.getString("name"));
            stu.setSex(rs.getString("sex"));
            stu.setSchool_date(rs.getString("school_date"));
            stu.setMajor(rs.getString("major"));
            stu.setEmail(rs.getString("email"));
        }
        return stu;
    }

    private void initConnection() throws Exception {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/aa?useSSL=false", "root", "123456");
    }

    private void closeConnection() throws Exception{
        conn.close();
    }
}
