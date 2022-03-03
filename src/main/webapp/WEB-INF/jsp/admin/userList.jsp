<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>


<jsp:include page="../include/header.jsp" />

<div class="bg-dark py-5 bg-img" ></div>
</br><br/>

    <table  class="table table-striped" >
        <tr>

            <td><b> First Name </b></td>
            <td><b> Last Name </b></td>
            <td><b> Email </b></td>
            <td><b> Address </b></td>
            <td><b> City </b></td>
            <td><b> State </b></td>
            <td><b> Zip Code </b></td>
            <td><b> Order History </b></td>
            <td><b> Order Status </b></td>
<%--            <td><b> Delete User </b></td>--%>


        </tr>
        <c:forEach  var="user" items="${userList}">

        <tr>

            <td>  ${user.firstName}  </td>
            <td>  ${user.lastName}  </td>
            <td>  ${user.email}  </td>
            <td>   ${user.address}  </td>
            <td>   ${user.city} </td>
            <td>   ${user.state} </td>
            <td>  ${user.zipCode} </td>
            <td><a href="/orderHistory?userId=${user.id}">View</a></td>
            <td><a href="/orderStatus?userId=${user.id}">View</a></td>
<%--            <td><a href="/admin/deleteUser?userId=${user.id}">Delete</a></td>--%>

        </tr>
        </c:forEach>
    </table>

<hr>

<form method="GET" action="/admin/userList">
    <label>Search for user</label>
    <input type="text" name="search" style="width: 300px; border-radius: 30px" value="${search}" placeholder="First name or last name">
    <button type="submit" class="btn btn-warning"  style="width: 100px">Search</button>
</form>
<br/>
<div class="pt-5">
    <h6 class="mb-0"><a  href="/admin/home" class="text-body"><i
            class="fas fa-long-arrow-alt-left me-2"></i>Back to admin page</a></h6>
</div>

<br/>
<br/>


<jsp:include page="../include/footer.jsp" />