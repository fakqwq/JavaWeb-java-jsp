let Id
function setId(id) {
    Id = id
    getScore()
}
function getId(id) {
    return Id
}

// 定义一个函数，用于创建表格的行
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

// 定义常量，用于设置表格的样式和标题
const TABLE_CLASS = "table table-striped";
const SUBJECT_LABEL = "科目";
const SCORE_LABEL = "分数";

// 发送 POST 请求，获取成绩数据
const getScore = () => {
    fetch("getScore", {
        body: getId(),
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
            const div = document.getElementById("scoreModal");
            if (div) {
                div.innerHTML = "";

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

