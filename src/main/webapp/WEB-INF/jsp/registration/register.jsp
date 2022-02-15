<%-- to include jstl libraries, to do loop, if statment, etc.. inside jsp page--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>


<jsp:include page="../include/header.jsp" />

<style>
    /* Full-width input fields */
    input[type=text], input[type=password], input[type=email] {
        width: 100%;
        padding: 15px;
        margin: 5px 0 22px 0;
        border: none;
        background: #f1f1f1;
    }

    input[type=text]:focus, input[type=password]:focus, input[type=email]:focus {
        background-color: #ddd;
        outline: none;
    }

    /* Set a style for the submit button */
    .btn {
        background-color: #04AA6D;
        color: white;
        padding: 16px 20px;
        border: none;
        cursor: pointer;
        width: 100%;
        opacity: 0.9;
    }

    .btn:hover {
        opacity: 1;
    }
</style>

<div class="bg-img2">
    <form action="/user/profile" class="container2" id="suForm" onsubmit="myFunction()" method="POST">
        <input type="hidden" name="id" value="${formBeanKey.id}">
        <h1>Sign Up</h1>
        <p>Please fill in this form to create an account.</p>
        <hr>
        <br /><label for="fName">First Name</label>
        <input id="fName" type="text" name="firstName" placeholder="Your name.."  required/>
        <!--      first name pattern      pattern="^[A-Z][a-z]+$"-->
        <br /><label for="lname">Last Name</label>
        <input id="lname" type="text" name="lastName" placeholder="Your Last name.."  required/>
        <!--          last name pattren   pattern="^[A-Z][a-z]+$"-->
        <br /><label for="email">Email</label>
        <input id="email" type="email" name="email" placeholder="Your Email.." pattern="[a-z0-9._%+-]+@[a-z0-9.-]+.[a-z]{2,4}$"   required/>
        <!--              pattern="^[A-Za-z0-9+_.-]+@(.+)[a-z]{2,4}$"-->
        <br /><label for="pass">Password</label>
        <input id="pass" type="password" name="password" placeholder="Your password.." required />

        <br /><label for="confirmPassword">Confirm Password</label>
        <input id="confirmPassword" type="password" name="confirmPassword" placeholder="Confirm your password.." required />

        <br /><label for="address">Address</label>
        <input id="address" type="text" name="address" placeholder="Your address.."  />

        <br /><label for="city">City</label>
        <input id="city" type="text" name="city" placeholder="Your city.."  />

        <!--            //<div class="form-group">-->
        <br /><label for="state" class=" control-label">State</label>
        <!--               <label for="state" class="col-sm-2 control-label">State</label> <div class="col-sm-10">  class="form-control-->
        <div>
            <select style="background-color: #f1f1f1" id="state" name="state">
                <option value="">N/A</option>
                <option value="AK">Alaska</option>
                <option value="AL">Alabama</option>
                <option value="AR">Arkansas</option>
                <option value="AZ">Arizona</option>
                <option value="CA">California</option>
                <option value="CO">Colorado</option>
                <option value="CT">Connecticut</option>
                <option value="DC">District of Columbia</option>
                <option value="DE">Delaware</option>
                <option value="FL">Florida</option>
                <option value="GA">Georgia</option>
                <option value="HI">Hawaii</option>
                <option value="IA">Iowa</option>
                <option value="ID">Idaho</option>
                <option value="IL">Illinois</option>
                <option value="IN">Indiana</option>
                <option value="KS">Kansas</option>
                <option value="KY">Kentucky</option>
                <option value="LA">Louisiana</option>
                <option value="MA">Massachusetts</option>
                <option value="MD">Maryland</option>
                <option value="ME">Maine</option>
                <option value="MI">Michigan</option>
                <option value="MN">Minnesota</option>
                <option value="MO">Missouri</option>
                <option value="MS">Mississippi</option>
                <option value="MT">Montana</option>
                <option value="NC">North Carolina</option>
                <option value="ND">North Dakota</option>
                <option value="NE">Nebraska</option>
                <option value="NH">New Hampshire</option>
                <option value="NJ">New Jersey</option>
                <option value="NM">New Mexico</option>
                <option value="NV">Nevada</option>
                <option value="NY">New York</option>
                <option value="OH">Ohio</option>
                <option value="OK">Oklahoma</option>
                <option value="OR">Oregon</option>
                <option value="PA">Pennsylvania</option>
                <option value="PR">Puerto Rico</option>
                <option value="RI">Rhode Island</option>
                <option value="SC">South Carolina</option>
                <option value="SD">South Dakota</option>
                <option value="TN">Tennessee</option>
                <option value="TX">Texas</option>
                <option value="UT">Utah</option>
                <option value="VA">Virginia</option>
                <option value="VT">Vermont</option>
                <option value="WA">Washington</option>
                <option value="WI">Wisconsin</option>
                <option value="WV">West Virginia</option>
                <option value="WY">Wyoming</option>
            </select>
        </div>
        <!--            </div>-->


        <br /><label for="zipCode">Zip code</label>
        <input id="zipCode" type="text" name="zipCode"  pattern="^[0-9]{5}(?:-[0-9]{4})?$" />

        <div class="container signin">
            <p>Already have an account? <a href="login.html">Sign in</a>.</p>
        </div>

        <button type="submit" class="btn" id="myBtn" >Register</button>
    </form>
</div>

<script>
    document.getElementById("suForm").addEventListener("onsubmit", myFunction);

    function myFunction() {
        alert("Thank you for signing up");
    }
</script>