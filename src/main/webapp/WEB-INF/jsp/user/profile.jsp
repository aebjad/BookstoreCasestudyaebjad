<jsp:include page="../include/header.jsp" />

<link rel="stylesheet" type="text/css" href="/pub/css/style.css">


<div class="bg-dark py-5 bg-img" ></div>
</br><br/>

<div class="container px-4 px-lg-5 h-100">

    <div class="row justify-content-center">
        <div class="col-sm-4">

            <img src="/pub/images/profile.png" class="img-rounded" alt="Book image" style="width: 200px; height: 200px">

        </div>
        <div class="col-sm-4">

<%--    <div class="col-lg-8 align-self-baseline">--%>
        <p class="text-white-75 mb-5">
            <br /><label >Full Name: ${user.firstName}  ${user.lastName}</label>
            <br /><label >Email: ${user.email}</label>
            <br /><label >Address: ${user.address} ${user.city}, ${user.state} ${user.zipCode}</label>

        </p>
        <div>
        <a class="btn btn-dark" style="width: 200px" href="/editUserProfile">Manage Account Setting</a>
            <br /><a class="btn btn-dark btn-xl" style="width: 200px" href="/orderHistory?userId=${user.id}">Purchases History</a>

    </div>
</div>
</div>


<jsp:include page="../include/footer.jsp" />
