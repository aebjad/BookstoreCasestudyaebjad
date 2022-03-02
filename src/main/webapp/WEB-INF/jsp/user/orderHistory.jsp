<%-- to include jstl libraries, to do loop, if statment, etc.. inside jsp page--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<jsp:include page="../include/header.jsp" />

<%--<link rel="stylesheet" type="text/css" href="/pub/css/style.css">--%>

<%--<div class="bg-dark py-5 bg-img" ></div>--%>
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
<%--<c:choose>--%>
<%--    <c:when test="${status} = shipped">--%>
<%--        <h1>Purchases History</h1>--%>
<%--    </c:when>--%>
<%--    <c:otherwise>--%>
<%--        <h1>Order Status</h1>--%>
<%--    </c:otherwise>--%>
<%--</c:choose>--%>


<h2>Order History</h2>
<table  class="table table-striped" >
    <tr>

        <td><b> Order # </b> </td>
        <td><b> Status </b> </td>
        <td><b> Shipped Date </b></td>
        <td><b> Book Name</b></td>
        <td><b> Quantity </b> </td>

    </tr>
    <c:forEach  var="order" items="${orders}">

        <tr>

            <td>  ${order.order_id}  </td>
            <td>  ${order.status}  </td>
            <td>  ${order.shipped_date}  </td>
            <td>  ${order.book_name}  </td>
            <td>  ${order.quantity}  </td>

        </tr>
    </c:forEach>
</table>

<div class="pt-5">
    <h6 class="mb-0"><a  href="/profile" class="text-body"><i
            class="fas fa-long-arrow-alt-left me-2"></i>Back</a></h6>
</div>
<hr>
<jsp:include page="../include/footer.jsp" />
