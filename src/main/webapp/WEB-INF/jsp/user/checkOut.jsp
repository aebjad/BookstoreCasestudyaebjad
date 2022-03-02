<%-- to include jstl libraries, to do loop, if statment, etc.. inside jsp page--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<jsp:include page="../include/header.jsp" />


<div class="bg-dark py-5 bg-img" ></div>
<br/><br/>
<div style="text-align:center;">
    <h1>Thank you!</h1>
    <h3>Your Order has been received.</h3>
    <span id="timer"></span></div>
<script type="text/javascript">
    var count = 5;
    var redirect = "/index";
    function countDown(){
        var timer = document.getElementById("timer");
        if(count > 0){
            count--;
            timer.innerHTML = "This page will redirect in "+count+" seconds.";
            setTimeout("countDown()", 1000);
        }else{
            window.location.href = redirect;
        }
    }
    countDown();
</script>


<jsp:include page="../include/footer.jsp" />
