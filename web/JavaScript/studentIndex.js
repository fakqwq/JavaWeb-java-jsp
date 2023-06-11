let name
// 定义常量，用于设置表格的样式和标题
const TABLE_CLASS = "table table-striped";
const SUBJECT_LABEL = "科目";
const SCORE_LABEL = "分数";

function check123() {
    name = document.getElementById("floatingInputUserName").value;
    const password = document.getElementById("floatingInputPassword").value;
    const radioButtons = document.querySelectorAll('input[name="inlineRadioOptions"]');
    let selectedValue;

    radioButtons.forEach(radioButton => {
        if (radioButton.checked) {
            selectedValue = radioButton.value;
        }
    });

    if (selectedValue === "student") {
        getMyScore();
        getName();
        console.log("student");
    } else {
        LoginTeacher();
    }
}

// 发送 POST 请求，获取成绩数据
const getMyScore = () => {
    fetch("getScore", {
        body: name,
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
    })
        .then(response => response.json())
        .then(data => {
            // 输出数据内容
            console.log(data);
            console.log(data[0].id);
            console.log(data[0].jsp);
            console.log(data[0].android);
            console.log(data[0].database);

            // 获取指定 ID 的 div 元素，并清空其内容
            const div = document.getElementById("tC");
            if (div) {
                div.innerHTML = "";
                div.style.marginLeft = "600px";

                // 创建 table 元素，并设置其样式和标题
                const table = document.createElement("table");
                table.className = TABLE_CLASS;
                const thead = document.createElement("thead");
                const tr = document.createElement("tr");
                const th1 = document.createElement("th");
                th1.innerHTML = SUBJECT_LABEL;
                const th2 = document.createElement("th");
                th2.innerHTML = SCORE_LABEL;
                tr.appendChild(th1);
                tr.appendChild(th2);
                thead.appendChild(tr);
                table.appendChild(thead);

                // 创建 tbody 元素，并添加多个行
                const tbody = document.createElement("tbody");
                tbody.appendChild(createTableRow("database", data[0].database));
                tbody.appendChild(createTableRow("android", data[0].android));
                tbody.appendChild(createTableRow("jsp", data[0].jsp));
                table.appendChild(tbody);

                // 将 table 元素添加到指定的 div 元素中
                div.appendChild(table);
            }
        });
};

const getName = node => {
    fetch("getName", {
        body: JSON.stringify({
            user: document.getElementById("floatingInputUserName").value,
            password: document.getElementById("floatingInputPassword").value
        }),
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        }
    })
        .then(response => response.text())
        .then(data => {
            // 输出响应数据
            const ul = document.getElementById("ulM");
            ul.innerHTML = "";
            console.log(data);
            const li = document.createElement("li");
            const a = document.createElement("a");
            a.style = "color: white";
            a.href = "exit";
            a.innerHTML = "退出登录";
            a.onclick = function () {
                return confirm('确认退出?');
            }
            const h1 = document.createElement("h1");
            h1.innerHTML = "欢迎您，" + data;
            li.appendChild(h1)
            li.appendChild(a);
            ul.appendChild(li);
        })
}

const createTableRow = (subject, score) => {
    const tr = document.createElement("tr");
    const td1 = document.createElement("td");
    td1.innerHTML = subject;
    const td2 = document.createElement("td");
    td2.innerHTML = score;
    tr.appendChild(td1);
    tr.appendChild(td2);
    return tr;
};

function LoginTeacher() {
    fetch("check_login", {
        body: JSON.stringify({
            user: document.getElementById("floatingInputUserName").value,
            password: document.getElementById("floatingInputPassword").value
        }),
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        }
    })
        .then(response => response.text())
        .then(data => {
            // 输出响应数据
            console.log(data);
            if (data === "success") {
                // 登录成功，跳转到学生页面
                window.location.href = "main.jsp";
            } else {
                // 登录失败，输出错误信息
                console.error("登录失败");
            }
        })
        .catch(error => {
            // 输出错误信息
            console.error(error);
        });
}