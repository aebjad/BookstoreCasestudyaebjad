<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>


<jsp:include page="../include/header.jsp" />

<%--<link rel="stylesheet" type="text/css" href="/pub/css/style.css">--%>

<div class="bg-dark py-5 bg-img" ></div>
</br><br/>

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
            <td>   ${book.price}  </td>
            <td>   ${book.quantityInStock} </td>
            <td>   ${book.category}  </td>


            <td><a href="/admin/edit?id=${book.id}">Edit</a></td>
            <td><a href="/admin/deleteBook?id=${book.id}">Delete</a></td>

        </tr>
        </c:forEach>
    </table>

<hr>


    <form method="GET" action="/admin/bookList">
              <label>Search for a book</label>
            <input type="text" name="booksearch" value="${booksearch}" style="width: 300px;
                border-radius: 30px" class="form-control" placeholder="Search by book title, author's name or keyword" >
               <button type="submit"  class="btn btn-warning"  style="width: 100px">Search</button>


    </form>

<div class="pt-5">
    <h6 class="mb-0"><a  href="/admin/home" class="text-body"><i
            class="fas fa-long-arrow-alt-left me-2"></i>Back to admin page</a></h6>
</div>
    <hr>

<jsp:include page="../include/footer.jsp" />