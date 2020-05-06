<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<jsp:include page="linkai1.jsp" />
<head>
    <title>Title</title>

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/style.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head>
<body class="bodybakas">
<jsp:include page="nav.jsp" />


<spring:url value="${contextPath}/users/addUser" var="ActionUrl" />
<div>
    <button style=" float:right;" onclick="location.href='?userid=new'" class="btn btn-blue-grey" >Pridėti Vartotoją</button>
</div>


<div>
    <main class="st_viewport">
        <div class="st_wrap_table" data-table_id="1">
            <header class="st_table_header">
                <h2>Vartotojai</h2>
                <div class="st_row">
                    <div class="st_column _userid">ID</div>
                    <div class="st_column _username">Vartotojo vardas</div>
                    <div class="st_column _vardas">Vardas</div>
                    <div class="st_column _pavarde">Pavarde</div>
                    <div class="st_column _aktyvus">Aktyvus</div>
                    <div class="st_column _role">Rolė</div>
                    <div class="st_column _imone">Įmonė</div>
                    <div class="st_column _mygtukai3"></div>
                </div>
            </header>
            <div class="st_table">
                <c:if test="${not empty users}">
                    <c:forEach items="${users}" var="us">
                        <div class="st_row2">
                            <div class="st_column _userid">${us.id}</div>
                            <div class="st_column _username">${us.username}</div>
                            <div class="st_column _vardas">${us.vardas}</div>
                            <div class="st_column _pavarde">${us.pavarde}</div>
                            <div class="st_column _aktyvus">${us.active}</div>
                            <div class="st_column _role">
                                <c:forEach items="${us.roles}" var="rol">
                                    ${rol.name}
                                </c:forEach>
                            </div>
                            <div class="st_column _imone">
                                <c:forEach items="${us.unitas}" var="bu">
                                    ${bu.name},
                                </c:forEach>
                            </div>
                            <div class="st_column _mygtukai3">
                                <sec:authorize access="hasRole('ADMIN')">
                                    <button onclick="location.href='?userid=${us.id}'" class="btn btn-blue-grey btn-sm" style="height:20px; width:40px;padding: 0;margin: 0;" >
                                        <i class="far fa-edit"></i>
                                    </button>
                                    <button onclick="location.href='?userid=${us.id}&idtochange=${us.id}'" class="btn btn-blue-grey btn-sm" style="height:20px; width:40px;padding: 0;margin: 0;" >
                                        <i class="fas fa-key"></i>
                                    </button>
                                </sec:authorize>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
            </div>
        </div>
    </main>
</div>

<!-- Update Start-->
<div class="modal fade" id="modalUpdate" tabindex="-1" role="dialog" aria-labelledby="myModalUpdate"
     aria-hidden="true" >
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header text-center">
                <h4 class="modal-title w-100 font-weight-bold">Vartotojas</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form:form method="post"  action="${contextPath}/users/addUser" modelAttribute="useris" >
                <form:hidden path="id"></form:hidden>

                <div class="modal-body mx-3">
                    <div class="md-form mb-sm-3">
                        <spring:bind path="username">
                            <div class="form-group ${status.error ? 'has-error' : ''}">
                            <form:input path="username" cssClass="form-control" type="text" required="required" placeholder="Username" autocomplete="off"/>
                            <form:errors path="username"></form:errors>
                                <c:if test="${not empty ereCreate.getFieldError('username')}">
                                    <div class="ui-state-error-text">Toks vartotojas jau egzistuoja</div>
                                </c:if>
                            </div>
                        </spring:bind>
                    </div>

                    <div class="md-form mb-sm-3">
                        <spring:bind path="vardas">
                            <form:input path="vardas" cssClass="form-control" type="text" required="required" placeholder="First Name" autocomplete="off"/>
                        </spring:bind>
                    </div>

                    <div class="md-form mb-sm-3">
                        <spring:bind path="pavarde">
                            <form:input path="pavarde" cssClass="form-control" type="text" required="required" placeholder="Last Name" autocomplete="off"/>
                        </spring:bind>

                    </div>
 <c:if test="${modalupdate eq false}">
                    <div class="md-form mb-sm-3">
                    <spring:bind path="password">
                        <div class="form-group ${status.error ? 'has-error' : ''}">
                            <form:input type="password" path="password" class="form-control" placeholder="Password"></form:input>
                            <form:errors path="password"></form:errors>
                            <c:if test="${not empty ereCreate.getFieldError('password')}">
                                <div class="ui-state-error-text">Slaptažodį turi sudaryti bent 8 simboliai</div>
                            </c:if>
                        </div>
                    </spring:bind>
                    </div>
                    <div class="md-form mb-sm-3">

                    <spring:bind path="passwordConfirm">
                        <div class="form-group ${status.error ? 'has-error' : ''}">
                            <form:input type="password" path="passwordConfirm" class="form-control" placeholder="Confirm your password"></form:input>
                            <form:errors path="passwordConfirm"></form:errors>
                            <c:if test="${not empty ereCreate.getFieldError('passwordConfirm')}">
                                <div class="ui-state-error-text">Pakartotas slaptažodis nesutampa</div>
                            </c:if>
                        </div>
                    </spring:bind>
                    </div>
</c:if>
                    <c:if test="${modalupdate eq true}">
                        <form:hidden path="password"></form:hidden>
                        <form:hidden path="passwordConfirm"></form:hidden>
                    </c:if>

                    <div class="md-form mb-sm-3">
                    <spring:bind path="roles">
                        <div class="form-group ${status.error ? 'has-error' : ''}">
                            <form:select type="text" path="roles" class="form-control">

                                <form:options items="${rolesvisos}" itemValue="id" itemLabel="name"/>

                            </form:select>

                        </div>

                    </spring:bind>
                    </div>
                    <div class="md-form mb-sm-3">
                    <spring:bind path="unitas">
                        <div class="form-group ${status.error ? 'has-error' : ''}">
                            <form:select multiple="multiple" type="text" path="unitas" class="form-control">
                                <form:options items="${unitaivisi}" itemValue="id" itemLabel="name"/>
                            </form:select>
                        </div>
                    </spring:bind>
                    </div>
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <button class="btn btn-deep-orange" type="submit"> Save </button>
                </div>
            </form:form>
        </div>
    </div>
</div>
<!-- Update END -->
<!-- Change pass Start-->
<div class="modal fade" id="modalChangePass" tabindex="-1" role="dialog" aria-labelledby="myModalUpdate"
     aria-hidden="true" >
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header text-center">
                <h4 class="modal-title w-100 font-weight-bold">Pakeisti slaptažodį</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form:form method="post"  action="${contextPath}/changePassword" modelAttribute="changepassform" >
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
                                    <form:input type="password" path="passwordConfirm2" class="form-control"
                                                placeholder="Confirm your password"></form:input>
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
        </div>
    </div>
</div>
<!-- Change pass END -->


<script>
    $(document).ready(function () {
        $('#dtHorizontalVerticalExample').DataTable({
            "scrollX": true,
            "scrollY": true,
        });
        $('.dataTables_length').addClass('bs-select');
    });

    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
    })


    $(window).on('load',function(){
        if(${modaladd} === true) {
            $('#modalUpdate').modal('show');

        }
        if(${modalupdate} === true) {
            $('#modalUpdate').modal('show');
        }
        if(${modalchangepass} === true){
            $('#modalChangePass').modal('show');
        }
    });



</script>
<script type="text/javascript" src="${contextPath}/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/popper.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/mdb.min.js"></script>
</body>
</html>