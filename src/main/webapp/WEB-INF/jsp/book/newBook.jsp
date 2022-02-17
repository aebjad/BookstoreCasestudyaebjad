<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<jsp:include page="../include/header.jsp" />

<link rel="stylesheet" type="text/css" href="/pub/css/style.css">

<div style=" background-color: #21211a;">
    <div class="bg-img2" >
        <form action="/bookSubmit" class="container2" id="bookForm"  method="POST">
            <%--        <input type="hidden" name="id" value="${formBeanKey.id}">--%>
            <h1>Add New Book</h1>
            <p>Please fill in this form to add new book</p>
            <hr>
            <br /><label for="bookName">Book Name</label>
            <input id="bookName" type="text" name="bookName" placeholder="book name.."  required/>

            <br /><label for="author">Last Name</label>
            <input id="author" type="text" name="author" placeholder="Author name.."  />

            <br /><label for="urlImage">Image URL</label>
            <input id="urlImage" type="text" name="urlImage" placeholder="Image url.." />

            <br /><label for="price">Address</label>
            <input id="price" type="number" name="price" placeholder="Price.."  />

            <br /><label for="quantityInStock">City</label>
            <input id="quantityInStock" type="number" name="quantityInStock" placeholder="Quantity.."  />

                <button type="submit" class="btn" id="myBtn" >Submit</button>
        </form>
    </div>

    <div style="color: red">
        <c:forEach  var="message" items="${formBeanKey.errorMessages}" varStatus="status">
        <span style="color: red">${message}</span><br>

        </c:forEach>
    </div>
</div>


<jsp:include page="../include/footer.jsp" />