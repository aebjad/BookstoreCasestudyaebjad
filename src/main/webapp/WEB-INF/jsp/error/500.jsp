<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<jsp:include page="../include/header.jsp" />

<script>
    $(function() {
        setTimeout(function(){
            $('#loading').removeClass('loading');
        }, 10);
    });
</script>

<style>

    /**/
    :root {
        --main-color: #3E4555;
        --stroke-color: black;

    }
    /**/

    h3 {
        text-align: center;
    }
    h5 {
        margin: 35px auto 35px auto;
        text-align: center;
        color:#C5A47E;
    }
    h3, h5 {
        -webkit-transition: opacity 0.5s linear, margin-top 0.5s linear; /* Safari */
        transition: opacity 0.5s linear, margin-top 0.5s linear;
    }
    .loading h3, .loading h5 {
        margin-top: 0px;
        opacity: 0;
    }
    .gears {
        position: relative;
        margin: 0 auto;
        width: auto; height: 0;
    }
    .gear {
        position: relative;
        z-index: 0;
        width: 120px; height: 120px;
        margin: 0 auto;
        border-radius: 50%;
        background: var(--stroke-color);
    }
    .gear:before{
        position: absolute; left: 5px; top: 5px; right: 5px; bottom: 5px;
        z-index: 2;
        content: "";
        border-radius: 50%;
        background: var(--main-color);
    }
    .gear:after {
        position: absolute; left: 25px; top: 25px;
        z-index: 3;
        content: "";
        width: 70px; height: 70px;
        border-radius: 50%;
        border: 5px solid var(--stroke-color);
        box-sizing: border-box;
        background-color: var(--main-color);
    }
    .gear.one {
        left: -130px;
    }
    .gear.two {
        top: -75px;
    }
    .gear.three {
        top: -235px;
        left: 130px;
    }
    .gear .bar {
        position: absolute; left: -15px; top: 50%;
        z-index: 0;
        width: 150px; height: 30px;
        margin-top: -15px;
        border-radius: 5px;
        background: var(--stroke-color);
    }
    .gear .bar:before {
        position: absolute; left: 5px; top: 5px; right: 5px; bottom: 5px;
        z-index: 1;
        content: "";
        border-radius: 2px;
        background: var(--main-color);
    }
    .gear .bar:nth-child(2) {
        transform: rotate(60deg);
        -webkit-transform: rotate(60deg);
    }
    .gear .bar:nth-child(3) {
        transform: rotate(120deg);
        -webkit-transform: rotate(120deg);
    }
    @-webkit-keyframes clockwise {
        0% { -webkit-transform: rotate(0deg);}
        100% { -webkit-transform: rotate(360deg);}
    }
    @-webkit-keyframes anticlockwise {
        0% { -webkit-transform: rotate(360deg);}
        100% { -webkit-transform: rotate(0deg);}
    }
    @-webkit-keyframes clockwiseError {
        0% { -webkit-transform: rotate(0deg);}
        20% { -webkit-transform: rotate(30deg);}
        40% { -webkit-transform: rotate(25deg);}
        60% { -webkit-transform: rotate(30deg);}
        100% { -webkit-transform: rotate(0deg);}
    }
    @-webkit-keyframes anticlockwiseErrorStop {
        0% { -webkit-transform: rotate(0deg);}
        20% { -webkit-transform: rotate(-30deg);}
        60% { -webkit-transform: rotate(-30deg);}
        100% { -webkit-transform: rotate(0deg);}
    }
    @-webkit-keyframes anticlockwiseError {
        0% { -webkit-transform: rotate(0deg);}
        20% { -webkit-transform: rotate(-30deg);}
        40% { -webkit-transform: rotate(-25deg);}
        60% { -webkit-transform: rotate(-30deg);}
        100% { -webkit-transform: rotate(0deg);}
    }
    .gear.one {
        -webkit-animation: anticlockwiseErrorStop 2s linear infinite;
    }
    .gear.two {
        -webkit-animation: anticlockwiseError 2s linear infinite;
    }
    .gear.three {
        -webkit-animation: clockwiseError 2s linear infinite;
    }
    .loading .gear.one, .loading .gear.three {
        -webkit-animation: clockwise 3s linear infinite;
    }
    .loading .gear.two {
        -webkit-animation: anticlockwise 3s linear infinite;
    }

</style>

<div id="loading" class="loading container backdrop-1 rounded">
    <h3 style="padding-top:40px">Unexpected Server Error</h3>
    <h5><i class="fa fa-frown-open fa-2x icon-color_1"></i></h5>
    <div class="gears">
        <div class="gear one">
            <div class="bar"></div>
            <div class="bar"></div>
            <div class="bar"></div>
        </div>
        <div class="gear two">
            <div class="bar"></div>
            <div class="bar"></div>
            <div class="bar"></div>
        </div>
        <div class="gear three">
            <div class="bar"></div>
            <div class="bar"></div>
            <div class="bar"></div>
        </div>
    </div>
    <div style="padding: 125px"></div>

    <sec:authorize access="hasAnyAuthority('ADMIN')">
        <c:if test="${not empty message}">
            <br />
            <p>${message}</p>
        </c:if>
        <c:if test="${not empty stackTrace}">
            <p>${stackTrace}</p>

        </c:if>
    </sec:authorize>
</div>

<jsp:include page="../include/footer.jsp" />