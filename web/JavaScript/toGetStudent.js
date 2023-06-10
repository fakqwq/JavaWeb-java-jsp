/**GitHub Copilot
 以下是对上述代码的分析：
 这段代码定义了一个名为 getStudent 的异步函数，
 它使用了 async/await 关键字来避免回调地狱和提高代码可读性。
 在函数内部，我们使用了 try/catch 语句来捕获可能出现的异常。
 在 try 语句块中，我们使用了 fetch 函数来获取学生信息。
 我们使用了 await 关键字来等待服务器响应，并使用 response.json() 方法将响应转换为 JSON 格式。
 然后，我们将 JSON 数据打印到控制台中，以便进行调试和测试。
 接下来，
 我们使用 document.getElementById 函数获取指定 ID 的 div 元素，并使用 createElement 函数动态生成一个 table 元素。
 我们设置了 table 元素的类名为 table table-striped，以便使用 Bootstrap 样式。然后，我们使用 map 函数遍历标题数组，
 并使用 createElement 函数动态生成多个 th 元素。我们使用解构赋值来将 th 元素数组解构为多个变量，
 并使用 append 函数将它们添加到 tr 元素中。然后，我们将 tr 元素添加到 thead 元素中，并将 thead 元素添加到 table 元素中。
 接下来，我们使用 createElement 函数动态生成一个 tbody 元素，
 并使用 forEach 函数遍历学生数组。我们使用解构赋值来获取学生对象的属性，
 并使用 map 函数遍历属性数组。我们使用 createElement 函数动态生成多个 td 元素，
 并使用 append 函数将它们添加到 tr 元素中。然后，我们将 tr 元素添加到 tbody 元素中，
 并将 tbody 元素添加到 table 元素中。
 最后，我们将 table 元素添加到指定的 div 元素中。如果出现异常，我们将错误信息打印到控制台中。

 总的来说，这段代码使用了许多 JavaScript 的常用技巧和函数，
 如异步函数、模板字符串、解构赋值、数组方法等。它还使用了 Bootstrap 样式来美化表格，
 并使用了 try/catch 语句来处理异常情况。
 */

const getStudent = async () => {
    try {
        const response = await fetch("getStudent", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            }
        });
        const data = await response.json();
        console.log(data);

        const div = document.getElementById("tableContainer");
        const table = document.createElement("table");
        table.className = "table table-striped";
        const thead = document.createElement("thead");
        const [th1, th2, th3, th4, th5,th6] = ["ID", "姓名", "性别", "入学日期", "专业","操作"].map(
            title => {
                const th = document.createElement("th");
                th.style.width = "100px";
                th.innerHTML = title;
                return th;
            }
        );
        const tr = document.createElement("tr");
        tr.append(th1, th2, th3, th4, th5,th6);
        thead.appendChild(tr);
        table.appendChild(thead);

        const tbody = document.createElement("tbody");
        data.forEach(({ id, name, sex, school_date, major }) => {
            const tr = document.createElement("tr");
            const [td1, td2, td3, td4, td5]
                = [id, name, sex, school_date, major]
                .map(
                value => {
                    const td = document.createElement("td");
                    td.style.width = "100px";
                    td.innerHTML = value;
                    return td;
                }
            );
            const td6 = document.createElement("td");
            td6.style.width = "180px";
            td6.innerHTML = `<button id="${id}"  onclick="setStudentId(this.id)" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#Info">修改学生信息</button>`;
            const td7 = document.createElement("td");
            td7.style.width = "100px";
            td7.innerHTML = `<a id="${id}" href="one_page_score?id=${id}">修改成绩</a>`;
            const td8 = document.createElement("td");
            td8.style.width = "80px";
            td8.innerHTML = `<a href="delete_student?id=${id}">删除</a>`;
            const td9 = document.createElement("td");
            td9.style.width = "120px";
            td9.innerHTML = `<button id="${id}"  onclick="setId(this.id)" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#score">查看成绩</button>`;
            tr.append(td1, td2, td3, td4, td5,td9,td6,td7,td8);
            tbody.appendChild(tr);
        });
        table.appendChild(tbody);

        div.appendChild(table);
    } catch (error) {
        console.error(error);
    }
};

//==================================================================================================

let StudentId;
setStudentId = (id) => {
    StudentId = id;
    getOneStudent();
}

getStudentId = () => {
    console.log(StudentId);
    return StudentId;
}
const getOneStudent = () => {
    fetch("getOneStudentInfo", {
        body: getStudentId(),
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        }
    })
        .then(response => response.json())
        .then(data => {
            // 获取指定 ID 的元素，并清空其内容
            const container = document.getElementById("InfoModal");
            container.innerHTML = "";

            // 创建表单元素
            const form = document.createElement("form");
            form.style.display = "flex";
            form.style.flexDirection = "column";
            form.style.alignItems = "center";
            form.method = "POST";
            form.action = "update_student";

            // 创建 ID 输入框
            const idInput = document.createElement("input");
            idInput.style.display = "none"; // 隐藏 ID 输入框
            idInput.type = "text";
            idInput.name = "stuno";
            idInput.value = data.id;
            idInput.style.marginBottom = "16px";
            form.appendChild(idInput);

            // 创建姓名输入框
            const nameInput = document.createElement("input");
            nameInput.type = "text";
            nameInput.name = "stuname";
            nameInput.value = data.name;
            nameInput.style.marginBottom = "16px";
            form.appendChild(nameInput);

            // 创建性别输入框
            const sexInput = document.createElement("input");
            sexInput.type = "text";
            sexInput.name = "stusex";
            sexInput.value = data.sex;
            sexInput.style.marginBottom = "16px";
            form.appendChild(sexInput);


            // 创建专业输入框
            const majorInput = document.createElement("input");
            majorInput.type = "text";
            majorInput.name = "stumajor";
            majorInput.value = data.major;
            majorInput.style.marginBottom = "16px";
            form.appendChild(majorInput);

            // 创建提交按钮
            const submitButton = document.createElement("button");
            submitButton.type = "submit";
            submitButton.class="btn btn-primary";
            submitButton.innerHTML = "修改";
            form.appendChild(submitButton);
            // 将表单添加到容器元素中
            container.appendChild(form);

            console.log(data);
        });
};
