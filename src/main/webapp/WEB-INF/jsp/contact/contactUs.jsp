<jsp:include page="../include/header.jsp" />

<div style="  min-height: 700px">
    <div class="bg-img2" >
        <div class="row">

            <div class="column" >

                <form action="/contactUs" class="container2" name="ContactForm" method="POST">
                    <h1>Contact US</h1>
                    <hr>
                    <br /><label for="fullName">Your Name</label>
                    <input type="text" id="fullName" name="fullName" value="${user.firstName} ${user.lastName}"  required/>

                    <br /><label for="email">Email</label>
                    <input id="email" type="email" name="email" value="${user.email}"  pattern="[a-z0-9._%+-]+@[a-z0-9.-]+.[a-z]{2,4}$" required/>

                    <label for="subject">Subject</label>
                    <textarea id="subject" name="subject"  style="height:200px"></textarea>

                    <br />
                    <button type="submit" class="btn btn-warning" id="myBtn2" onclick="contactUs()">Submit</button><br />

                </form>
            </div>

        </div>
    </div>
</div>
    <script>
        document.getElementById("myBtn2").addEventListener("onclick", contactUs);

        function contactUs() {
            alert("Thank you for contacting us, we'll reach you soon.");
        }
    </script>

<jsp:include page="../include/footer.jsp" />
