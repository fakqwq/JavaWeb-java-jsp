<%--
  Created by IntelliJ IDEA.
  User: fakqwq
  Date: 2023/6/6
  Time: 12:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="vo.Student" %>
<%@ page import="vo.Teacher" %>
<%@ page import="vo.Score" %>
<%@ page import="dao.StudentD" %>
<html>
<head>
  <title>Title</title>
  <link rel="stylesheet" href="CSS/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="CSS/indexContainer.css">
  <link rel="stylesheet" type="text/css" href="CSS/indexElements.css">
  <script type="text/javascript" src="JavaScript/index.js"></script>
  <script type="text/javascript" src="JavaScript/bootstrap.min.js"></script>
  <script type="text/javascript" src="JavaScript/ConfirmPassword.js"></script>
</head>
<body>
<%
  Teacher teacher = (Teacher) session.getAttribute("info");
  ArrayList<Score> stus = (ArrayList<Score>) session.getAttribute("onePageScore");
%>
<main>
  <header>
    <div class="px-3 py-2 text-bg-dark">
      <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
          <a href="" class="d-flex align-items-center my-2 my-lg-0 me-lg-auto text-white text-decoration-none">
            <svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" fill="currentColor" class="bi bi-browser-edge" viewBox="0 0 16 16" aria-label="Bootstrap"><path d="M9.482 9.341c-.069.062-.17.153-.17.309 0 .162.107.325.3.456.877.613 2.521.54 2.592.538h.002c.667 0 1.32-.18 1.894-.519A3.838 3.838 0 0 0 16 6.819c.018-1.316-.44-2.218-.666-2.664l-.04-.08C13.963 1.487 11.106 0 8 0A8 8 0 0 0 .473 5.29C1.488 4.048 3.183 3.262 5 3.262c2.83 0 5.01 1.885 5.01 4.797h-.004v.002c0 .338-.168.832-.487 1.244l.006-.006a.594.594 0 0 1-.043.041Z"/>
              <path d="M.01 7.753a8.137 8.137 0 0 0 .753 3.641 8 8 0 0 0 6.495 4.564 5.21 5.21 0 0 1-.785-.377h-.01l-.12-.075a5.45 5.45 0 0 1-1.56-1.463A5.543 5.543 0 0 1 6.81 5.8l.01-.004.025-.012c.208-.098.62-.292 1.167-.285.129.001.257.012.384.033a4.037 4.037 0 0 0-.993-.698l-.01-.005C6.348 4.282 5.199 4.263 5 4.263c-2.44 0-4.824 1.634-4.99 3.49Zm10.263 7.912c.088-.027.177-.054.265-.084-.102.032-.204.06-.307.086l.042-.002Z"/>
              <path d="M10.228 15.667a5.21 5.21 0 0 0 .303-.086l.082-.025a8.019 8.019 0 0 0 4.162-3.3.25.25 0 0 0-.331-.35c-.215.112-.436.21-.663.294a6.367 6.367 0 0 1-2.243.4c-2.957 0-5.532-2.031-5.532-4.644.002-.135.017-.268.046-.399a4.543 4.543 0 0 0-.46 5.898l.003.005c.315.441.707.821 1.158 1.121h.003l.144.09c.877.55 1.721 1.078 3.328.996Z"/><use xlink:href="#bootstrap"></use></svg>
          </a>
          <ul class="nav col-12 col-lg-auto my-2 justify-content-center my-md-0 text-small">
            <div id="logo">
              <h1><%=teacher.getName()%>
              </h1>
            </div>
          </ul>
        </div>
      </div>
    </div>
  </header>
</main>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

<div class="position-relative">
  <div class="position-absolute start-50 top-50 translate-middle">
    <div id="main">
      <div class="top">
        <h2>学生成绩管理</h2>
        <hr/>
      </div>
      <form method="post" action="update_score" style="height: 525px; margin-top: 20px">
        <a type="Button" class="btn btn-primary" href="main.jsp">返回</a>
        <input type="submit" class="btn-add btn btn-primary" style="float: right;margin-bottom: 30px" value="修改">
        <div class="table" style="margin-top: 20px; height: 525px">
          <table id="table" width="800" frame="box" align="center">
            <tr>
              <th height="35">学号</th>
              <th>姓名</th>
              <th>专业</th>
              <th>数据库</th>
              <th>Android</th>
              <th>JavaWeb</th>
            </tr>
            <%
              try {
                StudentD stuD = new StudentD();
                for (Score stu : stus) {
                  String name = stuD.findWithId(stu.getId()).getName();
                  String major = stuD.findWithId(stu.getId()).getMajor();
            %>
            <tr>
              <td height="35"><%=stu.getId()%></td>
              <td><%=name%></td>
              <td><%=major%></td>
              <td><input value="<%=stu.getDatabase()%>" name="database" class="table-input"></td>
              <td><input value="<%=stu.getAndroid()%>" name="android" class="table-input"></td>
              <td><input value="<%=stu.getJsp()%>" name="jsp" class="table-input"></td>
              <input value="<%=stu.getId()%>" name="id" type="hidden">
            </tr>
            <%
                }
              } catch (Exception e) {
                e.printStackTrace();
              }
            %>
          </table>
        </div>
      </form>


  </div>
</div>

</body>
</html>
