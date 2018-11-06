<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
          integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Josefin+Sans" rel="stylesheet">
    <style>
        .myForm {
            width: 100%;
            margin: 0;
        }

        .myInput {
            width: 50%;
            margin: 0px;
        }

        .title-text {
            text-align: center;
        }

        .myButton {
            height: 38px;
        }

        #edit {
            background-color: aqua;
        }

        #minus {
            background-color: red;
        }

        body {
            font-family: 'Josefin Sans', sans-serif;
        }

        a:hover {
            text-decoration: none;
            color: blue;
        }

        a {
            color: black;
            width: 100px;
        }

    </style>
    <title>Welcome</title>
</head>
<body>

<c:set var="user" value="${pageContext.request.userPrincipal}"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<h1>Hello ${user.name}</h1>
<div class="container-fluid">
    <div class="row">


        <div class="col-md-2">
            <div>
                <span>Menu</span>
                <button class="btn btn-outline-secondary" type="button"><i class="fas fa-plus"
                                                                           onmousedown="showFormAddMenu()"></i>
                </button>
            </div>
            <div id="hiddenMenu" class="input-group" hidden>
                <form:form action="/home/menu/add" modelAttribute="menu" method="POST"
                           class="myForm input-group">
                    <form:input type="text" class="form-control myInput" placeholder="name menu"
                                aria-label="Recipient's username"
                                aria-describedby="basic-addon2" path="nameMenu"></form:input>
                    <button type="submit" class="btn btn-success">add menu</button>
                </form:form>
            </div>
            <c:forEach var="menu" items="${listMenu}">
                <div>

                    <a href="${path}/${menu.nameMenu}" class="btn btn-info">${menu.nameMenu}</a>
                </div>
            </c:forEach>
        </div>






        <div class="col-md-10">
            <div>
                <span>Bookmark ${aimMenu}</span>
                <button class="btn btn-success" type="button"><i class="fas fa-plus"
                                                                 onclick="showFormAddBookmark()"></i>
                </button>
            </div>
            <div id="hiddenBookmark" class="input-group" hidden>
                <form:form action="/home/bookmark/add" modelAttribute="bookmark" method="POST"
                           class="myForm input-group">
                    <form:input type="text" class="form-control myInput" placeholder="link"
                                aria-label="Recipient's username"
                                aria-describedby="basic-addon2" path="link"></form:input>
                    <form:input type="text" class="form-control myInput" placeholder="comment"
                                aria-label="Recipient's username"
                                aria-describedby="basic-addon2" path="comment"></form:input>
                    <button name="aimMenu" type="submit" class="btn btn-success" value="${aimMenu}">add bookmark</button>
                </form:form>
            </div>

            <div class="input-group">
                <c:forEach var="bookmark" items="${listBookmark}">
                    <a href="${bookmark.link}" >${bookmark.link}</a>
                    <span>${bookmark.comment}</span>
                    <div class="input-group-append">
                        <form action="/home/bookmark/del">
                            <button id="minus" class="btn btn-outline-secondary myButton" type="button"><i
                                    class="fas fa-minus"></i>
                            </button>
                        </form>
                        <form action="/home/bookmark/edit">
                            <button id="edit" class="btn btn-outline-secondary myButton" type="button"><i
                                    class="fas fa-pen"></i></button>
                        </form>


                    </div>
                </c:forEach>
            </div>


        </div>
    </div>
</div>
</body>
<script>
    function showFormAddBookmark() {
        if (document.getElementById("hiddenBookmark").hidden === false) {
            document.getElementById("hiddenBookmark").hidden = true;
            return
        }
        document.getElementById("hiddenBookmark").hidden = false;
    }

    function showFormAddMenu() {
        if (document.getElementById("hiddenMenu").hidden === false) {
            document.getElementById("hiddenMenu").hidden = true;
            return
        }
        document.getElementById("hiddenMenu").hidden = false;
    }
</script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
        integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
        integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>
</html>
