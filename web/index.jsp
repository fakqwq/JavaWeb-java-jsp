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
    <script type="text/javascript" src="JavaScript/studentIndex.js"></script>
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
                    <ul id="ulM" class="nav col-12 col-lg-auto my-2 justify-content-center my-md-0 text-small">
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

    </header>
</main>

<div  style="position:sticky; margin-top: 100px; max-height: 100px">
    <div id="tC" style="width: 800px; margin-left: 850px">
        <?xml version="1.0" encoding="UTF-8"?>
        <svg xmlns="http://www.w3.org/2000/svg" width="124" height="124" fill="none" viewBox="0 0 24 24">
            <style>
                .eye-off {ubic-bezier(0.99, -0.1, 0.01, 1.02) alternate;
                    stroke-dashoffset: 100;
                    stroke-dasharray: 100;
                }

                @keyframes eye-off {
                    to {
                        stroke-dashoffset: 0;
                    }
                }
            </style>
            <path stroke="#0A0A30" stroke-width="1.5" d="M19.195 11.31c.325.41.325.97 0 1.38-1.114 1.4-3.916 4.45-7.195 4.45-3.28 0-6.08-3.05-7.195-4.45a1.097 1.097 0 010-1.38C5.92 9.91 8.721 6.86 12 6.86c3.28 0 6.08 3.05 7.195 4.45z"/>
            <circle cx="12" cy="12" r="1.972" stroke="#0A0A30" stroke-width="1.5"/>
            <path class="eye-off" stroke="#265BFF" stroke-linecap="round" stroke-width="1.5" d="M18.514 5.487L5.487 18.514"/>
        </svg>
        <h1>请登录！</h1>
    </div>
</div>

<!-- Modal login-->
<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable modal-lg">
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
                        <div class="col-md-12 mx-auto col-lg-5 ">

                                <div class="loadingio-spinner-bean-eater-1e10jkeuwis"><div class="ldio-h3u92sv3fpi">
                                    <div><div></div><div></div><div></div></div><div><div></div><div></div><div></div></div>
                                </div></div>
                                <style type="text/css">
                                    @keyframes ldio-h3u92sv3fpi-1 {
                                        0% { transform: rotate(0deg) }
                                        50% { transform: rotate(-45deg) }
                                        100% { transform: rotate(0deg) }
                                    }
                                    @keyframes ldio-h3u92sv3fpi-2 {
                                        0% { transform: rotate(180deg) }
                                        50% { transform: rotate(225deg) }
                                        100% { transform: rotate(180deg) }
                                    }
                                    .ldio-h3u92sv3fpi > div:nth-child(2) {
                                        transform: translate(-15px,0);
                                    }
                                    .ldio-h3u92sv3fpi > div:nth-child(2) div {
                                        position: absolute;
                                        top: 40px;
                                        left: 40px;
                                        width: 120px;
                                        height: 60px;
                                        border-radius: 120px 120px 0 0;
                                        background: #f8b26a;
                                        animation: ldio-h3u92sv3fpi-1 1s linear infinite;
                                        transform-origin: 60px 60px
                                    }
                                    .ldio-h3u92sv3fpi > div:nth-child(2) div:nth-child(2) {
                                        animation: ldio-h3u92sv3fpi-2 1s linear infinite
                                    }
                                    .ldio-h3u92sv3fpi > div:nth-child(2) div:nth-child(3) {
                                        transform: rotate(-90deg);
                                        animation: none;
                                    }@keyframes ldio-h3u92sv3fpi-3 {
                                         0% { transform: translate(190px,0); opacity: 0 }
                                         20% { opacity: 1 }
                                         100% { transform: translate(70px,0); opacity: 1 }
                                     }
                                    .ldio-h3u92sv3fpi > div:nth-child(1) {
                                        display: block;
                                    }
                                    .ldio-h3u92sv3fpi > div:nth-child(1) div {
                                        position: absolute;
                                        top: 92px;
                                        left: -8px;
                                        width: 16px;
                                        height: 16px;
                                        border-radius: 50%;
                                        background: #e15b64;
                                        animation: ldio-h3u92sv3fpi-3 1s linear infinite
                                    }
                                    .ldio-h3u92sv3fpi > div:nth-child(1) div:nth-child(1) { animation-delay: -0.67s }
                                    .ldio-h3u92sv3fpi > div:nth-child(1) div:nth-child(2) { animation-delay: -0.33s }
                                    .ldio-h3u92sv3fpi > div:nth-child(1) div:nth-child(3) { animation-delay: 0s }
                                    .loadingio-spinner-bean-eater-1e10jkeuwis {
                                        width: 200px;
                                        height: 200px;
                                        display: inline-block;
                                        overflow: hidden;
                                        background: #ffffff;
                                    }
                                    .ldio-h3u92sv3fpi {
                                        width: 100%;
                                        height: 100%;
                                        position: relative;
                                        transform: translateZ(0) scale(1);
                                        backface-visibility: hidden;
                                        transform-origin: 0 0; /* see note above */
                                    }
                                    .ldio-h3u92sv3fpi div { box-sizing: content-box; }
                                    /* generated by https://loading.io/ */
                                </style>
                                <h1 class="h3 mb-3 fw-normal">请登录</h1>
                                <div class="form-floating mb-3">
                                    <input type="text" class="form-control" id="floatingInputUserName" name="user" placeholder="UserName">
                                    <label for="floatingInputUserName">用户名(学生为学号)</label>
                                </div>
                                <div class="form-floating">
                                    <input type="password" class="form-control" id="floatingInputPassword" name="password" placeholder="Password">
                                    <label for="floatingInputPassword">密码(学生默认为0)</label>
                                </div>
                                <div style="margin-top: 10px">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="teacher">
                                        <label class="form-check-label" for="inlineRadio1">老师</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="student">
                                        <label class="form-check-label" for="inlineRadio2">学生</label>
                                    </div>
                                </div>
                                <BUTTON data-bs-dismiss="modal" aria-label="Close" onclick="check123()"  style="margin-top: 10px" class="w-100 btn btn-lg btn-primary" value="login">登录</BUTTON>

                        </div>
                    </div>
                </main>
            </div>
        </div>
        <div class="modal-footer">

        </div>
    </div>
</div>

<!--单个学生信息的 Modal -->
<div class="modal fade" id="changePwd" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title" id="changePwdLable">学生信息</h3>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div id="changePwdModal" class="modal-body">

            </div>
            <div id="SingleInfoModalFooter" class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>

</body>
</html>
