<%-- to include jstl libraries, to do loop, if statment, etc.. inside jsp page--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<jsp:include page="../include/header.jsp" />

<link rel="stylesheet" type="text/css" href="/pub/css/style.css">


<c:choose>
    <c:when test="${order = shipped}">
        <h1>Purchases History</h1>
    </c:when>
    <c:otherwise>
        <h1>Order Status</h1>
    </c:otherwise>
</c:choose>



<jsp:include page="../include/footer.jsp" />
