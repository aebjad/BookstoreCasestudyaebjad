<jsp:include page="../include/header.jsp" />


    <div class="bg-img2">
    <form action="/login/loginSecurityPost" method="POST" class="container2">
    <h1>Sign In</h1>
    <hr>

    <br /><label for="email">Email</label>
    <input id="email" type="email" name="email" placeholder="Your Email.."  required/>

    <br /><label for="pass">Password</label>
    <input id="pass" type="password" name="password" placeholder="Your password.." required />

    <label>

    <input type="checkbox" checked="checked" name="remember-me" style="margin-bottom:15px"> Remember me
    </label>

    <button type="submit" class="btn">Sign In</button>

        <h1 style="color:red">${errorMessage}</h1>
    </form>

<%--    <div class="video">--%>
<%--    <img  style="border: saddlebrown inset 2px" src="./images/giphy.webp" alt="I Like to read...">--%>
<%--    </div>--%>
<%--    </div>--%>

<jsp:include page="../include/footer.jsp" />
