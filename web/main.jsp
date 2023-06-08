<%--
  Created by IntelliJ IDEA.
  User: fakqwq
  Date: 2023/6/6
  Time: 12:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="vo.Student" %>
<%@ page import="vo.Teacher" %>
<%@ page import="dao.TeacherD" %>
<%@ page import="vo.Score" %>
<%@ page import="dao.StudentD" %>
<%@ page import="java.lang.*" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="CSS/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="CSS/indexContainer.css">
    <link rel="stylesheet" type="text/css" href="CSS/indexElements.css">
    <script type="text/javascript" src="JavaScript/index.js"></script>
    <script type="text/javascript" src="JavaScript/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="JavaScript/bootstrap.min.js"></script>
    <script type="text/javascript" src="JavaScript/ConfirmPassword.js"></script>
    <link rel="stylesheet" type="text/css" href="CSS/semantic.min.css">
    <script
            src="https://code.jquery.com/jquery-3.1.1.min.js"
            integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
            crossorigin="anonymous"></script>
    <script src="JavaScript/semantic.min.js"></script>
</head>
<body>
<%
    //获取session中的教师信息
    Teacher teacher = (Teacher) session.getAttribute("info");
    //这个ArrayList是用来存放一页的学生信息的
    //具体用法是在servlet中将所有学生信息存放在一个ArrayList中
    //然后将这个ArrayList分成多个ArrayList，每个ArrayList存放一页的学生信息
    //然后将这些ArrayList存放在session中
    //这里就是从session中获取一页的学生信息
    //这里的ArrayList泛型是Student，所以要强制转换成ArrayList<Student>
    //session.getAttribute是Object类型，所以要强制转换成ArrayList<Student>
    //session.getAttribute用法和request.getParameter用法一样
    //是用来获取session中的属性的
    ArrayList<Student> stus = (ArrayList<Student>) session.getAttribute("onePageStudent");
%>
<main>
    <header>
        <div class="px-3 py-2 text-bg-dark">
            <div class="container">
                <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                    <a class="disabled d-flex align-items-center my-2 my-lg-0 me-lg-auto text-white text-decoration-none">
                        <svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" fill="currentColor" class="bi bi-browser-edge" viewBox="0 0 16 16" aria-label="Bootstrap"><path d="M9.482 9.341c-.069.062-.17.153-.17.309 0 .162.107.325.3.456.877.613 2.521.54 2.592.538h.002c.667 0 1.32-.18 1.894-.519A3.838 3.838 0 0 0 16 6.819c.018-1.316-.44-2.218-.666-2.664l-.04-.08C13.963 1.487 11.106 0 8 0A8 8 0 0 0 .473 5.29C1.488 4.048 3.183 3.262 5 3.262c2.83 0 5.01 1.885 5.01 4.797h-.004v.002c0 .338-.168.832-.487 1.244l.006-.006a.594.594 0 0 1-.043.041Z"/>
                            <path d="M.01 7.753a8.137 8.137 0 0 0 .753 3.641 8 8 0 0 0 6.495 4.564 5.21 5.21 0 0 1-.785-.377h-.01l-.12-.075a5.45 5.45 0 0 1-1.56-1.463A5.543 5.543 0 0 1 6.81 5.8l.01-.004.025-.012c.208-.098.62-.292 1.167-.285.129.001.257.012.384.033a4.037 4.037 0 0 0-.993-.698l-.01-.005C6.348 4.282 5.199 4.263 5 4.263c-2.44 0-4.824 1.634-4.99 3.49Zm10.263 7.912c.088-.027.177-.054.265-.084-.102.032-.204.06-.307.086l.042-.002Z"/>
                            <path d="M10.228 15.667a5.21 5.21 0 0 0 .303-.086l.082-.025a8.019 8.019 0 0 0 4.162-3.3.25.25 0 0 0-.331-.35c-.215.112-.436.21-.663.294a6.367 6.367 0 0 1-2.243.4c-2.957 0-5.532-2.031-5.532-4.644.002-.135.017-.268.046-.399a4.543 4.543 0 0 0-.46 5.898l.003.005c.315.441.707.821 1.158 1.121h.003l.144.09c.877.55 1.721 1.078 3.328.996Z"/><use xlink:href="#bootstrap"></use></svg>
                    </a>
                    <ul class="nav col-12 col-lg-auto my-2 justify-content-center my-md-0 text-small">
                        <div id="logo">
                            <h1><%=teacher.getName()%></h1>
                            <li><a style="color: white" onclick="return confirm('确认退出?');" href="exit">退出登录</a></li>
                            </div>
                    </ul>
                </div>
            </div>
        </div>
        <div class="px-2 py-2 border-bottom mb-3">
            <div class="container d-flex flex-wrap justify-content-between">
                <div class="nav-scroller py-1 mb-2">
                    <nav class="nav d-flex justify-content-between fs-5">
                        <a class="p-2 link-secondary" href="PersonInfo.jsp">个人信息</a>
                    </nav>
                </div>
                <form class="row g-3" action="one_page_student" method="post">
                    <div class="col-auto">
                        <label for="search" class="visually-hidden">Search</label>
                        <input type="text" class="form-control" id="search" name="key" placeholder="输入学号或姓名搜索">
                    </div>
                    <div class="col-auto">
                        <button type="submit" class="btn btn-primary mb-3">搜索</button>
                    </div>
                </form>
            </div>
        </div>
    </header>
</main>

<br><br><br><br><br><br><br><br><br><br>

<div id="main" class="position-relative">
    <div class="position-absolute top-50 start-50 translate-middle">
        <div id="table1">
            <div class="top">
                <h2>学生信息管理</h2>
                <hr/>
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    添加学生
                </button>
            </div>
            <br>
            <div class="tableContainer">
                <table class="table" id="table" width="800" frame="box" align="center">
                    <thead>
                    <tr>
                        <th height="35">学号</th>
                        <th>姓名</th>
                        <th>性别</th>
                        <th>入学日期</th>
                        <th>专业</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        for (Student stu : stus) {
                    %>
                    <tr>
                        <form method="post" action="update_student">
                            <td height="35"><%=stu.getId()%></td>
                            <td><input value="<%=stu.getName()%>" name="stuname" class=""></td>
                            <td><input value="<%=stu.getSex()%>" name="stusex" class="table-input"></td>
                            <td><%=stu.getSchool_date()%></td>
                            <td><input value="<%=stu.getMajor()%>" name="stumajor" class="table-input" style="width: 110px"></td>
                            <input value="<%=stu.getId()%>" name="stuno" type="hidden">
                            <td><input type="submit" class="update-btn" value="修改">&nbsp;
                                <a class="btn-delete" onclick="return confirm('确定要删除吗?');" href=<%="'delete_student?id=" + stu.getId() + "'"%>>
                                    删除
                                </a>&nbsp;&nbsp;<a href="one_page_score?id=<%=stu.getId()%>">
                                    查看成绩
                                </a>
                            </td>
                        </form>
                    </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="add_student" method="post">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">输入学生信息</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="input-group mb-3">
                    <span class="input-group-text" id="basic-addon">id</span>
                    <input name="id" type="text" class="form-control" aria-label="Username" aria-describedby="basic-addon1">
                </div>
                <div class="input-group mb-3">
                    <span class="input-group-text" id="basic-addon1">姓名</span>
                    <input name="name" type="text" class="form-control" aria-label="Username" aria-describedby="basic-addon1">
                </div>
                <div class="input-group mb-3">
                    <label class="input-group-text" for="inputGroupSelect01">性别</label>
                    <select name="sex" class="form-select" id="inputGroupSelect01">
                        <option selected>请选择</option>
                        <option value="男">男</option>
                        <option value="女">女</option>
                    </select>
                </div>
                <div class="input-group mb-3">
                    <span class="input-group-text" id="basic-addon2">入学年份</span>
                    <input name="school_date" type="text" class="form-control" aria-label="Username" aria-describedby="basic-addon1">
                </div>
                <div class="input-group mb-3">
                    <span class="input-group-text" id="basic-addon3">专业</span>
                    <input name="major" type="text" class="form-control" aria-label="Username" aria-describedby="basic-addon1">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
                <button type="submit" class="btn btn-primary">保存</button>
            </div>
        </div>
        </form>
    </div>
</div>

</body>
</html>
