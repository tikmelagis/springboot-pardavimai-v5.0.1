
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<jsp:include page="linkai1.jsp" />
<nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #233556; box-shadow: #0b0705;">

    <!-- Navbar brand -->
    <a class="navbar-brand" style="text-shadow: 0 0 3px #00bcff;" href="${contextPath}/">CIVINITY</a>

    <!-- Collapse button -->
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#basicExampleNav"
            aria-controls="basicExampleNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <!-- Collapsible content -->
    <div class="collapse navbar-collapse" id="basicExampleNav">

        <!-- Links -->
        <ul class="navbar-nav mr-auto">

<sec:authorize access="hasRole('USER')">
            <li class="nav-item">
                <a class="nav-link" href="${contextPath}/pardavimolent">Pardavimų Lentelė
                    <span class="sr-only">(current)</span>
                </a>
            </li>

</sec:authorize>
<sec:authorize access="hasAnyRole('ADMIN','SUPERUSER')">
            <li class="nav-item">
                <a class="nav-link" href="${contextPath}/biudzetas">Bendra Lentele</a>
            </li>
</sec:authorize>
            <sec:authorize access="hasAnyRole('SUPERUSER')">
                <li class="nav-item">
                    <a class="nav-link" href="${contextPath}/admin/pardavimolent">Pardavimų Lentelės</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${contextPath}/users">Vartotojai</a>
                </li>
            </sec:authorize>

            <!-- Dropdown -->
<sec:authorize access="hasRole('ADMIN')">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">ADMIN</a>
                <div class="dropdown-menu dropdown-primary" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item" href="${contextPath}/admin/home">Pagrindinis puslapis</a>
                    <a class="dropdown-item" href="${contextPath}/admin/pardavimolent">Pardavimų lentelės</a>
                    <a class="dropdown-item" href="${contextPath}/users">Vartotojai</a>

                </div>
            </li>
</sec:authorize>
            <li class="nav-item" style="position: absolute;right:100px">
                <a class="nav-link" href="#"><sec:authentication property="principal.username" /></a>
            </li>
            <li class="nav-item" style="position: absolute;right:20px;width: 120px">
            <c:if test="${pageContext.request.userPrincipal.name != null}">
                <form id="logoutForm" method="POST" action="${contextPath}/logout" style="position: absolute">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </form>

                <a onclick="document.forms['logoutForm'].submit()" style="color: white; position: absolute; right: 0px;text-shadow: 0 0 5px #00bcff;" class="nav-link">Logout</a>
            </c:if>
            </li>
        </ul>
    </div>
    <!-- Collapsible content -->

</nav>



