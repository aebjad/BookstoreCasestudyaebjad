<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>


<jsp:include page="../include/header.jsp" />


    <table  class="table table-striped" >
        <tr>

            <td> Book Name </td>
            <td> Author Name </td>
            <td> image url </td>
            <td> Price </td>
            <td> Quantity In Stock </td>

            <td>Edit</td>
<%--            <td>Delete</td>--%>

        </tr>
        <c:forEach  var="book" items="${bookList}">

        <tr>

            <td>  ${book.bookName}  </td>
            <td>  ${book.author}  </td>
            <td>  ${book.urlImage}  </td>
            <td>   ${book.price}  </td>
            <td>   ${book.quantityInStock} </td>

            <td><a href="/edit?id=${book.id}">Edit</a></td>
<%--&lt;%&ndash;            <td><a href="/registration-url-path/deleteUser?id=${user.id}">Delete</a></td>&ndash;%&gt;--%>
<%--            <td><a href="/registration-url-path/deleteUser?id=${user.id}">Delete</a></td>--%>

        </tr>
        </c:forEach>
    </table>

<hr>


<form method="GET" action="/admin/bookList">
    <label>Search for a book</label>
    <input type="text" name="booksearch" value="${booksearch}" placeholder="Book title or author's name">
    <button type="submit">Search</button>
</form>
<hr>

<jsp:include page="../include/footer.jsp" />