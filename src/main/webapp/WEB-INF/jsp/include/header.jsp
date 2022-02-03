<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" type="text/css" href="src/main/webapp/pub/css/style.css">

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
<div class="container">

<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-light bg-light"  style="margin-bottom:0px; margin-top: 0px">
    <p class="navbar-brand title" >Charlotte Bookstore</p>
    <div class="collapse navbar-collapse" id="navbarSupportedContent" >
        <ul class="navbar-nav mr-auto" >
            <li class="nav-item active">
                <a class="nav-link active" href="index.html"> Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="contact.html">Contact</a>
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
                <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"><i class="fas fa-user"></i> My Account</a>
                <ul class="dropdown-menu">
                    <li><a href="login.html">Sign In</a></li>
                    <li><a href="#">Manage Account</a></li>
                    <li><a href="#">Order Status</a></li>
                    <li><a href="#">Wish List</a></li>
                    <li><a href="survey.html">Survey</a></li>
                    <div class="dropdown-divider"></div>
                    <li><a href="sign-up.html">Sign Up</a></li>

                </ul>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#"><i class="fas fa-shopping-bag"></i> Bag</a>
            </li>
        </ul>

    </div>
</nav>
