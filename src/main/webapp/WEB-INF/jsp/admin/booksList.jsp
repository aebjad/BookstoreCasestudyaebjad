<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<jsp:include page="../include/header.jsp" />


<div class="bg-dark py-5 bg-img" ></div>
</br><br/>
<form method="GET" action="/admin/bookList">
    <label>Search for a book</label>
    <input type="text" name="booksearch" value="${booksearch}"
           style="width: 300px; border-radius: 10px; box-shadow: 5px 10px #888888;" placeholder="Title, author or key">

    <button type="submit" class="btn btn-warning"  style="width: 100px" >Search</button>

</form>

    <table  class="table table-striped" >
        <tr>

            <td><b> Book Name </b> </td>
            <td><b> Author Name </b></td>
            <td><b> image url </b></td>
            <td><b> Price </b></td>
            <td><b> Quantity  </b></td>
            <td><b> Category </b></td>

            <td><b> Edit </b></td>
            <td><b> Delete</b></td>

        </tr>
        <c:forEach  var="book" items="${bookList}">

        <tr>

            <td>  ${book.bookName}  </td>
            <td>  ${book.author}  </td>
            <td>  ${book.urlImage}  </td>
            <td>  $${book.price}  </td>
            <td>   ${book.quantityInStock} </td>
            <td>   ${book.category}  </td>


            <td><a href="/admin/edit?id=${book.id}">Edit</a></td>
            <td><a href="/admin/deleteBook?id=${book.id}" id="delete" onclick="myFunction3()">Delete</a></td>

        </tr>
        </c:forEach>
    </table>

<div class="pt-5">
    <h6 class="mb-0"><a  href="/admin/home" class="text-body"><i
            class="fas fa-long-arrow-alt-left me-2"></i>Back to admin page</a></h6>
</div>
    <hr>

<script>
    document.getElementById("delete").addEventListener("onclick", myFunction3);

    function myFunction3() {
        alert("The book has been deleted successfully");
    }
</script>

<jsp:include page="../include/footer.jsp" />