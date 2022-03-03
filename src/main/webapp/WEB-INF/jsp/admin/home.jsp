<jsp:include page="../include/header.jsp" />


    <div class="bg-dark py-5 bg-img" ></div>

<h3>Admin Page</h3>
<br/>
    <form method="GET" action="/admin/userList">

        <label>Search for a user</label>
               <input type="text" name="search" value="${search}" style="width: 300px; border-radius: 10px;
                              box-shadow: 5px 10px #888888;" placeholder="First name or last name">
               <button type="submit" class="btn btn-warning"  style="width: 100px">Search</button>

    </form>
    <hr>

    <form method="GET" action="/admin/bookList">
        <label>Search for a book</label>
        <input type="text" name="booksearch" value="${booksearch}"
               style="width: 300px; border-radius: 10px; box-shadow: 5px 10px #888888;" placeholder="Title, author or key">

                <button type="submit" class="btn btn-warning"  style="width: 100px" >Search</button>

    </form>
    <hr>

    <div style="float: left; padding-right: 10px"><a href="/admin/newBook" class="btn btn-dark" style="width: 200px" role="button"> Add new book </a></div>

<div style="float: left; padding-right: 10px"><a href="/admin/usersList" class="btn btn-dark" style="width: 200px" role="button"> Display All Users </a></div>

<form method="GET" action="/admin/bookList">
    <div ><button type="submit" class="btn btn-dark" style="width: 200px" role="button"> Display All Books </button></div>
</form>


    </br><br/>


<jsp:include page="../include/footer.jsp" />