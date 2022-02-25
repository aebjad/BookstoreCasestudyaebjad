<jsp:include page="../include/header.jsp" />

<link rel="stylesheet" type="text/css" href="/pub/css/style.css">


<div class="bg-dark py-5 bg-img" ></div>
</br><br/>

<div class="container px-4 px-lg-5 h-100">
<%--    <div background-image: url("/pub/images/book.jpg")></div>--%>
    <div class="col-lg-8 align-self-baseline">
        <p class="text-white-75 mb-5">
            <br /><label >Full Name: ${user.firstName}  ${user.lastName}</label>
            <br /><label >Email: ${user.email}</label>
            <br /><label >Address: ${user.address} ${user.city}, ${user.state} ${user.zipCode}</label>
<%--            <br /><label > ${user.city}, ${user.state} ${user.zipCode}</label>--%>

        </p>
        <a class="btn btn-primary btn-xl" href="/editUserProfile">Manage Account Setting</a>
    </div>
</div>



<jsp:include page="../include/footer.jsp" />
