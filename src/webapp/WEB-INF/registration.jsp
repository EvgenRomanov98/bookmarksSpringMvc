<%--<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>--%>

<%--<c:set var="contextPath" value="${pageContext.request.contextPath}"/>--%>

<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<%--<head>--%>
<%--<meta charset="utf-8">--%>
<%--<meta http-equiv="X-UA-Compatible" content="IE=edge">--%>
<%--<meta name="viewport" content="width=device-width, initial-scale=1">--%>
<%--<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->--%>
<%--<meta name="description" content="">--%>
<%--<meta name="author" content="">--%>

<%--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"--%>
<%--integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">--%>
<%--<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"--%>
<%--integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"--%>
<%--crossorigin="anonymous"></script>--%>
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"--%>
<%--integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"--%>
<%--crossorigin="anonymous"></script>--%>
<%--<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"--%>
<%--integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"--%>
<%--crossorigin="anonymous"></script>--%>
<%--<title>Create an account</title>--%>

<%--</head>--%>

<%--<body>--%>

<%--<div class="container">--%>

<%--<form:form method="POST" action="/registration" modelAttribute="userInfoForm" class="form-signin">--%>
    <%--<h2 class="form-signin-heading">Create your account</h2>--%>
    <%--<spring:bind path="username">--%>
        <%--<div class="form-group ${status.error ? 'has-error' : ''}">--%>
            <%--<form:input type="text" path="username" class="form-control" placeholder="Username"--%>
                        <%--autofocus="true"></form:input>--%>
            <%--<form:errors path="username"></form:errors>--%>
        <%--</div>--%>
    <%--</spring:bind>--%>

    <%--<spring:bind path="password">--%>
        <%--<div class="form-group ${status.error ? 'has-error' : ''}">--%>
            <%--<form:input type="password" path="password" class="form-control" placeholder="Password"></form:input>--%>
            <%--<form:errors path="password"></form:errors>--%>
        <%--</div>--%>
    <%--</spring:bind>--%>

    <%--<spring:bind path="passwordConfirm">--%>
        <%--<div class="form-group ${status.error ? 'has-error' : ''}">--%>
            <%--<form:input type="password" path="passwordConfirm" class="form-control"--%>
                        <%--placeholder="Confirm your password"></form:input>--%>
            <%--<form:errors path="passwordConfirm"></form:errors>--%>
        <%--</div>--%>
    <%--</spring:bind>--%>

    <%--<button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>--%>
<%--</form:form>--%>

<%--&lt;%&ndash;</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;</body>&ndash;%&gt;--%>
<%--&lt;%&ndash;</html>&ndash;%&gt;--%>
<%--<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>--%>

<%--<c:set var="contextPath" value="${pageContext.request.contextPath}"/>--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Log in with your account</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
            integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
            integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
            crossorigin="anonymous"></script>

    <!--Fontawesome CDN-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
          integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

    <link rel="stylesheet" href="../resources/css/login.css">

</head>
<body>
<div class="container">
    <div class="d-flex justify-content-center h-100">
        <div class="card">
            <div class="card-header">
                <h3>Sign Up</h3>
            </div>
            <div class="card-body">
                <form method="POST" action="/registration">
                    <div class="input-group form-group ${error != null ? 'has-error' : ''}">
                        <span class="massage">${message}</span>
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                        </div>
                        <input name="username" type="text" class="form-control" placeholder="username">

                    </div>
                    <div class="input-group form-group">
                        <span class="error">${error}</span>
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-key"></i></span>
                        </div>
                        <input name="password" type="password" class="form-control" placeholder="password">
                    </div>
                    <%--<div class="row align-items-center remember">--%>
                    <%--<input type="checkbox">Remember Me--%>
                    <%--</div>--%>
                    <div class="input-group form-group">
                        <span class="error">${error}</span>
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-key"></i></span>
                        </div>
                        <input name="passwordConfirm" type="password" class="form-control" placeholder="password confirm">
                    </div>
                    <div class="form-group">
                        <input type="submit" value="Login" class="btn float-right login_btn">
                    </div>
                </form>
            </div>
            <div class="card-footer">
                <div class="d-flex justify-content-center links">
                    Do you have an account?<a href="/login">Sign In</a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
