<%--
  Created by IntelliJ IDEA.
  User: fakqwq
  Date: 2023/3/5
  Time: 11:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.TeacherD" %>
<%@ page import="vo.Teacher" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Guide</title>
    <link rel="stylesheet" href="CSS/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="CSS/indexContainer.css">
    <link rel="stylesheet" type="text/css" href="CSS/indexElements.css">
    <script type="text/javascript" src="JavaScript/index.js"></script>
    <script type="text/javascript" src="JavaScript/bootstrap.min.js"></script>
    <script type="text/javascript" src="JavaScript/ConfirmPassword.js"></script>
</head>
<body>
<main>
    <header>
        <div class="px-3 py-2 text-bg-dark">
            <div class="container">
                <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                    <a class="d-flex align-items-center my-2 my-lg-0 me-lg-auto text-white text-decoration-none">
                        <svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" fill="currentColor" class="bi bi-browser-edge" viewBox="0 0 16 16" aria-label="Bootstrap"><path d="M9.482 9.341c-.069.062-.17.153-.17.309 0 .162.107.325.3.456.877.613 2.521.54 2.592.538h.002c.667 0 1.32-.18 1.894-.519A3.838 3.838 0 0 0 16 6.819c.018-1.316-.44-2.218-.666-2.664l-.04-.08C13.963 1.487 11.106 0 8 0A8 8 0 0 0 .473 5.29C1.488 4.048 3.183 3.262 5 3.262c2.83 0 5.01 1.885 5.01 4.797h-.004v.002c0 .338-.168.832-.487 1.244l.006-.006a.594.594 0 0 1-.043.041Z"/>
                            <path d="M.01 7.753a8.137 8.137 0 0 0 .753 3.641 8 8 0 0 0 6.495 4.564 5.21 5.21 0 0 1-.785-.377h-.01l-.12-.075a5.45 5.45 0 0 1-1.56-1.463A5.543 5.543 0 0 1 6.81 5.8l.01-.004.025-.012c.208-.098.62-.292 1.167-.285.129.001.257.012.384.033a4.037 4.037 0 0 0-.993-.698l-.01-.005C6.348 4.282 5.199 4.263 5 4.263c-2.44 0-4.824 1.634-4.99 3.49Zm10.263 7.912c.088-.027.177-.054.265-.084-.102.032-.204.06-.307.086l.042-.002Z"/>
                            <path d="M10.228 15.667a5.21 5.21 0 0 0 .303-.086l.082-.025a8.019 8.019 0 0 0 4.162-3.3.25.25 0 0 0-.331-.35c-.215.112-.436.21-.663.294a6.367 6.367 0 0 1-2.243.4c-2.957 0-5.532-2.031-5.532-4.644.002-.135.017-.268.046-.399a4.543 4.543 0 0 0-.46 5.898l.003.005c.315.441.707.821 1.158 1.121h.003l.144.09c.877.55 1.721 1.078 3.328.996Z"/><use xlink:href="#bootstrap"></use></svg>
                    </a>
                    <ul class="nav col-12 col-lg-auto my-2 justify-content-center my-md-0 text-small">
                        <li>
                            <button onclick="window.location.href='SignUp.jsp'" class="btn btn-dark">
                                <svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" fill="currentColor" class="bi d-block mx-auto mb-1 bi bi-people" viewBox="0 0 16 16">
                                    <use xlink:href="#grid"></use>
                                    <path d="M15 14s1 0 1-1-1-4-5-4-5 3-5 4 1 1 1 1h8zm-7.978-1A.261.261 0 0 1 7 12.996c.001-.264.167-1.03.76-1.72C8.312 10.629 9.282 10 11 10c1.717 0 2.687.63 3.24 1.276.593.69.758 1.457.76 1.72l-.008.002a.274.274 0 0 1-.014.002H7.022zM11 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm3-2a3 3 0 1 1-6 0 3 3 0 0 1 6 0zM6.936 9.28a5.88 5.88 0 0 0-1.23-.247A7.35 7.35 0 0 0 5 9c-4 0-5 3-5 4 0 .667.333 1 1 1h4.216A2.238 2.238 0 0 1 5 13c0-1.01.377-2.042 1.09-2.904.243-.294.526-.569.846-.816zM4.92 10A5.493 5.493 0 0 0 4 13H1c0-.26.164-1.03.76-1.724.545-.636 1.492-1.256 3.16-1.275zM1.5 5.5a3 3 0 1 1 6 0 3 3 0 0 1-6 0zm3-2a2 2 0 1 0 0 4 2 2 0 0 0 0-4z"/>
                                </svg>
                                注册
                            </button>
                        </li>

                        <li>
                            <button data-bs-toggle="modal" data-bs-target="#exampleModal2" class="btn btn-dark">
                                <svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" fill="currentColor" class="bi d-block mx-auto mb-1 bi bi-person-bounding-box" viewBox="0 0 16 16">
                                    <use xlink:href="#people-circle"></use>
                                    <path d="M1.5 1a.5.5 0 0 0-.5.5v3a.5.5 0 0 1-1 0v-3A1.5 1.5 0 0 1 1.5 0h3a.5.5 0 0 1 0 1h-3zM11 .5a.5.5 0 0 1 .5-.5h3A1.5 1.5 0 0 1 16 1.5v3a.5.5 0 0 1-1 0v-3a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 1-.5-.5zM.5 11a.5.5 0 0 1 .5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 1 0 1h-3A1.5 1.5 0 0 1 0 14.5v-3a.5.5 0 0 1 .5-.5zm15 0a.5.5 0 0 1 .5.5v3a1.5 1.5 0 0 1-1.5 1.5h-3a.5.5 0 0 1 0-1h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 1 .5-.5z"/>
                                    <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm8-9a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                                </svg>
                                登录
                            </button>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="px-2 py-2 border-bottom mb-3">
            <div class="container d-flex flex-wrap justify-content-between">
                <div class="nav-scroller py-1 mb-2">
                    <nav class="nav d-flex justify-content-between fs-5">
                        <a class="p-2 link-secondary">个人信息</a>
                        <a class="p-2 link-secondary">学生管理</a>
                    </nav>
                </div>
                <form class="row g-3">
                    <div class="col-auto">
                <label for="search" class="visually-hidden">Search</label>
                <input type="text" class="disabled form-control" id="search" placeholder="输入学号或姓名搜索">
            </div>
                    <div class="col-auto">
                <button type="submit" class="disabled btn btn-primary mb-3">搜索</button>
            </div>
                </form>
            </div>
        </div>
    </header>
</main>
<br>
<br>
<br>
<br>
<br>
<div class="position-relative">
    <div class="position-absolute top-80 start-50 translate-middle">
        <?xml version="1.0" encoding="UTF-8"?>
        <svg width="10 0" height="100" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M9.85786 18C6.23858 21 4 24 4 24C4 24 12.9543 36 24 36C25.3699 36 26.7076 35.8154 28 35.4921M20.0318 12.5C21.3144 12.1816 22.6414 12 24 12C35.0457 12 44 24 44 24C44 24 41.7614 27 38.1421 30" stroke="#333" stroke-width="4" stroke-linecap="round" stroke-linejoin="round"/>
            <path d="M20.3142 20.6211C19.4981 21.5109 19 22.6972 19 23.9998C19 26.7612 21.2386 28.9998 24 28.9998C25.3627 28.9998 26.5981 28.4546 27.5 27.5705" stroke="#333" stroke-width="4" stroke-linecap="round" stroke-linejoin="round"/>
            <path d="M42 42L6 6" stroke="#333" stroke-width="4" stroke-linecap="round" stroke-linejoin="round"/>
        </svg>
        <h1>请登录！</h1>
    </div>
</div>

<!-- Modal login-->
<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <ul class="nav justify-content-center">
                    <li class="nav-item">
                        <button class="btn btn-primary active" aria-current="page" onclick="window.location.href='SignUp.jsp'">切换为注册</button>
                    </li>
                </ul>
                <button type="button" class="btn-close text-end" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <main class="container col-xl-10 col-xxl-12 px-4">
                    <div class="row align-items-center g-lg-5">
                        <div class="col-lg-7 text-center text-lg-start">
                            <h1 class="display-4 fw-bold lh-1 mb-3">登录后查看信息</h1>
                            <p class="col-lg-10 fs-4">以及用于管理</p>
                        </div>
                        <div class="col-md-12 mx-auto col-lg-5">
                            <form class="text-center p-4 p-md-5 border rounded-3 bg-light" method="post" action="check_login">
                                <img class="mb-4" src="/docs/5.3/assets/brand/bootstrap-logo.svg" alt="" width="120" height="120">
                                <h1 class="h3 mb-3 fw-normal">请登录</h1>

                                <div class="form-floating mb-3">
                                    <input type="text" class="form-control" id="floatingInputUserName" name="user" placeholder="UserName">
                                    <label for="floatingInputUserName">用户名</label>
                                </div>
                                <div class="form-floating">
                                    <input type="password" class="form-control" id="floatingInputPassword" name="password" placeholder="Password">
                                    <label for="floatingInputPassword">密码</label>
                                </div>

                                <div class="checkbox mb-3">
                                    <label>
                                        <input type="checkbox" value="remember"> 记住我
                                    </label>
                                </div>

                                <BUTTON class="w-100 btn btn-lg btn-primary" type="submit" value="login">登录</BUTTON>

                            </form>
                        </div>
                    </div>
                </main>
            </div>
        </div>
        <div class="modal-footer">

        </div>
    </div>
</div>

</body>
</html>
