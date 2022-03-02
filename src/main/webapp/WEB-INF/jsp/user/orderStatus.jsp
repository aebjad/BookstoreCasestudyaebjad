<%-- to include jstl libraries, to do loop, if statment, etc.. inside jsp page--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<jsp:include page="../include/header.jsp" />



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

<h2>Order Status</h2>

<table  class="table table-striped" >
    <tr>

        <td><b> Order # </b> </td>
        <td><b> Status </b> </td>
        <td><b> Order Date </b></td>
        <td><b> Book Name</b></td>
        <td><b> Quantity </b> </td>

    </tr>
    <c:forEach  var="order" items="${orders}">

        <tr>

            <td>  ${order.order_id}  </td>
            <td>  In Transit  </td>
            <td>  ${order.order_date}  </td>
            <td>  ${order.book_name}  </td>
            <td>  ${order.quantity}  </td>

        </tr>
    </c:forEach>
</table>


<jsp:include page="../include/footer.jsp" />
