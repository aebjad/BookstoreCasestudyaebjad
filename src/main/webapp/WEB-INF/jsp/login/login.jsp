<jsp:include page="../include/header.jsp" />

<link rel="stylesheet" type="text/css" href="/pub/css/style.css">

<!-- form submission must align with security config see .loginProcessingUrl in Security Config -->


   <div  style=" background-color: #21211a;">
    <div class="bg-img2" >

<%--        form action="/login/loginSecurityPost" method="POST" should alwasy be like that--%>
    <form action="/login/loginSecurityPost" method="POST" class="container2">

        <h1 style="color:red">${errorMessage}</h1>

    <h1>Sign In</h1>
    <hr>

<%--        name="username" &  name="password" should always be like that for login to proccess/security--%>
    <br /><label for="email">Email</label>
    <input id="email" type="email" name="username" placeholder="Your Email.."  required/>


    <br /><label for="pass">Password</label>
    <input id="pass" type="password" name="password" placeholder="Your password.." required />

<%--    <label>--%>

<%--    <input type="checkbox" checked="checked" name="remember-me" style="margin-bottom:15px"> Remember me--%>
<%--    </label>--%>

        <div class="container signin">
            <p>Don't have an account? <a href="/register">Sign up</a>.</p>
        </div>
    <button type="submit" class="btn">Sign In</button>


    </form>
    </div></div>
<%--    <div class="video">--%>
<%--    <img  style="border: saddlebrown inset 2px" src="./images/giphy.webp" alt="I Like to read...">--%>
<%--    </div>--%>
<%--    </div>--%>

<jsp:include page="../include/footer.jsp" />
