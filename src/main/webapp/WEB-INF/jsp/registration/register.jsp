<%-- to include jstl libraries, to do loop, if statment, etc.. inside jsp page--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>


<jsp:include page="../include/header.jsp" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


<div style="min-height: 1000px">
<div class="bg-img2" >
<%--//onsubmit="myFunction()"--%>


    <form action="/registerSubmit" class="container2" id="suForm"  method="POST">

        <h1>Sign Up</h1>
        <p>Please fill in this form to create an account.</p>
        <hr>
        <input id="fName" type="text" name="firstName" value="${formBeanKey.firstName}" placeholder="Your name.."  required/>

        <input id="lname" type="text" name="lastName"  value="${formBeanKey.lastName}" placeholder="Your Last name.."  required/>

        <input id="email" type="email" name="email" placeholder="Your Email.." value="${formBeanKey.email}" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+.[a-z]{2,4}$"   required/>

        <input id="pass" type="password" name="password" placeholder="Your password.." required />

        <input id="confirmPassword" type="password" name="confirmPassword" placeholder="Confirm your password.." required />

        <input id="address" type="text" name="address" value="${formBeanKey.address}" placeholder="Your address.."  />

        <input id="city" type="text" name="city"  value="${formBeanKey.city}" placeholder="Your city.."  />

        <div>
            <select style="background-color: #f1f1f1" id="state" name="state" value="${formBeanKey.state}">
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

        <input id="zipCode" type="text" name="zipCode" value="${formBeanKey.zipCode}" placeholder="Zip Code" pattern="^[0-9]{5}(?:-[0-9]{4})?$" />

        <div class="container signin" style="max-width: 500px;">
            <p>Already have an account? <a href="/login/login">Sign in</a>.</p>
        </div>

        <button type="submit" class="btn btn-warning" id="myBtn" style=" padding: 16px 20px;
        border: none; cursor: pointer; width: 100%; opacity: 0.9;" >Register</button>
    </form>
</div>
    <div style="color: red">
        <c:forEach  var="message" items="${formBeanKey.errorMessages}" varStatus="status">
            <span style="color: red">${message}</span><br>

        </c:forEach>
    </div>
</div>



<script>
    document.getElementById("suForm").addEventListener("onsubmit", myFunction);

    function myFunction() {
        alert("Thank you for signing up");
    }
</script>

<jsp:include page="../include/footer.jsp" />