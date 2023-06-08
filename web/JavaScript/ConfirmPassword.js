function length() {
    var password = document.getElementById("floatingPassword").value;
    var re =/^(?=.*[a-z])(?=.*\d)[^]{6,16}$/;
    var result =  re.test(password);
    if(!result) {
        document.getElementById("pwdlength").innerHTML = "密码必须包含数字,字母,且不少于6位";
        return false;
    }else {
        document.getElementById("pwdlength").innerHTML = "";
        return true;
    }
}
function Pass() {
    var text1 = document.getElementById("floatingPassword").value;
    var text2 = document.getElementById("floatingrePassword").value;
    if (text2 == text1) {
        document.getElementById("pwdSpan").innerHTML = "";
        return true;
    } else {
        document.getElementById("pwdSpan").innerHTML = "两次输入的密码不一致";
        return false;
    }
}
