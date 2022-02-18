<jsp:include page="../include/header.jsp" />

<link rel="stylesheet" type="text/css" href="/pub/css/style.css">

<h1> This is admin page</h1>

<form method="GET" action="/admin/userList">
    <label>Search for user</label>
    <input type="text" name="search" value="${search}" placeholder="First name or last name">
    <button type="submit" >Search</button>
</form>
<hr>

<form method="GET" action="/admin/bookList">
    <label>Search for a book</label>
    <input type="text" name="booksearch" value="${booksearch}" placeholder="Book title or author's name">
    <button type="submit"  >Search</button>
</form>
<hr>

<div><a href="/newBook" class="btn"> Add new book </a></div>



<jsp:include page="../include/footer.jsp" />