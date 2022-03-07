<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<jsp:include page="../include/header.jsp" />

    <!-- Header-->
    <header class="bg-dark py-5 bg-img" >
        <div class="container px-4 px-lg-5 my-5" >
            <div class="text-center text-white">
                <form class="navbar-form navbar-center" action="/searchBookList"  >
                    <div class="input-group">
                        <input type="text" name="searchBooklist" size="50" class="form-control" placeholder="Search by Title, Author or Keyword">
                        <div class="input-group-btn">
                            <button class="btn btn-warning" type="submit">
                                <i class="glyphicon glyphicon-search"></i>  Search
                            </button>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </header>
    </br><br/>

    <h3>Search Result:</h3>
      <div class="container">
       <div class="row" justify-content-center>
        <c:forEach  var="book" items="${booksList}">

            <div class="col-3 py-3">
             <div class="card" style="width: 18rem;">
                 <a href="/bookDetails?id=${book.id}">
                <img class="card-img-top" src="${book.urlImage}" alt="Book image" >
                 </a>
                <div class="card-body">
                    <h5 class="card-title"><b>${book.bookName}</b></h5>
                    <h5 class="card-title">${book.author}</h5>
                    <h5 class="card-price">$${book.price}</h5>
                    <a id="cart2" href="/addToCart?id=${book.id}" class="btn btn-dark" onclick="addToCart()">Add to cart</a>
                </div>
             </div>
            </div>
            </c:forEach>
           </div>
        </div>


        <div style="color: red">
             <span style="color: red">${error}</span><br>
        </div>

        <script>
            document.getElementById("cart2").addEventListener("onclick", addToCart);

            function addToCart() {
                alert("The book has been added to your bag");
            }
        </script>

<jsp:include page="../include/footer.jsp" />