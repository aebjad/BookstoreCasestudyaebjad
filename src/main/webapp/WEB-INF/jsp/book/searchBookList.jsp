    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

    <jsp:include page="../include/header.jsp" />

    <div class="bg-dark py-5 bg-img" ></div>
    </br><br/>
    <h4>Search for a book</h4>
    <form class="form-inline" method="GET" action="/searchBookList">
        <div class="input-group">
            <input type="text" class="form-control" size="50" name="searchBooklist" value="${searchBooklist}" placeholder="Title, author or keyword..">
            <div class="input-group-btn">
                <button type="submit" class="btn btn-danger">Search</button>
            </div>
        </div>
    </form>

<%--    <form method="GET" action="/searchBookList">--%>
<%--        <label>Search for a book</label>--%>
<%--        <input type="text" name="searchBooklist" value="${searchBooklist}" placeholder="Title, author or keyword..">--%>
<%--        <button type="submit">Search</button>--%>
<%--    </form>--%>
    <hr>
<h3>Search Result:</h3>
  <div class="container">
   <div class="row" justify-content-center">
    <c:forEach  var="book" items="${booksList}">

        <div class="col-3 py-3">
         <div class="card" style="width: 18rem;">
             <a href="/bookDetails?id=${book.id}">
<%--                 <c:if test="${not empty product.imageUrl}">    --%>
            <img class="card-img-top" src="${book.urlImage}" alt="Book image">
<%--                 </c:if>--%>
             </a>
            <div class="card-body">
                <h5 class="card-title">${book.bookName}</h5>
                <h5 class="card-price">${book.price}</h5>
                <a href="/addToCart?id=${book.id}" class="btn btn-primary">Add to cart</a>
            </div>
         </div>
        </div>
        </c:forEach>
       </div>
    </div>

    <div style="color: red">
         <span style="color: red">${error}</span><br>
    </div>
    <%--<section class="py-5">--%>
    <%--    <div class="container px-4 px-lg-5 mt-5">--%>
    <%--        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">--%>

    <%--<c:forEach  var="book" items="${booksList}">--%>


    <%--    <div class="col mb-5">--%>
    <%--        <a class="card h-100">--%>
    <%--        <!-- Book image-->--%>
    <%--        <a href="/bookDetails?id=${book.id}">--%>
    <%--        <img class="card-img-top" src="${book.urlImage} " alt="Book..." /></a>--%>
    <%--        <!-- Book details-->--%>
    <%--        <div class="card-body p-4">--%>
    <%--            <div class="text-center">--%>
    <%--            <!-- Book name-->--%>
    <%--            <h5 class="fw-bolder">${book.bookName} </h5>--%>
    <%--            <!-- Book price-->--%>
    <%--            ${book.price}--%>
    <%--            </div>--%>
    <%--        </div>--%>
    <%--        <!-- Book actions-->--%>
    <%--        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">--%>
    <%--            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>--%>
    <%--        </div>--%>

    <%--    </div>--%>


    <%--</c:forEach>--%>

    <%--</div>--%>
    <%--</div>--%>
    <%--</section>--%>
    <%--<table  class="table table-striped" >--%>
    <%--<tr>--%>

    <%--    <td> Book Name </td>--%>
    <%--    <td> Author Name </td>--%>
    <%--    <td> image url </td>--%>
    <%--    <td> Price </td>--%>
    <%--    <td> Quantity In Stock </td>--%>

    <%--    <td>Edit</td>--%>
    <%--    &lt;%&ndash;            <td>Delete</td>&ndash;%&gt;--%>

    <%--</tr>--%>
    <%--<c:forEach  var="book" items="${booksList}">--%>

    <%--    <tr>--%>

    <%--    <td>  ${book.bookName}  </td>--%>
    <%--    <td>  ${book.author}  </td>--%>
    <%--    <td>  ${book.urlImage}  </td>--%>
    <%--    <td>   ${book.price}  </td>--%>
    <%--    <td>   ${book.quantityInStock} </td>--%>
    <%--    </tr>--%>
    <%--</c:forEach>--%>
    <%--</table>--%>

        <%--      ${book.author}  --%>
    <%--      --%>
    <%--       --%>
    <%--      ${book.quantityInStock} --%>

    <%--    <a href="/bookDetails?id=${book.id}">Edit</a>--%>

    <jsp:include page="../include/footer.jsp" />