<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<jsp:include page="../include/header.jsp" />

<div class="bg-dark py-5 bg-img" ></div>
</br><br/>

<%--    <div class="row justify-content-center" style="padding-bottom: 20px; padding-left: 30px" >--%>
<%--        <br/><h3 >Book Details:</h3>--%>
<%--    </div>--%>
    <div class="row justify-content-center">
        <div class="col-sm-4">
<%--            <br/><h2 >Book Details:</h2>--%>
            <img src="${formBeanKey.urlImage}" class="img-rounded" alt="Book image" style="width: 150px; height: 150px">

        </div>
        <div class="col-sm-4">
            <br/><b>${formBeanKey.bookName}</b>
            <br/> Author: ${formBeanKey.author}
            <br/> List price: $${formBeanKey.price}
          <hr>
            <a href="/addToCart?id=${formBeanKey.id}" class="btn btn-dark">Add to cart</a>


        </div>

    </div>


<div style="color: red">
    <span style="color: red">${error}</span><br>

    <c:forEach  var="message" items="${formBeanKey.errorMessages}" varStatus="status">
        <span style="color: red">${message}</span><br>

    </c:forEach>
</div>


<jsp:include page="../include/footer.jsp" />