<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<jsp:include page="linkai1.jsp" />
<head>
    <title>Pardavimai</title>

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/style.css">
    <script>
        $( function() {
            $( "#datepickeris1" ).datepicker( {
                dateFormat: 'yy-mm-dd',
                changeMonth: true,
                changeYear: true,
                firstDay: 1,
                dayNamesMin: [ "Se", "Pi", "An", "Tr", "Ke", "Pe", "Še" ],
                monthNamesShort: [ "Sau", "Vas", "Kov", "Bal", "Geg", "Bir", "Lie", "Rugp", "Rugs", "Spa", "Lap", "Gru" ],
                //minDate: new Date(),
            });
        } );

        $( function() {
            $( "#datepickeris2" ).datepicker( {
                dateFormat: 'yy-mm-dd',
                changeMonth: true,
                changeYear: true,
                firstDay: 1,
                dayNamesMin: [ "Se", "Pi", "An", "Tr", "Ke", "Pe", "Še" ],
                monthNamesShort: [ "Sau", "Vas", "Kov", "Bal", "Geg", "Bir", "Lie", "Rugp", "Rugs", "Spa", "Lap", "Gru" ],
                //minDate: new Date(),

            });
        } );
    </script>
</head>
<body class="bodybakas">
<jsp:include page="nav.jsp" />

<div style="width: 100%; height:80px;">

    <form action="${contextPath}/admin/pardavimolent" style="width: 50%;height: 60px;display: inline-block; position: absolute; left:50px">
        <select name="metais" class="browser-default custom-select" style="width: fit-content">
            <option>${pasirinktiMetai}</option>
            <c:forEach items="${metai}" var="met">
                <c:choose>
                    <c:when test="${met eq pasirinktiMetai}">

                    </c:when>
                    <c:otherwise>
                        <option value="${met}">${met}</option>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </select>
        <select name="darbuotojoid" class="browser-default custom-select" style="width: fit-content">
            <option value="${pasirinktasDarbuotojas.id}">${pasirinktasDarbuotojas.username}</option>

            <sec:authorize access="hasRole('SUPERUSER')">
                <c:forEach items="${visiPagalBusinessUnitDarbuotojai}" var="darb">

                        <c:choose>
                            <c:when test="${darb.username eq pasirinktasDarbuotojas.username}">

                            </c:when>
                            <c:otherwise>
                                <option value="${darb.id}">${darb.username}</option>
                            </c:otherwise>
                        </c:choose>

                </c:forEach>
            </sec:authorize>
<sec:authorize access="hasRole('ADMIN')">
            <c:forEach items="${visiDarbuotojai}" var="darb">
                <c:choose>
                    <c:when test="${darb.username eq pasirinktasDarbuotojas.username}">

                    </c:when>
                    <c:otherwise>
                        <option value="${darb.id}">${darb.username}</option>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
</sec:authorize>
        </select>

        <input type="submit" value="Submit" class="btn btn-blue-grey">
    </form>
<sec:authorize access="hasRole('ADMIN')">
    <div style="width: 100px; height: 60px; display: inline-block; position: absolute; right: 50px">
        <button style="float: right;" onclick="location.href='?pardavimoid=new&darbuotojoid=${pasirinktasDarbuotojas.id}&metais=${pasirinktiMetai}'" class="btn btn-blue-grey" >  Add</button>
    </div>
</sec:authorize>
</div>

<spring:url value="${contextPath}/admin/addPardavima" var="ActionUrl" />

<c:choose>
<c:when test="${pasirinktasDarbuotojas.username ne esamasUsername.username}">

<div>
    <main class="st_viewport">
        <div class="st_wrap_table" data-table_id="1">
            <header class="st_table_header">
                <h2>I Ketvirtis</h2>
                <div class="st_row">
                    <div class="st_column _colketvirciai">
                        <h6 class="menesioBtextas">Mėnesio planas (01 mėn.): <b class="b_spalva"></b></h6>
                        <h6 class="menesioBtextas">Mėnesio planas (02 mėn.): <b class="b_spalva"></b></h6>
                        <h6 class="menesioBtextas">Mėnesio planas (03 mėn.): <b class="b_spalva"></b></h6>
                        <h6 class="menesioBtextas">I kevirčio planas: <b class="b_spalvak"></b></h6>
                    </div>
                    <div  class="st_column _colketvirciai">
                        <h6 class="menesioBtextas">Planuojami pardavimai (01 mėn.): <b class="b_spalva">${infoall.planuojamiPar1}</b></h6>
                        <h6 class="menesioBtextas">Planuojami pardavimai (02 mėn.): <b class="b_spalva">${infoall.planuojamiPar2}</b></h6>
                        <h6 class="menesioBtextas">Planuojami pardavimai (03 mėn.): <b class="b_spalva">${infoall.planuojamiPar3}</b></h6>
                        <h6 class="menesioBtextas">Planuojami darbai I kevirtis: <b class="b_spalvak">${infoall.planuojamiPar1+infoall.planuojamiPar2+infoall.planuojamiPar3}</b></h6>
                    </div>
                    <div  class="st_column _colketvirciai">
                        <h6 class="menesioBtextas">Planuojamas aktavimas (01 mėn.): <b class="b_spalva">${infoall.planuojamasAkt1}</b></h6>
                        <h6 class="menesioBtextas">Planuojamas aktavimas (02 mėn.): <b class="b_spalva">${infoall.planuojamasAkt2}</b></h6>
                        <h6 class="menesioBtextas">Planuojamas aktavimas (03 mėn.): <b class="b_spalva">${infoall.planuojamasAkt3}</b></h6>
                        <h6 class="menesioBtextas">Sutartys I kevirtis: <b class="b_spalvak">${infoall.planuojamasAkt1+infoall.planuojamasAkt2+infoall.planuojamasAkt3}</b></h6>
                    </div>
                    <div class="st_column _colketvirciai">
                        <h6 class="menesioBtextas">Elektra: <b class="b_spalva">${infoall.ket1Elektra}</b></h6>
                        <h6 class="menesioBtextas">Santechnika: <b class="b_spalva">${infoall.ket1Santechnika}</b></h6>
                        <h6 class="menesioBtextas">Statyba: <b class="b_spalva">${infoall.ket1Statyba}</b></h6>
                        <h6 class="menesioBtextas">Kiti: <b class="b_spalva">${infoall.ket1Kita}</b></h6>
                    </div>
                </div>
                <div class="st_row">
                    <div class="st_column _ketvirtis">Ketvirtis</div>
                    <div class="st_column _objektopavadinimas">Objekto pavadinimas</div>
                    <div class="st_column _sprendimobudas" data-toggle="tooltip" title="Sprendimo priėmimo būdas">SPB</div>
                    <div class="st_column _sprendimodata" data-toggle="tooltip" title="Sprendimo priėmimo data (planuojama)">SPD</div>
                    <div class="st_column _darbutipas">Darbų tipas</div>
                    <div class="st_column _darbupavadinimas">Darbų pavadinimas</div>
                    <div class="st_column _preliminarikaina" data-toggle="tooltip" title="Pristatumų darbų kaina (preliminari)">PDK</div>
                    <div class="st_column _pagrindas" data-toggle="tooltip" title="Pagrindas (patvirtintas)">Pagrindas</div>
                    <div class="st_column _rangovas">Pasirinktas rangovas</div>
                    <div class="st_column _tikslisuma" data-toggle="tooltip" title="Sutartinė suma (tiksli)">Sutartinė suma</div>
                    <div class="st_column _atlikimodata" data-toggle="tooltip" title="Planuojama atlikimo data">PAD</div>
                    <div class="st_column _ticketFMSid" data-toggle="tooltip" title="FMS ticket ID">FMS</div>
                    <div class="st_column _mygtukai2"></div>
                </div>
            </header>
            <div class="st_table">
                <c:if test="${not empty Iketvirtis}">
                <c:forEach items="${Iketvirtis}" var="pirmasketvertis">
                <div class="st_row2">
                    <div class="st_column _ketvirtis">${pirmasketvertis.ketvirtis}</div>
                    <div class="st_column _objektopavadinimas">${pirmasketvertis.objektoPavadinimas}</div>
                    <div class="st_column _sprendimobudas">${pirmasketvertis.sprendimoPriemimoBudas}</div>
                    <div class="st_column _sprendimodata">${pirmasketvertis.sprendimoPriemimoData}</div>
                    <div class="st_column _darbutipas">${pirmasketvertis.darbuTipas}</div>
                    <div class="st_column _darbupavadinimas">${pirmasketvertis.darbuPavadinimas}</div>
                    <div class="st_column _preliminarikaina">${pirmasketvertis.pristatomuDarbuKainaPreliminari}</div>
                    <c:choose>
                        <c:when test="${pirmasketvertis.pagrindasPatvirtintas == 'Pasirinkti'}">
                            <div class="st_column _pagrindas not_filled">${pirmasketvertis.pagrindasPatvirtintas}</div>
                        </c:when>
                        <c:otherwise>
                            <div class="st_column _pagrindas">${pirmasketvertis.pagrindasPatvirtintas}</div>
                        </c:otherwise>
                    </c:choose>

                    <c:choose>
                        <c:when test="${pirmasketvertis.pasirinktasRangovas ==''}">
                            <div class="st_column _rangovas not_filled">${pirmasketvertis.pasirinktasRangovas}</div>
                        </c:when>
                        <c:otherwise>
                            <div class="st_column _rangovas">${pirmasketvertis.pasirinktasRangovas}</div>
                        </c:otherwise>
                    </c:choose>

                    <c:choose>
                        <c:when test="${pirmasketvertis.sutartineSumaTiksli == 0.0}">
                            <div class="st_column _tikslisuma not_filled">${pirmasketvertis.sutartineSumaTiksli}</div>
                        </c:when>
                        <c:otherwise>
                            <div class="st_column _tikslisuma">${pirmasketvertis.sutartineSumaTiksli}</div>
                        </c:otherwise>
                    </c:choose>

                    <c:choose>
                        <c:when test="${pirmasketvertis.planuojamaAtlikimoData == ''}">
                            <div class="st_column _atlikimodata not_filled">${pirmasketvertis.planuojamaAtlikimoData}</div>
                        </c:when>
                        <c:otherwise>
                            <div class="st_column _atlikimodata">${pirmasketvertis.planuojamaAtlikimoData}</div>
                        </c:otherwise>
                    </c:choose>
                    <div class="st_column _ticketFMSid"><a href="https://fms.civinity.lt/tickets/view/${pirmasketvertis.ticketFMSid}">${pirmasketvertis.ticketFMSid}</a></div>

                    <div class="st_column _mygtukai2">
                        <button onclick="location.href='${contextPath}/viewPardavimas/${pirmasketvertis.id}'" class="btn btn-blue-grey btn-sm" style="height:20px; width:40px;padding: 0;margin: 0; ">
                            <i class="far fa-eye"></i>
                        </button>
                        <sec:authorize access="hasRole('ADMIN')">
                            <button onclick="location.href='?pardavimoid=${pirmasketvertis.id}&darbuotojoid=${pasirinktasDarbuotojas.id}&metais=${pasirinktiMetai}'" class="btn btn-blue-grey btn-sm" style="height:20px; width:40px;padding: 0;margin: 0; ">
                                <i class="far fa-edit"></i>
                            </button>
                            <button onclick="location.href='${contextPath}/admin/pardavimolent/${pirmasketvertis.id}/delete?darbuotojoid=${pasirinktasDarbuotojas.id}&metais=${pasirinktiMetai}'" class="btn btn-blue-grey btn-sm" style="height:20px; width:40px;padding: 0;margin: 0; ">
                                <i class="fas fa-trash-alt"></i>
                            </button>
                        </sec:authorize>
                    </div>
                </div>
                </c:forEach>
                </c:if>
            </div>
        </div>
        <div class="st_wrap_table" data-table_id="2">
            <header class="st_table_header">
                <h2>II Ketvirtis</h2>
                <div class="st_row">
                    <div class="st_column _colketvirciai">
                        <h6 class="menesioBtextas">Mėnesio planas (04 mėn.): <b class="b_spalva"></b></h6>
                        <h6 class="menesioBtextas">Mėnesio planas (05 mėn.): <b class="b_spalva"></b></h6>
                        <h6 class="menesioBtextas">Mėnesio planas (06 mėn.): <b class="b_spalva"></b></h6>
                        <h6 class="menesioBtextas">II kevirčio planas: <b class="b_spalvak"></b></h6>
                    </div>
                    <div  class="st_column _colketvirciai">
                        <h6 class="menesioBtextas">Planuojami pardavimai (04 mėn.): <b class="b_spalva">${infoall.planuojamiPar4}</b></h6>
                        <h6 class="menesioBtextas">Planuojami pardavimai (05 mėn.): <b class="b_spalva">${infoall.planuojamiPar5}</b></h6>
                        <h6 class="menesioBtextas">Planuojami pardavimai (06 mėn.): <b class="b_spalva">${infoall.planuojamiPar6}</b></h6>
                        <h6 class="menesioBtextas">Planuojami darbai II kevirtis: <b class="b_spalvak">${infoall.planuojamiPar4+infoall.planuojamiPar5+infoall.planuojamiPar6}</b></h6>
                    </div>
                    <div  class="st_column _colketvirciai">
                        <h6 class="menesioBtextas">Planuojamas aktavimas (04 mėn.): <b class="b_spalva">${infoall.planuojamasAkt4}</b></h6>
                        <h6 class="menesioBtextas">Planuojamas aktavimas (05 mėn.): <b class="b_spalva">${infoall.planuojamasAkt5}</b></h6>
                        <h6 class="menesioBtextas">Planuojamas aktavimas (06 mėn.): <b class="b_spalva">${infoall.planuojamasAkt6}</b></h6>
                        <h6 class="menesioBtextas">Sutartys II kevirtis: <b class="b_spalvak">${infoall.planuojamasAkt4+infoall.planuojamasAkt5+infoall.planuojamasAkt6}</b></h6>
                    </div>
                    <div class="st_column _colketvirciai">
                        <h6 class="menesioBtextas">Elektra: <b class="b_spalva">${infoall.ket2Elektra}</b></h6>
                        <h6 class="menesioBtextas">Santechnika: <b class="b_spalva">${infoall.ket2Santechnika}</b></h6>
                        <h6 class="menesioBtextas">Statyba: <b class="b_spalva">${infoall.ket2Statyba}</b></h6>
                        <h6 class="menesioBtextas">Kiti: <b class="b_spalva">${infoall.ket2Kita}</b></h6>
                    </div>
                </div>
                <div class="st_row">
                    <div class="st_column _ketvirtis">Ketvirtis</div>
                    <div class="st_column _objektopavadinimas">Objekto pavadinimas</div>
                    <div class="st_column _sprendimobudas" data-toggle="tooltip" title="Sprendimo priėmimo būdas">SPB</div>
                    <div class="st_column _sprendimodata" data-toggle="tooltip" title="Sprendimo priėmimo data (planuojama)">SPD</div>
                    <div class="st_column _darbutipas">Darbų tipas</div>
                    <div class="st_column _darbupavadinimas">Darbų pavadinimas</div>
                    <div class="st_column _preliminarikaina" data-toggle="tooltip" title="Pristatumų darbų kaina (preliminari)">PDK</div>
                    <div class="st_column _pagrindas" data-toggle="tooltip" title="Pagrindas (patvirtintas)">Pagrindas</div>
                    <div class="st_column _rangovas">Pasirinktas rangovas</div>
                    <div class="st_column _tikslisuma" data-toggle="tooltip" title="Sutartinė suma (tiksli)">Sutartinė suma</div>
                    <div class="st_column _atlikimodata" data-toggle="tooltip" title="Planuojama atlikimo data">PAD</div>
                    <div class="st_column _ticketFMSid" data-toggle="tooltip" title="FMS ticket ID">FMS</div>
                    <div class="st_column _mygtukai2"></div>
                </div>
            </header>
            <div class="st_table">
                <c:if test="${not empty IIketvirtis}">
                    <c:forEach items="${IIketvirtis}" var="a2ketvertis">
                        <div class="st_row2">
                            <div class="st_column _ketvirtis">${a2ketvertis.ketvirtis}</div>
                            <div class="st_column _objektopavadinimas">${a2ketvertis.objektoPavadinimas}</div>
                            <div class="st_column _sprendimobudas">${a2ketvertis.sprendimoPriemimoBudas}</div>
                            <div class="st_column _sprendimodata">${a2ketvertis.sprendimoPriemimoData}</div>
                            <div class="st_column _darbutipas">${a2ketvertis.darbuTipas}</div>
                            <div class="st_column _darbupavadinimas">${a2ketvertis.darbuPavadinimas}</div>
                            <div class="st_column _preliminarikaina">${a2ketvertis.pristatomuDarbuKainaPreliminari}</div>
                            <c:choose>
                                <c:when test="${a2ketvertis.pagrindasPatvirtintas == 'Pasirinkti'}">
                                    <div class="st_column _pagrindas not_filled">${a2ketvertis.pagrindasPatvirtintas}</div>
                                </c:when>
                                <c:otherwise>
                                    <div class="st_column _pagrindas">${a2ketvertis.pagrindasPatvirtintas}</div>
                                </c:otherwise>
                            </c:choose>

                            <c:choose>
                                <c:when test="${a2ketvertis.pasirinktasRangovas ==''}">
                                    <div class="st_column _rangovas not_filled">${a2ketvertis.pasirinktasRangovas}</div>
                                </c:when>
                                <c:otherwise>
                                    <div class="st_column _rangovas">${a2ketvertis.pasirinktasRangovas}</div>
                                </c:otherwise>
                            </c:choose>

                            <c:choose>
                                <c:when test="${a2ketvertis.sutartineSumaTiksli == 0.0}">
                                    <div class="st_column _tikslisuma not_filled" >${a2ketvertis.sutartineSumaTiksli}</div>
                                </c:when>
                                <c:otherwise>
                                    <div class="st_column _tikslisuma">${a2ketvertis.sutartineSumaTiksli}</div>
                                </c:otherwise>
                            </c:choose>

                            <c:choose>
                                <c:when test="${a2ketvertis.planuojamaAtlikimoData == ''}">
                                    <div class="st_column _atlikimodata not_filled">${a2ketvertis.planuojamaAtlikimoData}</div>
                                </c:when>
                                <c:otherwise>
                                    <div class="st_column _atlikimodata">${a2ketvertis.planuojamaAtlikimoData}</div>
                                </c:otherwise>
                            </c:choose>

                            <div class="st_column _ticketFMSid"><a href="https://fms.civinity.lt/tickets/view/${a2ketvertis.ticketFMSid}">${a2ketvertis.ticketFMSid}</a></div>

                            <div class="st_column _mygtukai2">
                                <button onclick="location.href='${contextPath}/viewPardavimas/${a2ketvertis.id}'" class="btn btn-blue-grey btn-sm" style="height:20px; width:40px;padding: 0;margin: 0; ">
                                    <i class="far fa-eye"></i>
                                </button>
                                <sec:authorize access="hasRole('ADMIN')">
                                    <button onclick="location.href='?pardavimoid=${a2ketvertis.id}&darbuotojoid=${pasirinktasDarbuotojas.id}&metais=${pasirinktiMetai}'" class="btn btn-blue-grey btn-sm" style="height:20px; width:40px;padding: 0;margin: 0; ">
                                        <i class="far fa-edit"></i>
                                    </button>
                                    <button onclick="location.href='${contextPath}/admin/pardavimolent/${a2ketvertis.id}/delete?darbuotojoid=${pasirinktasDarbuotojas.id}&metais=${pasirinktiMetai}'"  class="btn btn-blue-grey btn-sm" style="height:20px; width:40px;padding: 0;margin: 0; ">
                                        <i class="fas fa-trash-alt"></i>
                                    </button>

                                </sec:authorize>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
            </div>
        </div>
        <div class="st_wrap_table" data-table_id="3">
            <header class="st_table_header">
                <h2>III Ketvirtis</h2>
                <div class="st_row">
                    <div class="st_column _colketvirciai">
                        <h6 class="menesioBtextas">Mėnesio planas (07 mėn.): <b class="b_spalva"></b></h6>
                        <h6 class="menesioBtextas">Mėnesio planas (08 mėn.): <b class="b_spalva"></b></h6>
                        <h6 class="menesioBtextas">Mėnesio planas (09 mėn.): <b class="b_spalva"></b></h6>
                        <h6 class="menesioBtextas">III kevirčio planas: <b class="b_spalvak"></b></h6>
                    </div>
                    <div  class="st_column _colketvirciai">
                        <h6 class="menesioBtextas">Planuojami pardavimai (07 mėn.): <b class="b_spalva">${infoall.planuojamiPar7}</b></h6>
                        <h6 class="menesioBtextas">Planuojami pardavimai (08 mėn.): <b class="b_spalva">${infoall.planuojamiPar8}</b></h6>
                        <h6 class="menesioBtextas">Planuojami pardavimai (09 mėn.): <b class="b_spalva">${infoall.planuojamiPar9}</b></h6>
                        <h6 class="menesioBtextas">Planuojami darbai III kevirtis: <b class="b_spalvak">${infoall.planuojamiPar7+infoall.planuojamiPar8+infoall.planuojamiPar9}</b></h6>
                    </div>
                    <div  class="st_column _colketvirciai">
                        <h6 class="menesioBtextas">Planuojamas aktavimas (07 mėn.): <b class="b_spalva">${infoall.planuojamasAkt7}</b></h6>
                        <h6 class="menesioBtextas">Planuojamas aktavimas (08 mėn.): <b class="b_spalva">${infoall.planuojamasAkt8}</b></h6>
                        <h6 class="menesioBtextas">Planuojamas aktavimas (09 mėn.): <b class="b_spalva">${infoall.planuojamasAkt9}</b></h6>
                        <h6 class="menesioBtextas">Sutartys III kevirtis: <b class="b_spalvak">${infoall.planuojamasAkt7+infoall.planuojamasAkt8+infoall.planuojamasAkt9}</b></h6>
                    </div>
                    <div class="st_column _colketvirciai">
                        <h6 class="menesioBtextas">Elektra: <b class="b_spalva">${infoall.ket3Elektra}</b></h6>
                        <h6 class="menesioBtextas">Santechnika: <b class="b_spalva">${infoall.ket3Santechnika}</b></h6>
                        <h6 class="menesioBtextas">Statyba: <b class="b_spalva">${infoall.ket3Statyba}</b></h6>
                        <h6 class="menesioBtextas">Kiti: <b class="b_spalva">${infoall.ket3Kita}</b></h6>
                    </div>
                </div>
                <div class="st_row">
                    <div class="st_column _ketvirtis">Ketvirtis</div>
                    <div class="st_column _objektopavadinimas">Objekto pavadinimas</div>
                    <div class="st_column _sprendimobudas" data-toggle="tooltip" title="Sprendimo priėmimo būdas">SPB</div>
                    <div class="st_column _sprendimodata" data-toggle="tooltip" title="Sprendimo priėmimo data (planuojama)">SPD</div>
                    <div class="st_column _darbutipas">Darbų tipas</div>
                    <div class="st_column _darbupavadinimas">Darbų pavadinimas</div>
                    <div class="st_column _preliminarikaina" data-toggle="tooltip" title="Pristatumų darbų kaina (preliminari)">PDK</div>
                    <div class="st_column _pagrindas" data-toggle="tooltip" title="Pagrindas (patvirtintas)">Pagrindas</div>
                    <div class="st_column _rangovas">Pasirinktas rangovas</div>
                    <div class="st_column _tikslisuma" data-toggle="tooltip" title="Sutartinė suma (tiksli)">Sutartinė suma</div>
                    <div class="st_column _atlikimodata" data-toggle="tooltip" title="Planuojama atlikimo data">PAD</div>
                    <div class="st_column _ticketFMSid" data-toggle="tooltip" title="FMS ticket ID">FMS</div>
                    <div class="st_column _mygtukai2"></div>
                </div>
            </header>
            <div class="st_table">
                <c:if test="${not empty IIIketvirtis}">
                    <c:forEach items="${IIIketvirtis}" var="a3ketvertis">
                        <div class="st_row2">
                            <div class="st_column _ketvirtis">${a3ketvertis.ketvirtis}</div>
                            <div class="st_column _objektopavadinimas">${a3ketvertis.objektoPavadinimas}</div>
                            <div class="st_column _sprendimobudas">${a3ketvertis.sprendimoPriemimoBudas}</div>
                            <div class="st_column _sprendimodata">${a3ketvertis.sprendimoPriemimoData}</div>
                            <div class="st_column _darbutipas">${a3ketvertis.darbuTipas}</div>
                            <div class="st_column _darbupavadinimas">${a3ketvertis.darbuPavadinimas}</div>
                            <div class="st_column _preliminarikaina">${a3ketvertis.pristatomuDarbuKainaPreliminari}</div>
                            <c:choose>
                                <c:when test="${a3ketvertis.pagrindasPatvirtintas == 'Pasirinkti'}">
                                    <div class="st_column _pagrindas not_filled">${a3ketvertis.pagrindasPatvirtintas}</div>
                                </c:when>
                                <c:otherwise>
                                    <div class="st_column _pagrindas">${a3ketvertis.pagrindasPatvirtintas}</div>
                                </c:otherwise>
                            </c:choose>

                            <c:choose>
                                <c:when test="${a3ketvertis.pasirinktasRangovas ==''}">
                                    <div class="st_column _rangovas not_filled" >${a3ketvertis.pasirinktasRangovas}</div>
                                </c:when>
                                <c:otherwise>
                                    <div class="st_column _rangovas">${a3ketvertis.pasirinktasRangovas}</div>
                                </c:otherwise>
                            </c:choose>

                            <c:choose>
                                <c:when test="${a3ketvertis.sutartineSumaTiksli == 0.0}">
                                    <div class="st_column _tikslisuma  not_filled">${a3ketvertis.sutartineSumaTiksli}</div>
                                </c:when>
                                <c:otherwise>
                                    <div class="st_column _tikslisuma">${a3ketvertis.sutartineSumaTiksli}</div>
                                </c:otherwise>
                            </c:choose>

                            <c:choose>
                                <c:when test="${a3ketvertis.planuojamaAtlikimoData == ''}">
                                    <div class="st_column _atlikimodata not_filled">${a3ketvertis.planuojamaAtlikimoData}</div>
                                </c:when>
                                <c:otherwise>
                                    <div class="st_column _atlikimodata">${a3ketvertis.planuojamaAtlikimoData}</div>
                                </c:otherwise>
                            </c:choose>

                            <div class="st_column _ticketFMSid"><a href="https://fms.civinity.lt/tickets/view/${a3ketvertis.ticketFMSid}">${a3ketvertis.ticketFMSid}</a></div>

                            <div class="st_column _mygtukai2">
                                <button onclick="location.href='${contextPath}/viewPardavimas/${a3ketvertis.id}'" class="btn btn-blue-grey btn-sm" style="height:20px; width:40px;padding: 0;margin: 0; ">
                                    <i class="far fa-eye"></i>
                                </button>
                                <sec:authorize access="hasRole('ADMIN')">

                                    <button onclick="location.href='?pardavimoid=${a3ketvertis.id}&darbuotojoid=${pasirinktasDarbuotojas.id}&metais=${pasirinktiMetai}'" class="btn btn-blue-grey btn-sm" style="height:20px; width:40px;padding: 0;margin: 0; ">
                                        <i class="far fa-edit"></i>
                                    </button>
                                    <button onclick="location.href='${contextPath}/admin/pardavimolent/${a3ketvertis.id}/delete?darbuotojoid=${pasirinktasDarbuotojas.id}&metais=${pasirinktiMetai}'"  class="btn btn-blue-grey btn-sm" style="height:20px; width:40px;padding: 0;margin: 0; ">
                                        <i class="fas fa-trash-alt"></i>
                                    </button>

                                </sec:authorize>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
            </div>
        </div>
        <div class="st_wrap_table" data-table_id="2">
            <header class="st_table_header">
                <h2>IV Ketvirtis</h2>
                <div class="st_row">
                    <div class="st_column _colketvirciai">
                        <h6 class="menesioBtextas">Mėnesio planas (10 mėn.): <b class="b_spalva"></b></h6>
                        <h6 class="menesioBtextas">Mėnesio planas (11 mėn.): <b class="b_spalva"></b></h6>
                        <h6 class="menesioBtextas">Mėnesio planas (12 mėn.): <b class="b_spalva"></b></h6>
                        <h6 class="menesioBtextas">IV kevirčio planas: <b class="b_spalvak"></b></h6>
                    </div>
                    <div  class="st_column _colketvirciai">
                        <h6 class="menesioBtextas">Planuojami pardavimai (10 mėn.): <b class="b_spalva">${infoall.planuojamiPar10}</b></h6>
                        <h6 class="menesioBtextas">Planuojami pardavimai (11 mėn.): <b class="b_spalva">${infoall.planuojamiPar11}</b></h6>
                        <h6 class="menesioBtextas">Planuojami pardavimai (12 mėn.): <b class="b_spalva">${infoall.planuojamiPar12}</b></h6>
                        <h6 class="menesioBtextas">Planuojami darbai IV kevirtis: <b class="b_spalvak">${infoall.planuojamiPar10+infoall.planuojamiPar11+infoall.planuojamiPar12}</b></h6>
                    </div>
                    <div  class="st_column _colketvirciai">
                        <h6 class="menesioBtextas">Planuojamas aktavimas (10 mėn.): <b class="b_spalva">${infoall.planuojamasAkt10}</b></h6>
                        <h6 class="menesioBtextas">Planuojamas aktavimas (11 mėn.): <b class="b_spalva">${infoall.planuojamasAkt11}</b></h6>
                        <h6 class="menesioBtextas">Planuojamas aktavimas (12 mėn.): <b class="b_spalva">${infoall.planuojamasAkt12}</b></h6>
                        <h6 class="menesioBtextas">Sutartys IV kevirtis: <b class="b_spalvak">${infoall.planuojamasAkt10+infoall.planuojamasAkt11+infoall.planuojamasAkt12}</b></h6>
                    </div>
                    <div class="st_column _colketvirciai">
                        <h6 class="menesioBtextas">Elektra: <b class="b_spalva">${infoall.ket4Elektra}</b></h6>
                        <h6 class="menesioBtextas">Santechnika: <b class="b_spalva">${infoall.ket4Santechnika}</b></h6>
                        <h6 class="menesioBtextas">Statyba: <b class="b_spalva">${infoall.ket4Statyba}</b></h6>
                        <h6 class="menesioBtextas">Kiti: <b class="b_spalva">${infoall.ket4Kita}</b></h6>
                    </div>
                </div>
                <div class="st_row">
                    <div class="st_column _ketvirtis">Ketvirtis</div>
                    <div class="st_column _objektopavadinimas">Objekto pavadinimas</div>
                    <div class="st_column _sprendimobudas" data-toggle="tooltip" title="Sprendimo priėmimo būdas">SPB</div>
                    <div class="st_column _sprendimodata" data-toggle="tooltip" title="Sprendimo priėmimo data (planuojama)">SPD</div>
                    <div class="st_column _darbutipas">Darbų tipas</div>
                    <div class="st_column _darbupavadinimas">Darbų pavadinimas</div>
                    <div class="st_column _preliminarikaina" data-toggle="tooltip" title="Pristatumų darbų kaina (preliminari)">PDK</div>
                    <div class="st_column _pagrindas" data-toggle="tooltip" title="Pagrindas (patvirtintas)">Pagrindas</div>
                    <div class="st_column _rangovas">Pasirinktas rangovas</div>
                    <div class="st_column _tikslisuma" data-toggle="tooltip" title="Sutartinė suma (tiksli)">Sutartinė suma</div>
                    <div class="st_column _atlikimodata" data-toggle="tooltip" title="Planuojama atlikimo data">PAD</div>
                    <div class="st_column _ticketFMSid" data-toggle="tooltip" title="FMS ticket ID">FMS</div>
                    <div class="st_column _mygtukai2"></div>
                </div>
            </header>
            <div class="st_table">
                <c:if test="${not empty IVketvirtis}">
                    <c:forEach items="${IVketvirtis}" var="a4ketvertis">
                        <div class="st_row2">
                            <div class="st_column _ketvirtis">${a4ketvertis.ketvirtis}</div>
                            <div class="st_column _objektopavadinimas">${a4ketvertis.objektoPavadinimas}</div>
                            <div class="st_column _sprendimobudas">${a4ketvertis.sprendimoPriemimoBudas}</div>
                            <div class="st_column _sprendimodata">${a4ketvertis.sprendimoPriemimoData}</div>
                            <div class="st_column _darbutipas">${a4ketvertis.darbuTipas}</div>
                            <div class="st_column _darbupavadinimas">${a4ketvertis.darbuPavadinimas}</div>
                            <div class="st_column _preliminarikaina">${a4ketvertis.pristatomuDarbuKainaPreliminari}</div>
                            <c:choose>
                                <c:when test="${a4ketvertis.pagrindasPatvirtintas == 'Pasirinkti'}">
                                    <div class="st_column _pagrindas not_filled">${a4ketvertis.pagrindasPatvirtintas}</div>
                                </c:when>
                                <c:otherwise>
                                    <div class="st_column _pagrindas">${a4ketvertis.pagrindasPatvirtintas}</div>
                                </c:otherwise>
                            </c:choose>

                            <c:choose>
                                <c:when test="${a4ketvertis.pasirinktasRangovas ==''}">
                                    <div class="st_column _rangovas not_filled" >${a4ketvertis.pasirinktasRangovas}</div>
                                </c:when>
                                <c:otherwise>
                                    <div class="st_column _rangovas">${a4ketvertis.pasirinktasRangovas}</div>
                                </c:otherwise>
                            </c:choose>

                            <c:choose>
                                <c:when test="${a4ketvertis.sutartineSumaTiksli == 0.0}">
                                    <div class="st_column _tikslisuma  not_filled" >${a4ketvertis.sutartineSumaTiksli}</div>
                                </c:when>
                                <c:otherwise>
                                    <div class="st_column _tikslisuma">${a4ketvertis.sutartineSumaTiksli}</div>
                                </c:otherwise>
                            </c:choose>

                            <c:choose>
                                <c:when test="${a4ketvertis.planuojamaAtlikimoData == ''}">
                                    <div class="st_column _atlikimodata not_filled">${a4ketvertis.planuojamaAtlikimoData}</div>
                                </c:when>
                                <c:otherwise>
                                    <div class="st_column _atlikimodata">${a4ketvertis.planuojamaAtlikimoData}</div>
                                </c:otherwise>
                            </c:choose>

                            <div class="st_column _ticketFMSid"><a href="https://fms.civinity.lt/tickets/view/${a4ketvertis.ticketFMSid}">${a4ketvertis.ticketFMSid}</a></div>

                            <div class="st_column _mygtukai2">
                                <button onclick="location.href='${contextPath}/viewPardavimas/${a4ketvertis.id}'" class="btn btn-blue-grey btn-sm" style="height:20px; width:40px;padding: 0;margin: 0; ">
                                    <i class="far fa-eye"></i>
                                </button>
                                <sec:authorize access="hasRole('ADMIN')">

                                    <button onclick="location.href='?pardavimoid=${a4ketvertis.id}&darbuotojoid=${pasirinktasDarbuotojas.id}&metais=${pasirinktiMetai}'" class="btn btn-blue-grey btn-sm" style="height:20px; width:40px;padding: 0;margin: 0; ">
                                        <i class="far fa-edit"></i>
                                    </button>
                                    <button onclick="location.href='${contextPath}/admin/pardavimolent/${a4ketvertis.id}/delete?darbuotojoid=${pasirinktasDarbuotojas.id}&metais=${pasirinktiMetai}'" class="btn btn-blue-grey btn-sm" style="height:20px; width:40px;padding: 0;margin: 0; ">
                                        <i class="fas fa-trash-alt"></i>
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

</c:when>
    <c:otherwise>
        <div style="margin:auto">
            <h1>PASIRINKITE Darbuotoja</h1>
        </div>
    </c:otherwise>
</c:choose>
<!-- Update Start-->
<div class="modal fade" id="modalUpdate" tabindex="-1" role="dialog" aria-labelledby="myModalUpdate"
     aria-hidden="true" >
    <div class="modal-dialog modal-lg" role="document" >
        <div class="modal-content" >
            <div class="modal-header text-center">
                <h4 class="modal-title w-100 font-weight-bold">Pardavimas</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form:form method="post"  action="${contextPath}/admin/addPardavima?darbuotojoid=${pasirinktasDarbuotojas.id}&metais=${pasirinktiMetai}" modelAttribute="pardavimas" >
                <form:hidden path="id"></form:hidden>
            <div class="modal-body mx-3" >
                <div style="width: 48%; float:left">
                    <form:hidden path="metai"></form:hidden>
                    <form:hidden path="ketvirtis"></form:hidden>

                    <div class="formos-inputai">
                        <p class="p_label">Objekto Pavadinimas</p>
                        <spring:bind path="objektoPavadinimas">
                            <form:input path="objektoPavadinimas" cssClass="form-control validate" type="text" required="required" autocomplete="off"/>
                        </spring:bind>
                    </div>


                    <div class="formos-inputai">
                        <p class="p_label">Sprendimo Priemimo Budas</p>
                        <spring:bind path="sprendimoPriemimoBudas">
                            <form:select path="sprendimoPriemimoBudas" required="required" cssClass="browser-default custom-select">
                                <form:option value="Pasirinkti" label="--Please Select--"/>
                                <form:option value="Balsavimas raštu" label="Balsavimas raštu"/>
                                <form:option value="Susirinkimas" label="Susirinkimas"/>
                                <form:option value="Privalomąja tvarka" label="Privalomąja tvarka"/>
                            </form:select>
                        </spring:bind>
                    </div>


                    <div class="formos-inputai">
                        <p class="p_label">sprendimo Priemimo Data</p>
                        <spring:bind path="sprendimoPriemimoData">
                            <form:input path="sprendimoPriemimoData" cssClass="form-control validate" type="text" required="required" id="datepickeris1"/>
                        </spring:bind>
                    </div>


                    <div class="formos-inputai">
                        <p class="p_label">Darbu tipas</p>
                            <spring:bind path="darbuTipas">
                                <form:select path="darbuTipas" required="required" cssClass="browser-default custom-select">
                                    <form:option value="Pasirinkti" label="--Please Select--"/>
                                    <form:option value="Elektra" label="Elektra"/>
                                    <form:option value="Statyba" label="Statyba"/>
                                    <form:option value="Santechnika" label="Santechnika"/>
                                    <form:option value="Kiti" label="Kiti"/>
                                </form:select>
                            </spring:bind>
                    </div>


                    <div class="formos-inputai">
                        <p class="p_label">Darbu Pavadinimas</p>
                        <spring:bind path="darbuPavadinimas">
                            <form:input path="darbuPavadinimas" cssClass="form-control validate" type="text"  required="required" autocomplete="off"/>
                        </spring:bind>
                    </div>

                    <div class="formos-inputai">
                        <p class="p_label">Pristatomų Darbų Kaina Preliminari</p>
                        <spring:bind path="pristatomuDarbuKainaPreliminari">
                            <form:input path="pristatomuDarbuKainaPreliminari" cssClass="form-control validate" type="number" required="required" autocomplete="off"/>
                        </spring:bind>
                    </div>

                </div>
                <div style="width: 48%;float:right">
                    <div class="formos-inputai">
                        <p class="p_label">Pagrindas Patvirtintas</p>
                        <spring:bind path="pagrindasPatvirtintas">
                            <form:select path="pagrindasPatvirtintas" required="required" cssClass="browser-default custom-select">
                                <form:option value="Pasirinkti" label="--Please Select--"/>
                                <form:option value="Susirinkimo protokolas" label="Susirinkimo protokolas"/>
                                <form:option value="Balsavimo raštu protokolas" label="Balsavimo raštu protokolas"/>
                                <form:option value="Statinio apžiūros aktas" label="Statinio apžiūros aktas"/>
                            </form:select>
                        </spring:bind>

                    </div>

                    <div class="formos-inputai">
                        <p class="p_label">Pasirinktas Rangovas</p>
                        <spring:bind path="pasirinktasRangovas">
                            <form:input path="pasirinktasRangovas" type="text" cssClass='form-control validate'  />
                        </spring:bind>
                    </div>


                    <div class="formos-inputai">
                        <p class="p_label">Sutartinė Tiksli Suma</p>
                        <spring:bind path="sutartineSumaTiksli">
                            <form:input path="sutartineSumaTiksli" cssClass="form-control validate" type="number"  autocomplete="off"/>
                        </spring:bind>
                    </div>


                    <div class="formos-inputai">
                        <p class="p_label">Planuojama Atlikimo Data</p>
                        <spring:bind path="planuojamaAtlikimoData">
                            <form:input path="planuojamaAtlikimoData" cssClass="form-control validate" type="text"  id="datepickeris2"/>
                        </spring:bind>
                    </div>

                    <div class="formos-inputai">
                        <p class="p_label">FMS Ticket ID</p>
                        <spring:bind path="ticketFMSid">
                            <form:input path="ticketFMSid" cssClass="form-control validate" type="number" autocomplete="off"/>
                        </spring:bind>
                    </div>

                </div>

            </div>
            <div class="modal-footer" style="width: 100%; background-color: white">
                <button class="btn btn-deep-orange" type="submit"> Save </button>
            </div>
        </div>

        </form:form>
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
        if(${modalupdate} === true) {
            $('#modalUpdate').modal('show');
        }
    });





</script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript" src="${contextPath}/resources/js/popper.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/mdb.min.js"></script>

</body>
</html>
