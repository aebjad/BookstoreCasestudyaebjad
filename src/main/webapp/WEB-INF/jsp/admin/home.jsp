<jsp:include page="../include/header.jsp" />


<h1> This is admin page</h1>

<form method="GET" action="/admin/userList">
    <label>Search for user</label>
    <input type="text" name="search" value="${search}" placeholder="First name or last name">
    <button type="submit">Search</button>
</form>
<hr>

<form method="GET" action="/bookList">
    <label>Search for a book</label>
    <input type="text" name="search" value="${search2}" placeholder="Book title or author's name">
    <button type="submit">Search</button>
</form>
<hr>

<div><a href="/newBook"> Add new book </a></div>


<jsp:include page="../include/footer.jsp" />