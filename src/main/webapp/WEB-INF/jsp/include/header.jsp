<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>


<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" type="text/css" href="/pub/css/style.css">

<%--    <script--%>
<%--            src="https://code.jquery.com/jquery-3.6.0.js"--%>
<%--            integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="--%>
<%--            crossorigin="anonymous"></script>--%>

<%--    <!-- Bootstrap CSS -->--%>
<%--    <link rel="stylesheet"--%>
<%--          href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"--%>
<%--          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"--%>
<%--          crossorigin="anonymous">--%>

<%--    <!-- Optional JavaScript -->--%>
<%--    <!-- jQuery first, then Popper.js, then Bootstrap JS -->--%>
<%--    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"--%>
<%--            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"--%>
<%--            crossorigin="anonymous"></script>--%>
<%--    <script--%>
<%--            src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"--%>
<%--            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"--%>
<%--            crossorigin="anonymous"></script>--%>
<%--    <script--%>
<%--            src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"--%>
<%--            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"--%>
<%--            crossorigin="anonymous"></script>--%>

    <!-- Bootstrap CSS  / JS-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


    <!-- Font Awesome for icons  -->
    <link  rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <!-- Google font   -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">


    <title>Charlotte Bookstore</title>
</head>

<body>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<div class="container">

<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-light bg-light"  style="margin-bottom:0px; margin-top: 0px">
    <p class="navbar-brand title" >Charlotte Bookstore</p>
    <div class="collapse navbar-collapse" id="navbarSupportedContent" >
        <ul class="navbar-nav mr-auto" >
            <li class="nav-item active">
                <a class="nav-link active" href="/index"> Home </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/contactUs">Contact</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Books
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#">Kids</a>
                    <a class="dropdown-item" href="#">Teens</a>
                    <a class="dropdown-item" href="#">Adult</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">All Books</a>
                </div>
            </li>
        </ul>
    </div>
    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
        <ul class="navbar-nav mr-auto" >
            <li class="nav-item dropdown" >
                <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">
                    <sec:authorize access="!isAuthenticated()">
                    <i class="fas fa-user"></i> My Account</a>
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">
                    <i class="fas fa-user"></i> <sec:authentication property="principal.username" /></a>
                </sec:authorize>
                <ul class="dropdown-menu">
                    <sec:authorize access="!isAuthenticated()">
                    <li><a href="/login/login">Sign In</a></li>
                    </sec:authorize>

                    <sec:authorize access="hasAuthority('ADMIN')">
                        <li><a href="/admin/home">Admin Page</a></li>
                    </sec:authorize>

                    <li><a href="#">Manage Account</a></li>
                    <li><a href="#">Order Status</a></li>
<%--                    <li><a href="#">Wish List</a></li>--%>
                    <li><a href="/survey">Survey</a></li>

                    <div class="dropdown-divider"></div>
                    <sec:authorize access="!isAuthenticated()">
                    <li><a href="/register">Sign Up</a></li>
                    </sec:authorize>

                    <sec:authorize access="isAuthenticated()">
                        <li><a href="/login/logout">Logout</a></li>
                    </sec:authorize>

                </ul>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#"><i class="fas fa-shopping-bag"></i> Bag</a>
            </li>
        </ul>

    </div>
</nav>
