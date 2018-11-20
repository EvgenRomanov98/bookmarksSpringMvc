<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
          integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Josefin+Sans" rel="stylesheet">
    <link rel="stylesheet" href="../resources/css/home.css">

    <link rel="stylesheet"
          href="https://d19m59y37dris4.cloudfront.net/universal/2-0-1/vendor/font-awesome/css/font-awesome.min.css">
    <title>Welcome</title>
</head>
<body>
<c:set var="user" value="${pageContext.request.userPrincipal}"/>

<%--<nav class="navbar navbar-light navbar-expend-md fixed-top myHeader">--%>
<%--<h1 class="welcome">Hello ${user.name}--%>
<%--<a href="/logout" class="btn btn-warning">exit</a>--%>
<%--</h1>--%>
<%--</nav>--%>
<div class="top-bar">
    <div class="container">
        <div class="row d-flex align-items-center">
            <div class="col-md-6 d-md-block d-none">
                <h4>Hello <span class="welcome">${user.name}</span></h4>
            </div>
            <div class="col-md-6">
                <div class="d-flex justify-content-md-end justify-content-between">

                    <div class="login">
                        <a href="/logout" class="signup-btn">
                            <i class="fas fa-sign-out-alt"></i>
                            <span class="d-none d-md-inline-block">Sign out</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<section>
    <img src="../resources/image/black-background-blank-card-1383562.jpg" class="img-fluid home-img">

    <%--///////////////////////////////////   меню   //////////////////////////////////////////////////////--%>
    <div class="container-fluid">
        <div class="row">


            <div class="col-md-3">
                <div>
                    <span>Menu</span>
                    <button type="button" class="btn btn-info" data-toggle="modal"
                            data-target="#addMenu" data-whatever="@mdo"><i
                            class="fas fa-plus"></i></button>
                </div>


                <%-- добавление меню с помощью модального окна --%>


                <div class="modal fade" id="addMenu" tabindex="-1" role="dialog" aria-labelledby="addMenuLabel"
                     aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title inModalText" id="addMenuLabel">Add menu</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form action="/home/menu/add" method="POST" id="addMenuForm">
                                    <div class="form-group">
                                        <label for="addMenuInp" class="col-form-label inModalText">menu tittle</label>
                                        <input id="addMenuInp" type="text" class="form-control"
                                               placeholder="write menu tittle"
                                               name="nameMenu">
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="submit" form="addMenuForm" class="btn btn-secondary">Okay</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>


                <%-- вывод всех меню --%>
                <table class="table table-hover table-sm">
                    <thead class="thead-light">
                    <tr>
                        <th scope="col">menu title</th>
                        <th width="100px" scope="col">modify</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:if test="${listMenu.size() != 0}">
                        <c:forEach var="menu" items="${listMenu}">
                            <tr>
                                <div class="input-group">
                                    <td><a href="/home/selectBookmark/${menu.id}"
                                           class="btn btn-light">${menu.nameMenu}</a>
                                    </td>
                                        <%-- удалить меню--%>
                                    <div class="input-group-append">
                                        <td width="100px" class="colModify"><a
                                                href="home/menu/del/${aimMenu.id}/${menu.id}" class="btn btn-light"><i
                                                class="fas fa-minus"></i></a>

                                                <%--вызов модального окна для редактирования меню--%>


                                            <button type="button" class="btn btn-light" data-toggle="modal"
                                                    data-target="#editMenu${menu.id}" data-whatever="@mdo"><i
                                                    class="fas fa-pen"></i></button>
                                        </td>

                                            <%--собственно модальное окно--%>

                                        <div class="modal fade" id="editMenu${menu.id}" tabindex="-1" role="dialog"
                                             aria-labelledby="editMenuLabel${menu.id}" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title inModalText"
                                                            id="editMenuLabel${menu.id}">Rename
                                                            menu
                                                        </h5>
                                                        <button type="button" class="close" data-dismiss="modal"
                                                                aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <form id="editMenuForm${menu.id}"
                                                              action="/home/menu/edit/${aimMenu.id}/${menu.id}"
                                                              method="post">
                                                            <div class="form-group">
                                                                <label for="recipient-name${menu.id}"
                                                                       class="col-form-label inModalText">menu</label>
                                                                <input type="text" class="form-control"
                                                                       id="recipient-name${menu.id}"
                                                                       placeholder="name Menu" name="nameMenu">
                                                            </div>
                                                        </form>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="submit" form="editMenuForm${menu.id}"
                                                        class="btn btn-secondary">Okay
                                                        </button>
                                                        <button type="button" class="btn btn-secondary"
                                                                data-dismiss="modal">
                                                            Close
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </tr>
                        </c:forEach>
                    </c:if>
                    </tbody>
                </table>
            </div>


            <%--//////////////////////////////////////   собственно закладки   ///////////////////////////////////////////////////--%>


            <div class="col-md-9">
                <div>
                    Bookmark <span class="welcome">'${aimMenu.nameMenu}'</span>
                    <button type="button" class="btn btn-info" data-toggle="modal"
                            data-target="#addBookmark" data-whatever="@mdo"><i
                            class="fas fa-plus"></i></button>
                </div>

                <%--добавление закладки с помощью модального окна--%>
                <div class="modal fade" id="addBookmark" tabindex="-1" role="dialog"
                     aria-labelledby="addBookmarkLabel"
                     aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title inModalText" id="addBookmarkLabel">Add bookmark</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form id="addBookmarkForm" action="/home/bookmark/add" method="POST">
                                    <div class="form-group">
                                        <label for="addLink"
                                               class="col-form-label inModalText">link</label>
                                        <input id="addLink" type="text" class="form-control" placeholder="link"
                                               aria-label="Recipient's username"
                                               aria-describedby="basic-addon2" name="link">

                                        <label for="addComment"
                                               class="col-form-label inModalText">comment</label>
                                        <input id="addComment" type="text" class="form-control"
                                               placeholder="comment"
                                               aria-label="Recipient's username"
                                               aria-describedby="basic-addon2" name="comment">
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="submit" form="addBookmarkForm" class="btn btn-secondary"
                                        value="${aimMenu.id}"
                                name="aimMenuId">Okay
                                </button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>


                <%--  вывод всех закладок  --%>


                <table class="table table-hover table-sm">
                    <thead class="thead-light">
                    <tr>
                        <th scope="col">link</th>
                        <th scope="col">comment</th>
                        <th width="100px" scope="col">modify</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:if test="${listBookmark.size() != 0}">
                    <c:forEach var="bookmark" items="${listBookmark}">
                    <div class="input-group">
                        <tr>
                            <td><a href="${bookmark.link}" class="decorationLink">${bookmark.link}</a></td>
                            <td><span>${bookmark.comment}</span></td>
                            <div class="input-group-append">
                                <td width="100px"><a href="/home/bookmark/del/${aimMenu.id}/${bookmark.id}"
                                                     class="btn btn-light"><i
                                        class="fas fa-minus"></i></a>
                                        <%--удаление закладки--%>


                                    <button type="button" class="btn btn-light" data-toggle="modal"
                                            data-target="#exampleModal${bookmark.id}bookmark"
                                            data-whatever="@mdo"><i
                                            class="fas fa-pen"></i></button>
                                </td>

                                    <%--Вызов модального окна для редактироапния закладки--%>

                                <div class="modal fade" id="exampleModal${bookmark.id}bookmark" tabindex="-1"
                                     role="dialog"
                                     aria-labelledby="exampleModalLabel${bookmark.id}bookmark"
                                     aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title inModalText"
                                                    id="exampleModalLabel${bookmark.id}bookmark">Rename bookmark
                                                </h5>
                                                <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <form id="editBookmark${bookmark.id}bookmark"
                                                      action="/home/bookmark/edit/${aimMenu.id}/${bookmark.id}">
                                                    <div class="form-group">
                                                        <label for="recipient-name${bookmark.id}bookmark"
                                                               class="col-form-label inModalText">link</label>
                                                        <input type="text" class="form-control"
                                                               id="recipient-name${bookmark.id}bookmark"
                                                               placeholder="link bookmark"
                                                               value="${bookmark.link}"
                                                               name="bookmarkLink">
                                                        <label for="recipient-comment${bookmark.id}bookmark"
                                                               class="col-form-label inModalText">comment</label>
                                                        <input type="text" class="form-control"
                                                               id="recipient-comment${bookmark.id}bookmark"
                                                               placeholder="comment bookmark"
                                                               value="${bookmark.comment}"
                                                               name="bookmarkComment">
                                                    </div>
                                                </form>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="submit" form="editBookmark${bookmark.id}bookmark"
                                                        class="btn btn-secondary">
                                                    Okay
                                                </button>
                                                <button type="button" class="btn btn-secondary"
                                                        data-dismiss="modal">
                                                    Close
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </tr>
                    </div>
                    </tbody>
                    </c:forEach>
                    </c:if>

                </table>

                <%--//////////////////////////////////////////  конец  ///////////////////////////////////////////////--%>


            </div>
        </div>
    </div>
</section>
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
