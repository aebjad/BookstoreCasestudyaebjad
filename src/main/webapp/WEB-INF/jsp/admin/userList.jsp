<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>


<jsp:include page="../include/header.jsp" />


    <table  class="table table-striped" >
        <tr>

            <td> First Name </td>
            <td> Last Name </td>
            <td> Email </td>
            <td> Address </td>
            <td> City </td>
            <td> State </td>
            <td> Zip Code </td>

<%--            <td>Edit</td>--%>
<%--            <td>Delete</td>--%>

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
<%--            <td><a href="/edit?id=${user.id}">Edit</a></td>--%>
<%--&lt;%&ndash;            <td><a href="/registration-url-path/deleteUser?id=${user.id}">Delete</a></td>&ndash;%&gt;--%>
<%--            <td><a href="/registration-url-path/deleteUser?id=${user.id}">Delete</a></td>--%>

        </tr>
        </c:forEach>
    </table>

<hr>

<form method="GET" action="/admin/userList">
    <label>Search for user</label>
    <input type="text" name="search" value="${search}" placeholder="First name or last name">
    <button type="submit">Search</button>
</form>
<hr>



<jsp:include page="../include/footer.jsp" />