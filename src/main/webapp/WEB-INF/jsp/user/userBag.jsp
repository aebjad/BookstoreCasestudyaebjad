<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<jsp:include page="../include/header.jsp" />



<%--<link rel="stylesheet" type="text/css" href="/pub/css/style.css">--%>
<%--<div class="bg-dark py-5 bg-img" ></div>--%>

<span style="color: red">${error}</span><br>

<section class="h-100 h-custom" style="background-color: white;">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-12">
                <div   style="border-radius: 15px;">
                    <div class="card-body p-0">
                        <div class="row g-0">
                            <div class="col-lg-8">
                                <div class="p-5">
                                    <div class="d-flex justify-content-between align-items-center mb-5">
                                        <h1 class="fw-bold mb-0 text-black">Shopping Cart</h1>
<%--                                        <h6 class="mb-0 text-muted">3 items</h6>--%>
                                    </div>
                                    <hr class="my-4">

                            <c:forEach  var="book" items="${bookList}">


                                    <div class="row mb-4 d-flex justify-content-between align-items-center">
                                        <div class="col-md-2 col-lg-2 col-xl-2">
                                            <img src="${book.book.urlImage}"class="img-fluid rounded-3"
                                                 style="width: 70px; height: 70px" alt="Book image">
                                        </div>
                                        <div class="col-md-3 col-lg-3 col-xl-3">
                                            <h6 class="text-muted">${book.book.bookName}</h6>

                                        </div>

                                        <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
                                          <form action="/lowerQuantity" method="get">
                                              <input type="hidden" name="orderBookId" value="${book.id}">
                                            <button class="btn btn-link px-2"
                                                    onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                                                <i class="fas fa-minus"></i>
                                            </button>
                                              <input min="1" name="quantity" value="${book.quantity}"
                                                     type="number" class="form-control form-control-sm" style="width: 60px" />

                                          </form>

                                            <form action="/increaseQuantity" method="get">
                                              <input type="hidden" name="orderBookId" value="${book.id}">
                                            <button class="btn btn-link px-2"
                                                    onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                                                <i class="fas fa-plus"></i>
                                            </button>
                                          </form>
                                        </div>
                                        <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                            <h6 class="mb-0" >$ ${book.book.price}</h6>
                                        </div>

                                           <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                                             <a class="text-danger" href="/deleteOrderBook?orderBookId=${book.id}">
                                                 <i class="fas fa-trash fa-lg"></i></a>
                                           </div>

                                    </div>

                                    <hr class="my-4">
                            </c:forEach>

                                    <div class="pt-5">
                                        <h6 class="mb-0"><a  href="/searchBookCategory" class="text-body"><i
                                                class="fas fa-long-arrow-alt-left me-2"></i>Back to shop</a></h6>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 bg-grey">
                                <div class="p-5">
                                    <h3 class="fw-bold mb-5 mt-2 pt-1">Summary</h3>
                                    <hr class="my-4">

                                    <div class="d-flex justify-content-between mb-4">
                                        <h5 class="text-uppercase">Books </h5>
                                        <h5 step=".01">$ ${total}</h5>
                                    </div>

                                    <h5 class="text-uppercase mb-3">Shipping + Tax</h5>

                                    <hr class="my-4">

                                    <div class="d-flex justify-content-between mb-5">
                                        <h5 class="text-uppercase"><b>Total price</b></h5>
                                        <h5><b>$ ${totalprice}</b></h5>
                                    </div>

                                    <a href="/checkOut?orderId=${orderId}" class="btn btn-dark btn-block btn-lg"
                                       data-mdb-ripple-color="dark"  role="button">CHECKOUT</a>
<%--                                    <button type="button" class="btn btn-dark btn-block btn-lg"--%>
<%--                                            data-mdb-ripple-color="dark">CHECKOUT</button>--%>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<jsp:include page="../include/footer.jsp" />



<%--<div class="subtotal cf">--%>
<%--    <ul>--%>
<%--        <li class="totalRow"><span class="label">Subtotal</span><span class="value">$35.00</span></li>--%>

<%--        <li class="totalRow"><span class="label">Shipping</span><span class="value">$5.00</span></li>--%>

<%--        <li class="totalRow"><span class="label">Tax</span><span class="value">$4.00</span></li>--%>
<%--        <li class="totalRow final"><span class="label">Total</span><span class="value">$44.00</span></li>--%>
<%--        <li class="totalRow"><a href="#" class="btn continue">Checkout</a></li>--%>
<%--    </ul>--%>
<%--</div>--%>
<%--</div>--%>

<%--<script>--%>
<%--    // Remove Items From Cart--%>
<%--    $('a.remove').click(function(){--%>
<%--        event.preventDefault();--%>
<%--        $( this ).parent().parent().parent().hide( 400 );--%>

<%--    })--%>

<%--    // Just for testing, show all items--%>
<%--    $('a.btn.continue').click(function(){--%>
<%--        $('li.items').show(400);--%>
<%--    })--%>
<%--</script>--%>

<%--<h1>My Shopping Bag</h1>--%>

