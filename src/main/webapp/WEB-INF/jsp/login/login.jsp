<jsp:include page="../include/header.jsp" />

<%--    <%@ include file="resources/header.jsp"--%>
<%--    <%@include>--%>

    <div class="bg-img2">
    <form action="login.html" class="container2">
    <h1>Sign In</h1>
    <hr>

    <br /><label for="email">Email</label>
    <input id="email" type="email" name="email" placeholder="Your Email.." pattern="^[a-z0-9._%+-]+@[a-z0-9.-]+.[a-z]{2,4}$" required/>

    <br /><label for="pass">Password</label>
    <input id="pass" type="password" name="p" placeholder="Your password.." required />

    <label>
    <input type="checkbox" checked="checked" name="remember" style="margin-bottom:15px"> Remember me
    </label>

    <button type="submit" class="btn">Sign In</button>
    </form>

    <div class="video">
    <img  style="border: saddlebrown inset 2px" src="./images/giphy.webp" alt="I Like to read...">
    </div>
    </div>

<jsp:include page="../include/footer.jsp" />
