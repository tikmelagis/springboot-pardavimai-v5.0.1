<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>

<head>
    <title>Slaptažodžio keitimas</title>

    <style>
        ::placeholder { /* Chrome, Firefox, Opera, Safari 10.1+ */
            color: white !important;
            opacity: 1; /* Firefox */
        }

        :-ms-input-placeholder { /* Internet Explorer 10-11 */
            color: white;
        }

        ::-ms-input-placeholder { /* Microsoft Edge */
            color: white;
        }

        .form-control{
            color: white !important;
        }
    </style>
</head>
<body class="bodybakas">
<jsp:include page="nav.jsp" />


<form:form method="post"  action="${contextPath}/changePasswordUser" modelAttribute="changepassform" >
    <form:hidden path="id2" ></form:hidden>
    <div class="modal-body mx-3">
        <div class="md-form mb-sm-3">
            <spring:bind path="password2">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="password" path="password2" class="form-control" placeholder="Password"></form:input>
                    <form:errors path="password2"></form:errors>
                    <c:if test="${not empty ere.getFieldError('password2')}">
                        <div class="ui-state-error-text">Slaptažodį turi sudaryti bent 8 simboliai</div>
                    </c:if>
                </div>

            </spring:bind>
        </div>
        <div class="md-form mb-sm-3">
            <spring:bind path="passwordConfirm2">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="password" path="passwordConfirm2" class="form-control" placeholder="Confirm your password"></form:input>
                    <form:errors path="passwordConfirm2"></form:errors>
                    <c:if test="${not empty ere.getFieldError('passwordConfirm2')}">
                        <div class="ui-state-error-text">Pakartotas slaptažodis nesutampa</div>
                    </c:if>
                </div>
            </spring:bind>
        </div>

    </div>
    <div class="modal-footer d-flex justify-content-center">
        <button class="btn btn-deep-orange" type="submit"> Save </button>
    </div>
</form:form>

</body>
</html>
