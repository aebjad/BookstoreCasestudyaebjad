<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<jsp:include page="../include/header.jsp" />


    <div class="row justify-content-center">
        <br/><h1>${formBeanKey.bookName}</h1>
    </div>
    <div class="row justify-content-center">
        <div class="col-sm-4">

            <img src="${formBeanKey.urlImage}" alt="Book image" height="300px">

        </div>
        <div class="col-sm-4">
            <br/>${formBeanKey.bookName}
            <br/> Author: ${formBeanKey.author}
            <br/> List price: $${formBeanKey.price}
          <hr>
            <a href="/addToCart?id=${formBeanKey.id}" class="btn btn-primary">Add to cart</a>


        </div>

    </div>


<div style="color: red">
    <span style="color: red">${error}</span><br>

    <c:forEach  var="message" items="${formBeanKey.errorMessages}" varStatus="status">
        <span style="color: red">${message}</span><br>

    </c:forEach>
</div>


<jsp:include page="../include/footer.jsp" />