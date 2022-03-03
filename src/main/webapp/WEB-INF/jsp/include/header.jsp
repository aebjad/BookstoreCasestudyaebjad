<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>


<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" type="text/css" href="/pub/css/style.css">


    <!-- Bootstrap CSS  / JS-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<%--    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>--%>


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
            <li class="nav-item">
                <a class="nav-link " href="/index"> Home </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/contactUs"> Contact </a>
            </li>
            <p>  </p>
            <li class="nav-item">
                <a class="nav-link" href="/aboutUs"> About </a>
            </li>
            <p>  </p>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Books
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="/searchBookCategory?searchBooklist=kid">Kids</a>
                    <a class="dropdown-item" href="/searchBookCategory?searchBooklist=teen">Teen/Tween</a>
                    <a class="dropdown-item" href="/searchBookCategory?searchBooklist=adult">Adult</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="/searchBookCategory"> All Books</a>
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
                    <i class="fas fa-user"></i> Hi, ${user.firstName}</a>
                </sec:authorize>
                <ul class="dropdown-menu">
                    <sec:authorize access="!isAuthenticated()">
                    <li><a href="/login/login">Sign In</a></li>
                    </sec:authorize>

                    <sec:authorize access="hasAuthority('ADMIN')">
                        <li><a href="/admin/home">Admin Page</a></li>
                    </sec:authorize>

                    <li><a href="/profile">Manage Account</a></li>
                    <li><a href="/orderStatus">Order Status</a></li>
<%--                    <li><a href="#">Wish List</a></li>--%>
<%--                    <li><a href="/survey">Survey</a></li>--%>

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
                <a class="nav-link" href="/userBag"><i class="fas fa-shopping-bag"></i> Bag</a>
            </li>
        </ul>

    </div>
</nav>


