let index

function searchStudent() {
    fetch("searchStudent",{
        body: document.getElementById("search").value,
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        }
    })
        .then(response => response.json())
        .then(data => {
            console.log(data);

            const div = document.getElementById("SingleInfoModal");
            div.innerHTML = "";

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
        })
}