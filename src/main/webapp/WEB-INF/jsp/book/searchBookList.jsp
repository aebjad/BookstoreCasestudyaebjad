    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

    <jsp:include page="../include/header.jsp" />

    <div class="bg-dark py-5 bg-img" ></div>
    </br><br/>
    <h4>Search for a book</h4>
    <form class="form-inline" method="GET" action="/searchBookList">
        <div class="input-group">
            <input type="text" class="form-control" size="50" name="searchBooklist" value="${searchBooklist}" placeholder="Title, author or keyword..">
            <div class="input-group-btn">
                <button type="submit" class="btn btn-warning">Search</button>
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
   <div class="row" justify-content-center>
    <c:forEach  var="book" items="${booksList}">

        <div class="col-3 py-3">
         <div class="card" style="width: 18rem;">
             <a href="/bookDetails?id=${book.id}">
<%--                 <c:if test="${not empty product.imageUrl}">    --%>
            <img class="card-img-top" src="${book.urlImage}" alt="Book image" >
<%--                 </c:if>--%>
             </a>
            <div class="card-body">
                <h5 class="card-title">${book.bookName}</h5>
                <h5 class="card-title">${book.author}</h5>
                <h5 class="card-price">$${book.price}</h5>
                <a href="/addToCart?id=${book.id}" class="btn btn-dark" onclick="myFunction()">Add to cart</a>
            </div>
         </div>
        </div>
        </c:forEach>
       </div>
    </div>


    <div style="color: red">
         <span style="color: red">${error}</span><br>
    </div>

<%--    <script>--%>
<%--        document.getElementsByName("cart").addEventListener("click", myFunction);--%>

<%--        function myFunction() {--%>
<%--            alert("Book successfully added to your bag");--%>
<%--        }--%>
<%--    </script>--%>

    <jsp:include page="../include/footer.jsp" />