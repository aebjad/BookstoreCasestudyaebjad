<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>


<jsp:include page="../include/header.jsp" />


    <table cellspacing="7" >
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



<jsp:include page="../include/footer.jsp" />