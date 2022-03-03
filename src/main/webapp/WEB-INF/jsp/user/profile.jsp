<jsp:include page="../include/header.jsp" />

<%--<link rel="stylesheet" type="text/css" href="/pub/css/style.css">--%>


<%--<div class="bg-dark py-5 bg-img" ></div>--%>
<!-- Header-->
<header class="bg-dark py-5 bg-img" >
    <div class="container px-4 px-lg-5 my-5" >
        <div class="text-center text-white">
            <form class="navbar-form navbar-center" action="/searchBookList"  >
                <div class="input-group">
                    <input type="text" name="searchBooklist" size="50" class="form-control" placeholder="Search by Title, Author or Keyword">
                    <div class="input-group-btn">
                        <button class="btn btn-warning" type="submit">
                            <i class="glyphicon glyphicon-search"></i>  Search
                        </button>
                    </div>
                </div>

            </form>
        </div>
    </div>
</header>
</br><br/>


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
                                                                <br/>
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
                            <div class="col-sm-6">
                                <a class="btn btn-dark" href="/editUserProfile">Account Setting</a>
                            </div>
                            <br />
                            <div class="col-sm-6">
                                <a class="btn btn-dark"   href="/orderHistory?userId=${user.id}">Purchases History</a>
                            </div>
                        </div>
                    </div>
                </div>


        </div>

    </div>
</div>

<jsp:include page="../include/footer.jsp" />
