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

<%--    <div class="row justify-content-center" style="padding-bottom: 20px; padding-left: 30px" >--%>
<%--&lt;%&ndash;        <br/><h3 >Book Details:</h3>&ndash;%&gt; --%>
<%--    </div>--%>
    <div class="row justify-content-center">
        <div class="col-sm-4">
<%--            <br/><h2 >Book Details:</h2>--%>
            <img src="${formBeanKey.urlImage}" class="img-rounded" alt="Book image" style="width: 300px; height: 350px">

        </div>
        <div class="col-sm-4">
            <br/><b>${formBeanKey.bookName}</b>
            <br/> <b>Author:</b>      ${formBeanKey.author}
            <br/><b> List price:</b> $${formBeanKey.price}
            <br/><b> Description: </b><article>${formBeanKey.description}

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