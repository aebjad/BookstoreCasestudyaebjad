<%-- to include jstl libraries, to do loop, if statment, etc.. inside jsp page--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>


<jsp:include page="../include/header.jsp" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<div style="min-height: 1300px">
<div class="bg-img2" >
    <form action="/updateUser" class="container2" id="peForm" onsubmit="myFunction()" method="POST">
        <input type="hidden" name="id" value="${formBeanKey.id}">
        <h1>Account Settings</h1>
        <hr>
        <label for="fName">First Name</label>
        <input id="fName" type="text" name="firstName" value="${formBeanKey.firstName}" placeholder="Your name.."  />

        <label for="lname">Last Name</label>
        <input id="lname" type="text" name="lastName"  value="${formBeanKey.lastName}" placeholder="Your Last name.." />

        <br /><label for="email">Email</label>
        <input id="email" type="email" name="email" placeholder="Your Email.." value="${formBeanKey.email}" disabled/>

        <br /><label for="pass">Password</label>
        <input id="pass" type="password" name="password"  placeholder="Confirm Your password.."  required/>

        <br /><label for="confirmPassword">Confirm Password</label>
        <input id="confirmPassword" type="password" name="confirmPassword" placeholder="Confirm your password.." required />

        <br /><label for="address">Address</label>
        <input id="address" type="text" name="address" value="${formBeanKey.address}" placeholder="Your address.."  />

        <br /><label for="city">City</label>
        <input id="city" type="text" name="city"  value="${formBeanKey.city}" placeholder="Your city.."  />

        <br /><label for="state" class=" control-label">State</label>

        <div>
            <select style="background-color: #f1f1f1" id="state" name="state" value="${formBeanKey.state}">
                <option value="${formBeanKey.state}">${formBeanKey.state}</option>
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

        <br /><label for="zipCode">Zip code</label>
        <input id="zipCode" type="text" name="zipCode" value="${formBeanKey.zipCode}"  pattern="^[0-9]{5}(?:-[0-9]{4})?$" />



        <button type="submit" class="btn btn-warning" id="myBtn2" >Save Changes</button><br />
        <br /><button type="reset" class="btn btn-warning" value="Reset" onclick="location.href ='/profile'">Cancel</button>

    </form>
</div>
</div>

<div style="color: red">
    <c:forEach  var="message" items="${formBeanKey.errorMessages}" varStatus="status">
        <span style="color: red">${message}</span><br>

    </c:forEach>
</div>

<script>
    document.getElementById("peForm").addEventListener("onsubmit", myFunction);

    function myFunction() {
        alert("Your information has been updated");
    }
</script>

<jsp:include page="../include/footer.jsp" />