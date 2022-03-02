<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<jsp:include page="./include/header.jsp" />


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

    <!-- Section-->
    <section class="py-5">
        <div class="container px-4 px-lg-5 mt-5">
            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

<%--                <span style="color: red">${error}</span><br>--%>

<%--                <c:forEach  var="book" items="${booksList}">--%>

<%--                    <div class="col-3 py-3">--%>
<%--                        <div class="card" style="width: 18rem;">--%>
<%--                            <a href="/bookDetails?id=${book.id}">--%>
<%--                                    &lt;%&ndash;                 <c:if test="${not empty product.imageUrl}">    &ndash;%&gt;--%>
<%--                                <img class="card-img-top" src="${book.urlImage}" alt="Book image" >--%>
<%--                                    &lt;%&ndash;                 </c:if>&ndash;%&gt;--%>
<%--                            </a>--%>
<%--                            <div class="card-body">--%>
<%--                                <h5 class="card-title">${book.bookName}</h5>--%>
<%--                                <h5 class="card-price">${book.price}</h5>--%>
<%--                                <a href="/addToCart?id=${book.id}" class="btn btn-primary">Add to cart</a>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </c:forEach>--%>


                <div class="col mb-5">
                    <div class="card h-25">
                        <!-- Book image-->
                        <a href="/bookDetails?id=22">
                            <img class="card-img-top" src="/pub/images/smile.jpg" alt="Book..." /> </a>
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">Smile</h5>
                                <h6 class="fw-bolder">By Raina Telgemeier</h6>
                                <!-- Product price-->
                                $10.99
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center">
                                <a class=" btn btn-dark"  href="/addToCart?id=22" onclick="myFunction()">Add to cart</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Sale badge-->
                        <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                        <!-- Product image-->
                        <a href="/bookDetails?id=8">
                            <img class="card-img-top" src="/pub/images/b2.jpg" alt="Book..." /></a>
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name/author-->
                                <h5 class="fw-bolder">Becoming</h5>
                                <h6 class="fw-bolder">By Michelle Obama</h6>
                                <!-- Product price-->
                                <span class=" text-muted text-decoration-line-through">$20.00</span>
                                $18.00
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center">
                                <a class="btn btn-dark" href="/addToCart?id=8" onclick="myFunction()">Add to cart</a></div>
                        </div>
                    </div>
                </div>
                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Sale badge-->
                        <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                        <!-- Product image-->
                        <a href="/bookDetails?id=10">
                            <img class="card-img-top" src="/pub/images/b3.jpg" alt="Book..." /></a>
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">
                                    I want to be an engineer</h5>
                                <h6 class="fw-bolder">By Laura Driscoll</h6>
                                <!-- Product price-->
                                <span class="text-muted text-decoration-line-through">$10.00</span>
                                $5.00
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center">
                                <a class="btn btn-dark " href="/addToCart?id=10" onclick="myFunction()">Add to cart</a></div>
                        </div>
                    </div>
                </div>
                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Product image-->
                        <a href="/bookDetails?id=14">
                            <img class="card-img-top" src="/pub/images/b4.jpg" alt="Book..." /></a>
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">In the spirit of a dream</h5>
                                <h6 class="fw-bolder">By Aida Salazar</h6>
                                <!-- Product price-->
                                $14.00
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center">
                                <a class="btn btn-dark" href="/addToCart?id=14" onclick="myFunction()">Add to cart</a></div>
                        </div>
                    </div>
                </div>
                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Sale badge-->
                        <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                        <!-- Product image-->
                        <a href="/bookDetails?id=5">
                            <img class="card-img-top" src="/pub/images/moon.jpg" alt="Book..." /></a>
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">I Love You to the Moon and Back</h5>
                                <h6 class="fw-bolder">By Laura Driscoll</h6>
                                <!-- Product price-->
                                <span class="text-muted text-decoration-line-through">$10.00</span>
                                $7.99
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center">
                                <a class="btn btn-dark" href="/addToCart?id=5" onclick="myFunction()">Add to cart</a></div>
                        </div>
                    </div>
                </div>
                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Sale badge-->
<%--                        <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>--%>
                        <!-- Product image-->
                        <a href="/bookDetails?id=6">
                            <img class="card-img-top" src="/pub/images/animals.jpg" alt="Book..." /></a>
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">If Animals Kissed Goodnight</h5>
                                <h6 class="fw-bolder">By Ann Whitford Paul, David Walker</h6>
                                <!-- Product price-->
                                $7.99
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center">
                                <a class="btn btn-dark" href="/addToCart?id=6" onclick="myFunction()">Add to cart</a></div>
                        </div>
                    </div>
                </div>
                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Sale badge-->
<%--                        <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>--%>
                        <!-- Product image-->
                        <a href="/bookDetails?id=13">
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Out Of Stock</div>
                            <img class="card-img-top" src="/pub/images/humble.jpg" alt="Book..." /></a>
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">Humble Pie</h5>
                                <h6 class="fw-bolder">Gordon Ramsay</h6>
                                <!-- Product price-->
                                $11.25
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center">
                                <a class="btn btn-dark" id="out" href="#" onclick="myFunction2()">Add to cart</a></div>
                        </div>
                    </div>
                </div>
                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Product image-->
                        <a href="/bookDetails?id=12">
                            <img class="card-img-top" src="/pub/images/rawFood.jpg" alt="Book..." /></a>
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">Raw Food Detox Diet </h5>
                                <h6 class="fw-bolder">Natalia Rose</h6>
                                <!-- Product price-->
                                $16.99
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center">
                                <a class="btn btn-dark"  href="/addToCart?id=12" onclick="myFunction()">Add to cart</a></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

<script>
    document.getElementById("out").addEventListener("click", myFunction2);

    function myFunction2() {
        alert("Sorry, out of stuck");
    }

<%--<script>--%>
<%--    document.addEventListener("click", myFunction);--%>

<%--    function myFunction() {--%>
<%--        alert("Book successfully added to your bag");--%>
<%--    }--%>
<%--</script>--%>


    <jsp:include page="./include/footer.jsp" />