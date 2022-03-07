<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<jsp:include page="../include/header.jsp" />


<div style="min-height: 1000px">
    <div class="bg-img2" >
        <form action="/admin/editBook" class="container2" id="editForm" onsubmit="myFunction3()"  method="POST">
                    <input type="hidden" name="id" value="${formBeanKey.id}">
            <h1>Edit Book</h1>
            <p>Please fill in this form to edit the book information</p>
            <hr>
            <br /><label for="bookName">Book Name</label>
            <input id="bookName" type="text" name="bookName" value="${formBeanKey.bookName}" placeholder="book name.."  required/>

            <br /><label for="author">author Name</label>
            <input id="author" type="text" name="author" value="${formBeanKey.author}" placeholder="Author name.."  />

            <br /><label for="category">Category</label>
            <input id="category" type="text" name="category" value="${formBeanKey.category}" placeholder="Category.."  />

            <br /><label for="description">Description</label>
            <input id="description" type="text" name="description" value="${formBeanKey.description}" placeholder="description.."  />

            <br /><label for="urlImage">Image URL</label>
            <input id="urlImage" type="text" name="urlImage" value="${formBeanKey.urlImage}" placeholder="image url.." />

            <br /><label for="price">Price</label>
            <input id="price" type="number"  step="any" name="price" min="0.00" value="${formBeanKey.price}" placeholder="Price.."  />

            <br /><label for="quantityInStock">Quantity In Stock</label>
            <input id="quantityInStock" type="number" name="quantityInStock" min="0" value="${formBeanKey.quantityInStock}" placeholder="Quantity.."  />

                <button type="submit" class="btn btn-warning" id="myBtn" >Submit</button>
        </form>
    </div>

    <div style="color: red">
        <c:forEach  var="message" items="${formBeanKey.errorMessages}" varStatus="status">
        <span style="color: red">${message}</span><br>

        </c:forEach>
    </div>
</div>

<script>
    document.getElementById("editForm").addEventListener("onsubmit", myFunction3);

    function myFunction3() {
        alert("The book has been updated successfully");
    }
</script>

<jsp:include page="../include/footer.jsp" />