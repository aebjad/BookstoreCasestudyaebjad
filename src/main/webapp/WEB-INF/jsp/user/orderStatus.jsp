<%-- to include jstl libraries, to do loop, if statment, etc.. inside jsp page--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<jsp:include page="../include/header.jsp" />

<link rel="stylesheet" type="text/css" href="/pub/css/style.css">

<div class="bg-dark py-5 bg-img" ></div>
</br><br/>

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
            <td>  ${order.status}  </td>
            <td>  ${order.order_date}  </td>
            <td>  ${order.book_name}  </td>
            <td>  ${order.quantity}  </td>

        </tr>
    </c:forEach>
</table>

<jsp:include page="../include/footer.jsp" />
