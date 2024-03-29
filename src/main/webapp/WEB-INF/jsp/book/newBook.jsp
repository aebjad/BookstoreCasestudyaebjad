<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<jsp:include page="../include/header.jsp" />

<div style="min-height: 1000px">
    <div class="bg-img2" >
        <form action="/admin/bookSubmit" class="container2" id="bookForm" onsubmit="myFunction2()"  method="POST">
            <%--        <input type="hidden" name="id" value="${formBeanKey.id}">--%>
            <h1>Add New Book</h1>
            <p>Please fill in this form to add new book</p>
            <hr>
            <label for="bookName">Book Name</label>
            <input id="bookName" type="text" name="bookName" placeholder="book name.."  required/>


                <br /><label for="author">author Name</label>
                <input id="author" type="text" name="author"  placeholder="Author name.."  />

                <br /><label for="category">Category</label>
                <input id="category" type="text" name="category"  placeholder="Category.."  />

                <br /><label for="description">Description</label>
                <input id="description" type="text" name="description"  placeholder="description.."  />

                <br /><label for="urlImage">Image URL</label>
            <input id="urlImage" type="text" name="urlImage"  placeholder="image url.." />

            <br /><label for="price">Price</label>
            <input id="price" type="number"  step="any" name="price" min="0.00" placeholder="Price.."  />

            <br /><label for="quantityInStock">Quantity In Stock</label>
            <input id="quantityInStock" type="number" name="quantityInStock" min="0"  placeholder="Quantity.."  />

                <button type="submit" class="btn btn-warning" id="myBtn"  >Submit</button>

        </form>
    </div>

    <div style="color: red">
        <c:forEach  var="message" items="${formBeanKey.errorMessages}" varStatus="status">
        <span style="color: red">${message}</span><br>

        </c:forEach>
    </div>

<div class="pt-5">
    <h6 class="mb-0"><a  href="/admin/home" class="text-body"><i
            class="fas fa-long-arrow-alt-left me-2"></i>Back to admin page</a></h6>
</div>
</div>
<script>
    document.getElementById("bookForm").addEventListener("onsubmit", myFunction2);

    function myFunction2() {
        alert("The book has been added successfully");
    }
</script>

<jsp:include page="../include/footer.jsp" />