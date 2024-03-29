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

                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Book image-->
                        <a href="/bookDetails?id=22">
                            <img class="card-img-top" src="/pub/images/smile.jpg" alt="Book..." /> </a>
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">Smile</h5>
                                <h6>By Raina Telgemeier</h6>
                                <!-- Product price-->
                                $10.99
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center">
                                <a class=" btn btn-dark active"  href="/addToCart?id=22" onclick="addToCart()">Add to cart</a>
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
                                <h6>By Michelle Obama</h6>
                                <!-- Product price-->
                                <span class=" text-muted text-decoration-line-through">$20.00</span>
                                $18.00
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center">
                                <a class="btn btn-dark active" href="/addToCart?id=8" onclick="addToCart()">Add to cart</a></div>
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
                                <h6>By Laura Driscoll</h6>
                                <!-- Product price-->
                                <span class="text-muted text-decoration-line-through">$10.00</span>
                                $5.00
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center">
                                <a class="btn btn-dark active" href="/addToCart?id=10" onclick="addToCart()">Add to cart</a></div>
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
                                <h6>By Aida Salazar</h6>
                                <!-- Product price-->
                                $14.00
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center">
                                <a class="btn btn-dark active" href="/addToCart?id=14" onclick="addToCart()">Add to cart</a></div>
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
                                <h6>By Laura Driscoll</h6>
                                <!-- Product price-->
                                <span class="text-muted text-decoration-line-through">$10.00</span>
                                $7.99
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center">
                                <a class="btn btn-dark active" href="/addToCart?id=5" onclick="addToCart()">Add to cart</a></div>
                        </div>
                    </div>
                </div>
                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Product image-->
                        <a href="/bookDetails?id=51">
                            <img class="card-img-top" src="/pub/images/aranimals.jpg" alt="Book..." /></a>
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">My First Bilingual Book-Animals</h5>
                                <h6 >By Milet Publishing</h6>
                                <!-- Product price-->
                                $8.99
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center">
                                <a class="btn btn-dark active" href="/addToCart?id=51" onclick="addToCart()">Add to cart</a></div>
                        </div>
                    </div>
                </div>
                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Product image-->
                        <a href="/bookDetails?id=13">
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Out Of Stock</div>
                            <img class="card-img-top" src="/pub/images/humble.jpg" alt="Book..." /></a>
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">Humble Pie</h5>
                                <h6>Gordon Ramsay</h6>
                                <!-- Product price-->
                                $11.25
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center">
                                <a class="btn btn-dark" id="out" href="" onclick="outOfStuck()">Add to cart</a></div>
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
                                <h6>Natalia Rose</h6>
                                <!-- Product price-->
                                $16.99
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center">
                                <a class="btn btn-dark active"  href="/addToCart?id=12" onclick="addToCart()">Add to cart</a></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

<script>
    document.getElementById("out").addEventListener("onclick", outOfStuck);

    function outOfStuck() {
        alert("Sorry, out of stuck");
    }

    document.getElementsByClassName("active").addEventListener("onclick", addToCart);

    function addToCart() {
        alert("The book has been added to your bag");
    }


</script>


    <jsp:include page="./include/footer.jsp" />