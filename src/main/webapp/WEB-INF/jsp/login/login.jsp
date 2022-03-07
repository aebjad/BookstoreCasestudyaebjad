<jsp:include page="../include/header.jsp" />


   <div  style="  min-height: 500px">
    <div class="bg-img2" >

        <form action="/login/loginSecurityPost" method="POST" class="container2" >
                <h1 style="color:red">${errorMessage}</h1>

                <h1>Sign In</h1>
                <hr>

                <br /><label for="email">Email</label>
                <input id="email" type="email" name="username"  placeholder="Your Email.." required/>

                <br /><label for="pass">Password</label>
                <input id="pass" type="password" name="password" placeholder="Your password.." required />

                <div class="container signin" style="max-width: 500px;">
                    <p>Don't have an account? <a href="/register">Sign up</a>.</p>
                </div>
            <button type="submit" class="btn btn-warning" style=" padding: 16px 20px;
                border: none; cursor: pointer; width: 100%; opacity: 0.9;">Sign In</button>


           </form>
    </div></div>


<jsp:include page="../include/footer.jsp" />
