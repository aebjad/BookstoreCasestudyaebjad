<jsp:include page="../include/header.jsp" />

<%--<link rel="stylesheet" type="text/css" href="/pub/css/style.css">--%>

    <div class="bg-dark py-5 bg-img" ></div>
<%--    </br>--%>
    <%--<h2> This is admin manage page</h2>--%>
<h3>Admin Page</h3>
<br/>
    <form method="GET" action="/admin/userList">

        <label>Search for a user</label>
               <input type="text" name="search" value="${search}" style="width: 300px; border-radius: 20px" placeholder="First name or last name">
               <button type="submit" class="btn btn-dark"  style="width: 100px">Search</button>

    </form>
    <hr>

    <form method="GET" action="/admin/bookList">
        <label>Search for a book</label>
        <input type="text" name="booksearch" value="${booksearch}"
               style="width: 300px; border-radius: 30px" placeholder="Book title or author's name">

                <button type="submit" class="btn btn-warning"  style="width: 100px" >Search</button>

    </form>
    <hr>

    <div style="float: left; padding-right: 10px"><a href="/admin/newBook" class="btn btn-warning" style="width: 200px" role="button"> Add new book </a></div>

<form method="GET" action="/admin/bookList">
    <div ><button type="submit" class="btn btn-dark" style="width: 200px" role="button"> Display All Books </button></div>
</form>
    <br/>
    </br>


<jsp:include page="../include/footer.jsp" />