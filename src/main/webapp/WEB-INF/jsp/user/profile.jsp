<jsp:include page="../include/header.jsp" />

<link rel="stylesheet" type="text/css" href="/pub/css/style.css">

<!-- form submission must align with security config see .loginProcessingUrl in Security Config -->


<div class="container px-4 px-lg-5 h-100">
    <div background-image: url("../images/book.jpg")></div>
    <div class="col-lg-8 align-self-baseline">
        <p class="text-white-75 mb-5">
            <br /><label >Full Name: ${user.firstName}  ${user.lastName}</label>
            <br /><label >Email: ${user.email}</label>
            <br /><label >Address: ${user.address} </label>
            <br /><label > ${user.city}, ${user.state} ${user.zipCode}</label>

        </p>
        <a class="btn btn-primary btn-xl" href="/editUserProfile">Manage Account Setting</a>
    </div>
</div>



<jsp:include page="../include/footer.jsp" />
