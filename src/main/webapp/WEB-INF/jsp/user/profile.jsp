<jsp:include page="../include/header.jsp" />

<%--<link rel="stylesheet" type="text/css" href="/pub/css/style.css">--%>


<div class="bg-dark py-5 bg-img" ></div>
</br><br/>

<%--<div class="container px-4 px-lg-5 h-100">--%>

<%--    <div class="row justify-content-center">--%>
<%--        <div class="col-sm-4">--%>

<%--            <img src="/pub/images/profile.png" class="img-rounded" alt="Book image" style="width: 200px; height: 200px">--%>

<%--        </div>--%>
<%--        <div class="col-sm-4">--%>

<%--&lt;%&ndash;    <div class="col-lg-8 align-self-baseline">&ndash;%&gt;--%>
<%--        <p class="text-white-75 mb-5">--%>
<%--            <br /><label >Full Name: ${user.firstName}  ${user.lastName}</label>--%>
<%--            <br /><label >Email: ${user.email}</label>--%>
<%--            <br /><label >Address: ${user.address} ${user.city}, ${user.state} ${user.zipCode}</label>--%>

<%--        </p>--%>
<%--        <div>--%>
<%--            <a class="btn btn-warning" style="width: 200px" href="/editUserProfile">Manage Account Setting</a></div>--%>
<%--        <div>--%>
<%--            <br /><a class="btn btn-dark btn-xl" style="width: 200px" href="/orderHistory?userId=${user.id}">Purchases History</a>--%>

<%--    </div>--%>
<%--</div>--%>
<%--</div>--%>


<div class="container">
    <div class="main-body">

       <!-- /Breadcrumb -->

        <div class="row gutters-sm">
            <div class="col-md-4 mb-3">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex flex-column align-items-center text-center">
                            <img src="/pub/images/profile.png" class="img-rounded" alt="Admin" class="rounded-circle" width="150">
                            <div class="mt-3">
                                <h4>${user.firstName}  ${user.lastName}</h4>
                                <p class="text-secondary mb-1">${user.city}, ${user.state}</p>
<%--                                <p class="text-muted font-size-sm">Bay Area, San Francisco, CA</p>--%>
<%--                                <button class="btn btn-primary">Follow</button>--%>
<%--                                <button class="btn btn-outline-primary">Message</button>--%>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="col-md-8">
                <div class="card mb-3">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-sm-3">
                                <h6 class="mb-0">Full Name</h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                ${user.firstName}  ${user.lastName}
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <h6 class="mb-0">Email</h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                ${user.email}
                            </div>
                        </div>
                        <hr>

                        <div class="row">
                            <div class="col-sm-3">
                                <h6 class="mb-0">Address</h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                ${user.address} ${user.city}, ${user.state} ${user.zipCode}
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-12">
                                <a class="btn btn-warning" href="/editUserProfile">Account Setting</a>
                            </div>
                            <br />
                            <div class="col-sm-12">
                                <a class="btn btn-dark"   href="/orderHistory?userId=${user.id}">Purchases History</a>
                            </div>
                        </div>
                    </div>
                </div>


        </div>

    </div>
</div>

<jsp:include page="../include/footer.jsp" />
