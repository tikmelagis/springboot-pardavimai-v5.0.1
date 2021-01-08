<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Pardavimas</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/style.css">

</head>
<body class="bodybakas">
<jsp:include page="nav.jsp" />

<div class="pardavimo_info">
    <div class="pardavimo_infoV1">
        <h6><b>Objekto pavadinimas:</b> ${pardavimas.objektoPavadinimas}</h6>
        <h6><b>Sprendimo priėmimo būdas:</b> ${pardavimas.sprendimoPriemimoBudas}</h6>
        <h6><b>Sprendimo priėmimo data (planuojama):</b> ${pardavimas.sprendimoPriemimoData}</h6>
        <h6><b>Darbų tipas:</b> ${pardavimas.darbuTipas}</h6>
        <h6><b>Darbų pavadinimas:</b> ${pardavimas.darbuPavadinimas}</h6>
        <h6><b>Pristatumų darbų kaina (preliminari):</b> ${pardavimas.pristatomuDarbuKainaPreliminari}</h6>
    </div>
    <div class="pardavimo_infoV2">
        <h6><b>Pagrindas (patvirtintas):</b> ${pardavimas.pagrindasPatvirtintas}</h6>
        <h6><b>Pasirinktas rangovas:</b> ${pardavimas.pasirinktasRangovas}</h6>
        <h6><b>Sutartinė suma (tiksli):</b> ${pardavimas.sutartineSumaTiksli}</h6>
        <h6><b>Planuojama atlikimo data:</b> ${pardavimas.planuojamaAtlikimoData}</h6>
        <h6><b>FMS Ticket ID:</b> <a href="https://fms.civinity.lt/tickets/view/${pardavimas.ticketFMSid}">${pardavimas.ticketFMSid}</a></h6>
<c:if test="${not empty pardavimas.planuojamaAtlikimoData2}">
        <h6><b>Sutartinė suma (tiksli) (Dalinimas):</b> ${pardavimas.sutartineSumaTiksli2}</h6>
        <h6><b>Planuojama atlikimo data (Dalinimas):</b> ${pardavimas.planuojamaAtlikimoData2}</h6>
        <h6><b>FMS Ticket ID (Dalinimas):</b> <a href="https://fms.civinity.lt/tickets/view/${pardavimas.ticketFMSid2}">${pardavimas.ticketFMSid2}</a></h6>
</c:if>
    </div>
</div>



<div>
    <div class="komentaru_skiltis">
        <div style=" height:40px; background: #243555">
            <h6 style=" padding: 10px; color: white">Komentarai:</h6>
        </div>
    <c:if test="${not empty komentarai}">
        <c:forEach items="${komentarai}" var="kom">
           <div class="komentaras">
               <div>
                   <b>${kom.vartotojas.vardas} ${kom.vartotojas.pavarde}</b> <i style="font-size: 10px">(${kom.komentaroData})</i>
                   <button style="float:right; " onclick="location.href='${contextPath}/viewPardavimas/${pardavimas.id}?responsekomentaras=${kom.id}'" class="btn btn-sm btn-blue-grey" >Komentuoti įrašą</button>
               </div>
               <div>
                       ${kom.komentaras}
               </div>
           </div>
            <c:if test="${not empty kom.responseKomentarasList}" >
                <c:forEach items="${kom.responseKomentarasList}" var="respkom">
                    <div class="respone">
                        <div>
                            <b>${respkom.vartotojas.vardas} ${respkom.vartotojas.pavarde}</b> <i style="font-size: 10px">(${respkom.komentaroData})</i>
                        </div>
                        <div>
                                ${respkom.komentaras}
                        </div>
                    </div>
                </c:forEach>
            </c:if>

        </c:forEach>
    </c:if>
        <div class="komentaru_footeris" >
            <button style="float:left;" onclick="location.href='${contextPath}/viewPardavimas/${pardavimas.id}?komentaras=new'" class="btn btn-sm btn-blue-grey" >Prideti komentara</button>
        </div>
    </div>

    <div class="attachment_skiltis">
        <div style="height: 40px;background-color: rgba(255, 255, 255, 0.70);width:100%;">
            <div style="padding: 10px; float: left; height:40px">
                <h6 style="color: #243555">Dokumentai:</h6>
            </div>
            <div style="float:right; height:40px">
                <button   onclick="location.href='${contextPath}/viewPardavimas/${pardavimas.id}?attachmentas=new'" class="btn btn-sm btn-blue-grey" >Prideti faila</button>
            </div>
        </div>
        <table class="table-bonas">
            <thead class="table-headas">
            <tr>
                <th class="table-headas-txt">ID</th>
                <th class="table-headas-txt">Pavadinimas</th>
                <th class="table-headas-txt">Dokumentas</th>
                <th class="table-headas-txt">Aprašymas</th>
                <th class="table-headas-txt">Įkėlimo Data</th>
                <th class="table-headas-txt">Įkėlęs Vartotojas</th>
                <th class="table-headas-txt"></th>
            </tr>
            </thead>
            <tbody>
        <c:if test="${not empty attachmentai}">
            <c:forEach items="${attachmentai}" var="att">
            <tr class="lentelesRow" style="border-top: gray solid 1px">
                <td class="lentelesCellAtt">${att.id}</td>
                <td class="lentelesCellAtt">${att.title}</td>
                <td class="lentelesCellAtt"><a href="${contextPath}/getpdf/${att.id}?todo=view">${att.filePath}</a></td>
                <td class="lentelesCellAtt">${att.description}</td>
                <td class="lentelesCellAtt">${att.ikelimoData}</td>
                <td class="lentelesCellAtt">${att.vartotojas.vardas} ${att.vartotojas.pavarde}</td>
                <td class="lentelesCellAtt">
                    <button onclick="location.href='${contextPath}/getpdf/${att.id}?todo=download'" class="btn btn-blue-grey btn-sm" style="height:20px; width:40px;padding: 0;margin: 0; ">
                        <i class="far fa-download"></i>
                    </button>
                    <button  onclick="location.href='${contextPath}/getpdf/${att.id}/delete/${pardavimoid}'" class="btn btn-blue-grey btn-sm" style="height:20px; width:40px;padding: 0;margin: 0; margin-left:30px ">
                        <i class="far fa-trash"></i>
                    </button>
                </td>
            </tr>
            </c:forEach>
        </c:if>
            </tbody>
        </table>
    </div>

</div>

<!-- Add Koment Start-->
<div class="modal fade" id="modalUpdate" tabindex="-1" role="dialog" aria-labelledby="myModalUpdate"
     aria-hidden="true" >
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header text-center">
                <h4 class="modal-title w-100 font-weight-bold">Komentaras</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form:form method="post"  action="${contextPath}/komentadd/${pardavimas.id}" modelAttribute="komentForm" >
                <form:hidden path="id"></form:hidden>
                <form:hidden path="komentaroData"></form:hidden>
                <form:hidden path="pardavimas"></form:hidden>
                <div class="modal-body mx-3">
                    <div class="md-form mb-sm-3">
                        <spring:bind path="komentaras">
                            <form:textarea path="komentaras" rows="5" cols="30" cssClass="form-control validate" type="text" required="required" autocomplete="off"/>
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
<!-- Add Koment END -->

<!-- Add Response Start-->
<div class="modal fade" id="modalUpdateResponse" tabindex="-1" role="dialog" aria-labelledby="myModalUpdate"
     aria-hidden="true" >
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header text-center">
                <h4 class="modal-title w-100 font-weight-bold">Komentaras</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form:form method="post"  action="${contextPath}/komentaddresponse/${komentaroid}" modelAttribute="responseForm" >
                <form:hidden path="id"></form:hidden>
                <div class="modal-body mx-3">
                    <div class="md-form mb-sm-3">
                        <spring:bind path="komentaras">
                            <form:textarea path="komentaras" rows="5" cols="30" cssClass="form-control validate" type="text" required="required" autocomplete="off"/>
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
<!-- Add Response END -->
<!-- Add Attachment Start-->
<div class="modal fade" id="modalUpdateAttachment" tabindex="-1" role="dialog" aria-labelledby="myModalUpdate"
     aria-hidden="true" >
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header text-center">
                <h4 class="modal-title w-100 font-weight-bold">Failo prisegimas</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form:form method="post"  action="${contextPath}/upload/${pardavimas.id}" modelAttribute="attachmentForm" enctype="multipart/form-data" >
                <form:hidden path="id"></form:hidden>
                <div class="modal-body mx-3">
                    <div class="md-form mb-sm-3">
                        <spring:bind path="title">
                            <form:input path="title" cssClass="form-control validate" type="text" required="required" autocomplete="off"/>
                        </spring:bind>
                    </div>

                    <div class="md-form mb-sm-3">
                        <spring:bind path="description">
                            <form:textarea path="description" rows="5" cols="30" cssClass="form-control validate" type="text" required="required" autocomplete="off"/>
                        </spring:bind>
                    </div>
                    <div class="md-form mb-sm-3">
                        <spring:bind path="multipartFile">
                            <form:input path="multipartFile" cssClass="form-control validate" type="file" required="required" autocomplete="off"/>
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
<!-- Add Attachment END -->

<script>

    $(window).on('load',function(){
        if(${modaladd} === true) {
            $('#modalUpdate').modal('show');
        }
    });

    $(window).on('load',function(){
        if(${modaladdresp} === true) {
            $('#modalUpdateResponse').modal('show');
        }
    })

    $(window).on('load',function(){
        if(${modaladdfile} === true) {
            $('#modalUpdateAttachment').modal('show');
        }
    });
</script>

</body>
</html>
