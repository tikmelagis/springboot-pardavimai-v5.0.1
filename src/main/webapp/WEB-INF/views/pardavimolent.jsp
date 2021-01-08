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
                minDate: new Date(2019,1,1),
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
                minDate: new Date(2019,1,1),

            });
        } );

        $( function() {
            $( "#datepickeris3" ).datepicker( {
                dateFormat: 'yy-mm-dd',
                changeMonth: true,
                changeYear: true,
                firstDay: 1,
                dayNamesMin: [ "Se", "Pi", "An", "Tr", "Ke", "Pe", "Še" ],
                monthNamesShort: [ "Sau", "Vas", "Kov", "Bal", "Geg", "Bir", "Lie", "Rugp", "Rugs", "Spa", "Lap", "Gru" ],
                minDate: new Date(2019,1,1),

            });
        } );

        $( function() {
            $( "#datepickeris4" ).datepicker( {
                dateFormat: 'yy-mm-dd',
                changeMonth: true,
                changeYear: true,
                firstDay: 1,
                dayNamesMin: [ "Se", "Pi", "An", "Tr", "Ke", "Pe", "Še" ],
                monthNamesShort: [ "Sau", "Vas", "Kov", "Bal", "Geg", "Bir", "Lie", "Rugp", "Rugs", "Spa", "Lap", "Gru" ],
                minDate: new Date(2019,1,1),

            });
        } );
        $( function() {
            $( "#datepickeris5" ).datepicker( {
                dateFormat: 'yy-mm-dd',
                changeMonth: true,
                changeYear: true,
                firstDay: 1,
                dayNamesMin: [ "Se", "Pi", "An", "Tr", "Ke", "Pe", "Še" ],
                monthNamesShort: [ "Sau", "Vas", "Kov", "Bal", "Geg", "Bir", "Lie", "Rugp", "Rugs", "Spa", "Lap", "Gru" ],
                minDate: new Date(2019,1,1),

            });
        } );

        $( function() {
            $(".padalinta").click(function () {
                if ($(this).is(":checked")) {
                    $('.padalinta').prop('checked', true);
                    $("._atlikimodata2").show();
                    $("._ticketFMSid2").show();
                    $("._tikslisuma2").show();
                    $("._atlikimodata3").show();
                    $("._ticketFMSid3").show();
                    $("._tikslisuma3").show();
                    $("._atlikimodata4").show();
                    $("._ticketFMSid4").show();
                    $("._tikslisuma4").show();
                    $(".st_viewport").css({
                        'overflow-x':'scroll'
                    });
                    $(".st_wrap_table").css({
                        'width':'140em'
                    });

                } else {
                    $('.padalinta').prop('checked', false);
                    $("._atlikimodata2").hide();
                    $("._ticketFMSid2").hide();
                    $("._tikslisuma2").hide();
                    $("._atlikimodata3").hide();
                    $("._ticketFMSid3").hide();
                    $("._tikslisuma3").hide();
                    $("._atlikimodata4").hide();
                    $("._ticketFMSid4").hide();
                    $("._tikslisuma4").hide();
                    $(".st_viewport").css({
                        'overflow-x':'scroll'
                    });
                    $(".st_wrap_table").css({
                        'width':'100%'
                    });

                }
            });
        });

        $(document).ready(function () {
            $('#myscroll').scrollTop(${scrolas.intValue()});
        });
    </script>

</head>
<body class="bodybakas">
<jsp:include page="nav.jsp" />
<div style="width: 100%; height:80px;">
    <form action="${contextPath}/pardavimolent" style="width: 50%;height: 60px;display: inline-block; position: absolute; left:50px">
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

        <select name="unit" class="browser-default custom-select" style="width: fit-content">
            <option value="${pasirinktasUnit.id}">${pasirinktasUnit.name}</option>
            <c:forEach items="${esamasUsername.unitas}" var="un">
                <c:choose>
                    <c:when test="${un eq pasirinktasUnit}">

                    </c:when>
                    <c:otherwise>
                        <option value="${un.id}">${un.name}</option>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </select>

        <input type="submit" value="Submit" class="btn btn-blue-grey">
    </form>

    <div style="width: 100px; height: 60px; display: inline-block; position: absolute; right:50px">
        <button style="float:right; " onclick="location.href='?pardavimoid=new&metais=${pasirinktiMetai}&unit=${pasirinktasUnit.id}&scrolas='+$('#myscroll').scrollTop()" class="btn btn-blue-grey" >  +  </button>
    </div>

</div>


<spring:url value="${contextPath}/addPardavima" var="ActionUrl" />
<div>
    <main class="st_viewport" id="myscroll">
        <div class="st_wrap_table" data-table_id="1">
            <header class="st_table_header">
                <h2>I Ketvirtis</h2>
                <div class="st_row">

                    <div class="st_column _colketvirciai2">
                        <h6 class="menesioBtextas2" data-toggle="tooltip" title="Mėnesio Planas">MP (01 mėn.):
                            <b class="b_spalva">
                                ${planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 1 ).findFirst().orElse(null).getPlanasElektra()
                                + planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 1 ).findFirst().orElse(null).getPlanasSantechnika()
                                + planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 1 ).findFirst().orElse(null).getPlanasStatyba()
                                        + planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 1).findFirst().orElse(null).getPlanasKiti()}
                            </b>
                        </h6>
                        <h6 class="menesioBtextas2" data-toggle="tooltip" title="Mėnesio Planas">MP (02 mėn.):
                            <b class="b_spalva">
                                ${planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 2 ).findFirst().orElse(null).getPlanasElektra()
                                        + planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 2 ).findFirst().orElse(null).getPlanasSantechnika()
                                        + planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 2 ).findFirst().orElse(null).getPlanasStatyba()
                                        + planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 2).findFirst().orElse(null).getPlanasKiti()}
                            </b>
                        </h6>
                        <h6 class="menesioBtextas2" data-toggle="tooltip" title="Mėnesio Planas">MP (03 mėn.):
                            <b class="b_spalva">
                                ${planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 3 ).findFirst().orElse(null).getPlanasElektra()
                                        + planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 3 ).findFirst().orElse(null).getPlanasSantechnika()
                                        + planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 3 ).findFirst().orElse(null).getPlanasStatyba()
                                        + planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 3).findFirst().orElse(null).getPlanasKiti()}
                            </b>
                        </h6>
                    </div>
                    <div class="st_column _colketvirciai2">
                        <h6 class="menesioBtextas2">Elektra: <b class="b_spalva">${planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 1 ).findFirst().orElse(null).getPlanasElektra()}</b></h6>
                        <h6 class="menesioBtextas2">Elektra: <b class="b_spalva">${planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 2 ).findFirst().orElse(null).getPlanasElektra()}</b></h6>
                        <h6 class="menesioBtextas2">Elektra: <b class="b_spalva">${planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 3 ).findFirst().orElse(null).getPlanasElektra()}</b></h6>
                    </div>
                    <div class="st_column _colketvirciai2">
                        <h6 class="menesioBtextas2">Santechnika: <b class="b_spalva">${planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 1 ).findFirst().orElse(null).getPlanasSantechnika()}</b></h6>
                        <h6 class="menesioBtextas2">Santechnika: <b class="b_spalva">${planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 2 ).findFirst().orElse(null).getPlanasSantechnika()}</b></h6>
                        <h6 class="menesioBtextas2">Santechnika: <b class="b_spalva">${planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 3 ).findFirst().orElse(null).getPlanasSantechnika()}</b></h6>
                    </div>
                    <div class="st_column _colketvirciai2" >
                        <h6 class="menesioBtextas2">Statyba: <b class="b_spalva">${planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 1 ).findFirst().orElse(null).getPlanasStatyba()}</b></h6>
                        <h6 class="menesioBtextas2">Statyba: <b class="b_spalva">${planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 2 ).findFirst().orElse(null).getPlanasStatyba()}</b></h6>
                        <h6 class="menesioBtextas2">Statyba: <b class="b_spalva">${planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 3 ).findFirst().orElse(null).getPlanasStatyba()}</b></h6>
                    </div>
                    <div class="st_column _colketvirciai2" style="border-right: solid 1px #ff6e40">
                        <h6 class="menesioBtextas2">Kiti: <b class="b_spalva">${planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 1 ).findFirst().orElse(null).getPlanasKiti()}</b></h6>
                        <h6 class="menesioBtextas2">Kiti: <b class="b_spalva">${planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 2 ).findFirst().orElse(null).getPlanasKiti()}</b></h6>
                        <h6 class="menesioBtextas2">Kiti: <b class="b_spalva">${planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 3 ).findFirst().orElse(null).getPlanasKiti()}</b></h6>
                    </div>

                    <div  class="st_column _colketvirciai">
                        <h6 class="menesioBtextas">Planuojami pardavimai (01 mėn.): <b class="b_spalva">${infoall.planuojamiPar1}</b></h6>
                        <h6 class="menesioBtextas">Planuojami pardavimai (02 mėn.): <b class="b_spalva">${infoall.planuojamiPar2}</b></h6>
                        <h6 class="menesioBtextas">Planuojami pardavimai (03 mėn.): <b class="b_spalva">${infoall.planuojamiPar3}</b></h6>
                        <h6 class="menesioBtextas">Planuojami darbai I kevirtis: <b class="b_spalvak">${infoall.planuojamiPar1+infoall.planuojamiPar2+infoall.planuojamiPar3}</b></h6>
                    </div>
                    <div class="st_column _colketvirciai" style="border-right: solid 1px #ff6e40">
                        <h6 class="menesioBtextas">Elektra: <b class="b_spalva">${infoall.ket1Elektra}</b></h6>
                        <h6 class="menesioBtextas">Santechnika: <b class="b_spalva">${infoall.ket1Santechnika}</b></h6>
                        <h6 class="menesioBtextas">Statyba: <b class="b_spalva">${infoall.ket1Statyba}</b></h6>
                        <h6 class="menesioBtextas">Kiti: <b class="b_spalva">${infoall.ket1Kita}</b></h6>
                    </div>
                    <div  class="st_column _colketvirciai">
                        <h6 class="menesioBtextas">Planuojamas aktavimas (01 mėn.): <b class="b_spalva">${infoall.planuojamasAkt1}</b></h6>
                        <h6 class="menesioBtextas">Planuojamas aktavimas (02 mėn.): <b class="b_spalva">${infoall.planuojamasAkt2}</b></h6>
                        <h6 class="menesioBtextas">Planuojamas aktavimas (03 mėn.): <b class="b_spalva">${infoall.planuojamasAkt3}</b></h6>
                        <h6 class="menesioBtextas">Sutartys I kevirtis: <b class="b_spalvak">${infoall.planuojamasAkt1+infoall.planuojamasAkt2+infoall.planuojamasAkt3}</b></h6>
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
                    <div class="st_column _sutartinesuma" data-toggle="tooltip" title="Sutartinė suma">SS</div>

                    <div class="st_column _tikslisuma" data-toggle="tooltip" title="1 Aktavimo Suma">1 Akt S</div>

                    <div class="st_column _atlikimodata" data-toggle="tooltip" title="1 Aktavimo Data">1 Akt D</div>
                    <div class="st_column _ticketFMSid" data-toggle="tooltip" title="FMS ticket ID">1 FMS</div>

                    <div class="st_column _padalinta"><input type="checkbox" class="padalinta" /></div>

                    <div class="st_column _tikslisuma2" data-toggle="tooltip" title="2 Aktavimo Suma">2 Akt S</div>
                    <div class="st_column _atlikimodata2" data-toggle="tooltip" title="2 Aktavimo Data">2 Akt D</div>
                    <div class="st_column _ticketFMSid2" data-toggle="tooltip" title="FMS ticket ID (Dalinimas) 2">2 FMS</div>

                    <div class="st_column _tikslisuma3" data-toggle="tooltip" title="3 Aktavimo Suma">3 Akt S</div>
                    <div class="st_column _atlikimodata3" data-toggle="tooltip" title="3 Aktavimo Data">3 Akt D</div>
                    <div class="st_column _ticketFMSid3" data-toggle="tooltip" title="FMS ticket ID (Dalinimas) 3">3 FMS</div>

                    <div class="st_column _tikslisuma4" data-toggle="tooltip" title="4 Aktavimo Suma">4 Akt S</div>
                    <div class="st_column _atlikimodata4" data-toggle="tooltip" title="4 Aktavimo Data">4 Akt D</div>
                    <div class="st_column _ticketFMSid4" data-toggle="tooltip" title="FMS ticket ID (Dalinimas) 4">4 FMS</div>

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
                                <c:when test="${pirmasketvertis.sutartineSuma == 0.0}">
                                    <div class="st_column _sutartinesuma not_filled">${pirmasketvertis.sutartineSuma}</div>
                                </c:when>
                                <c:otherwise>
                                    <div class="st_column _sutartinesuma">${pirmasketvertis.sutartineSuma}</div>
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

                            <c:choose>
                                <c:when test="${pirmasketvertis.ticketFMSid == ''}">
                                    <div class="st_column _ticketFMSid not_filled"><a href="https://fms.civinity.lt/tickets/view/${pirmasketvertis.ticketFMSid}">${pirmasketvertis.ticketFMSid}</a></div>
                                </c:when>
                                <c:otherwise>
                                    <div class="st_column _ticketFMSid"><a href="https://fms.civinity.lt/tickets/view/${pirmasketvertis.ticketFMSid}">${pirmasketvertis.ticketFMSid}</a></div>
                                </c:otherwise>
                            </c:choose>

                            <div class="st_column _padalinta"></div>

                            <div class="st_column _tikslisuma2">${pirmasketvertis.sutartineSumaTiksli2}</div>
                            <div class="st_column _atlikimodata2">${pirmasketvertis.planuojamaAtlikimoData2}</div>
                            <div class="st_column _ticketFMSid2"><a href="https://fms.civinity.lt/tickets/view/${pirmasketvertis.ticketFMSid2}">${pirmasketvertis.ticketFMSid2}</a></div>

                            <div class="st_column _tikslisuma3">${pirmasketvertis.sutartineSumaTiksli3}</div>
                            <div class="st_column _atlikimodata3">${pirmasketvertis.planuojamaAtlikimoData3}</div>
                            <div class="st_column _ticketFMSid3"><a href="https://fms.civinity.lt/tickets/view/${pirmasketvertis.ticketFMSid3}">${pirmasketvertis.ticketFMSid3}</a></div>

                            <div class="st_column _tikslisuma4">${pirmasketvertis.sutartineSumaTiksli4}</div>
                            <div class="st_column _atlikimodata4">${pirmasketvertis.planuojamaAtlikimoData4}</div>
                            <div class="st_column _ticketFMSid4"><a href="https://fms.civinity.lt/tickets/view/${pirmasketvertis.ticketFMSid4}">${pirmasketvertis.ticketFMSid4}</a></div>



                            <div class="st_column _mygtukai2">
                                <button onclick="location.href='${contextPath}/viewPardavimas/${pirmasketvertis.id}'" class="btn btn-blue-grey btn-sm" style="height:20px; width:40px;padding: 0;margin: 0; ">
                                    <i class="far fa-eye"></i>
                                </button>
                                <button onclick="location.href='?pardavimoid=${pirmasketvertis.id}&metais=${pasirinktiMetai}&unit=${pasirinktasUnit.id}&scrolas='+$('#myscroll').scrollTop()" class="btn btn-blue-grey btn-sm" style="height:20px; width:40px;padding: 0;margin: 0; ">
                                    <i class="far fa-edit"></i>
                                </button>
                                    <button onclick="location.href='${contextPath}/pardavimolent/${pirmasketvertis.id}/delete?metais=${pasirinktiMetai}&scrolas='+$('#myscroll').scrollTop()"  class="btn btn-blue-grey btn-sm" style="height:20px; width:40px;padding: 0;margin: 0; ">
                                        <i class="fas fa-trash-alt"></i>
                                    </button>
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

                    <div class="st_column _colketvirciai2">
                        <h6 class="menesioBtextas2">MP (04 mėn.):
                            <b class="b_spalva" data-toggle="tooltip" title="Mėnesio Planas">
                                ${planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 4 ).findFirst().orElse(null).getPlanasElektra()
                                        + planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 4 ).findFirst().orElse(null).getPlanasSantechnika()
                                        + planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 4 ).findFirst().orElse(null).getPlanasStatyba()
                                        + planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 4).findFirst().orElse(null).getPlanasKiti()}
                            </b>
                        </h6>
                        <h6 class="menesioBtextas2" data-toggle="tooltip" title="Mėnesio Planas">MP (05 mėn.):
                            <b class="b_spalva">
                                ${planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 5 ).findFirst().orElse(null).getPlanasElektra()
                                        + planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 5 ).findFirst().orElse(null).getPlanasSantechnika()
                                        + planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 5 ).findFirst().orElse(null).getPlanasStatyba()
                                        + planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 5).findFirst().orElse(null).getPlanasKiti()}
                            </b>
                        </h6>
                        <h6 class="menesioBtextas2" data-toggle="tooltip" title="Mėnesio Planas">MP (06 mėn.):
                            <b class="b_spalva">
                                ${planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 6 ).findFirst().orElse(null).getPlanasElektra()
                                        + planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 6 ).findFirst().orElse(null).getPlanasSantechnika()
                                        + planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 6 ).findFirst().orElse(null).getPlanasStatyba()
                                        + planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 6).findFirst().orElse(null).getPlanasKiti()}
                            </b>
                        </h6>
                    </div>
                    <div class="st_column _colketvirciai2">
                        <h6 class="menesioBtextas2">Elektra: <b class="b_spalva">${planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 4 ).findFirst().orElse(null).getPlanasElektra()}</b></h6>
                        <h6 class="menesioBtextas2">Elektra: <b class="b_spalva">${planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 5 ).findFirst().orElse(null).getPlanasElektra()}</b></h6>
                        <h6 class="menesioBtextas2">Elektra: <b class="b_spalva">${planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 6 ).findFirst().orElse(null).getPlanasElektra()}</b></h6>
                    </div>
                    <div class="st_column _colketvirciai2">
                        <h6 class="menesioBtextas2">Santechnika: <b class="b_spalva">${planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 4 ).findFirst().orElse(null).getPlanasSantechnika()}</b></h6>
                        <h6 class="menesioBtextas2">Santechnika: <b class="b_spalva">${planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 5 ).findFirst().orElse(null).getPlanasSantechnika()}</b></h6>
                        <h6 class="menesioBtextas2">Santechnika: <b class="b_spalva">${planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 6 ).findFirst().orElse(null).getPlanasSantechnika()}</b></h6>
                    </div>
                    <div class="st_column _colketvirciai2" >
                        <h6 class="menesioBtextas2">Statyba: <b class="b_spalva">${planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 4 ).findFirst().orElse(null).getPlanasStatyba()}</b></h6>
                        <h6 class="menesioBtextas2">Statyba: <b class="b_spalva">${planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 5 ).findFirst().orElse(null).getPlanasStatyba()}</b></h6>
                        <h6 class="menesioBtextas2">Statyba: <b class="b_spalva">${planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 6 ).findFirst().orElse(null).getPlanasStatyba()}</b></h6>
                    </div>
                    <div class="st_column _colketvirciai2" style="border-right: solid 1px #ff6e40">
                        <h6 class="menesioBtextas2">Kiti: <b class="b_spalva">${planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 4 ).findFirst().orElse(null).getPlanasKiti()}</b></h6>
                        <h6 class="menesioBtextas2">Kiti: <b class="b_spalva">${planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 5 ).findFirst().orElse(null).getPlanasKiti()}</b></h6>
                        <h6 class="menesioBtextas2">Kiti: <b class="b_spalva">${planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 6 ).findFirst().orElse(null).getPlanasKiti()}</b></h6>
                    </div>


                    <div  class="st_column _colketvirciai">
                        <h6 class="menesioBtextas">Planuojami pardavimai (04 mėn.): <b class="b_spalva">${infoall.planuojamiPar4}</b></h6>
                        <h6 class="menesioBtextas">Planuojami pardavimai (05 mėn.): <b class="b_spalva">${infoall.planuojamiPar5}</b></h6>
                        <h6 class="menesioBtextas">Planuojami pardavimai (06 mėn.): <b class="b_spalva">${infoall.planuojamiPar6}</b></h6>
                        <h6 class="menesioBtextas">Planuojami darbai II kevirtis: <b class="b_spalvak">${infoall.planuojamiPar4+infoall.planuojamiPar5+infoall.planuojamiPar6}</b></h6>
                    </div>

                    <div class="st_column _colketvirciai" style="border-right: solid 1px #ff6e40">
                        <h6 class="menesioBtextas">Elektra: <b class="b_spalva">${infoall.ket2Elektra}</b></h6>
                        <h6 class="menesioBtextas">Santechnika: <b class="b_spalva">${infoall.ket2Santechnika}</b></h6>
                        <h6 class="menesioBtextas">Statyba: <b class="b_spalva">${infoall.ket2Statyba}</b></h6>
                        <h6 class="menesioBtextas">Kiti: <b class="b_spalva">${infoall.ket2Kita}</b></h6>
                    </div>
                    <div  class="st_column _colketvirciai">
                        <h6 class="menesioBtextas">Planuojamas aktavimas (04 mėn.): <b class="b_spalva">${infoall.planuojamasAkt4}</b></h6>
                        <h6 class="menesioBtextas">Planuojamas aktavimas (05 mėn.): <b class="b_spalva">${infoall.planuojamasAkt5}</b></h6>
                        <h6 class="menesioBtextas">Planuojamas aktavimas (06 mėn.): <b class="b_spalva">${infoall.planuojamasAkt6}</b></h6>
                        <h6 class="menesioBtextas">Sutartys II kevirtis: <b class="b_spalvak">${infoall.planuojamasAkt4+infoall.planuojamasAkt5+infoall.planuojamasAkt6}</b></h6>
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
                    <div class="st_column _sutartinesuma" data-toggle="tooltip" title="Sutartinė suma (tiksli)">SS</div>

                    <div class="st_column _tikslisuma" data-toggle="tooltip" title="1 Aktavimo Suma">1 Akt S</div>
                    <div class="st_column _atlikimodata" data-toggle="tooltip" title="1 Aktavimo Data">1 Akt D</div>
                    <div class="st_column _ticketFMSid" data-toggle="tooltip" title="FMS ticket ID">1 FMS</div>

                    <div class="st_column _padalinta"><input type="checkbox" class="padalinta" /></div>

                    <div class="st_column _tikslisuma2" data-toggle="tooltip" title="2 Aktavimo Suma">2 Akt S</div>
                    <div class="st_column _atlikimodata2" data-toggle="tooltip" title="2 Aktavimo Data">2 Akt D</div>
                    <div class="st_column _ticketFMSid2" data-toggle="tooltip" title="FMS ticket ID (Dalinimas)">2 FMS</div>

                    <div class="st_column _tikslisuma3" data-toggle="tooltip" title="3 Aktavimo Suma">3 Akt S</div>
                    <div class="st_column _atlikimodata3" data-toggle="tooltip" title="3 Aktavimo Data">3 Akt D</div>
                    <div class="st_column _ticketFMSid3" data-toggle="tooltip" title="FMS ticket ID (Dalinimas) 3">3 FMS</div>

                    <div class="st_column _tikslisuma4" data-toggle="tooltip" title="4 Aktavimo Suma">4 Akt S</div>
                    <div class="st_column _atlikimodata4" data-toggle="tooltip" title="4 Aktavimo Data">4 Akt D</div>
                    <div class="st_column _ticketFMSid4" data-toggle="tooltip" title="FMS ticket ID (Dalinimas) 4">4 FMS</div>

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
                                <c:when test="${a2ketvertis.sutartineSuma == 0.0}">
                                    <div class="st_column _sutartinesuma not_filled" >${a2ketvertis.sutartineSuma}</div>
                                </c:when>
                                <c:otherwise>
                                    <div class="st_column _sutartinesuma">${a2ketvertis.sutartineSuma}</div>
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

                            <c:choose>
                                <c:when test="${a2ketvertis.ticketFMSid == ''}">
                                    <div class="st_column _ticketFMSid not_filled"><a href="https://fms.civinity.lt/tickets/view/${a2ketvertis.ticketFMSid}">${a2ketvertis.ticketFMSid}</a></div>
                                </c:when>
                                <c:otherwise>
                                    <div class="st_column _ticketFMSid"><a href="https://fms.civinity.lt/tickets/view/${a2ketvertis.ticketFMSid}">${a2ketvertis.ticketFMSid}</a></div>
                                </c:otherwise>
                            </c:choose>

                            <div class="st_column _padalinta"></div>

                            <div class="st_column _tikslisuma2">${a2ketvertis.sutartineSumaTiksli2}</div>
                            <div class="st_column _atlikimodata2">${a2ketvertis.planuojamaAtlikimoData2}</div>
                            <div class="st_column _ticketFMSid2"><a href="https://fms.civinity.lt/tickets/view/${a2ketvertis.ticketFMSid2}">${a2ketvertis.ticketFMSid2}</a></div>

                            <div class="st_column _tikslisuma3">${a2ketvertis.sutartineSumaTiksli3}</div>
                            <div class="st_column _atlikimodata3">${a2ketvertis.planuojamaAtlikimoData3}</div>
                            <div class="st_column _ticketFMSid3"><a href="https://fms.civinity.lt/tickets/view/${a2ketvertis.ticketFMSid3}">${a2ketvertis.ticketFMSid3}</a></div>

                            <div class="st_column _tikslisuma4">${a2ketvertis.sutartineSumaTiksli4}</div>
                            <div class="st_column _atlikimodata4">${a2ketvertis.planuojamaAtlikimoData4}</div>
                            <div class="st_column _ticketFMSid4"><a href="https://fms.civinity.lt/tickets/view/${a2ketvertis.ticketFMSid4}">${a2ketvertis.ticketFMSid4}</a></div>

                            <div class="st_column _mygtukai2">
                                <button onclick="location.href='${contextPath}/viewPardavimas/${a2ketvertis.id}'" class="btn btn-blue-grey btn-sm" style="height:20px; width:40px;padding: 0;margin: 0; ">
                                    <i class="far fa-eye"></i>
                                </button>
                                <button onclick="location.href='?pardavimoid=${a2ketvertis.id}&metais=${pasirinktiMetai}&unit=${pasirinktasUnit.id}&scrolas='+$('#myscroll').scrollTop()" class="btn btn-blue-grey btn-sm" style="height:20px; width:40px;padding: 0;margin: 0;">
                                    <i class="far fa-edit"></i>
                                </button>
                                    <button onclick="location.href='${contextPath}/pardavimolent/${a2ketvertis.id}/delete?metais=${pasirinktiMetai}&scrolas='+$('#myscroll').scrollTop()"  class="btn btn-blue-grey btn-sm" style="height:20px; width:40px;padding: 0;margin: 0; ">
                                        <i class="fas fa-trash-alt"></i>
                                    </button>

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

                    <div class="st_column _colketvirciai2">
                        <h6 class="menesioBtextas2" data-toggle="tooltip" title="Mėnesio Planas">MP (07 mėn.):
                            <b class="b_spalva">
                                ${planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 7 ).findFirst().orElse(null).getPlanasElektra()
                                        + planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 7 ).findFirst().orElse(null).getPlanasSantechnika()
                                        + planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 7 ).findFirst().orElse(null).getPlanasStatyba()
                                        + planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 7).findFirst().orElse(null).getPlanasKiti()}
                            </b>
                        </h6>
                        <h6 class="menesioBtextas2" data-toggle="tooltip" title="Mėnesio Planas">MP (08 mėn.):
                            <b class="b_spalva">
                                ${planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 8 ).findFirst().orElse(null).getPlanasElektra()
                                        + planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 8 ).findFirst().orElse(null).getPlanasSantechnika()
                                        + planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 8 ).findFirst().orElse(null).getPlanasStatyba()
                                        + planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 8).findFirst().orElse(null).getPlanasKiti()}
                            </b>
                        </h6>
                        <h6 class="menesioBtextas2" data-toggle="tooltip" title="Mėnesio Planas">MP (09 mėn.):
                            <b class="b_spalva">
                                ${planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 9 ).findFirst().orElse(null).getPlanasElektra()
                                        + planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 9 ).findFirst().orElse(null).getPlanasSantechnika()
                                        + planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 9 ).findFirst().orElse(null).getPlanasStatyba()
                                        + planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 9).findFirst().orElse(null).getPlanasKiti()}
                            </b>
                        </h6>
                    </div>
                    <div class="st_column _colketvirciai2">
                        <h6 class="menesioBtextas2">Elektra: <b class="b_spalva">${planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 7 ).findFirst().orElse(null).getPlanasElektra()}</b></h6>
                        <h6 class="menesioBtextas2">Elektra: <b class="b_spalva">${planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 8 ).findFirst().orElse(null).getPlanasElektra()}</b></h6>
                        <h6 class="menesioBtextas2">Elektra: <b class="b_spalva">${planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 9 ).findFirst().orElse(null).getPlanasElektra()}</b></h6>
                    </div>
                    <div class="st_column _colketvirciai2">
                        <h6 class="menesioBtextas2">Santechnika: <b class="b_spalva">${planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 7 ).findFirst().orElse(null).getPlanasSantechnika()}</b></h6>
                        <h6 class="menesioBtextas2">Santechnika: <b class="b_spalva">${planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 8 ).findFirst().orElse(null).getPlanasSantechnika()}</b></h6>
                        <h6 class="menesioBtextas2">Santechnika: <b class="b_spalva">${planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 9 ).findFirst().orElse(null).getPlanasSantechnika()}</b></h6>
                    </div>
                    <div class="st_column _colketvirciai2" >
                        <h6 class="menesioBtextas2">Statyba: <b class="b_spalva">${planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 7 ).findFirst().orElse(null).getPlanasStatyba()}</b></h6>
                        <h6 class="menesioBtextas2">Statyba: <b class="b_spalva">${planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 8 ).findFirst().orElse(null).getPlanasStatyba()}</b></h6>
                        <h6 class="menesioBtextas2">Statyba: <b class="b_spalva">${planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 9 ).findFirst().orElse(null).getPlanasStatyba()}</b></h6>
                    </div>
                    <div class="st_column _colketvirciai2" style="border-right: solid 1px #ff6e40">
                        <h6 class="menesioBtextas2">Kiti: <b class="b_spalva">${planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 7 ).findFirst().orElse(null).getPlanasKiti()}</b></h6>
                        <h6 class="menesioBtextas2">Kiti: <b class="b_spalva">${planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 8 ).findFirst().orElse(null).getPlanasKiti()}</b></h6>
                        <h6 class="menesioBtextas2">Kiti: <b class="b_spalva">${planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 9 ).findFirst().orElse(null).getPlanasKiti()}</b></h6>
                    </div>

                    <div  class="st_column _colketvirciai">
                        <h6 class="menesioBtextas">Planuojami pardavimai (07 mėn.): <b class="b_spalva">${infoall.planuojamiPar7}</b></h6>
                        <h6 class="menesioBtextas">Planuojami pardavimai (08 mėn.): <b class="b_spalva">${infoall.planuojamiPar8}</b></h6>
                        <h6 class="menesioBtextas">Planuojami pardavimai (09 mėn.): <b class="b_spalva">${infoall.planuojamiPar9}</b></h6>
                        <h6 class="menesioBtextas">Planuojami darbai III kevirtis: <b class="b_spalvak">${infoall.planuojamiPar7+infoall.planuojamiPar8+infoall.planuojamiPar9}</b></h6>
                    </div>

                    <div class="st_column _colketvirciai" style="border-right: solid 1px #ff6e40">
                        <h6 class="menesioBtextas">Elektra: <b class="b_spalva">${infoall.ket3Elektra}</b></h6>
                        <h6 class="menesioBtextas">Santechnika: <b class="b_spalva">${infoall.ket3Santechnika}</b></h6>
                        <h6 class="menesioBtextas">Statyba: <b class="b_spalva">${infoall.ket3Statyba}</b></h6>
                        <h6 class="menesioBtextas">Kiti: <b class="b_spalva">${infoall.ket3Kita}</b></h6>
                    </div>
                    <div  class="st_column _colketvirciai">
                        <h6 class="menesioBtextas">Planuojamas aktavimas (07 mėn.): <b class="b_spalva">${infoall.planuojamasAkt7}</b></h6>
                        <h6 class="menesioBtextas">Planuojamas aktavimas (08 mėn.): <b class="b_spalva">${infoall.planuojamasAkt8}</b></h6>
                        <h6 class="menesioBtextas">Planuojamas aktavimas (09 mėn.): <b class="b_spalva">${infoall.planuojamasAkt9}</b></h6>
                        <h6 class="menesioBtextas">Sutartys III kevirtis: <b class="b_spalvak">${infoall.planuojamasAkt7+infoall.planuojamasAkt8+infoall.planuojamasAkt9}</b></h6>
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
                    <div class="st_column _sutartinesuma" data-toggle="tooltip" title="Sutartinė suma (tiksli)">SS</div>

                    <div class="st_column _tikslisuma" data-toggle="tooltip" title="1 Aktavimo Suma">1 Akt S</div>
                    <div class="st_column _atlikimodata" data-toggle="tooltip" title="1 Aktavimo Data">1 Akt D</div>
                    <div class="st_column _ticketFMSid" data-toggle="tooltip" title="FMS ticket ID">1 FMS</div>

                    <div class="st_column _padalinta"><input type="checkbox" class="padalinta" /></div>

                    <div class="st_column _tikslisuma2" data-toggle="tooltip" title="2 Aktavimo Suma">2 Akt S</div>
                    <div class="st_column _atlikimodata2" data-toggle="tooltip" title="2 Aktavimo Data">2 Akt D</div>
                    <div class="st_column _ticketFMSid2" data-toggle="tooltip" title="FMS ticket ID (Dalinimas)">2 FMS</div>

                    <div class="st_column _tikslisuma3" data-toggle="tooltip" title="3 Aktavimo Suma">3 Akt S</div>
                    <div class="st_column _atlikimodata3" data-toggle="tooltip" title="3 Aktavimo Data">3 Akt D</div>
                    <div class="st_column _ticketFMSid3" data-toggle="tooltip" title="FMS ticket ID (Dalinimas) 3">3 FMS</div>

                    <div class="st_column _tikslisuma4" data-toggle="tooltip" title="4 Aktavimo Suma">4 Akt S</div>
                    <div class="st_column _atlikimodata4" data-toggle="tooltip" title="4 Aktavimo Data">4 Akt D</div>
                    <div class="st_column _ticketFMSid4" data-toggle="tooltip" title="FMS ticket ID (Dalinimas) 4">4 FMS</div>

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
                                <c:when test="${a3ketvertis.sutartineSuma == 0.0}">
                                    <div class="st_column _sutartinesuma  not_filled">${a3ketvertis.sutartineSuma}</div>
                                </c:when>
                                <c:otherwise>
                                    <div class="st_column _sutartinesuma">${a3ketvertis.sutartineSuma}</div>
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

                            <c:choose>
                                <c:when test="${a3ketvertis.ticketFMSid == ''}">
                                    <div class="st_column _ticketFMSid not_filled"><a href="https://fms.civinity.lt/tickets/view/${a3ketvertis.ticketFMSid}">${a3ketvertis.ticketFMSid}</a></div>
                                </c:when>
                                <c:otherwise>
                                    <div class="st_column _ticketFMSid"><a href="https://fms.civinity.lt/tickets/view/${a3ketvertis.ticketFMSid}">${a3ketvertis.ticketFMSid}</a></div>
                                </c:otherwise>
                            </c:choose>

                            <div class="st_column _padalinta"></div>

                            <div class="st_column _tikslisuma2">${a3ketvertis.sutartineSumaTiksli2}</div>
                            <div class="st_column _atlikimodata2">${a3ketvertis.planuojamaAtlikimoData2}</div>
                            <div class="st_column _ticketFMSid2"><a href="https://fms.civinity.lt/tickets/view/${a3ketvertis.ticketFMSid2}">${a3ketvertis.ticketFMSid2}</a></div>

                            <div class="st_column _tikslisuma3">${a3ketvertis.sutartineSumaTiksli3}</div>
                            <div class="st_column _atlikimodata3">${a3ketvertis.planuojamaAtlikimoData3}</div>
                            <div class="st_column _ticketFMSid3"><a href="https://fms.civinity.lt/tickets/view/${a3ketvertis.ticketFMSid3}">${a3ketvertis.ticketFMSid3}</a></div>

                            <div class="st_column _tikslisuma4">${a3ketvertis.sutartineSumaTiksli4}</div>
                            <div class="st_column _atlikimodata4">${a3ketvertis.planuojamaAtlikimoData4}</div>
                            <div class="st_column _ticketFMSid4"><a href="https://fms.civinity.lt/tickets/view/${a3ketvertis.ticketFMSid4}">${a3ketvertis.ticketFMSid4}</a></div>

                            <div class="st_column _mygtukai2">
                                <button onclick="location.href='${contextPath}/viewPardavimas/${a3ketvertis.id}'" class="btn btn-blue-grey btn-sm" style="height:20px; width:40px;padding: 0;margin: 0; ">
                                    <i class="far fa-eye"></i>
                                </button>
                                <button onclick="location.href='?pardavimoid=${a3ketvertis.id}&metais=${pasirinktiMetai}&unit=${pasirinktasUnit.id}&scrolas='+$('#myscroll').scrollTop()" class="btn btn-blue-grey btn-sm" style="height:20px; width:40px;padding: 0;margin: 0; ">
                                    <i class="far fa-edit"></i>
                                </button>
                                    <button onclick="location.href='${contextPath}/pardavimolent/${a3ketvertis.id}/delete?metais=${pasirinktiMetai}&scrolas='+$('#myscroll').scrollTop()"  class="btn btn-blue-grey btn-sm" style="height:20px; width:40px;padding: 0;margin: 0;">
                                        <i class="fas fa-trash-alt"></i>
                                    </button>

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

                    <div class="st_column _colketvirciai2">
                        <h6 class="menesioBtextas2">MP (10 mėn.):
                            <b class="b_spalva" data-toggle="tooltip" title="Mėnesio Planas">
                                ${planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 10 ).findFirst().orElse(null).getPlanasElektra()
                                        + planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 10 ).findFirst().orElse(null).getPlanasSantechnika()
                                        + planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 10 ).findFirst().orElse(null).getPlanasStatyba()
                                        + planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 10).findFirst().orElse(null).getPlanasKiti()}
                            </b>
                        </h6>
                        <h6 class="menesioBtextas2" data-toggle="tooltip" title="Mėnesio Planas">MP (11 mėn.):
                            <b class="b_spalva">
                                ${planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 11 ).findFirst().orElse(null).getPlanasElektra()
                                        + planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 11 ).findFirst().orElse(null).getPlanasSantechnika()
                                        + planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 11 ).findFirst().orElse(null).getPlanasStatyba()
                                        + planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 11).findFirst().orElse(null).getPlanasKiti()}
                            </b>
                        </h6>
                        <h6 class="menesioBtextas2" data-toggle="tooltip" title="Mėnesio Planas">MP (12 mėn.):
                            <b class="b_spalva">
                                ${planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 12 ).findFirst().orElse(null).getPlanasElektra()
                                        + planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 12 ).findFirst().orElse(null).getPlanasSantechnika()
                                        + planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 12 ).findFirst().orElse(null).getPlanasStatyba()
                                        + planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 12).findFirst().orElse(null).getPlanasKiti()}
                            </b>
                        </h6>
                    </div>
                    <div class="st_column _colketvirciai2">
                        <h6 class="menesioBtextas2">Elektra: <b class="b_spalva">${planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 10 ).findFirst().orElse(null).getPlanasElektra()}</b></h6>
                        <h6 class="menesioBtextas2">Elektra: <b class="b_spalva">${planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 11 ).findFirst().orElse(null).getPlanasElektra()}</b></h6>
                        <h6 class="menesioBtextas2">Elektra: <b class="b_spalva">${planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 12 ).findFirst().orElse(null).getPlanasElektra()}</b></h6>
                    </div>
                    <div class="st_column _colketvirciai2">
                        <h6 class="menesioBtextas2">Santechnika: <b class="b_spalva">${planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 10 ).findFirst().orElse(null).getPlanasSantechnika()}</b></h6>
                        <h6 class="menesioBtextas2">Santechnika: <b class="b_spalva">${planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 11 ).findFirst().orElse(null).getPlanasSantechnika()}</b></h6>
                        <h6 class="menesioBtextas2">Santechnika: <b class="b_spalva">${planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 12 ).findFirst().orElse(null).getPlanasSantechnika()}</b></h6>
                    </div>
                    <div class="st_column _colketvirciai2" >
                        <h6 class="menesioBtextas2">Statyba: <b class="b_spalva">${planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 10 ).findFirst().orElse(null).getPlanasStatyba()}</b></h6>
                        <h6 class="menesioBtextas2">Statyba: <b class="b_spalva">${planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 11 ).findFirst().orElse(null).getPlanasStatyba()}</b></h6>
                        <h6 class="menesioBtextas2">Statyba: <b class="b_spalva">${planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 12 ).findFirst().orElse(null).getPlanasStatyba()}</b></h6>
                    </div>
                    <div class="st_column _colketvirciai2" style="border-right: solid 1px #ff6e40">
                        <h6 class="menesioBtextas2">Kiti: <b class="b_spalva">${planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 10 ).findFirst().orElse(null).getPlanasKiti()}</b></h6>
                        <h6 class="menesioBtextas2">Kiti: <b class="b_spalva">${planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 11 ).findFirst().orElse(null).getPlanasKiti()}</b></h6>
                        <h6 class="menesioBtextas2">Kiti: <b class="b_spalva">${planasMenesio.stream().filter(e -> e.getPlanasMenuo() == 12 ).findFirst().orElse(null).getPlanasKiti()}</b></h6>
                    </div>

                    <div  class="st_column _colketvirciai">
                        <h6 class="menesioBtextas">Planuojami pardavimai (10 mėn.): <b class="b_spalva">${infoall.planuojamiPar10}</b></h6>
                        <h6 class="menesioBtextas">Planuojami pardavimai (11 mėn.): <b class="b_spalva">${infoall.planuojamiPar11}</b></h6>
                        <h6 class="menesioBtextas">Planuojami pardavimai (12 mėn.): <b class="b_spalva">${infoall.planuojamiPar12}</b></h6>
                        <h6 class="menesioBtextas">Planuojami darbai IV kevirtis: <b class="b_spalvak">${infoall.planuojamiPar10+infoall.planuojamiPar11+infoall.planuojamiPar12}</b></h6>
                    </div>

                    <div class="st_column _colketvirciai" style="border-right: solid 1px #ff6e40">
                        <h6 class="menesioBtextas">Elektra: <b class="b_spalva">${infoall.ket4Elektra}</b></h6>
                        <h6 class="menesioBtextas">Santechnika: <b class="b_spalva">${infoall.ket4Santechnika}</b></h6>
                        <h6 class="menesioBtextas">Statyba: <b class="b_spalva">${infoall.ket4Statyba}</b></h6>
                        <h6 class="menesioBtextas">Kiti: <b class="b_spalva">${infoall.ket4Kita}</b></h6>
                    </div>

                    <div  class="st_column _colketvirciai">
                        <h6 class="menesioBtextas">Planuojamas aktavimas (10 mėn.): <b class="b_spalva">${infoall.planuojamasAkt10}</b></h6>
                        <h6 class="menesioBtextas">Planuojamas aktavimas (11 mėn.): <b class="b_spalva">${infoall.planuojamasAkt11}</b></h6>
                        <h6 class="menesioBtextas">Planuojamas aktavimas (12 mėn.): <b class="b_spalva">${infoall.planuojamasAkt12}</b></h6>
                        <h6 class="menesioBtextas">Sutartys IV kevirtis: <b class="b_spalvak">${infoall.planuojamasAkt10+infoall.planuojamasAkt11+infoall.planuojamasAkt12}</b></h6>
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
                    <div class="st_column _sutartinesuma" data-toggle="tooltip" title="Sutartinė suma (tiksli)">SS</div>

                    <div class="st_column _tikslisuma" data-toggle="tooltip" title="1 Aktavimo Suma">1 Akt S</div>
                    <div class="st_column _atlikimodata" data-toggle="tooltip" title="1 Aktavimo Data">1 Akt D</div>
                    <div class="st_column _ticketFMSid" data-toggle="tooltip" title="FMS ticket ID">1 FMS</div>

                    <div class="st_column _padalinta"><input type="checkbox" class="padalinta" /></div>

                    <div class="st_column _tikslisuma2" data-toggle="tooltip" title="2 Aktavimo Suma">2 Akt S</div>
                    <div class="st_column _atlikimodata2" data-toggle="tooltip" title="2 Aktavimo Data">2 Akt D</div>
                    <div class="st_column _ticketFMSid2" data-toggle="tooltip" title="FMS ticket ID (Dalinimas)">2 FMS</div>

                    <div class="st_column _tikslisuma3" data-toggle="tooltip" title="3 Aktavimo Suma">3 Akt S</div>
                    <div class="st_column _atlikimodata3" data-toggle="tooltip" title="3 Aktavimo Data">3 Akt D</div>
                    <div class="st_column _ticketFMSid3" data-toggle="tooltip" title="FMS ticket ID (Dalinimas) 3">3 FMS</div>

                    <div class="st_column _tikslisuma4" data-toggle="tooltip" title="4 Aktavimo Suma">4 Akt S</div>
                    <div class="st_column _atlikimodata4" data-toggle="tooltip" title="4 Aktavimo Data">4 Akt D</div>
                    <div class="st_column _ticketFMSid4" data-toggle="tooltip" title="FMS ticket ID (Dalinimas) 4">4 FMS</div>

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
                                <c:when test="${a4ketvertis.sutartineSuma == 0.0}">
                                    <div class="st_column _sutartinesuma  not_filled" >${a4ketvertis.sutartineSuma}</div>
                                </c:when>
                                <c:otherwise>
                                    <div class="st_column _sutartinesuma">${a4ketvertis.sutartineSuma}</div>
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

                            <c:choose>
                                <c:when test="${a4ketvertis.ticketFMSid == ''}">
                                    <div class="st_column _ticketFMSid not_filled"><a href="https://fms.civinity.lt/tickets/view/${a4ketvertis.ticketFMSid}">${a4ketvertis.ticketFMSid}</a></div>
                                </c:when>
                                <c:otherwise>
                                    <div class="st_column _ticketFMSid"><a href="https://fms.civinity.lt/tickets/view/${a4ketvertis.ticketFMSid}">${a4ketvertis.ticketFMSid}</a></div>
                                </c:otherwise>
                            </c:choose>

                            <div class="st_column _padalinta"></div>

                            <div class="st_column _tikslisuma2">${a4ketvertis.sutartineSumaTiksli2}</div>
                            <div class="st_column _atlikimodata2">${a4ketvertis.planuojamaAtlikimoData2}</div>
                            <div class="st_column _ticketFMSid2"><a href="https://fms.civinity.lt/tickets/view/${a4ketvertis.ticketFMSid2}">${a4ketvertis.ticketFMSid2}</a></div>

                            <div class="st_column _tikslisuma3">${a4ketvertis.sutartineSumaTiksli3}</div>
                            <div class="st_column _atlikimodata3">${a4ketvertis.planuojamaAtlikimoData3}</div>
                            <div class="st_column _ticketFMSid3"><a href="https://fms.civinity.lt/tickets/view/${a4ketvertis.ticketFMSid3}">${a4ketvertis.ticketFMSid3}</a></div>

                            <div class="st_column _tikslisuma4">${a4ketvertis.sutartineSumaTiksli4}</div>
                            <div class="st_column _atlikimodata4">${a4ketvertis.planuojamaAtlikimoData4}</div>
                            <div class="st_column _ticketFMSid4"><a href="https://fms.civinity.lt/tickets/view/${a4ketvertis.ticketFMSid4}">${a4ketvertis.ticketFMSid4}</a></div>

                            <div class="st_column _mygtukai2">
                                <button onclick="location.href='${contextPath}/viewPardavimas/${a4ketvertis.id}'" class="btn btn-blue-grey btn-sm" style="height:20px; width:40px;padding: 0;margin: 0; ">
                                    <i class="far fa-eye"></i>
                                </button>
                                <button onclick="location.href='?pardavimoid=${a4ketvertis.id}&metais=${pasirinktiMetai}&unit=${pasirinktasUnit.id}&scrolas='+$('#myscroll').scrollTop()" class="btn btn-blue-grey btn-sm" style="height:20px; width:40px;padding: 0;margin: 0;" >
                                    <i class="far fa-edit"></i>
                                </button>
                                    <button onclick="location.href='${contextPath}/pardavimolent/${a4ketvertis.id}/delete?metais=${pasirinktiMetai}&scrolas='+$('#myscroll').scrollTop()"  class="btn btn-blue-grey btn-sm" style="height:20px; width:40px;padding: 0;margin: 0;">
                                        <i class="fas fa-trash-alt"></i>
                                    </button>

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
    <div class="modal-dialog modal-lg" role="document" >
        <div class="modal-content" >
            <div class="modal-header text-center">
                <h4 class="modal-title w-100 font-weight-bold">Pardavimas</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form:form method="post"  action="${contextPath}/addPardavima?metais=${pasirinktiMetai}&unit=${pasirinktasUnit.id}&scrolas=${scrolas}" modelAttribute="pardavimas" >
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
                            <form:select path="sprendimoPriemimoBudas" required="required" aria-required="true"  cssClass="browser-default custom-select">
                                <form:option value="" label="--Please Select--"/>
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
                            <form:select path="darbuTipas" required="required" aria-required="true"  cssClass="browser-default custom-select">
                                <form:option value="" label="--Please Select--"/>
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
                        <p class="p_label">Sutartinė Suma</p>
                        <spring:bind path="sutartineSuma">
                            <form:input path="sutartineSuma" cssClass="form-control validate" type="number"  autocomplete="off" />
                        </spring:bind>
                    </div>

                    <div class="formos-inputai">
                        <p class="p_label">1 Aktavimo Suma</p>
                        <spring:bind path="sutartineSumaTiksli">
                            <form:input path="sutartineSumaTiksli" cssClass="form-control validate" type="number"  autocomplete="off"/>
                        </spring:bind>
                    </div>


                    <div class="formos-inputai">
                        <p class="p_label">1 Atlikimo Data</p>
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

                    <div class="formos-inputai">
                        <p class="p_label"> Dalinimas</p>
                        <input type="checkbox" id="dalinimas"/>
                    </div>

                    <div class="formos-inputai" id="SS2">
                        <p class="p_label">2 Aktavimo Suma</p>
                        <spring:bind path="sutartineSumaTiksli2">
                            <form:input path="sutartineSumaTiksli2" cssClass="form-control validate" type="number"  autocomplete="off"/>
                        </spring:bind>
                    </div>


                    <div class="formos-inputai" id="PAD2" >
                        <p class="p_label">2 Atlikimo Data</p>
                        <spring:bind path="planuojamaAtlikimoData2">
                            <form:input path="planuojamaAtlikimoData2" cssClass="form-control validate" type="text"  id="datepickeris3"/>
                        </spring:bind>
                    </div>

                    <div class="formos-inputai" id="FMS2" >
                        <p class="p_label">FMS Ticket ID 2</p>
                        <spring:bind path="ticketFMSid2">
                            <form:input path="ticketFMSid2" cssClass="form-control validate" type="number" autocomplete="off"/>
                        </spring:bind>
                    </div>

                    <div class="formos-inputai" id="SS3">
                        <p class="p_label">3 Aktavimo Suma</p>
                        <spring:bind path="sutartineSumaTiksli3">
                            <form:input path="sutartineSumaTiksli3" cssClass="form-control validate" type="number"  autocomplete="off"/>
                        </spring:bind>
                    </div>


                    <div class="formos-inputai" id="PAD3" >
                        <p class="p_label">3 Atlikimo Data</p>
                        <spring:bind path="planuojamaAtlikimoData3">
                            <form:input path="planuojamaAtlikimoData3" cssClass="form-control validate" type="text"  id="datepickeris4"/>
                        </spring:bind>
                    </div>

                    <div class="formos-inputai" id="FMS3" >
                        <p class="p_label">FMS Ticket ID 3</p>
                        <spring:bind path="ticketFMSid3">
                            <form:input path="ticketFMSid3" cssClass="form-control validate" type="number" autocomplete="off"/>
                        </spring:bind>
                    </div>

                    <div class="formos-inputai" id="SS4">
                        <p class="p_label">4 Aktavimo Suma</p>
                        <spring:bind path="sutartineSumaTiksli4">
                            <form:input path="sutartineSumaTiksli4" cssClass="form-control validate" type="number"  autocomplete="off"/>
                        </spring:bind>
                    </div>


                    <div class="formos-inputai" id="PAD4" >
                        <p class="p_label">4 Atlikimo Data</p>
                        <spring:bind path="planuojamaAtlikimoData4">
                            <form:input path="planuojamaAtlikimoData4" cssClass="form-control validate" type="text"  id="datepickeris5"/>
                        </spring:bind>
                    </div>

                    <div class="formos-inputai" id="FMS4" >
                        <p class="p_label">FMS Ticket ID 4</p>
                        <spring:bind path="ticketFMSid4">
                            <form:input path="ticketFMSid4" cssClass="form-control validate" type="number" autocomplete="off"/>
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

    $("#dalinimas").change(function() {
        if ($("#dalinimas").is(':checked')) {
            $("#SS2").show();
            $("#PAD2").show();
            $("#FMS2").show();
            $("#SS3").show();
            $("#PAD3").show();
            $("#FMS3").show();
            $("#SS4").show();
            $("#PAD4").show();
            $("#FMS4").show();
        } else {
            $("#SS2").hide();
            $("#PAD2").hide();
            $("#FMS2").hide();
            $("#SS3").hide();
            $("#PAD3").hide();
            $("#FMS3").hide();
            $("#SS4").hide();
            $("#PAD4").hide();
            $("#FMS4").hide();
        }

    }).change();

</script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/popper.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/mdb.min.js"></script>
</body>
</html>
