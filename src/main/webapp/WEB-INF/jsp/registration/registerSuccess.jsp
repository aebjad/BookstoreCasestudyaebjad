<jsp:include page="../include/header.jsp" />

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

<div  style="justify-content: center">
<%--    <div class="col-md-4 mb-3">--%>
        <div class="card">
            <div class="card-body">
                <div class="d-flex flex-column align-items-center text-center">
                    <img src="/pub/images/giphy.webp" class="img-rounded" alt="Admin" class="rounded-circle" width="350">
                    <div class="mt-3">
                        <h4>Thank you for signing up</h4>
                        <p class="text-secondary mb-1"><a href="/login/login">Sign in</a></p>
                        <br/>
                    </div>
                </div>
            </div>
        </div>

    </div>




<jsp:include page="../include/footer.jsp" />
