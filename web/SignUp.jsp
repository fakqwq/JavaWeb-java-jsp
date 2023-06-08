<%--
  Created by IntelliJ IDEA.
  User: fakqwq
  Date: 2023/3/9
  Time: 10:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>SignUp</title>
    <link rel="stylesheet" href="CSS/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="CSS/indexContainer.css">
    <link rel="stylesheet" type="text/css" href="CSS/indexElements.css">
    <script type="text/javascript" src="JavaScript/index.js"></script>
    <script type="text/javascript" src="JavaScript/bootstrap.min.js"></script>
    <script type="text/javascript" src="JavaScript/ConfirmPassword.js"></script>
</head>
<body>
<header>
    <div class="px-3 py-2">
        <div class="container">
            <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                <a href="" class="d-flex align-items-center my-2 my-lg-0 me-lg-auto text-white text-decoration-none">
                    <svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" fill="currentColor" class="bi bi-browser-edge" viewBox="0 0 16 16" aria-label="Bootstrap"><path d="M9.482 9.341c-.069.062-.17.153-.17.309 0 .162.107.325.3.456.877.613 2.521.54 2.592.538h.002c.667 0 1.32-.18 1.894-.519A3.838 3.838 0 0 0 16 6.819c.018-1.316-.44-2.218-.666-2.664l-.04-.08C13.963 1.487 11.106 0 8 0A8 8 0 0 0 .473 5.29C1.488 4.048 3.183 3.262 5 3.262c2.83 0 5.01 1.885 5.01 4.797h-.004v.002c0 .338-.168.832-.487 1.244l.006-.006a.594.594 0 0 1-.043.041Z"/>
                        <path d="M.01 7.753a8.137 8.137 0 0 0 .753 3.641 8 8 0 0 0 6.495 4.564 5.21 5.21 0 0 1-.785-.377h-.01l-.12-.075a5.45 5.45 0 0 1-1.56-1.463A5.543 5.543 0 0 1 6.81 5.8l.01-.004.025-.012c.208-.098.62-.292 1.167-.285.129.001.257.012.384.033a4.037 4.037 0 0 0-.993-.698l-.01-.005C6.348 4.282 5.199 4.263 5 4.263c-2.44 0-4.824 1.634-4.99 3.49Zm10.263 7.912c.088-.027.177-.054.265-.084-.102.032-.204.06-.307.086l.042-.002Z"/>
                        <path d="M10.228 15.667a5.21 5.21 0 0 0 .303-.086l.082-.025a8.019 8.019 0 0 0 4.162-3.3.25.25 0 0 0-.331-.35c-.215.112-.436.21-.663.294a6.367 6.367 0 0 1-2.243.4c-2.957 0-5.532-2.031-5.532-4.644.002-.135.017-.268.046-.399a4.543 4.543 0 0 0-.46 5.898l.003.005c.315.441.707.821 1.158 1.121h.003l.144.09c.877.55 1.721 1.078 3.328.996Z"/><use xlink:href="#bootstrap"></use></svg>
                </a>

            </div>
        </div>
    </div>
</header>

<div class="px-3 py-2">
    <main class="container col-xl-10 col-xxl-12 px-4">
        <div class="row align-items-center g-lg-5">
            <div class="col-lg-7 text-center text-lg-start">
                <h1 class="display-4 fw-bold lh-1 mb-3">注册成为管理员</h1>
                <p class="col-lg-10 fs-4">管理学生信息</p>
            </div>
            <div class="col-md-12 mx-auto col-lg-5">
                <form class="text-center p-4 p-md-5 border rounded-3 bg-light" action="check_register" method="post" onsubmit="return check(this)>
                    <img class="mb-4" src="/docs/5.3/assets/brand/bootstrap-logo.svg" alt="" width="120" height="120">
                    <h1 class="h3 mb-3 fw-normal">填写账号密码</h1>

                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="email" name="email" placeholder="name@example.com">
                        <label for="floatingInput">邮箱</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="floatingInput" name="user" placeholder="name@example.com">
                        <label for="floatingInput">用户名</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input onblur="length()" type="password" class="form-control" id="floatingPassword" name="password1" placeholder="Password">
                        <label for="floatingPassword">密码</label>
                        <span id="pwdlength" style="color: red;"></span>
                    </div>
                    <div class="form-floating mb-3">
                        <input onkeyup="Pass()" type="password" class="form-control" id="floatingrePassword" name="repassword" placeholder="Password">
                        <label for="floatingPassword">确认密码</label>
                        <span id="pwdSpan" style="color: red;"></span>
                    </div>

                    <div class="form-group">
                            <input type="text" name="code" class="form-control" id="code" placeholder="请输入验证码" required>
                            <div class="input-group-append  m-lg-3">
                                <img  src="code.jsp" id="image" class="img-fluid rounded" onclick="refresh()">
                        </div>
                    </div>
                    <div class="checkbox mb-3">
                        <label>
                            <input type="checkbox" value="remember-me">
                            <a class="link-primary" data-bs-toggle="modal" data-bs-target="#exampleModal2">
                                同意用户协议
                            </a>
                        </label>
                    </div>
                    <button class="w-100 btn btn-lg btn-primary" type="submit" name="regist">继续</button>
                </form>
            </div>
        </div>
    </main>
</div>

<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable modal-xl">
        <div class="modal-content">
            <div class="modal-body">
                <p class="text-center">在此特别提醒您在注册成为用户之前，请认真阅读本《服务协议》（以下简称“协议”），确保您充分理解本协议中的各项条款。请您谨慎阅读并选择接受或不接受本协议。除非您接受本协议所有条款a否则您无权注册、登录或使用本协议所涉服务。您的注册、登录、使用等行为将视为对本协议的接受，并同意接受本协议各项条款的约束。本协议约定我方与用户之间关于App软件服务（以下简称“服务”）的权利义务。用户，是指注册、登录、使用本服务的个人或组织。本协议可由我方随时更新，更新后的协议条款一旦公布即代替原来的协议条款，恕不再另行通知，用户可在本App中查阅最新版协议条款。在修改协议条款后，如果用户不接受修改后的条款，请立即停止使用我方提供的服务，用户继续使用我方提供的服务将被视为接受修改后的协议。</p>

                <div class="row">
                    <div class="">
                        <div data-bs-spy="scroll" data-bs-target="#list-example" data-bs-smooth-scroll="true" class="scrollspy-example" tabindex="0">
                            <h4 id="item-1">一、账号注册</h4>
                            <p>用户在使用本服务前需要注册一个App账号。本App账号应当使用手机号码、邮箱绑定注册，请用户使用尚未与本App账号绑定的手机号码，以及未被我方协议封禁的手机号码注册本App账号。我方可以根据用户需求或产品需要对账号注册和绑定的方式进行变更，而无须事先通知用户。</p>
                            <p>鉴于本App账号的绑定注册方式，您同意在注册本App时将允许您的手机号码及手机设备识别码等信息用于注册。</p>
                            <h4 id="item-2">二、用户个人隐私信息保护</h4>
                            <p>如果我方发现或收到他人举报或投诉用户违反本协议约定的，我方有权不经通知随时对相关内容，包括但不限于用户资料、发布记录进行审查、删除，并视情节轻重对违规账号处以包括但不限于警告、账号封禁、设备封禁、功能封禁的处罚，且通知用户处理结果。</p>
                            <h4 id="item-3">三、用户发布内容规范</h4>
                            <p>1、本条所述内容是指用户使用本App的过程中所制作、上载、复制、发布、传播的任何内容，包括但不限于账号头像、名称、用户说明等注册信息及认证资料，或文字、语音、图片、视频、图文等发送、回复或自动回复消息和相关链接页面，以及其他使用账号或本服务所产生的内容。</p>
                            <p>2、用户不得利用本App账号或本服务制作、上传、复制、发布、传播如下法律、法规和政策禁止的内容：<br>
                                (1) 反对宪法所确定的基本原则的；<br>
                                (2) 危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的；<br>
                                (3) 损害国家荣誉和利益的；<br>
                                (4) 煽动民族仇恨、民族歧视，破坏民族团结的；<br>
                                (5) 破坏国家宗教政策，宣扬邪教和封建迷信的；<br>
                                (6) 散布谣言，扰乱社会秩序，破坏社会稳定的；<br>
                                (7) 散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的；<br>
                                (8) 侮辱或者诽谤他人，侵害他人合法权益的；<br>
                                (9) 含有法律、行政法规禁止的其他内容的信息。</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
