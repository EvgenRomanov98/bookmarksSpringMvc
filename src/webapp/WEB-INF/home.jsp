<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
          integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Josefin+Sans" rel="stylesheet">
    <style>
        /*.myForm {*/
        /*width: 100%;*/
        /*margin: 0;*/
        /*}*/

        /*.myInput {*/
        /*width: 50%;*/
        /*margin: 0px;*/
        /*}*/

        /*.title-text {*/
        /*text-align: center;*/
        /*}*/

        /*.myButton {*/
        /*height: 38px;*/
        /*}*/

        /*#edit {*/
        /*background-color: aqua;*/
        /*}*/

        /*#minus {*/
        /*background-color: red;*/
        /*}*/

        /*body {*/
        /*font-family: 'Josefin Sans', sans-serif;*/
        /*}*/

        /*a:hover {*/
        /*text-decoration: none;*/
        /*color: yellow;*/
        /*}*/

        /*a {*/
        /*color: white;*/
        /*width: 100px;*/
        /*}*/

    </style>
    <title>Welcome</title>
</head>
<body>

<c:set var="user" value="${pageContext.request.userPrincipal}"/>

<%--///////////////////////////////////   меню   //////////////////////////////////////////////////////--%>

<h1>Hello ${user.name} <a href="/logout" class="btn btn-warning"> exit </a></h1>
<div class="container-fluid">
    <div class="row">


        <div class="col-md-2">
            <div>
                <span>Menu</span>
                <button type="button" class="btn btn-primary" data-toggle="modal"
                        data-target="#addMenu" data-whatever="@mdo"><i
                        class="fas fa-plus"></i></button>
            </div>


            <%-- добавление меню с помощью модального окна --%>


            <div class="modal fade" id="addMenu" tabindex="-1" role="dialog" aria-labelledby="addMenuLabel"
                 aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="addMenuLabel">Add Menu</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="input-group">
                                <form action="/home/menu/add" method="POST"
                                      class="myForm input-group" id="addMenuForm">
                                    <input type="text" class="form-control" placeholder="name menu" name="nameMenu">
                                </form>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="submit" form="addMenuForm" class="btn btn-primary">add Menu</button>
                        </div>
                    </div>
                </div>
            </div>


            <%-- вывод всех меню меню --%>

            <c:if test="${listMenu.size() != 0}">
                <c:forEach var="menu" items="${listMenu}">
                    <div class="input-group">
                        <a href="/home/selectBookmark/${menu.id}" class="btn">${menu.nameMenu}</a><%-- удалить меню--%>
                        <div class="input-group-append">

                            <a href="home/menu/del/${aimMenu.id}/${menu.id}"><i
                                    class="fas fa-minus"></i></a>

                                <%--вызов модального окна для редактирования меню--%>

                            <button type="button" class="btn btn-primary" data-toggle="modal"
                                    data-target="#editMenu${menu.id}" data-whatever="@mdo"><i
                                    class="fas fa-pen"></i></button>

                                <%--собственно модальное окно--%>

                            <div class="modal fade" id="editMenu${menu.id}" tabindex="-1" role="dialog"
                                 aria-labelledby="editMenuLabel${menu.id}" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="editMenuLabel${menu.id}">Rename Menu</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <form id="editMenuForm${menu.id}"
                                                  action="/home/menu/edit/${aimMenu.id}/${menu.id}" method="post">
                                                <div class="form-group">
                                                    <label for="recipient-name${menu.id}"
                                                           class="col-form-label">Menu</label>
                                                    <input type="text" class="form-control"
                                                           id="recipient-name${menu.id}"
                                                           placeholder="name Menu" name="nameMenu">
                                                </div>
                                            </form>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close
                                            </button>
                                            <button type="submit" form="editMenuForm${menu.id}" class="btn btn-primary">
                                                Ok
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:if>

        </div>


        <%--//////////////////////////////////////   собственно закладки   ///////////////////////////////////////////////////--%>


        <div class="col-md-10">
            <div>
                <span>Bookmark ${aimMenu.nameMenu}</span>
                <button type="button" class="btn btn-primary" data-toggle="modal"
                        data-target="#addBookmark" data-whatever="@mdo"><i
                        class="fas fa-plus"></i></button>
            </div>

            <%--добавление закладки с помощью модального окна--%>
            <div class="modal fade" id="addBookmark" tabindex="-1" role="dialog" aria-labelledby="addBookmarkLabel"
                 aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="addBookmarkLabel">Add Bookmark</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="input-group">
                            <form id="addBookmarkForm" action="/home/bookmark/add" method="POST"
                                  class="myForm input-group">
                                <input type="text" class="form-control myInput" placeholder="link"
                                       aria-label="Recipient's username"
                                       aria-describedby="basic-addon2" name="link">
                                <input type="text" class="form-control myInput" placeholder="comment"
                                       aria-label="Recipient's username"
                                       aria-describedby="basic-addon2" name="comment">
                                </button>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="submit" form="addBookmarkForm" class="btn btn-primary" value="${aimMenu.id}"
                                    name="aimMenuId">add Bookmark
                            </button>
                        </div>
                    </div>
                </div>
            </div>


            <%--  вывод всех закладок  --%>


            <c:if test="${listBookmark.size() != 0}">
                <c:forEach var="bookmark" items="${listBookmark}">
                    <div class="input-group">
                        <a href="${bookmark.link}">${bookmark.link}</a>
                        <span>${bookmark.comment}</span>
                        <div class="input-group-append">
                            <a href="/home/bookmark/del/${aimMenu.id}/${bookmark.id}"><i
                                    class="fas fa-minus"></i></a><%--удаление закладки--%>

                            <button type="button" class="btn btn-primary" data-toggle="modal"
                                    data-target="#exampleModal${bookmark.id}bookmark" data-whatever="@mdo"><i
                                    class="fas fa-pen"></i></button> <%--Вызов модального окна для редактироапния закладки--%>

                            <div class="modal fade" id="exampleModal${bookmark.id}bookmark" tabindex="-1" role="dialog"
                                 aria-labelledby="exampleModalLabel${bookmark.id}bookmark" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel${bookmark.id}bookmark">Rename
                                                bookmark</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <form id="editBookmark${bookmark.id}bookmark"
                                                  action="/home/bookmark/edit/${aimMenu.id}/${bookmark.id}">
                                                <div class="form-group">
                                                    <label for="recipient-name${bookmark.id}bookmark"
                                                           class="col-form-label">Link</label>
                                                    <input type="text" class="form-control"
                                                           id="recipient-name${bookmark.id}bookmark"
                                                           placeholder="link bookmark" value="${bookmark.link}"
                                                           name="bookmarkLink">
                                                    <label for="recipient-comment${bookmark.id}bookmark"
                                                           class="col-form-label">comment</label>
                                                    <input type="text" class="form-control"
                                                           id="recipient-comment${bookmark.id}bookmark"
                                                           placeholder="comment bookmark" value="${bookmark.comment}"
                                                           name="bookmarkComment">
                                                </div>
                                            </form>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close
                                            </button>
                                            <button type="submit" form="editBookmark${bookmark.id}bookmark"
                                                    class="btn btn-primary">
                                                Okay
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </c:forEach>
            </c:if>


            <%--//////////////////////////////////////////  конец  ///////////////////////////////////////////////--%>


        </div>
    </div>
</div>

</body>
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
