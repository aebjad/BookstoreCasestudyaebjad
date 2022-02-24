<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<jsp:include page="../include/header.jsp" />

<link rel="stylesheet" type="text/css" href="/pub/css/style.css">

<h1>My Cart</h1>
<a href="/index" class="continue">Continue Shopping</a>


<hr>

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

<div class="container">

    <c:forEach  var="booklist" items="${booksList}">
        <div class="row" justify-content-center">
<%--        <div class="col-12 py-3">--%>
<%--            <div class="card" style="width: 18rem;">--%>
<%--                <a href="/bookDetails?id=${book.id}">--%>
        <div class="card mb-3" style="max-width: 540px;">
            <div class="row no-gutters">
                <div class="col-md-4">
                    <img class="card-img-top" src="${booklist.book.urlImage}"  alt="Book image">
                        <%--                 </c:if>--%>
<%--                </a>--%>
                </div>
                <div class="col-md-8">
                <div class="card-body">
                    <h5 class="card-title">${booklist.book.bookName}</h5>
                    <h5 class="card-price">$${booklist.book.price}</h5>
                    <h5 class="card-price" ><input type="number" min="1" style="background-color: #dddddd"
                                                   name="quantity" value="${booklist.quantity}"/></h5>
                    <h5><button type="submit" class="btn">Remove</button></h5>
                </div>
                </div>

                </div>
            </div>
       </div>
    </c:forEach>

</div>


<jsp:include page="../include/footer.jsp" />
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

