<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<jsp:include page="linkai1.jsp" />
<head>
    <title>Pardavimai</title>

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/style.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head>
<body class="bodybakas">
<jsp:include page="nav.jsp" />
<div style="height: 60px">
    <form action="${contextPath}/biudzetas" style="width: 50%;height: 60px;display: inline-block; margin-left: 0;margin-right: 0">
        <select name="metai1" class="browser-default custom-select" style="width: fit-content">
            <option>${pasirinktiMetai}</option>
            <c:forEach items="${metukai}" var="met">
                <c:choose>
                    <c:when test="${met eq pasirinktiMetai}">

                    </c:when>
                    <c:otherwise>
                        <option value="${met}">${met}</option>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </select>
        <input type="submit" value="Submit" class="btn btn-blue-grey">
    </form>
</div>

<div>
    <main class="st_viewport">
<c:forEach var="men" items="${menesiai}">
        <div class="st_wrap_table" data-table_id="${men.key}">
            <header class="st_table_header">
                <h2>${men.value}</h2>
                <div class="st_row">
                    <div class="st_column _menuo">Mėnuo</div>
                    <div class="st_column _ukis">Ūkis</div>
                    <div class="st_column _menesiobiudzetas">Ūkio mėnesio biudžeto</div>
                    <div class="st_column _menesioplanas">Mėnesio pardavimo planas</div>
                    <div class="st_column _menesioaktavimas">Planuojama mėnesio aktavimo suma</div>
                    <div class="st_column _uzaktuotasumafms">Faktiškai užaktuota suma(FMS)</div>
                    <div class="st_column _mygtukai"></div>
                </div>
            </header>
            <div class="st_table">
    <c:forEach items="${biudzetas}" var="biu">
        <c:if test="${biu.menuo eq men.key}">
                <div class="st_row3">
                    <div class="st_column _menuo" >${biu.menuo}</div>
                    <div class="st_column _ukis">${biu.unit}</div>
                    <div class="st_column _menesiobiudzetas">${biu.menesioBiudzetas}</div>
                    <div class="st_column _menesioplanas">${biu.menesioPardavimoPlanas}</div>
                    <div class="st_column _menesioaktavimas">${biu.menesioAktavimoSuma}</div>
                    <div class="st_column _uzaktuotasumafms">${biu.uzaktuotaSumaFMS}</div>
                    <div class="st_column _mygtukai">
                        <c:if test="${principal.contains(biu.unit)}">
                            <button onclick="location.href='?metai1=${pasirinktiMetai}&menuo1=${biu.menuo}&unitasName=${biu.unit}'" class="btn btn-blue-grey btn-sm" style="height:20px; width:40px;padding: 0;margin: 0;">
                                <i class="far fa-edit"></i>
                            </button>
                        </c:if>
                    </div>
                </div>
        </c:if>
    </c:forEach>
            </div>
        </div>
</c:forEach>
    </main>
</div>

<!-- Update Start-->
<div class="modal fade" id="modalUpdate" tabindex="-1" role="dialog" aria-labelledby="myModalUpdate"
     aria-hidden="true" >
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header text-center">
                <h4 class="modal-title w-100 font-weight-bold">Biudzetas</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form:form method="post"  action="${contextPath}/admin/addUpdateBud?metai1=${metai2}&menuo1=${menuo2}&unitasName=${unitas2.name}" modelAttribute="addUpBud" >
                <form:hidden path="id"></form:hidden>
                <form:hidden path="metai"></form:hidden>
                <form:hidden path="menuo"></form:hidden>
                <form:hidden path="businessUnit"></form:hidden>
                <div class="modal-body mx-3">
                    <div class="md-form mb-sm-3">
                        <spring:bind path="menesioBiudzetasUkio">
                            <form:input path="menesioBiudzetasUkio" cssClass="form-control validate" type="text" required="required" autocomplete="off"/>
                        </spring:bind>
                        <label data-error="wrong" data-success="right" for="menesioBiudzetasUkio">menesio Biudzetas Ukio</label>
                    </div>

                    <div class="md-form mb-sm-3">
                        <spring:bind path="faktiskaiUzaktuotaSumaFMS">
                            <form:input path="faktiskaiUzaktuotaSumaFMS" cssClass="form-control validate" type="text" required="required" autocomplete="off"/>
                        </spring:bind>
                        <label data-error="wrong" data-success="right" for="faktiskaiUzaktuotaSumaFMS">faktiskai Uzaktuota Suma FMS</label>
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
    });





</script>

</body>
<script type="text/javascript" src="${contextPath}/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/popper.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/mdb.min.js"></script>
</html>
