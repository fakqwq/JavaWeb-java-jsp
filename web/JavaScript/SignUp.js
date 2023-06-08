

function UserTip(){
    NameTextImage.style.height="20px"
    NameTextImage.style.width="40px"
}
function UserTipout() {
    var str = document.getElementById("NameText").value;
    if (str == ""){
        NameTextImage.style.height="30px"
        NameTextImage.style.width="60px"
    }
}

function tips() {
    PasswordTextImage.style.height="17px"
    PasswordTextImage.style.width="34px"
}
function tipsout()  {
    var str = document.getElementById("PasswordText").value;
    if (str == ""){
        PasswordTextImage.style.height="25px"
        PasswordTextImage.style.width="50px"
    }
}
function password() {
    PasswordIdentifyImage1.style.height="17px"
    PasswordIdentifyImage1.style.width="68px"
}
function passwordout() {
    var str = document.getElementById("PasswordIdentify").value;
    if (str == "") {
        PasswordIdentifyImage1.style.height="25px"
        PasswordIdentifyImage1.style.width="100px"
    }
}
function compare() {
    var password1 = document.getElementById("PasswordText").value;
    var password2 = document.getElementById("PasswordIdentify").value;

    if (password1 != password2) {
        document.getElementById("hid").innerHTML="<br>两次输入密码不一致!";
    }
}