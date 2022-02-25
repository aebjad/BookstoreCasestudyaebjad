<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<jsp:include page="../include/header.jsp" />


<%--<link rel="stylesheet" type="text/css" href="/pub/css/style.css">--%>
<%--<div class="bg-dark py-5 bg-img" ></div>--%>
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
                        <form action="/updateQuantity" method="get">
                            <c:forEach  var="book" items="${bookList}">

                                <input type="hidden" name="orderBookId" value="${book.id}">
                                <input type="hidden" name="bookId" value="${book.book.id}">
                                    <div class="row mb-4 d-flex justify-content-between align-items-center">
                                        <div class="col-md-2 col-lg-2 col-xl-2">
                                            <img src="${book.book.urlImage}"class="img-fluid rounded-3"
                                                 style="width: 70px; height: 70px" alt="Book image">
                                        </div>
                                        <div class="col-md-3 col-lg-3 col-xl-3">
                                            <h6 class="text-muted">${book.book.bookName}</h6>

                                        </div>
                                        <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
                                            <button class="btn btn-link px-2"
                                                    onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                                                <i class="fas fa-minus"></i>
                                            </button>

                                            <input id="form1" min="0" name="quantity" value="${book.quantity}" type="number"
                                                   class="form-control form-control-sm" />

                                            <button class="btn btn-link px-2"
                                                    onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                                                <i class="fas fa-plus"></i>
                                            </button>
                                        </div>
                                        <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                            <h6 class="mb-0" >$ ${book.book.price}</h6>
                                        </div>
                                        <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                                            <a href="#!" class="text-danger"><i class="fas fa-trash fa-lg"></i></a>
                                        </div>
                                    </div>

                                    <hr class="my-4">
                            </c:forEach>
                     </form>

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
                                        <h5 class="text-uppercase">Total price</h5>
                                        <h5>$ ${totalprice}</h5>
                                    </div>

                                    <button type="button" class="btn btn-dark btn-block btn-lg"
                                            data-mdb-ripple-color="dark">CHECKOUT</button>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<%--<div class="bg-dark py-5 bg-img" ></div>--%>
<%--</br><br/>--%>

<%--<h2>My Cart</h2>--%>
<%--<a href="/searchBookCategory" class="continue">Continue Shopping</a>--%>


<%--<hr>--%>

<%--<div class="container-fluid">--%>
<%--    <div class="row">--%>
<%--    <div class="col-8>--%>
<%--    <c:forEach  var="book" items="${bookList}">--%>
<%--<div class="row justify-content-center">--%>
<%--    <div class="col-sm-4">--%>

<%--        <img src="${book.book.urlImage}" alt="Book image" style="width: 70px; height: 70px">--%>
<%--        <br/>$${book.book.price}--%>
<%--    </div>--%>
<%--    <div class="col-sm-4">--%>
<%--        <br/>${book.book.bookName}--%>
<%--&lt;%&ndash;        <br/> Author: ${booksList.author}&ndash;%&gt;--%>
<%--        <h5  ><input type="number" min="1" style="background-color: #dddddd; width: 70px; border-radius: 10px"--%>
<%--                     name="quantity" value="${book.quantity}"/></h5>--%>
<%--&lt;%&ndash;        <br/> List price: $${booksList.price}&ndash;%&gt;--%>
<%--&lt;%&ndash;        <hr>&ndash;%&gt;--%>
<%--        <a href="/editBookQuantity?id=${book.id}" class="btn btn-danger" style="width: 70px" >Update</a>--%>
<%--        <a href="/removeBookFromCart?id=${book.id}"  class="btn btn-danger" style="width: 70px">Remove</a>--%>


<%--    </div>--%>

<%--</div>--%>
<%--    <hr>--%>
<%--</c:forEach>--%>
<%--</div>--%>
<%--<div class="col-3>--%>

<%--</div>--%>
<%--</div>--%>

<jsp:include page="../include/footer.jsp" />

<%--<div class ="body-cart">--%>
<%--<div class=”Cart-Container”>--%>
<%--    <div class=”Header”>--%>
<%--        <h3 class=”Heading”>Shopping Bag</h3>--%>
<%--        <h5 class=”Action”>Remove all</h5>--%>
<%--    </div>--%>

<%--    <c:forEach var="booklist" items="${booksList}">--%>
<%--    <div class=”Cart-Items”>--%>
<%--        <div class=”image-box”>--%>
<%--            <img src=”${booklist.book.urlImage}” height=”120px”  />--%>
<%--        </div>--%>
<%--        <div class=”about”>--%>
<%--            <h1 class=”title”>${booklist.book.bookName}</h1>--%>
<%--&lt;%&ndash;            <h3 class=”subtitle”>250ml</h3>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <img src=”images/veg.png” style={{ height=”30px” }}/>&ndash;%&gt;--%>
<%--        </div>--%>
<%--        <div class=”counter”></div>--%>
<%--        <div class=”prices”></div>--%>
<%--    </div>--%>

<%--    <div class=”counter”>--%>
<%--        <div class=”btn”>+</div>--%>
<%--        <div class=”count”>${booklist.quantity}</div>--%>
<%--        <div class=”btn”>-</div>--%>
<%--    </div>--%>

<%--    <div class=”prices”>--%>
<%--        <div class=”amount”>${booklist.book.price}</div>--%>
<%--        <div class=”save”><u>Save for later</u></div>--%>
<%--        <div class=”remove”><u>Remove</u></div>--%>
<%--    </div>--%>

<%--</c:forEach>--%>

<%--    <hr>--%>
<%--    <div class=”checkout”>--%>
<%--        <div class=”total”>--%>
<%--            <div>--%>
<%--                <div class=”Subtotal”>Sub-Total</div>--%>
<%--                <div class=”items”>2 items</div>--%>
<%--            </div>--%>
<%--            <div class=”total-amount”>$6.18</div>--%>
<%--        </div>--%>
<%--        <button class=”button”>Checkout</button>--%>
<%--    </div>--%>
<%--</div>--%>
<%--</div>--%>


<%--<div class="cart">--%>
<%--    <!--    <ul class="tableHead">--%>
<%--          <li class="prodHeader">Product</li>--%>
<%--          <li>Quantity</li>--%>
<%--          <li>Total</li>--%>
<%--           <li>Remove</li>--%>
<%--        </ul>-->--%>
<%--    <ul class="cartWrap">--%>
<%--<c:forEach  var="booklist" items="${booksList}">--%>
<%--        <li class="items odd">--%>

<%--            <div class="infoWrap">--%>
<%--                <div class="cartSection">--%>

<%--                    <img src="${booklist.book.urlImage}" height="50" width="50" alt="Book image" class="itemImg" />--%>
<%--&lt;%&ndash;                    <p class="itemNumber">#QUE-007544-002</p>&ndash;%&gt;--%>
<%--                    <h3>${booklist.book.bookName}</h3>--%>

<%--                    <p> <input type="text" value="${booklist.quantity}"/> x ${booklist.book.price}</p>--%>

<%--&lt;%&ndash;                    <p class="stockStatus"> In Stock</p>&ndash;%&gt;--%>
<%--                </div>--%>


<%--                <div class="prodTotal cartSection">--%>
<%--                    <p>${booklist.quantity} x ${booklist.book.price}</p>--%>
<%--                </div>--%>
<%--                <div class="cartSection removeWrap">--%>
<%--                    <a href="#" class="remove">x</a>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </li>--%>
<%--    </c:forEach>--%>
<%--<--%>
<%--    </ul>--%>
<%--</div>--%>


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

