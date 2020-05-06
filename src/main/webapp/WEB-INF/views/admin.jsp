<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<jsp:include page="linkai1.jsp" />
<head>
    <meta charset="utf-8">
    <title>Admin</title>

</head>

<body class="bodybakas">
<div>
<jsp:include page="nav.jsp" />
</div>
<div >

        <div class="container">

                <h2>Welcome Adminas </h2>

        </div>

</div>
</body>



<script type="text/javascript" src="${contextPath}/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/popper.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/mdb.min.js"></script>
</html>