<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%-- <jsp:forward page="/selectBoardList.do"/> --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <html> -->
<!-- <head> -->
<!-- <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR"> -->
<!-- <title>Insert title here</title> -->
<!-- </head> -->
<!-- <body> -->
<!--  <h1> This is index.jsp. </h1> -->
<!-- </body> -->
<!-- </html> -->

<html lang="en">
    <head>
    		
    <%@ include file="/WEB-INF/include/include-header.jspf" %>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Creative - Start Bootstrap Theme</title>
        <!-- Bootstrap Core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="vendor/bootstrap/css/bs.sm.css" rel="stylesheet">
        <!-- Custom Fonts -->
        <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
        <!-- Plugin CSS -->
        <link href="vendor/magnific-popup/magnific-popup.css" rel="stylesheet">
        <!-- Theme CSS -->
        <link href="css/creative.min3.css" rel="stylesheet">
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    </head>
    <body id="page-top">
        
        <nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span> Menu 
                        <i class="fa fa-bars"></i>
                    </button>
                    <a class="navbar-brand page-scroll" href="#page-top">TOOWIDE</a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a id="menu_logout" class="page-scroll" onclick="fn_logout()" href="javascript:void(0);">로그아웃</a>
                        </li>
                        <li>
                            <a id="menu_project" class="page-scroll" href="performanceStatus.do">프로젝트</a>
                        </li>
                        <li>
                            <a id="menu_cost" class="page-scroll" href="budget_status.do">실행예산서</a>
                        </li>
                        <li>
                            <a id="menu_reception" class="page-scroll" href="request_status.do">업무요청및수신</a>
                        </li>
<!--                         <li> -->
<!--                             <a id="menu_dispatch" class="page-scroll" href="#contact">업무요청</a> -->
<!--                         </li> -->
                        <li>
                            <a id="menu_member" class="page-scroll" href="listMember.do"">직원</a>
                        </li>
                        <li>
                            <a id="menu_team" class="page-scroll" href="listTeam.do"">팀(TEAM)</a>
                        </li>
                        <li>
                            <a id="menu_notice" class="page-scroll" href="#contact">공지사항</a>
                        </li>
                        <li>
                            <a id="menu_import" class="page-scroll" href="importCardData.do">카드승인 데이터 적재</a>
                        </li>
                        <!-- <li>
                            <a id="menu_verification" class="page-scroll" href="#contact">카드승인 데이터 검증</a>
                        </li> -->
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container-fluid -->
        </nav>
       
     <div id="id_loading" style="display:none">  <img src="img/bg.jpg" /> </div>
<!--      <div id="id_mainContents"> -->
     
       <header id="id_header">
            <div class="header-content">
                <div class="header-content-inner">
                    <h1 id="homeHeading">프로젝트 현황</h1>
                    
                    <a id="btn_createPrj" class="btn btn-primary btn-xl page-scroll">프로젝트 생성</a>
                </div>
                <form role="form">
                    <div class="form-group"> 
                        <label class="control-label" for="formInput19">기준년</label>                         
                        <select id="id_s_year" class="form-control"> 
                            <option>2014</option>
                            <option>2015</option>
                            <option>2016</option>
                            <option>2017</option>                             
                            <option>2018</option>                             
                            <option>2019</option>
                            <option>2020</option>                             
                        </select>
                    </div>
                    <div class="form-group"> 
                        <label class="control-label" for="formInput23">기준반기</label>                         
                        <select id="id_s_quarter" class="form-control"> 
                            <option>상반기</option>                             
                            <option>하반기</option>                             
                            <option>전체</option>                             
                        </select>
                    </div>
                    <div class="form-group"> 
                        <label class="control-label" for="formInput45">제작팀명</label>                         
                        <select id="id_s_team_name" class="form-control"> 
                        	<option>전체</option> 
                            <option>연출1팀</option>                             
                            <option>연출2팀</option>                             
                            <option>연출3팀</option>    
                            <option>허니티브</option>
                            <option>투와이드미디어</option>
                            <option>외주제작</option>                         
                        </select>
                    </div>                     
                </form>
                
                <div>
                <button  id="id_performance_search" class="btn btn-primary btn-xl page-scroll">조회</button>
                </div>
            </div>
        </header>
        
        
        <section class="no-padding" id="id_session">
            <div class="call-to-action">
                <h1 id="id_peformance_title">&nbsp;기준년: 2017 &nbsp; 기준반기: 상반기<br></h1>
            </div>
            <div class="container-fluid">
                <div>
                    <span class="label label-default">프로젝트 수</span>
                    <table id="id_projectCountTable"  class="table" data-pg-collapsed> 
                        <thead data-pg-collapsed>
                            <tr> 
                                <th>팀명</th> 
                                <th>총 프로젝트 수</th> 
                                <th>완료 프로젝트 수</th> 
                                <th>진행 프로젝트 수</th> 
                            </tr>                             
                        </thead>                         
                        <tbody data-pg-collapsed> 
                            <tr> 
                                <td>전체</td>
                                <td>Mark</td> 
                                <td>Otto</td> 
                                <td>@mdo</td> 
                            </tr>                             
                            <tr> 
                                <td>연출1팀</td> 
                                <td>Jacob</td> 
                                <td>Thornton</td> 
                                <td>@fat</td> 
                            </tr>                             
                            <tr> 
                                <td>연출2팀</td> 
                                <td>Larry</td> 
                                <td>the Bird</td> 
                                <td>@twitter</td> 
                            </tr>
                            <tr> 
                                <td>연출3팀</td> 
                                <td>Larry</td> 
                                <td>the Bird</td> 
                                <td>@twitter</td> 
                            </tr>
                            <tr> 
                                <td>연출4팀</td> 
                                <td>Larry</td> 
                                <td>the Bird</td> 
                                <td>@twitter</td> 
                            </tr>                             
                        </tbody>
                    </table>
                </div>
                <div>
                    <span class="label label-default">실적</span>
                    <table id="id_projectCompleteTable" class="table" data-pg-collapsed> 
                        <thead data-pg-collapsed>
                            <tr> 
                                <th>팀명</th> 
                                <th>총 계약금</th> 
                                <th>총 지급 제작비</th> 
                                <th>총 계획(예산) 실적</th>
                                <th>총 실적</th>
                                <th>고정비</th>
                                <th>실적률 (%)</th> 
                            </tr>                             
                        </thead>                         
                        <tbody data-pg-collapsed> 
                            <tr> 
                                <td>전체</td>
                                <td>Mark</td> 
                                <td>Otto</td> 
                                <td>@mdo</td>
                                <td>@mdo</td>
                                <td>@mdo</td>
                                <td>@mdo</td> 
                            </tr>                             
                            <tr> 
                                <td>연출1팀</td> 
                                <td>Jacob</td> 
                                <td>Thornton</td> 
                                <td>@fat</td>
                                <td>@fat</td>
                                <td>@mdo</td>
                                <td>@fat</td> 
                            </tr>                             
                            <tr> 
                                <td>연출2팀</td> 
                                <td>Larry</td> 
                                <td>the Bird</td> 
                                <td>@twitter</td>
                                <td>@twitter</td>
                                <td>@mdo</td>
                                <td>@twitter</td> 
                            </tr>
                            <tr> 
                                <td>연출3팀</td> 
                                <td>Larry</td> 
                                <td>the Bird</td> 
                                <td>@twitter</td>
                                <td>@twitter</td>
                                <td>@mdo</td>
                                <td>@twitter</td> 
                            </tr>
                            <tr> 
                                <td>연출4팀</td> 
                                <td>Larry</td> 
                                <td>the Bird</td> 
                                <td>@twitter</td>
                                <td>@mdo</td>
                                <td>@twitter</td>
                                <td>@twitter</td> 
                            </tr>                             
                        </tbody>
                    </table>
                </div>
                <div>
<!--                     <span class="label label-default">진행중 정보</span> -->
					<span class="label label-default">(예상포함) 실적</span>
                    <table id="id_projectIngTable" class="table"> 
                        <thead data-pg-collapsed>
                            <tr> 
                                <th>팀명</th> 
                                <th>총 계약금</th> 
                                <th>총 지급 제작비</th> 
                                <th>총 계획(예산) 실적</th>
                                <th>총 실적</th>
                                <th>고정비</th>
                                <th>실적률 (%)</th> 
                            </tr>                             
                        </thead>                         
                        <tbody data-pg-collapsed> 
                            <tr> 
                                <td>전체</td>
                                <td>Mark</td> 
                                <td>Otto</td> 
                                <td>@mdo</td>
                                <td>@mdo</td> 
                                <td>@mdo</td>
                                <td>@mdo</td> 
                            </tr>                             
                            <tr> 
                                <td>연출1팀</td> 
                                <td>Jacob</td> 
                                <td>Thornton</td> 
                                <td>@fat</td>
                                <td>@fat</td> 
                                <td>@mdo</td>
                                <td>@mdo</td> 
                            </tr>                             
                            <tr> 
                                <td>연출2팀</td> 
                                <td>Larry</td> 
                                <td>the Bird</td> 
                                <td>@twitter</td>
                                <td>@twitter</td> 
                                <td>@mdo</td>
                                <td>@mdo</td> 
                            </tr>
                            <tr> 
                                <td>연출3팀</td> 
                                <td>Larry</td> 
                                <td>the Bird</td> 
                                <td>@twitter</td>
                                <td>@twitter</td> 
                                <td>@mdo</td>
                                <td>@mdo</td> 
                            </tr>
                            <tr> 
                                <td>연출4팀</td> 
                                <td>Larry</td> 
                                <td>the Bird</td> 
                                <td>@twitter</td>
                                <td>@twitter</td> 
                                <td>@mdo</td>
                                <td>@mdo</td> 
                            </tr>                             
                        </tbody>
                    </table>
                </div>
            </div>
        </section>
        <aside class="bg-dark" id="id_before_section_2">
            <div class="container text-center">
                <div class="header-content-inner">
                    <h3 id="homeHeading">프로젝트 제작정보 및 예산내역서</h3>
                    <a id="id_show_prjInfo" class="btn btn-primary btn-xl page-scroll">제작정보 보기</a>
                    <a id="id_show_budgetInfo" class="btn btn-primary btn-xl page-scroll">예산정보 생성및보기</a>
                    <a id="id_show_prjBudget" class="btn btn-primary btn-xl page-scroll">실행예산 보기</a>
                </div>
            </div>
        </aside>
        <section class="no-padding" id="id_section_2">
            <div class="container-fluid">
                <div>
                    <span class="label label-default">팀 상세 실적현황</span>
                    <table id="id_projectDetailTable" class="table" data-pg-collapsed> 
                        <thead>
                            <tr> 
                                <th>#</th> 
                                <th>기관명</th> 
                                <th>프로젝트 명</th> 
                                <th>계약금</th>
                                <th>제작비</th>
                                <th>내부비</th>
                                <th>외주비<br></th>
                                <th>진행비</th>
                                <th>지출 총계</th>
                                <th>외주비 잔액</th>
                                <th>연출실적</th>
                                <th>계약시작일</th>
                                <th>계약완료일</th>
                                <th>최종납부일</th>
                                <th>완료여부</th> 
                            </tr>                             
                        </thead>                         
                        <tbody> 
                            <tr> 
                                <td>1</td>
                                <td>Markㄴㅇㄹ ㄴㅇ런ㅇ러 ㄴ이ㅏ런 ㅇ런ㅇ 런ㅇㄹ&nbsp;</td> 
                                <td>ㄴㅇㄹㄴㅇㄹㄴㅇㄹㄴㅇㄹㄴㅁㅇㄹ</td> 
                                <td>@mdo</td>
                                <td>@mdo</td>
                                <td>@mdo</td>
                                <td>@mdo</td>
                                <td>@mdo</td>
                                <td>@mdo</td>
                                <td>@mdo</td>
                                <td>@mdo</td>
                                <td>@mdo</td>
                                <td>@mdo</td>
                                <td>@mdo</td>
                                <td>@mdo</td> 
                            </tr>                             
                            <tr> 
                                <td>2</td> 
                                <td>Jacob</td> 
                                <td>Thornton</td> 
                                <td>@fat</td>
                                <td>@fat</td>
                                <td>@fat</td>
                                <td>@fat</td>
                                <td>@fat</td>
                                <td>@fat</td>
                                <td>@fat</td>
                                <td>@fat</td>
                                <td>@fat</td>
                                <td>@fat</td>
                                <td>@fat</td>
                                <td>@fat</td> 
                            </tr>                             
                            <tr> 
                                <td>3</td> 
                                <td>Larry</td> 
                                <td>the Bird</td> 
                                <td>@twitter</td>
                                <td>@twitter</td>
                                <td>@twitter</td>
                                <td>@twitter</td>
                                <td>@twitter</td>
                                <td>@twitter</td>
                                <td>@twitter</td>
                                <td>@twitter</td>
                                <td>@twitter</td>
                                <td>@twitter</td>
                                <td>@twitter</td>
                                <td>@twitter</td> 
                            </tr>                             
                        </tbody>
                    </table>
                </div>
            </div>
        </section>
        <div class="modal fade pg-show-modal" id="modal1" tabindex="-1" role="dialog" aria-hidden="true"> 
            <div class="modal-dialog"> 
                <div class="modal-content"> 
                    <div class="modal-header"> 
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>                         
                        <h4 class="modal-title">처리중</h4> 
                    </div>                     
                    <div class="modal-body"> 
                        <p>프로세스 처리중 입니다.&nbsp;</p>
                    </div>                     
                    <div class="modal-footer"> 
                        <button type="button" id="close" class="btn btn-primary" data-dismiss="modal">Close</button>                         
                        <button type="button" class="btn btn-primary">Save changes</button>                         
                    </div>                     
                </div>                 
            </div>             
        </div>
        
        <div class="modal fade pg-show-modal" id="modal_create_prj" tabindex="-1" role="dialog" aria-hidden="true"> 
            <div class="modal-dialog"> 
                <div class="modal-content"> 
                    <div class="modal-header"> 
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>                         
                        <h4 d="id_cp_title" class="modal-title">프로젝트 생성</h4> 
                    </div>                     
                    <div class="modal-body"> 
                        
                        <p>&nbsp;</p>
                        
                        <form role="form" > 
                            <div class="form-group"> 
                                <label class="control-label" for="cpFormPrjName">프로젝트 명</label>                                 
                                <input type="text" class="form-control" id="cpFormPrjName" placeholder="프로젝트 명"> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cpFormAgency">기관명</label>                                 
                                <input type="text" class="form-control" id="cpFormAgency" placeholder="기관명"> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cpFormCteam">제작팀</label>                                 
                                <select id="cpFormCteam" class="form-control"> 
                                    <option>연출1팀</option>                                     
                                    <option>연출2팀</option>                                     
                                    <option>연출3팀</option>
                                    <option>허니티브</option>
                                    <option>투와이드미디어</option>
                                    <option>외주제작</option>
                                </select>
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cpFormPM">총괄PM (ex: 홍길동, 이름만 기입)
                                    <br>
                                </label>
                                <input type="text" class="form-control" id="cpFormPM" placeholder=""> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cpFormPD">제작담당PD (ex: 홍길동, 이름만 기입)
                                    <br>
                                </label>
                                <input type="text" class="form-control" id="cpFormPD" placeholder=""> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cpFormStartDay">계약 시작일 (ex: 20170522, yyyymmdd 8자리 숫자입력)</label>                                 
                                <input type="text" class="form-control" id="cpFormStartDay" placeholder="yyyymmdd"> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cpFormContCompleteDay1">계약완료1차(ex: 20170522, yyyymmdd 8자리 숫자입력)</label>                                 
                                <input type="text" class="form-control" id="cpFormContCompleteDay1" placeholder="yyyymmdd"> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cpFormContCompleteDay2">계약완료2차(ex: 20170522, yyyymmdd 8자리 숫자입력)</label>                                 
                                <input type="text" class="form-control" id="cpFormContCompleteDay2" placeholder="yyyymmdd"> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cpFormContCompleteDay3">계약완료3차(ex: 20170522, yyyymmdd 8자리 숫자입력)</label>                                 
                                <input type="text" class="form-control" id="cpFormContCompleteDay3" placeholder="yyyymmdd"> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cpFormDeliCompleteDay">납품완료일 &nbsp;(ex: 20170522, yyyymmdd 8자리 숫자입력)</label>                                 
                                <input type="text" class="form-control" id="cpFormDeliCompleteDay" placeholder="yyyymmdd"> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cpFormAdminCloseDay">관리자완료일 &nbsp;(ex: 20170522, yyyymmdd 8자리 숫자입력)</label>                                 
                                <input type="text" class="form-control" id="cpFormAdminCloseDay" placeholder="yyyymmdd"> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cpFormPrjCloseDay">프로젝트종료일&nbsp;(ex: 20170522, yyyymmdd 8자리 숫자입력)</label>                                 
                                <input type="text" class="form-control" id="cpFormPrjCloseDay" placeholder="yyyymmdd"> 
                            </div>
                            <div class="form-group"> 
						        <label class="control-label" for="cpFormStandardYear">실적 기준년</label>         
						        <select id="cpFormStandardYear" class="form-control"> 
						            <option>2015</option>             
						            <option>2016</option>             
						            <option>2017</option>             
						            <option>2018</option>
						            <option>2019</option>
						            <option>2020</option>
						        </select>
						    </div>
						    <div class="form-group"> 
						        <label class="control-label" for="cpFormStandardQuarter">실적 기준반기</label>         
						        <select id="cpFormStandardQuarter" class="form-control"> 
						            <option>상반기</option>             
						            <option>하반기</option>             
						        </select>
						    </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cpFormPrjStatus">프로젝트 진행상태</label>                                 
                                <select id="cpFormPrjStatus" class="form-control"> 
                                    <option>협상및계약</option>                                     
                                    <option>착수보고</option>                                     
                                    <option>시나리오</option>                                     
                                    <option>PPM</option>
                                    <option>촬영</option>
                                    <option>편집</option>
                                    <option>음악</option>
                                    <option>1차 시사</option>
                                    <option>2차 시사</option>
                                    <option>최종 시사</option>
                                    <option>외국어</option>
                                    <option>복사</option>
                                    <option>납품</option>
                                    <option>admin_close</option>
                                    <option>project_close</option>
                                </select>
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cpFormContrAmount">계약금액 (단위 원 - won)</label>                                 
                                <input type="number" class="form-control" id="cpFormContrAmount" placeholder=""> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cpFormPrjAmount">제작금액 (단위 원 - won)</label>                                 
                                <input type="number" class="form-control" id="cpFormPrjAmount" placeholder=""> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cpFormPrePayRatio">선금비율 (ex: 50%, 실제입력 % 제외)</label>                                 
                                <input type="number" class="form-control" id="cpFormPrePayRatio" placeholder=""> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cpFormPrePay">선금 (단위 원 - won)</label>                                 
                                <input type="number" class="form-control" id="cpFormPrePay" placeholder=""> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cpFormMidlePay1">중도금 1차(단위 원 - won)</label>                                 
                                <input type="number" class="form-control" id="cpFormMidlePay1" placeholder=""> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cpFormMidlePay2">중도금 2차(단위 원 - won)</label>                                 
                                <input type="number" class="form-control" id="cpFormMidlePay2" placeholder=""> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cpFormMidlePay3">중도금 3차(단위 원 - won)</label>                                 
                                <input type="number" class="form-control" id="cpFormMidlePay3" placeholder=""> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cpFormMidlePay4">중도금 4차 (단위 원 - won)</label>                                 
                                <input type="number" class="form-control" id="cpFormMidlePay4" placeholder=""> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cpFormBalance">잔금 (단위 원 - won)</label>                                 
                                <input type="number" class="form-control" id="cpFormBalance" placeholder=""> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cpFormRegSeal">사용인감</label>                                 
                                <select id="cpFormRegSeal" class="form-control"> 
                                    <option>별</option>                                     
                                    <option>세모</option>                                     
                                    <option>빈세모</option>
                                    <option>네모</option>
                                    <option>마름모</option>
                                </select>
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cpFormCustomProposal1">고객사 제안담당자1(최대 한글 50자)</label>
                                <textarea id="cpFormCustomProposal1" class="form-control" rows="3"></textarea>
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cpFormCustomProposal2">고객사 제안담당자2(최대 한글 50자)</label>
                                <textarea id="cpFormCustomProposal2" class="form-control" rows="3"></textarea>
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cpFormCustomContractl1">고객사 계약담당자1(최대 한글 50자)</label>
                                <textarea id="cpFormCustomContractl1" class="form-control" rows="3"></textarea>
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cpFormCustomContractl2">고객사 계약담당자2(최대 한글 50자)</label>
                                <textarea id="cpFormCustomContractl2" class="form-control" rows="3"></textarea>
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cpFormRemark1">비고 1(ex: 선금, 중도금 세금계산서 발행일 메모기록 , 최대 한글 150자)</label>
                                <textarea id="cpFormRemark1" class="form-control" rows="3"></textarea>
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cpFormRemark2">비고 2 (최대 한글 150자)</label>
                                <textarea id="cpFormRemark2" class="form-control" rows="3"></textarea>
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cpFormRemark3">비고 3 (최대 한글 150자)</label>
                                <textarea id="cpFormRemark3" class="form-control" rows="3"></textarea>
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cpFormRemark4">비고 4 (최대 한글 150자)</label>
                                <textarea id="cpFormRemark4" class="form-control" rows="3"></textarea>
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cpFormRemark5">비고 5 (최대 한글 150자)</label>
                                <textarea id="cpFormRemark5" class="form-control" rows="3"></textarea>
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cpFormNagotiation">협상내용 (ex: PM 협상내용, 제작팀과 공유내용, 최대 한글 200자)</label>
                                <textarea id="cpFormNagotiation" class="form-control" rows="3"></textarea>
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cpFormReportProgress">진행보고 (최대 한글 200자)</label>
                                <textarea id="cpFormReportProgress" class="form-control" rows="3"></textarea>
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cpFormReportResult">결과보고 (최대 한글 200자)</label>
                                <textarea id="cpFormReportResult" class="form-control" rows="3"></textarea>
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cpFormReportSpecial">특이사항 (최대 한글 200자)</label>
                                <textarea id="cpFormReportSpecial" class="form-control" rows="3"></textarea>
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cpFormDeliveryProduct">납품내역 (최대 한글 200자)</label>
                                <textarea id="cpFormDeliveryProduct" class="form-control" rows="3"></textarea>
                            </div>
                           
                           <!-- <div id="fileDiv">
								<p>
									<input type="file" id="file" name="file_0">
									<a href="#this" class="btn" id="delete" name="delete">삭제</a>
								</p>
							</div>   
							<br/><br/>
							<a href="#this" class="btn" id="addFile">파일 추가</a>   -->  
							                      
                        </form>
                        <form id="frmCreateProject" role="form" enctype="multipart/form-data">   
	                        <div id="selectFileDiv">
								
							</div>           
						     <div id="fileDiv">
								<!-- <p>
									<input type="file" id="file" name="file_0">
									<a href="#this" class="btn" id="delete" name="delete">삭제</a>
								</p> -->
							</div> 
							<div id="addFileDiv">
								<br/><br/>
								<a href="#this" class="btn" id="addFile">파일 추가</a>  
							</div>
							   
						</form>
					
                    </div>                     
                    <div class="modal-footer"> 
                        <button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>                         
                        <button id="id_cpSave" type="button" class="btn btn-primary">저장</button>
                        <!-- <button id="id_cbModify" type="button" class="btn btn-primary">예산계획 생성 및 수정</button>    -->                      
                    </div>                     
                </div>                 
            </div>             
        </div>
       
        <div class="modal fade pg-show-modal" id="modal_create_budget" tabindex="-1" role="dialog" aria-hidden="true"> 
            <div class="modal-dialog"> 
                <div class="modal-content"> 
                    <div class="modal-header"> 
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>                         
                        <h4 id="id_cb_title" class="modal-title">예산계획 생성</h4> 
                    </div>                     
                    <div class="modal-body"> 
                        <p>&nbsp;</p>
                        <form id="frmCreateBudget" role="form"> 
                            <div class="form-group"> 
                                <label class="control-label" for="cbFormPrjName">프로젝트 명</label>                                 
                                <input type="text" class="form-control" id="cbFormPrjName" placeholder="프로젝트 명"> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cbFormCteam">제작팀</label>    
                                <input type="text" class="form-control" id="cbFormCteam" placeholder="제작">                             
                            </div>
                            <div id="id_pm" class="form-group"> 
                                <label class="control-label" for="cbFormPM">총괄PM (ex: 홍길동, 이름만 기입)
                                    <br>
                                </label>
                                <input type="text" class="form-control" id="cbFormPM" placeholder=""> 
                            </div>
                            <div id="id_pd" class="form-group"> 
                                <label class="control-label" for="cbFormPD">제작담당PD (ex: 홍길동, 이름만 기입)
                                    <br>
                                </label>
                                <input type="text" class="form-control" id="cbFormPD" placeholder=""> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cbFormContractAmount">계약금액 (단위 원 - won)</label>                                 
                                <input type="number" class="form-control" id="cbFormContractAmount" placeholder=""> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cbFormProductAmount">제작금액 (단위 원 - won)</label>                                 
                                <input type="number" class="form-control" id="cbFormProductAmount" placeholder="PM 작성금액"> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cbFormPreResultAmount">예상 연출실적 (단위 원 - won)</label>                                 
                                <input type="number" class="form-control" id="cbFormPreResultAmount" placeholder="자동계산"> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cbFormPreCustSum">예상 지출 총합계 (단위 원 - won)</label>                                 
                                <input type="number" class="form-control" id="cbFormPreCustSum" placeholder="자동계산"> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cbFormPreProductSum">예상 제작비 합계(단위 원 - won)</label>                                 
                                <input type="number" class="form-control" id="cbFormPreProductSum" placeholder="자동계산"> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cbFormPreOutsourcingCost">예상 외주비(단위 원 - won)</label>                                 
                                <input type="number" class="form-control" id="cbFormPreOutsourcingCost" placeholder="자동계산"> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cbFormPreProgressCost">예상 진행비(단위 원 - won)</label>                                 
                                <input type="number" class="form-control" id="cbFormPreProgressCost" placeholder="자동계산"> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cbFormPreInternalCost">예상 내부비(단위 원 - won)</label>                                 
                                <input type="number" class="form-control" id="cbFormPreInternalCost" placeholder="자동계산"> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cbFormPreOCameraRental">외주비 카메라렌탈(단위 원 - won)</label>                                 
                                <input type="number" class="form-control" id="cbFormPreOCameraRental" placeholder=""> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cbFormPreOEquipmentCost">외주비 기자재비(단위 원 - won)</label>                                 
                                <input type="number" class="form-control" id="cbFormPreOEquipmentCost" placeholder=""> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cbFormPreOMakeupFee">외주비 메이크업(단위 원 - won)</label>                                 
                                <input type="number" class="form-control" id="cbFormPreOMakeupFee" placeholder=""> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cbFormPreOStarringFee">외주비 출연료(단위 원 - won)</label>                                 
                                <input type="number" class="form-control" id="cbFormPreOStarringFee" placeholder=""> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cbFormPreOAuthorFee">외주비 작가(단위 원 - won)</label>                                 
                                <input type="number" class="form-control" id="cbFormPreOAuthorFee" placeholder=""> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cbFormPreOPostProduct">외주비 POST_PRODUCT(단위 원 - won)</label>                                 
                                <input type="number" class="form-control" id="cbFormPreOPostProduct" placeholder=""> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cbFormPreORecordFee">외주비 녹음료(단위 원 - won)</label>                                 
                                <input type="number" class="form-control" id="cbFormPreORecordFee" placeholder=""> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cbFormPreOVoiceActorFee">외주비 성우료(단위 원 - won)</label>                                 
                                <input type="number" class="form-control" id="cbFormPreOVoiceActorFee" placeholder=""> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cbFormPreOTranslationFee">외주비 번역료(단위 원 - won)</label>                                 
                                <input type="number" class="form-control" id="cbFormPreOTranslationFee" placeholder=""> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cbFormPreOPurchaseMaterials">외주비 자료구매(단위 원 - won)</label>                                 
                                <input type="number" class="form-control" id="cbFormPreOPurchaseMaterials" placeholder=""> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cbFormPreOPlaceRental">외주비 장소대여(단위 원 - won)</label>                                 
                                <input type="number" class="form-control" id="cbFormPreOPlaceRental" placeholder=""> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cbFormPreOBuyArtAccessories">외주비 미술및소품구매(단위 원 - won)</label>                                 
                                <input type="number" class="form-control" id="cbFormPreOBuyArtAccessories" placeholder=""> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cbFormPreOArt">외주비 미술(단위 원 - won)</label>                                 
                                <input type="number" class="form-control" id="cbFormPreOArt" placeholder=""> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cbFormPreOOverSeesPhotography">외주비 해외촬영(단위 원 - won)</label>                                 
                                <input type="number" class="form-control" id="cbFormPreOOverSeesPhotography" placeholder=""> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cbFormPreOTranslationInspection">외주비 번역검수(단위 원 - won)</label>                                 
                                <input type="number" class="form-control" id="cbFormPreOTranslationInspection" placeholder=""> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cbFormPreOTranslation">외주비 번역(단위 원 - won)</label>                                 
                                <input type="number" class="form-control" id="cbFormPreOTranslation" placeholder=""> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cbFormPreODeliveryFee">외주비 납품료(단위 원 - won)</label>                                 
                                <input type="number" class="form-control" id="cbFormPreODeliveryFee" placeholder=""> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cbFormPreOEtc">외주비 기타(단위 원 - won)</label>                                 
                                <input type="number" class="form-control" id="cbFormPreOEtc" placeholder=""> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cbFormPrePFoodExpenses">진행비 식비(단위 원 - won)</label>                                 
                                <input type="number" class="form-control" id="cbFormPrePFoodExpenses" placeholder=""> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cbFormPrePFuelCost">진행비 주유비(단위 원 - won)</label>                                 
                                <input type="number" class="form-control" id="cbFormPrePFuelCost" placeholder=""> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cbFormPrePTransportationCost">진행비 교통비(단위 원 - won)</label>                                 
                                <input type="number" class="form-control" id="cbFormPrePTransportationCost" placeholder=""> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cbFormPrePAccommodationCost">진행비 숙박비(단위 원 - won)</label>                                 
                                <input type="number" class="form-control" id="cbFormPrePAccommodationCost" placeholder=""> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cbFormPrePSnackCost">진행비 부식비(단위 원 - won)</label>                                 
                                <input type="number" class="form-control" id="cbFormPrePSnackCost" placeholder=""> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cbFormPrePParkingFee">진행비 주차비(단위 원 - won)</label>                                 
                                <input type="number" class="form-control" id="cbFormPrePParkingFee" placeholder=""> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cbFormPrePPurchaseOfficeSupplies">진행비 비품구매(단위 원 - won)</label>                                 
                                <input type="number" class="form-control" id="cbFormPrePPurchaseOfficeSupplies" placeholder=""> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cbFormPrePEquipmentRental">진행비 장비렌탈(단위 원 - won)</label>                                 
                                <input type="number" class="form-control" id="cbFormPrePEquipmentRental" placeholder=""> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cbFormPrePEtc">진행비 기타(단위 원 - won)</label>                                 
                                <input type="number" class="form-control" id="cbFormPrePEtc" placeholder=""> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cbFormPrePCashUsage">진행비 현금사용내역(단위 원 - won)</label>                                 
                                <input type="number" class="form-control" id="cbFormPrePCashUsage" placeholder=""> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="cbFormPreICarRental">내부비 차량비(단위 원 - won)</label>                                 
                                <input type="number" class="form-control" id="cbFormPreICarRental" placeholder=""> 
                            </div>
<!--                             <div class="form-group">  -->
<!--                                 <label class="control-label" for="cbFormPreIPhotography1Team">내부비 촬영1팀(단위 원 - won)</label>                                  -->
<!--                                 <input type="number" class="form-control" id="cbFormPreIPhotography1Team" placeholder="">  -->
<!--                             </div> -->
<!--                             <div class="form-group">  -->
<!--                                 <label class="control-label" for="cbFormPreIPhotography2Team">내부비 촬영2팀(단위 원 - won)</label>                                  -->
<!--                                 <input type="number" class="form-control" id="cbFormPreIPhotography2Team" placeholder="">  -->
<!--                             </div> -->
<!--                             <div class="form-group">  -->
<!--                                 <label class="control-label" for="cbFormPreIAerialPhotographyTeam">내부비 항공팀(단위 원 - won)</label>                                  -->
<!--                                 <input type="number" class="form-control" id="cbFormPreIAerialPhotographyTeam" placeholder="">  -->
<!--                             </div> -->
<!--                             <div class="form-group">  -->
<!--                                 <label class="control-label" for="cbFormPreIAuthorTeam">내부비 작가팀(단위 원 - won)</label>                                  -->
<!--                                 <input type="number" class="form-control" id="cbFormPreIAuthorTeam" placeholder="">  -->
<!--                             </div> -->
<!--                             <div class="form-group">  -->
<!--                                 <label class="control-label" for="cbFormPreIDesignTeam">내부비 디자인팀(단위 원 - won)</label>                                  -->
<!--                                 <input type="number" class="form-control" id="cbFormPreIDesignTeam" placeholder="">  -->
<!--                             </div> -->
                            <div class="form-group" id="idSelectInternalTeam"> 
                                <label class="control-label" for="cbFormInternalTeam_1">내부비 내부팀</label>                                 
                                <select id="cbFormInternalTeam_1" class="form-control"> 
                                    <option>team1</option>                                     
                                    <option>team2</option>                                     
                                    <option>team3</option>
                                    <option>team4</option>
                                    <option>team5</option>
                                </select>
                            </div> 
                            <div id="addInternalTeam">
								<br/><br/>
								<a href="#this" class="btn" id="idAddInternalTeam">팀 추가</a>  
							</div>  
							                          
                        </form>
                    </div>                     
                    <div class="modal-footer"> 
                    	<button id="id_cbRefresh" type="button" class="btn btn-primary">자동계산</button> 
                        <button id="id_cbClose" type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>                         
                        <button id="id_cbSave" type="button" class="btn btn-primary">저장</button>                         
                    </div>                     
                </div>                 
            </div>             
        </div>
        <aside id="id_before_contact" class="bg-dark" data-pg-collapsed>
            <div class="container text-center">
                <div class="call-to-action">
				</div>
            </div>
        </aside>
        <section id="id_contact">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2 text-center">
                        <h2 class="section-heading">Let's Get In Touch!</h2>
                        <hr class="primary">
                        <p>Ready to start your next project with us? That's great! Give us a call or send us an email and we will get back to you as soon as possible!</p>
                    </div>
                    <div class="col-lg-4 col-lg-offset-2 text-center">
                        <i class="fa fa-phone fa-3x sr-contact"></i>
                        <p>123-456-6789</p>
                    </div>
                    <div class="col-lg-4 text-center">
                        <i class="fa fa-envelope-o fa-3x sr-contact"></i>
                        <p><a href="mailto:your-email@your-domain.com">ceo.sjplab@gmail.com</a></p>
                    </div>
                </div>
            </div>
        </section>
        
<!--         </div> -->
        
        <%@ include file="/WEB-INF/include/include-body.jspf" %>
        
        <!-- jQuery -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <!-- Bootstrap Core JavaScript -->
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <script src="vendor/bootstrap/js/bs.sm.js"></script>
        <!-- Plugin JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
        <script src="vendor/scrollreveal/scrollreveal.min.js"></script>
        <script src="vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
        <!-- Theme JavaScript -->
        <script src="js/creative.min.js"></script>
        
        <script type="text/javascript">
        var gfv_count = 0;
        var g_authority;
        
        var g_member_name;
        var g_team_db_name;
        
        var g_current_product_team;
        var g_current_project_number = -1;
        var g_current_project_name;
        var g_current_contract_amount;
        var g_current_product_amount;
        
        var g_isCBUpdate = 0;
        
        var g_project_number;
        var g_project_name;
        var g_product_team;
        var g_charge_pm;
        var g_charge_pd;
        var g_contract_amount;
        var g_product_amount;
        
        var g_cbIsRefresh = 0;
        
        var g_internalTeamCount = 0;
        var g_teamNameArray = [];
        
        $(document).ready(function(){
			
        	$('#menu_logout').hide();
        	$('#menu_project').hide();
    		$('#menu_cost').hide();
    		$('#menu_reception').hide();
//     		$('#menu_dispatch').hide();
    		
        	$('#menu_member').hide();
        	$('#menu_team').hide();
    		$('#menu_notice').hide();
    		$('#menu_import').hide();
    		$('#menu_verification').hide();
    		
    		//예산생성 초기화
    		$('#cbFormPreOCameraRental').val(0);
    		$('#cbFormPreOEquipmentCost').val(0);
    		$('#cbFormPreOMakeupFee').val(0);
    		$('#cbFormPreOStarringFee').val(0);
    		$('#cbFormPreOAuthorFee').val(0);
    		$('#cbFormPreOPostProduct').val(0);
    		$('#cbFormPreORecordFee').val(0);
    		$('#cbFormPreOVoiceActorFee').val(0);
    		$('#cbFormPreOTranslationFee').val(0);
    		$('#cbFormPreOPurchaseMaterials').val(0);
    		$('#cbFormPreOPlaceRental').val(0);
    		$('#cbFormPreOBuyArtAccessories').val(0);
    		$('#cbFormPreOArt').val(0);
    		$('#cbFormPreOOverSeesPhotography').val(0);
    		$('#cbFormPreOTranslationInspection').val(0);
    		$('#cbFormPreOTranslation').val(0);
    		$('#cbFormPreODeliveryFee').val(0);
    		$('#cbFormPreOEtc').val(0);
    		$('#cbFormPrePFoodExpenses').val(0);
    		$('#cbFormPrePFuelCost').val(0);
    		$('#cbFormPrePTransportationCost').val(0);
    		$('#cbFormPrePAccommodationCost').val(0);
    		$('#cbFormPrePSnackCost').val(0);
    		$('#cbFormPrePParkingFee').val(0);
    		$('#cbFormPrePPurchaseOfficeSupplies').val(0);
    		$('#cbFormPrePEquipmentRental').val(0);
    		$('#cbFormPrePEtc').val(0);
    		$('#cbFormPrePCashUsage').val(0);
    		$('#cbFormPreICarRental').val(0);
    		$('#cbFormPreIPhotography1Team').val(0);
    		$('#cbFormPreIPhotography2Team').val(0);
    		$('#cbFormPreIAerialPhotographyTeam').val(0);
    		$('#cbFormPreIAuthorTeam').val(0);
    		$('#cbFormPreIDesignTeam').val(0);
    		
    		var body = $("#id_projectCountTable > tbody");
			body.empty();
			body = $("#id_projectCompleteTable > tbody");
			body.empty();
			body = $("#id_projectIngTable > tbody");
			body.empty();
			body = $("#id_projectDetailTable > tbody");
			body.empty();
			
			$("#id_peformance_title").text("기준년:      기준반기:    ");
			
			fn_setCurrentYearMonth();
			fn_getTeamNames();
			
			$('#id_s_quarter').val("전체").prop("selected", true);
			$('#id_s_team_name').val("전체").prop("selected", true);
    		fn_getSession();
    		
    		
    		$("#id_cpSave").bind('click', function () { 
    			//alert('hello!'); 
    			if(g_authority == 'C' ||  g_authority == 'D'){
					alert("엑세스 권한이 없습니다!");
				    return;
				}
    			
    			$('#id_cpSave').attr('disabled',true); 
    			
    			var textValue = $("#id_cpSave").text();
    		    if(textValue == "저장"){
    		    	fn_insertProject();
    		    }else{
    		    	fn_updateProject();
    		    }
    		});
    		
    		$("#id_cbSave").bind('click', function () { 
    			
    			if(g_authority == 'C' ||  g_authority == 'D'){
					alert("엑세스 권한이 없습니다!");
				    return;
				}
    			
    			if(!g_cbIsRefresh){
    				alert('자동계산 처리 후 저장가능합니다.'); 
    				return;
    			}
    			
    			$('#id_cbSave').attr('disabled',true); 
    			
    			if(g_isCBUpdate){
    				fn_updateBudget();
    				g_isCBUpdate = 0;
    			}else{
    				fn_insertBudget();	
    			}
    			
    			g_cbIsRefresh = 0;
    			
    		});
    		
    		$("#id_cbRefresh").bind('click', function () { 
    			
    			g_cbIsRefresh = 1;
    			
    			var varTemp;
    			
    			//외부비 
    			varTemp = 0;
    			varTemp = parseInt($('#cbFormPreOCameraRental').val()) + parseInt($('#cbFormPreOEquipmentCost').val());
    			varTemp += parseInt($('#cbFormPreOMakeupFee').val()) + parseInt($('#cbFormPreOStarringFee').val());
    			varTemp += parseInt($('#cbFormPreOAuthorFee').val()) + parseInt($('#cbFormPreOPostProduct').val());
    			varTemp += parseInt($('#cbFormPreORecordFee').val()) + parseInt($('#cbFormPreOVoiceActorFee').val());
    			varTemp += parseInt($('#cbFormPreOTranslationFee').val()) + parseInt($('#cbFormPreOPurchaseMaterials').val());
    			varTemp += parseInt($('#cbFormPreOPlaceRental').val()) + parseInt($('#cbFormPreOBuyArtAccessories').val());
    			varTemp += parseInt($('#cbFormPreOArt').val()) + parseInt($('#cbFormPreOOverSeesPhotography').val());
    			varTemp += parseInt($('#cbFormPreOTranslationInspection').val()) + parseInt($('#cbFormPreOTranslation').val());
    			varTemp += parseInt($('#cbFormPreODeliveryFee').val()) + parseInt($('#cbFormPreOEtc').val());
    			
    			$('#cbFormPreOutsourcingCost').val(varTemp);
    			
    			//진행비 
    			varTemp = 0;
    			varTemp = parseInt($('#cbFormPrePFoodExpenses').val()) + parseInt($('#cbFormPrePFuelCost').val());
    			varTemp += parseInt($('#cbFormPrePTransportationCost').val()) + parseInt($('#cbFormPrePAccommodationCost').val());
    			varTemp += parseInt($('#cbFormPrePSnackCost').val()) + parseInt($('#cbFormPrePParkingFee').val());
    			varTemp += parseInt($('#cbFormPrePPurchaseOfficeSupplies').val()) + parseInt($('#cbFormPrePEquipmentRental').val());
    			varTemp += parseInt($('#cbFormPrePEtc').val()) + parseInt($('#cbFormPrePCashUsage').val());
    			
    			$('#cbFormPreProgressCost').val(varTemp);
    			
    			//내부비 
    			varTemp = 0;
    			
    			for(var i=0; i<g_internalTeamCount; i++){
    				varTemp += parseInt($('#cbFormInternalTeamInput_'+i).val());
    			}
    			
//     			varTemp = parseInt($('#cbFormPreICarRental').val()) + parseInt($('#cbFormPreIPhotography1Team').val());
//     			varTemp += parseInt($('#cbFormPreIPhotography2Team').val()) + parseInt($('#cbFormPreIAerialPhotographyTeam').val());
//     			varTemp += parseInt($('#cbFormPreIAuthorTeam').val()) + parseInt($('#cbFormPreIDesignTeam').val());
    			varTemp += parseInt($('#cbFormPreICarRental').val());
    			
    			$('#cbFormPreInternalCost').val(varTemp);
    			
    			//제작비 
    			varTemp = 0;
    			varTemp = parseInt($('#cbFormPreOutsourcingCost').val()) + parseInt($('#cbFormPreProgressCost').val());
    			
    			$('#cbFormPreProductSum').val(varTemp);
    			
    			//지출 총 합  
    			varTemp = 0;
    			varTemp = parseInt($('#cbFormPreProductSum').val()) + parseInt($('#cbFormPreInternalCost').val());
    			
    			$('#cbFormPreCustSum').val(varTemp);
    			
    			//연출실적   
    			varTemp = 0;
    			varTemp = parseInt($('#cbFormProductAmount').val()) - parseInt($('#cbFormPreCustSum').val());
    			
    			$('#cbFormPreResultAmount').val(varTemp);
    			
    			alert('자동계산 처리 완료됨.'); 
    			
    		});
    		
    		$('#id_projectIngTable tbody tr').bind('click', function(e) {
    		 		$(e.currentTarget).siblings().children('td, th').css('background-color','#ffffff');
			    	$(e.currentTarget).children('td, th').css('background-color','#fcf8e3');
			    			
			    	$(this).find("td").each(function(i, item){ 
// 			    		console.log("i:"+i+"item:"+ $.trim($(item).html())); 
			    		if(i==0){ 
			    			g_current_product_team = $.trim($(item).html());
			    		}
			    	});
                
    		}); 
    		
			$("#id_show_budgetInfo").bind('click', function () { 
        		
				if(g_current_project_number == -1){
					alert("프로젝트를 선택해 주세요!");
				    return;
				}
				
				//fn_getSession();
				
				g_internalTeamCount = 0;
				$("#idSelectInternalTeam").empty();
				
				$('#modal_create_budget').modal('show');
				
				fn_selectBudget();
    			
    		});
			
			$("#id_show_prjInfo").bind('click', function () { 
        		
				if(g_current_project_number == -1){
					alert("프로젝트를 선택해 주세요!");
				    return;
				}
				
				gfv_count = 0;
				//fn_getSession();
				
				$('#modal_create_prj').modal('show');
				
				fn_selectProject();
				fn_selectProjectFiles();
				
    		});
    		
    		
    		$("#btn_createPrj").bind('click', function () { 
    			
    			if(g_authority == 'C' ||  g_authority == 'D'){
					alert("엑세스 권한이 없습니다!");
				    return;
				}
    			//fn_getSession();
    			fn_cpInit();
    			gfv_count = 0;
    			$('#id_cp_title').text("프로젝트 생성");
				$('#id_cpSave').text("저장");
    			$('#modal_create_prj').modal('show');
    			
    		});
    		
			$("#id_cbModify").bind('click', function () { 
        		
				g_internalTeamCount = 0;
				$("#idSelectInternalTeam").empty();
				
    			$('#modal_create_budget').modal('show');
    			
    		});
			
			$("#id_show_prjBudget").bind('click', function () { 
        		//session save call (create team, project infor)
        		//fn_getSession();
				if(g_current_project_number == -1){
					alert("프로젝트를 선택해 주세요!");
				    return;
				}
        		fn_setSession();
				location.href = "budget_status.do";
    			
    		});
    		
    		$("#btn_refresh").bind('click', function () { 
    		
    			location.reload();
    		
    			//fn_selectMemberList();
    			//alert('hello!'); 
    		});
    		
    		$("#btn_delete").bind('click', function () { 
    			fn_deleteMember();
    			location.reload();
    			//alert('hello!'); 
    		});
    		
    		$("#addFile").on("click", function(e){ //파일 추가 버튼
				e.preventDefault();
				fn_addFile();
			});
			
			$("a[name='delete']").on("click", function(e){ //삭제 버튼
				e.preventDefault();
				fn_deleteFile($(this));
			});
			
			$("#id_performance_search").bind('click', function () { 
    			//alert('hello!');
    			//fn_getSession();
    			fn_selectPerformance();
    		});
			
			$("#idAddInternalTeam").bind('click', function () { 
				fn_getTeamNamesForInternal();
    		});
			
			$(document).ajaxStart(function () {
// 				$("#id_mainContents").fadeOut();
				$("#id_contact").fadeOut();
				$("#id_before_contact").fadeOut();
				$("#id_section_2").fadeOut();
				$("#id_before_section_2").fadeOut();
				$("#id_session").fadeOut();
				$("#id_header").fadeOut();
// 				$("#modal_create_budget").modal("toggle");
// 			    $("#modal_create_prj").modal("toggle");
				
			    $("#id_loading").fadeIn();
		    });

	        $(document).ajaxStop(function () {
	        	$("#id_loading").fadeOut();
// 			    $("#id_mainContents").show();
// 			    $("#id_mainContents").fadeIn();
			    $("#id_contact").fadeIn();
			    $("#id_before_contact").fadeIn();
			    $("#id_section_2").fadeIn();
			    $("#id_before_section_2").fadeIn();
			    $("#id_session").fadeIn();
			    $("#id_header").fadeIn();
// 			    $("#modal_create_budget").modal("toggle");
// 			    $("#modal_create_prj").modal("toggle");
			    
	        });
    		
		});
        
		function fn_setCurrentYearMonth(){
        	
        	var d = new Date();
            y = d.getFullYear();
            
        	$('#id_s_year').val(y).prop("selected", true);
        }
        
        function fn_getTeamNames(){
        	var comAjax = new ComAjax();
        	comAjax.setUrl("<c:url value='/selectTeamNames.do' />");
        	comAjax.setCallback("fn_getTeamNames_Callback");
        	comAjax.ajax();
        }
        
        function fn_getTeamNames_Callback(data){
        	
        	var list_count = data.map["list_count"];
        	
			if(list_count != 0){
				
				$("#id_s_team_name").find("option").remove();
	        	$("#cpFormCteam").find("option").remove();
				
				var str = "";
				$.each(data.map["list"], function(key, value){
					str += "<option>"+value.team_name+"</option>";
					g_teamNameArray.push(value.team_name);
				});
				
				$('#id_s_team_name').append(str);
				$('#id_s_team_name').append("<option>전체</option>");
				
				$('#cpFormCteam').append(str);
				
				//add
				
        	}
        }
        
        function fn_getTeamNamesForInternal(){
        	
        	var comAjax = new ComAjax();
        	comAjax.setUrl("<c:url value='/selectTeamNames.do' />");
        	comAjax.setCallback("fn_getTeamNamesForInternal_Callback");
        	comAjax.ajax();
        }
        
        function fn_getTeamNamesForInternal_Callback(data){
        	
        	var list_count = data.map["list_count"];
        	
			if(list_count != 0){
				
				var str = "";
				str += "<div>";
				str += "<label class='control-label' for='cbFormInternalTeam_"+g_internalTeamCount+"'>내부비 내부팀</label>";
				str += "<select id='cbFormInternalTeam_"+g_internalTeamCount+"' class='form-control'>"; 
            
				$.each(data.map["list"], function(key, value){
					str += "<option>"+value.team_name+"</option>";
				});
				
				str += "</select>";
                str += "<input type='number' class='form-control' id='cbFormInternalTeamInput_"+g_internalTeamCount+"'  placeholder=''>";
                str += "<a href='#this' class='btn' name='internalTeamDelete'>삭제</a></p>";
                str += "</div>"
                
				$('#idSelectInternalTeam').append(str);
				
				$("a[name='internalTeamDelete']").on("click", function(e){ //삭제 버튼
					e.preventDefault();
					fn_deleteInternalTeam($(this));
				});
				
				g_internalTeamCount++;
				
			}
        }
        
        function fn_deleteInternalTeam(obj){
        	g_internalTeamCount--;
			obj.parent().remove();
		}
         
        function fn_addFile(){
			var str = "<p><input type='file' name='file_"+(gfv_count++)+"'><a href='#this' class='btn' name='delete'>삭제</a></p>";
			$("#fileDiv").append(str);
			$("a[name='delete']").on("click", function(e){ //삭제 버튼
				e.preventDefault();
				fn_deleteFile($(this));
			});
		}
		
		function fn_deleteFile(obj){
			gfv_count--;
			obj.parent().remove();
		}
		
		function fn_cpInit(){
			$('#id_cp_title').text("프로젝트 보기 및 수정");
			$('#id_cpSave').text("수정");
			
			$('#cpFormPrjName').val("");
	        $('#cpFormAgency').val("");
        	$('#cpFormCteam').val("").prop("selected", true);
            $('#cpFormPM').val("");
            $('#cpFormPD').val("");
            $('#cpFormStartDay').val("");
            $('#cpFormContCompleteDay1').val("");
            $('#cpFormContCompleteDay2').val("");
            $('#cpFormContCompleteDay3').val("");
            $('#cpFormDeliCompleteDay').val("");
            $('#cpFormAdminCloseDay').val("");
            $('#cpFormPrjCloseDay').val("");
            $('#cpFormStandardYear').val("").prop("selected", true);
            $('#cpFormStandardQuarter').val("").prop("selected", true);
            $('#cpFormPrjStatus').val("").prop("selected", true);
            $('#cpFormContrAmount').val("");
            $('#cpFormPrjAmount').val("");
            $('#cpFormPrePayRatio').val("");
            $('#cpFormPrePay').val("");
            $('#cpFormMidlePay1').val("");
            $('#cpFormMidlePay2').val("");
            $('#cpFormMidlePay3').val("");
            $('#cpFormMidlePay4').val("");
            $('#cpFormBalance').val("");
            $('#cpFormRegSeal').val("").prop("selected", true);
            $('#cpFormCustomProposal1').val("");
            $('#cpFormCustomProposal2').val("");
            $('#cpFormCustomContractl1').val("");
            $('#cpFormCustomContractl2').val("");
            $('#cpFormRemark1').val("");
            $('#cpFormRemark2').val("");
            $('#cpFormRemark3').val("");
            $('#cpFormRemark4').val("");
            $('#cpFormRemark5').val("");
            $('#cpFormNagotiation').val("");
			$('#cpFormReportProgress').val("");
            $('#cpFormReportResult').val("");
            $('#cpFormReportSpecial').val("");
            $('#cpFormDeliveryProduct').val("");
            
            $('#selectFileDiv').empty();
			$('#fileDiv').empty();
            
		}
		
		function fn_deleteFileDB(obj){
			obj.parent().remove();
		}
		
		function fn_setSession(){
        	var comAjax = new ComAjax();
        	comAjax.setUrl("<c:url value='/setSession.do' />");
        	
        	comAjax.addParam("S_isSession", "Y");
        	comAjax.addParam("S_goCommand", "autoSearch");
        	
        	var selectText;
        	selectText = $("#id_s_year option:selected").text();
        	selectText = selectText.replace(/\s+/g, '');
        	comAjax.addParam("S_STANDARD_YEAR", selectText);
        	
        	selectText = $("#id_s_quarter option:selected").text();
        	selectText = selectText.replace(/\s+/g, '');
        	comAjax.addParam("S_STANDARD_QUARTER", selectText);	
        	
        	g_current_product_team = g_current_product_team.replace(/\s+/g, '');
        	comAjax.addParam("S_PRODUCT_TEAM", g_current_product_team);
        	
        	g_current_project_name = g_current_project_name.replace(/\s+/g, '');
        	comAjax.addParam("S_PRJ_NAME", g_current_project_name);
        	
        	g_current_project_name = g_current_project_name.replace(/\s+/g, '');
        	comAjax.addParam("S_PRJ_NUMBER", g_current_project_number);
        	
        	comAjax.setCallback("fn_setSessionCallback");
        	comAjax.ajax();
        }
		
		function fn_setSessionCallback(data){
			
			var success = data.map["success"];
        	
        	if(!success){
        		var errorString = data.map["fail_desc"];
        		alert('error: ' + errorString); 
        	}else{
        		
        	}
		}
		
        function fn_getSession(){
        	var comAjax = new ComAjax();
        	comAjax.setUrl("<c:url value='/getSession.do' />");
        	comAjax.setCallback("fn_getSessionCallback");
        	comAjax.ajax();
        }
        
		function fn_getSessionCallback(data){
			        	
        	var session_data = data.map["session_data"]; //is session so 1, 0
        	
        	if(!session_data){
        		//window.location.replace("http://192.168.0.167:8080");
        		//window.location.replace("http://112.221.229.148:8080");
        		location.reload();
        	}
        	
        	//var sessionMap= data.map["sessionMap"];
        	g_member_name = data.map["sessionMap"]["MEMBER_NAME"];
        	var team_name = '관리팀';
        	var team_db_name = data.map["sessionMap"]["TEAM_NAME"];
        	g_team_db_name = team_db_name;
        	var goCommand = data.map["sessionMap"]["goCommand"];
        	
        	g_project_number = data.map["sessionMap"]["PRJ_NUM"];
        	g_project_name = data.map["sessionMap"]["PRJ_NAME"];
        	g_product_team = data.map["sessionMap"]["PRODUCT_TEAM"];
        	g_charge_pm = data.map["sessionMap"]["CHARGE_PM"];
        	g_charge_pd = data.map["sessionMap"]["CHARGE_PD"];
        	g_contract_amount = data.map["sessionMap"]["CONTRACT_AMOUNT"];
        	g_product_amount = data.map["sessionMap"]["PRODUCT_AMOUNT"];
        	
        	g_authority = data.map["sessionMap"]["AUTHORITY"];
        	
        	if(session_data){
        		
        		pageChange(g_authority);
        		
        		 if( g_authority == 'C' ){
            			$("#id_s_team_name").find("option").remove();
            			var optionTemp =  "<option>" + team_db_name + "</option>";
            			$("#id_s_team_name").append(optionTemp);
            	}	
           }
        	
		}
		
		 function fn_setSessionGoCommand(){
	        	var comAjax = new ComAjax();
	        	comAjax.setUrl("<c:url value='/setSessionGoCommand.do' />");
	        	comAjax.setCallback("fn_setSessionGoCommandCallback");
	        	comAjax.ajax();
	        	
	      }
		 
		 function fn_setSessionGoCommandCallback(data){
	        	
			 var success = data.map["success"];
	        	
	        	if(!success){
	        		var errorString = data.map["fail_desc"];
	        		alert('error: ' + errorString); 
	        	}else{
	        		
	        	}
	        	
		}
		 
		 function fn_selectProjectList(){
			 //fn_getSession();
			 
				var comAjax = new ComAjax();
	        	comAjax.setUrl("<c:url value='/selectProjectList.do' />");
	        	
	        	var selectText;
	        	selectText = $("#id_s_year option:selected").text();
	        	selectText = selectText.replace(/\s+/g, '');
	        	comAjax.addParam("STANDARD_YEAR", selectText);
	        	
	        	selectText = $("#id_s_quarter option:selected").text();
	        	selectText = selectText.replace(/\s+/g, '');
	        	comAjax.addParam("STANDARD_QUARTER", selectText);	
	        	
	        	g_current_product_team = g_current_product_team.replace(/\s+/g, '');
	        	comAjax.addParam("PRODUCT_TEAM", g_current_product_team);
	        	
	        	comAjax.setCallback("fn_selectProjectList_Callback");
	        	comAjax.ajax();
	     }
		 
		 function fn_selectProjectList_Callback(data){
	        	
	        	var success = data.map["success"];
	        	
	        	if(!success){
	        		var errorString = data.map["fail_desc"];
	        		alert('error: ' + errorString); 
	        	}else{
	        		
	        		// init
	        		g_current_project_number = -1;
	        		// first //////////////////////////////////////////////////////////////////////
	        		var list_count = data.map["firstListCount"];
		        	
		        	var body = $("#id_projectDetailTable > tbody");
					body.empty();
					if(list_count == 0){
						var str = "<tr>" + 
										"<td colspan='15'>조회된 결과가 없습니다.</td>" + 
									"</tr>";
						body.append(str);
					}
					else{
						
						var str = "";
						$.each(data.map["firstList"], function(key, value){
							str += "<tr>" + 
							"<td>" + value.prj_num + "</td>" +
							"<td>" + value.agency + "</td>" +
							"<td>" + value.prj_name + "</td>" + 
							"<td>" + value.contract_amount + "</td>" + 
							"<td>" + value.product_amount + "</td>" + 
							"<td>" + value.internal_cost + "</td>" +
							"<td>" + value.outsourcing_cost + "</td>" +
							"<td>" + value.progress_cost + "</td>" +
							"<td>" + value.totalCost + "</td>" +
							"<td>" + value.outsourcing_balance + "</td>" +
							"<td>" + value.performance + "</td>" +
							"<td>" + value.contract_start_day + "</td>" +
							"<td>" + value.contract_end_day_1 + "</td>" +
							"<td>" + value.delivery_close_day + "</td>" +
							"<td>" + value.prj_status + "</td>" +
						"</tr>";
						});
						body.append(str);
						//console.log("test test test test test test test test ");
						$('#id_projectDetailTable tbody tr').bind('click', function(e) {
			    			$(e.currentTarget).siblings().children('td, th').css('background-color','#ffffff');
			    			$(e.currentTarget).children('td, th').css('background-color','#fcf8e3');
			    			
			    			$(this).find("td").each(function(i, item){ 
//	 			    				console.log("i:"+i+"item:"+ $.trim($(item).html())); 
			    				if(i==0){ 
			    					g_current_project_number = $.trim($(item).html());
			    				}
			    				if(i==2){ 
			    					g_current_project_name = $.trim($(item).html());
			    				}
			    				if(i==3){ 
			    					g_current_contract_amount = $.trim($(item).html());
			    				}
			    				if(i==4){ 
			    					g_current_product_amount = $.trim($(item).html());
			    				}
			    			});
		    			
		    			}); 
					}
					
	        	}
	        }
		 
		 
		function fn_selectPerformance(){
			
			var comAjax = new ComAjax();
        	comAjax.setUrl("<c:url value='/selectPerformance.do' />");
        	
        	var selectText;
        	selectText = $("#id_s_year option:selected").text();
        	selectText = selectText.replace(/\s+/g, '');
        	comAjax.addParam("STANDARD_YEAR", selectText);
        	
        	selectText = $("#id_s_quarter option:selected").text();
        	selectText = selectText.replace(/\s+/g, '');
        	comAjax.addParam("STANDARD_QUARTER", selectText);	
        	
        	selectText = $("#id_s_team_name option:selected").text();
        	selectText = selectText.replace(/\s+/g, '');
        	comAjax.addParam("PRODUCT_TEAM", selectText);
        	
        	comAjax.setCallback("fn_selectPerformance_Callback");
        	comAjax.ajax();
        }
		
		function fn_selectPerformance_Callback(data){
        	
        	var success = data.map["success"];
        	
        	var body = $("#id_projectDetailTable > tbody");
			body.empty();
			
			g_current_project_number = -1;
			
        	if(!success){
        		var errorString = data.map["fail_desc"];
        		alert('error: ' + errorString); 
        	}else{
        		
        		// set titel
        		var selectText, selectText2;
	        	selectText = $("#id_s_year option:selected").text();
	        	selectText = selectText.replace(/\s+/g, '');
	        	selectText2 = $("#id_s_quarter option:selected").text();
	        	selectText2 = selectText2.replace(/\s+/g, '');
        	
        		$("#id_peformance_title").text("기준년: "+ selectText + "  기준반기: " + selectText2);
        		// first //////////////////////////////////////////////////////////////////////
        		var list_count = data.map["firstListCount"];
	        	
	        	var body = $("#id_projectCountTable > tbody");
				body.empty();
				if(list_count == 0){
					var str = "<tr>" + 
									"<td colspan='4'>조회된 결과가 없습니다.</td>" + 
								"</tr>";
					body.append(str);
				}
				else{
					
					var str = "";
					$.each(data.map["firstList"], function(key, value){
						str += "<tr>" + 
						"<td>" + value.product_team + "</td>" +
						"<td>" + value.totalProject + "</td>" + 
						"<td>" + value.completeProject + "</td>" + 
						"<td>" + value.ingProject + "</td>" + 
					"</tr>";
					});
					body.append(str);
					//console.log("test test test test test test test test ");
					$('#id_projectCountTable tbody tr').bind('click', function(e) {
		    			$(e.currentTarget).siblings().children('td, th').css('background-color','#ffffff');
		    			$(e.currentTarget).children('td, th').css('background-color','#fcf8e3');
		    			
		    			$(this).find("td").each(function(i, item){ 
// 			    				console.log("i:"+i+"item:"+ $.trim($(item).html())); 
		    				if(i==0){ 
		    					g_current_product_team = $.trim($(item).html());
		    					fn_selectProjectList();
		    				}
		    			});
	    			
	    			}); 
				}
				
				// second //////////////////////////////////////////////////////////////////////
				list_count = data.map["secondListCount"];
	        	
	        	body = $("#id_projectCompleteTable > tbody");
				body.empty();
				if(list_count == 0){
					var str = "<tr>" + 
									"<td colspan='7'>조회된 결과가 없습니다.</td>" + 
								"</tr>";
					body.append(str);
				}
				else{
					
					var str = "";
					$.each(data.map["secondList"], function(key, value){
						str += "<tr>" + 
						"<td>" + value.product_team + "</td>" +
						"<td>" + value.contract_amount + "</td>" + 
						"<td>" + value.product_amount + "</td>" + 
						"<td>" + value.result_amount + "</td>" + 
						"<td>" + value.last_result_amount + "</td>" +
						"<td>" + value.fixed_cost + "</td>" +
						"<td>" + value.lastRatio + "</td>" +
					"</tr>";
					});
					body.append(str);
					//console.log("test test test test test test test test ");
					$('#id_projectCompleteTable tbody tr').bind('click', function(e) {
		    			$(e.currentTarget).siblings().children('td, th').css('background-color','#ffffff');
		    			$(e.currentTarget).children('td, th').css('background-color','#fcf8e3');
		    			
		    			$(this).find("td").each(function(i, item){ 
// 			    				console.log("i:"+i+"item:"+ $.trim($(item).html())); 
		    				if(i==0){ 
		    					g_current_product_team = $.trim($(item).html());
		    					fn_selectProjectList();
		    				}
		    			});
	    			
	    			}); 
			    			
				}
				// third //////////////////////////////////////////////////////////////////////
				list_count = data.map["thirdListCount"];
	        	
	        	body = $("#id_projectIngTable > tbody");
				body.empty();
				if(list_count == 0){
					var str = "<tr>" + 
									"<td colspan='7'>조회된 결과가 없습니다.</td>" + 
								"</tr>";
					body.append(str);
				}
				else{
					
					var str = "";
					$.each(data.map["thirdList"], function(key, value){
						str += "<tr>" + 
						"<td>" + value.product_team + "</td>" +
						"<td>" + value.contract_amount + "</td>" + 
						"<td>" + value.product_amount + "</td>" + 
						"<td>" + value.result_amount + "</td>" + 
						"<td>" + value.last_result_amount + "</td>" +
						"<td>" + value.fixed_cost + "</td>" +
						"<td>" + value.lastRatio + "</td>" +
					"</tr>";
					});
					body.append(str);
					//console.log("test test test test test test test test ");
					
							$('#id_projectIngTable tbody tr').bind('click', function(e) {
				    			$(e.currentTarget).siblings().children('td, th').css('background-color','#ffffff');
				    			$(e.currentTarget).children('td, th').css('background-color','#fcf8e3');
				    			
				    			$(this).find("td").each(function(i, item){ 
	// 			    				console.log("i:"+i+"item:"+ $.trim($(item).html())); 
				    				if(i==0){ 
				    					g_current_product_team = $.trim($(item).html());
				    					fn_selectProjectList();
				    				}
				    			});
			    			
			    			}); 
				}
        	}
        }
		 
		 function fn_insertBudget(){
			
			 //fn_showProgress(1);
			 
				g_member_name = g_member_name.replace(/\s+/g, '');
             	
	        	var comAjax = new ComAjax();
	        	comAjax.setUrl("<c:url value='/insertBudget.do' />");
	        	
	        	comAjax.addParam("g_project_number",g_project_number);
	        	comAjax.addParam("g_project_name",g_project_name);	
	        	comAjax.addParam("g_contract_amount",g_contract_amount);
	        	comAjax.addParam("g_product_amount",g_product_amount);
	        	
	        	comAjax.addParam("cbFormPreProductSum",$('#cbFormPreProductSum').val());
	        	comAjax.addParam("cbFormPreCustSum",$('#cbFormPreCustSum').val());
	        	comAjax.addParam("cbFormPreResultAmount",$('#cbFormPreResultAmount').val());
	        	comAjax.addParam("cbFormPreOutsourcingCost",$('#cbFormPreOutsourcingCost').val());
	        	comAjax.addParam("cbFormPreOCameraRental",$('#cbFormPreOCameraRental').val());
	        	comAjax.addParam("cbFormPreOEquipmentCost",$('#cbFormPreOEquipmentCost').val());
	        	comAjax.addParam("cbFormPreOMakeupFee",$('#cbFormPreOMakeupFee').val());
	        	comAjax.addParam("cbFormPreOStarringFee",$('#cbFormPreOStarringFee').val());
	        	comAjax.addParam("cbFormPreOAuthorFee",$('#cbFormPreOAuthorFee').val());
	        	comAjax.addParam("cbFormPreOPostProduct",$('#cbFormPreOPostProduct').val());
	        	comAjax.addParam("cbFormPreORecordFee",$('#cbFormPreORecordFee').val());
	        	comAjax.addParam("cbFormPreOVoiceActorFee",$('#cbFormPreOVoiceActorFee').val());
	        	comAjax.addParam("cbFormPreOTranslationFee",$('#cbFormPreOTranslationFee').val());
	        	comAjax.addParam("cbFormPreOPurchaseMaterials",$('#cbFormPreOPurchaseMaterials').val());
	        	comAjax.addParam("cbFormPreOPlaceRental",$('#cbFormPreOPlaceRental').val());
	        	comAjax.addParam("cbFormPreOBuyArtAccessories",$('#cbFormPreOBuyArtAccessories').val());
	        	comAjax.addParam("cbFormPreOArt",$('#cbFormPreOArt').val());
	        	comAjax.addParam("cbFormPreOOverSeesPhotography",$('#cbFormPreOOverSeesPhotography').val());
	        	comAjax.addParam("cbFormPreOTranslationInspection",$('#cbFormPreOTranslationInspection').val());
	        	comAjax.addParam("cbFormPreOTranslation",$('#cbFormPreOTranslation').val());
	        	comAjax.addParam("cbFormPreODeliveryFee",$('#cbFormPreODeliveryFee').val());
	        	comAjax.addParam("cbFormPreOEtc",$('#cbFormPreOEtc').val());
	        	
	        	comAjax.addParam("cbFormPreProgressCost",$('#cbFormPreProgressCost').val());
	        	comAjax.addParam("cbFormPrePFoodExpenses",$('#cbFormPrePFoodExpenses').val());
	        	comAjax.addParam("cbFormPrePFuelCost",$('#cbFormPrePFuelCost').val());
	        	comAjax.addParam("cbFormPrePTransportationCost",$('#cbFormPrePTransportationCost').val());
	        	comAjax.addParam("cbFormPrePAccommodationCost",$('#cbFormPrePAccommodationCost').val());
	        	comAjax.addParam("cbFormPrePSnackCost",$('#cbFormPrePSnackCost').val());
	        	comAjax.addParam("cbFormPrePParkingFee",$('#cbFormPrePParkingFee').val());
	        	comAjax.addParam("cbFormPrePPurchaseOfficeSupplies",$('#cbFormPrePPurchaseOfficeSupplies').val());
	        	comAjax.addParam("cbFormPrePEquipmentRental",$('#cbFormPrePEquipmentRental').val());
	        	comAjax.addParam("cbFormPrePEtc",$('#cbFormPrePEtc').val());
	        	comAjax.addParam("cbFormPrePCashUsage",$('#cbFormPrePCashUsage').val());
	        	
	        	comAjax.addParam("cbFormPreInternalCost",$('#cbFormPreInternalCost').val());
	        	comAjax.addParam("cbFormPreICarRental",$('#cbFormPreICarRental').val());
	        	
// 	        	comAjax.addParam("cbFormPreIPhotography1Team",$('#cbFormPreIPhotography1Team').val());
// 	        	comAjax.addParam("cbFormPreIPhotography2Team",$('#cbFormPreIPhotography2Team').val());
// 	        	comAjax.addParam("cbFormPreIAerialPhotographyTeam",$('#cbFormPreIAerialPhotographyTeam').val());
// 	        	comAjax.addParam("cbFormPreIAuthorTeam",$('#cbFormPreIAuthorTeam').val());
// 	        	comAjax.addParam("cbFormPreIDesignTeam",$('#cbFormPreIDesignTeam').val());
	        	
	        	comAjax.addParam("WRITER",g_member_name);
	        	
	        	comAjax.setCallback("fn_insertBudget_Callback");
	        	comAjax.ajax();
	        }
		 
		 	function fn_insertBudget_Callback(data){
	        	
		 		//fn_showProgress(0);
		 		
		 		$('#id_pm').show();
        		$('#id_pd').show();
        		
	        	var success = data.map["success"];
	        	
	        	if(!success){
	        		var errorString = data.map["fail_desc"];
	        		alert('error: ' + errorString); 
	        	}else{
	        		//alert('budget insert success');
	        		
	        		//$('#modal_create_budget').modal('hide');
	        		fn_insertBudgetInternal();
	        	}
	        	
	        	//$('#id_cbSave').attr('disabled',false); 
	        }
		 	
		 	function fn_insertBudgetInternal()
		 	{
             	
	        	var comAjax = new ComAjax();
	        	comAjax.setUrl("<c:url value='/insertBudgetInternal.do' />");
	        	
	        	comAjax.addParam("g_project_number",g_project_number);
	        	comAjax.addParam("g_internalTeamCount",g_internalTeamCount);
	        	
	        	for(var i=0; i<g_internalTeamCount; i++){
    				comAjax.addParam("cbFormInternalTeam_"+i,$('#cbFormInternalTeam_'+i).val());
	    			console.log("i:"+i+"cbFormInternalTeam:"+ $('#cbFormInternalTeam_'+i).val()); 
	    			
    				comAjax.addParam("cbFormInternalTeamInput_"+i,$('#cbFormInternalTeamInput_'+i).val());
    			}
	        	comAjax.addParam("WRITER",g_member_name);
	        	
	        	comAjax.setCallback("fn_insertBudgetInternal_Callback");
	        	comAjax.ajax();
		 	}
		 	
		 	function fn_insertBudgetInternal_Callback(data){
        		
	        	var success = data.map["success"];
	        	
	        	if(!success){
	        		var errorString = data.map["fail_desc"];
	        		alert('error: ' + errorString); 
	        	}else{
	        		
	        		if(g_isCBUpdate){
	        			alert('budget update success');	
	        		}else{
	        			alert('budget insert success');
	        		}
	        		
	        		$('#modal_create_budget').modal('hide');
	        	}
	        	
	        	$('#id_cbSave').attr('disabled',false); 
		 	}
		 	
		 	function fn_deleteBudgetInternal()
		 	{
             	
	        	var comAjax = new ComAjax();
	        	comAjax.setUrl("<c:url value='/deleteBudgetInternal.do' />");
	        	
	        	comAjax.addParam("g_project_number",g_project_number);
	        	
	        	comAjax.setCallback("fn_deleteBudgetInternal_Callback");
	        	comAjax.ajax();
		 	}
		 	
		 	function fn_deleteBudgetInternal_Callback(data){
        		
	        	var success = data.map["success"];
	        	
	        	if(!success){
	        		var errorString = data.map["fail_desc"];
	        		alert('error: ' + errorString); 
	        	}else{
	        		fn_insertBudgetInternal();
	        	}
	        }
		 	
		 	function fn_updateBudget(){
				
		 		//fn_showProgress(1);
		 		
				g_member_name = g_member_name.replace(/\s+/g, '');
             	
	        	var comAjax = new ComAjax();
	        	comAjax.setUrl("<c:url value='/updateBudget.do' />");
	        	
	        	comAjax.addParam("g_current_project_number",g_current_project_number);
	        	comAjax.addParam("g_current_project_name",g_current_project_name);	
	        	comAjax.addParam("g_current_contract_amount",g_current_contract_amount);
	        	comAjax.addParam("g_current_product_amount",g_current_product_amount);
	        	
	        	comAjax.addParam("cbFormPreProductSum",$('#cbFormPreProductSum').val());
	        	comAjax.addParam("cbFormPreCustSum",$('#cbFormPreCustSum').val());
	        	comAjax.addParam("cbFormPreResultAmount",$('#cbFormPreResultAmount').val());
	        	comAjax.addParam("cbFormPreOutsourcingCost",$('#cbFormPreOutsourcingCost').val());
	        	comAjax.addParam("cbFormPreOCameraRental",$('#cbFormPreOCameraRental').val());
	        	comAjax.addParam("cbFormPreOEquipmentCost",$('#cbFormPreOEquipmentCost').val());
	        	comAjax.addParam("cbFormPreOMakeupFee",$('#cbFormPreOMakeupFee').val());
	        	comAjax.addParam("cbFormPreOStarringFee",$('#cbFormPreOStarringFee').val());
	        	comAjax.addParam("cbFormPreOAuthorFee",$('#cbFormPreOAuthorFee').val());
	        	comAjax.addParam("cbFormPreOPostProduct",$('#cbFormPreOPostProduct').val());
	        	comAjax.addParam("cbFormPreORecordFee",$('#cbFormPreORecordFee').val());
	        	comAjax.addParam("cbFormPreOVoiceActorFee",$('#cbFormPreOVoiceActorFee').val());
	        	comAjax.addParam("cbFormPreOTranslationFee",$('#cbFormPreOTranslationFee').val());
	        	comAjax.addParam("cbFormPreOPurchaseMaterials",$('#cbFormPreOPurchaseMaterials').val());
	        	comAjax.addParam("cbFormPreOPlaceRental",$('#cbFormPreOPlaceRental').val());
	        	comAjax.addParam("cbFormPreOBuyArtAccessories",$('#cbFormPreOBuyArtAccessories').val());
	        	comAjax.addParam("cbFormPreOArt",$('#cbFormPreOArt').val());
	        	comAjax.addParam("cbFormPreOOverSeesPhotography",$('#cbFormPreOOverSeesPhotography').val());
	        	comAjax.addParam("cbFormPreOTranslationInspection",$('#cbFormPreOTranslationInspection').val());
	        	comAjax.addParam("cbFormPreOTranslation",$('#cbFormPreOTranslation').val());
	        	comAjax.addParam("cbFormPreODeliveryFee",$('#cbFormPreODeliveryFee').val());
	        	comAjax.addParam("cbFormPreOEtc",$('#cbFormPreOEtc').val());
	        	
	        	comAjax.addParam("cbFormPreProgressCost",$('#cbFormPreProgressCost').val());
	        	comAjax.addParam("cbFormPrePFoodExpenses",$('#cbFormPrePFoodExpenses').val());
	        	comAjax.addParam("cbFormPrePFuelCost",$('#cbFormPrePFuelCost').val());
	        	comAjax.addParam("cbFormPrePTransportationCost",$('#cbFormPrePTransportationCost').val());
	        	comAjax.addParam("cbFormPrePAccommodationCost",$('#cbFormPrePAccommodationCost').val());
	        	comAjax.addParam("cbFormPrePSnackCost",$('#cbFormPrePSnackCost').val());
	        	comAjax.addParam("cbFormPrePParkingFee",$('#cbFormPrePParkingFee').val());
	        	comAjax.addParam("cbFormPrePPurchaseOfficeSupplies",$('#cbFormPrePPurchaseOfficeSupplies').val());
	        	comAjax.addParam("cbFormPrePEquipmentRental",$('#cbFormPrePEquipmentRental').val());
	        	comAjax.addParam("cbFormPrePEtc",$('#cbFormPrePEtc').val());
	        	comAjax.addParam("cbFormPrePCashUsage",$('#cbFormPrePCashUsage').val());
	        	
	        	comAjax.addParam("cbFormPreInternalCost",$('#cbFormPreInternalCost').val());
	        	comAjax.addParam("cbFormPreICarRental",$('#cbFormPreICarRental').val());
// 	        	comAjax.addParam("cbFormPreIPhotography1Team",$('#cbFormPreIPhotography1Team').val());
// 	        	comAjax.addParam("cbFormPreIPhotography2Team",$('#cbFormPreIPhotography2Team').val());
// 	        	comAjax.addParam("cbFormPreIAerialPhotographyTeam",$('#cbFormPreIAerialPhotographyTeam').val());
// 	        	comAjax.addParam("cbFormPreIAuthorTeam",$('#cbFormPreIAuthorTeam').val());
// 	        	comAjax.addParam("cbFormPreIDesignTeam",$('#cbFormPreIDesignTeam').val());
	        	
	        	comAjax.addParam("WRITER",g_member_name);
	        	
	        	comAjax.setCallback("fn_updateBudget_Callback");
	        	comAjax.ajax();
	        }
		 
		 	function fn_updateBudget_Callback(data){
	        	
		 		//fn_showProgress(0);
		 		
	        	var success = data.map["success"];
	        	
	        	if(!success){
	        		var errorString = data.map["fail_desc"];
	        		alert('error: ' + errorString); 
	        	}else{
// 	        		alert('budget update success');
	        		
// 	        		$('#modal_create_budget').modal('hide');
// 	        		$("#modal_create_budget .id_cbClose").click()

					fn_deleteBudgetInternal();
// 	        		fn_insertBudgetInternal();
	        	}
	        }
		 	
		 	function fn_selectBudget(){
		 		
				var comAjax = new ComAjax();
	        	comAjax.setUrl("<c:url value='/selectBudget.do' />");
	        	comAjax.addParam("g_current_project_number",g_current_project_number);
	        	comAjax.setCallback("fn_selectBudget_CallBack");
	        	comAjax.ajax();
	        	
		 	}
		 	
		 	function fn_selectBudget_CallBack(data){
				var success = data.map["success"];
				var isData = data.map["isData"];
	        	
	        	if(!success){
	        		var errorString = data.map["fail_desc"];
	        		alert('error: ' + errorString); 
	        	}else{
	        		
	        		$('#id_pm').hide();
	        		$('#id_pd').hide();
	        		
	        		g_isCBUpdate = 0;
	        		if(isData){
	        			
	        			$('#id_cb_title').text("예산계획 보기 및 수정");
	    				$('#id_cbSave').text("수정");
	    				g_isCBUpdate = 1;
	    				g_project_number = g_current_project_number;
	    				
		        		$('#cbFormPrjName').val(data.map["map"]["prj_name"]);
		        		$('#cbFormCteam').val(data.map["map"]["product_team"]);
		        		$('#cbFormPM').val(data.map["map"]["charge_pm"]);
		        		$('#cbFormPD').val(data.map["map"]["charge_pd"]);
		        		$('#cbFormContractAmount').val(data.map["map"]["contract_amount"]);
		        		$('#cbFormProductAmount').val(data.map["map"]["product_amount"]);
		        		
		        		$('#cbFormPreProductSum').val(data.map["map"]["PRODUCT_SUM"]);
		        		$('#cbFormPreCustSum').val(data.map["map"]["CUST_SUM"]);
		        		$('#cbFormPreResultAmount').val(data.map["map"]["RESULT_AMOUNT"]);
		        		
		        		$('#cbFormPreOutsourcingCost').val(data.map["map"]["OUTSOURCING_COST"]);
		        		$('#cbFormPreOCameraRental').val(data.map["map"]["O_CAMERA_RENTAL"]);
		        		$('#cbFormPreOEquipmentCost').val(data.map["map"]["O_EQUIPMENT_COST"]);
		        		$('#cbFormPreOMakeupFee').val(data.map["map"]["O_MAKEUP_FEE"]);
		        		$('#cbFormPreOStarringFee').val(data.map["map"]["O_STARRING_FEE"]);
		        		$('#cbFormPreOAuthorFee').val(data.map["map"]["O_AUTHOR_FEE"]);
		        		$('#cbFormPreOPostProduct').val(data.map["map"]["O_POST_PRODUCT_FEE"]);
		        		$('#cbFormPreORecordFee').val(data.map["map"]["O_RECORD_FEE"]);
		        		$('#cbFormPreOVoiceActorFee').val(data.map["map"]["O_VOICE_ACTOR_FEE"]);
		        		$('#cbFormPreOTranslationFee').val(data.map["map"]["O_TRANSLATION_FEE"]);
		        		$('#cbFormPreOPurchaseMaterials').val(data.map["map"]["O_PURCHASE_MATERIALS"]);
		        		$('#cbFormPreOPlaceRental').val(data.map["map"]["O_PLACE_RENTAL"]);
		        		$('#cbFormPreOBuyArtAccessories').val(data.map["map"]["O_BUY_ART_ACCESSORIES"]);
		        		$('#cbFormPreOArt').val(data.map["map"]["O_ART"]);
		        		$('#cbFormPreOOverSeesPhotography').val(data.map["map"]["O_OVERSEAS_PHOTOGRAPHY"]);
		        		$('#cbFormPreOTranslationInspection').val(data.map["map"]["O_TRANSLATION_INSPECTION"]);
		        		$('#cbFormPreOTranslation').val(data.map["map"]["O_TRANSLATION"]);
		        		$('#cbFormPreODeliveryFee').val(data.map["map"]["O_DELIVERY_FEE"]);
		        		$('#cbFormPreOEtc').val(data.map["map"]["O_ETC"]);
		        		
		        		$('#cbFormPreProgressCost').val(data.map["map"]["PROGRESS_COST"]);
		        		$('#cbFormPrePFoodExpenses').val(data.map["map"]["P_FOOD_EXPENSES"]);
		        		$('#cbFormPrePFuelCost').val(data.map["map"]["P_FUEL_COST"]);
		        		$('#cbFormPrePTransportationCost').val(data.map["map"]["P_TRANSPORTATION_COST"]);
		        		$('#cbFormPrePAccommodationCost').val(data.map["map"]["P_ACCOMMODATION_COST"]);
		        		$('#cbFormPrePSnackCost').val(data.map["map"]["P_SNACK_COST"]);
		        		$('#cbFormPrePParkingFee').val(data.map["map"]["P_PARKING_FEE"]);
		        		$('#cbFormPrePPurchaseOfficeSupplies').val(data.map["map"]["P_PURCHASE_OFFICE_SUPPLIES"]);
		        		$('#cbFormPrePEquipmentRental').val(data.map["map"]["P_EQUIPMENT_RENTAL"]);
		        		$('#cbFormPrePEtc').val(data.map["map"]["P_ETC"]);
		        		$('#cbFormPrePCashUsage').val(data.map["map"]["P_CASH_USAGE"]);
		        		
		        		$('#cbFormPreInternalCost').val(data.map["map"]["INTERNAL_COST"]);
		        		$('#cbFormPreICarRental').val(data.map["map"]["I_CAR_RENTAL"]);
		        		
// 		        		$('#cbFormPreIPhotography1Team').val(data.map["map"]["I_PHOTOGRAPHY_1_TEAM"]);
// 		        		$('#cbFormPreIPhotography2Team').val(data.map["map"]["I_PHOTOGRAPHY_2_TEAM"]);
// 		        		$('#cbFormPreIAerialPhotographyTeam').val(data.map["map"]["I_AERIAL_PHOTOGRAPHY_TEAM"]);
// 		        		$('#cbFormPreIAuthorTeam').val(data.map["map"]["I_AUTHOR_TEAM"]);
// 		        		$('#cbFormPreIDesignTeam').val(data.map["map"]["I_DESIGN_TEAM"]);

		        		fn_selectBudgetInternal();
						
	        		
	        		}else{
	        			$('#id_cb_title').text("예산계획 생성");
	    				$('#id_cbSave').text("저장");
	    				
	    				g_project_number = g_current_project_number;
	    				g_project_name = g_current_project_name;
	    				g_current_contract_amount = g_current_contract_amount.replace(/,+/g, '');
	    				g_contract_amount = g_current_contract_amount;
	    				g_current_product_amount = g_current_product_amount.replace(/,+/g, '');
	    				g_product_amount = g_current_product_amount;
	    				
	    				
	    				$('#cbFormPrjName').val(g_current_project_name);
		        		$('#cbFormCteam').val(g_current_product_team);
		        		$('#cbFormPM').val("");
		        		$('#cbFormPD').val("");
		        		
		        		$('#cbFormContractAmount').val(g_current_contract_amount);
		        		$('#cbFormProductAmount').val(g_current_product_amount);
		        		
		        		$('#cbFormPreProductSum').val("0");
		        		$('#cbFormPreCustSum').val("0");
		        		$('#cbFormPreResultAmount').val("0");
		        		
		        		$('#cbFormPreOutsourcingCost').val("0");
		        		$('#cbFormPreOCameraRental').val("0");
		        		$('#cbFormPreOEquipmentCost').val("0");
		        		$('#cbFormPreOMakeupFee').val("0");
		        		$('#cbFormPreOStarringFee').val("0");
		        		$('#cbFormPreOAuthorFee').val("0");
		        		$('#cbFormPreOPostProduct').val("0");
		        		$('#cbFormPreORecordFee').val("0");
		        		$('#cbFormPreOVoiceActorFee').val("0");
		        		$('#cbFormPreOTranslationFee').val("0");
		        		$('#cbFormPreOPurchaseMaterials').val("0");
		        		$('#cbFormPreOPlaceRental').val("0");
		        		$('#cbFormPreOBuyArtAccessories').val("0");
		        		$('#cbFormPreOArt').val("0");
		        		$('#cbFormPreOOverSeesPhotography').val("0");
		        		$('#cbFormPreOTranslationInspection').val("0");
		        		$('#cbFormPreOTranslation').val("0");
		        		$('#cbFormPreODeliveryFee').val("0");
		        		$('#cbFormPreOEtc').val("0");
		        		
		        		$('#cbFormPreProgressCost').val("0");
		        		$('#cbFormPrePFoodExpenses').val("0");
		        		$('#cbFormPrePFuelCost').val("0");
		        		$('#cbFormPrePTransportationCost').val("0");
		        		$('#cbFormPrePAccommodationCost').val("0");
		        		$('#cbFormPrePSnackCost').val("0");
		        		$('#cbFormPrePParkingFee').val("0");
		        		$('#cbFormPrePPurchaseOfficeSupplies').val("0");
		        		$('#cbFormPrePEquipmentRental').val("0");
		        		$('#cbFormPrePEtc').val("0");
		        		$('#cbFormPrePCashUsage').val("0");
		        		
		        		$('#cbFormPreInternalCost').val("0");
		        		$('#cbFormPreICarRental').val("0");
		        		$('#cbFormPreIPhotography1Team').val("0");
		        		$('#cbFormPreIPhotography2Team').val("0");
		        		$('#cbFormPreIAerialPhotographyTeam').val("0");
		        		$('#cbFormPreIAuthorTeam').val("0");
		        		$('#cbFormPreIDesignTeam').val("0");
		        		
	        		}
	        		
	        	}
		 	}
		 	
			function fn_selectBudgetInternal(){
		 		
				var comAjax = new ComAjax();
	        	comAjax.setUrl("<c:url value='/selectBudgetInternal.do' />");
	        	comAjax.addParam("g_current_project_number",g_current_project_number);
	        	comAjax.setCallback("fn_selectBudgetInternal_CallBack");
	        	comAjax.ajax();
	        	
		 	}
		 	
		 	function fn_selectBudgetInternal_CallBack(data){
				var success = data.map["success"];
				var list_count = data.map["list_count"];
	        	
	        	if(!success){
	        		var errorString = data.map["fail_desc"];
	        		alert('error: ' + errorString); 
	        	}else{
	            		
	        		if(list_count != 0){
	    				
	        			var temp_internal_team_name = "";
	        			var temp_internal_team_cost;
	        			var str = "";
	        			$.each(data.map["list"], function(key, value){
	        				
	        				temp_internal_team_name = value.internal_team_name;
	        				temp_internal_team_cost = value.internal_team_cost;
	        				
	        				str = "";
	        				str += "<div>";
		    				str += "<label class='control-label' for='cbFormInternalTeam_"+g_internalTeamCount+"'>내부비 내부팀</label>";
		    				str += "<select id='cbFormInternalTeam_"+g_internalTeamCount+"' class='form-control'>"; 
		                
		    				$.each(g_teamNameArray, function(index, value){
		    					str += "<option>"+value+"</option>";
		    				});
		    				
		    				str += "</select>";
		                    str += "<input type='number' class='form-control' id='cbFormInternalTeamInput_"+g_internalTeamCount+"'  placeholder=''>";
		                    str += "<a href='#this' class='btn' name='internalTeamDelete'>삭제</a></p>";
		                    str += "</div>"
		                    
		    				$('#idSelectInternalTeam').append(str);
		    				
		    				$("a[name='internalTeamDelete']").on("click", function(e){ //삭제 버튼
		    					e.preventDefault();
		    					fn_deleteInternalTeam($(this));
		    				});
		    				
		    				$('#cbFormInternalTeam_'+g_internalTeamCount).val(temp_internal_team_name).prop("selected", true);
		    				$('#cbFormInternalTeamInput_'+g_internalTeamCount).val(temp_internal_team_cost);
		    				
		    				
		    				g_internalTeamCount++;
		    				
	    				});
	        			
	    				
	    			}
		        	        		
	        	}
		 	}
		 
			function fn_selectProject(){
		 		
				var comAjax = new ComAjax();
	        	comAjax.setUrl("<c:url value='/selectProject.do' />");
	        	comAjax.addParam("g_current_project_number",g_current_project_number);
	        	comAjax.setCallback("fn_selectProject_CallBack");
	        	comAjax.ajax();
	        	
		 	}
		 	
		 	function fn_selectProject_CallBack(data){
				var success = data.map["success"];
				var isData = data.map["isData"];
	        	
	        	if(!success){
	        		var errorString = data.map["fail_desc"];
	        		alert('error: ' + errorString); 
	        	}else{
	        		
	        		if(isData){
	        			
	        			$('#id_cp_title').text("프로젝트수정");
	    				$('#id_cpSave').text("수정");
	    				
	    				$('#cpFormPrjName').val(data.map["map"]["PRJ_NAME"]);
	    		        $('#cpFormAgency').val(data.map["map"]["AGENCY"]);
    	            	$('#cpFormCteam').val(data.map["map"]["PRODUCT_TEAM"]).prop("selected", true);
    	                $('#cpFormPM').val(data.map["map"]["CHARGE_PM"]);
    	                $('#cpFormPD').val(data.map["map"]["CHARGE_PD"]);
    	                $('#cpFormStartDay').val(data.map["map"]["CONTRACT_START_DAY"]);
    	                $('#cpFormContCompleteDay1').val(data.map["map"]["CONTRACT_END_DAY_1"]);
    	                $('#cpFormContCompleteDay2').val(data.map["map"]["CONTRACT_END_DAY_2"]);
    	                $('#cpFormContCompleteDay3').val(data.map["map"]["CONTRACT_END_DAY_3"]);
    	                $('#cpFormDeliCompleteDay').val(data.map["map"]["DELIVERY_CLOSE_DAY"]);
    	                $('#cpFormAdminCloseDay').val(data.map["map"]["ADMIN_CLOSE_DAY"]);
    	                $('#cpFormPrjCloseDay').val(data.map["map"]["PRJ_COLSE_DAY"]);
    	                $('#cpFormStandardYear').val(data.map["map"]["STANDARD_YEAR"]).prop("selected", true);
    	                $('#cpFormStandardQuarter').val(data.map["map"]["STANDARD_QUARTER"]).prop("selected", true);
    	                $('#cpFormPrjStatus').val(data.map["map"]["PRJ_STATUS"]).prop("selected", true);
    	                $('#cpFormContrAmount').val(data.map["map"]["CONTRACT_AMOUNT"]);
    	                $('#cpFormPrjAmount').val(data.map["map"]["PRODUCT_AMOUNT"]);
    	                $('#cpFormPrePayRatio').val(data.map["map"]["PREPAY_RATIO"]);
    	                $('#cpFormPrePay').val(data.map["map"]["PREPAY"]);
    	                $('#cpFormMidlePay1').val(data.map["map"]["MIDDLE_PAY_1"]);
    	                $('#cpFormMidlePay2').val(data.map["map"]["MIDDLE_PAY_2"]);
    	                $('#cpFormMidlePay3').val(data.map["map"]["MIDDLE_PAY_3"]);
    	                $('#cpFormMidlePay4').val(data.map["map"]["MIDDLE_PAY_4"]);
    	                $('#cpFormBalance').val(data.map["map"]["BALANCE"]);
    	                $('#cpFormRegSeal').val(data.map["map"]["USE_REG_SEAL"]).prop("selected", true);
    	                $('#cpFormCustomProposal1').val(data.map["map"]["CUSTOM_PROPOSAL_1"]);
    	                $('#cpFormCustomProposal2').val(data.map["map"]["CUSTOM_PROPOSAL_2"]);
    	                $('#cpFormCustomContractl1').val(data.map["map"]["CUSTOM_CONTRACT_1"]);
    	                $('#cpFormCustomContractl2').val(data.map["map"]["CUSTOM_CONTRACT_2"]);
    	                $('#cpFormRemark1').val(data.map["map"]["REMARK_1"]);
    	                $('#cpFormRemark2').val(data.map["map"]["REMARK_2"]);
    	                $('#cpFormRemark3').val(data.map["map"]["REMARK_3"]);
    	                $('#cpFormRemark4').val(data.map["map"]["REMARK_4"]);
    	                $('#cpFormRemark5').val(data.map["map"]["REMARK_5"]);
    	                $('#cpFormNagotiation').val(data.map["map"]["NAGOTIATION"]);
	    				$('#cpFormReportProgress').val(data.map["map"]["REPORT_PROGRESS"]);
    	                $('#cpFormReportResult').val(data.map["map"]["REPORT_RESULT"]);
    	                $('#cpFormReportSpecial').val(data.map["map"]["REPORT_SPECIAL"]);
    	                $('#cpFormDeliveryProduct').val(data.map["map"]["DELIVERY_PRODUCT"]);
	        		
	        		}else{
	        			$('#id_cp_title').text("프로젝트 생성");
	    				$('#id_cpSave').text("저장");
	        		}
	        		
	        	}
		 	}
		 	
			function fn_selectProjectFiles(){
		 		
				var comAjax = new ComAjax();
	        	comAjax.setUrl("<c:url value='/selectProjectFiles.do' />");
	        	comAjax.addParam("g_current_project_number",g_current_project_number);
	        	comAjax.setCallback("fn_selectProjectFiles_CallBack");
	        	comAjax.ajax();
		 	}
		 	
		 	function fn_selectProjectFiles_CallBack(data){
				var success = data.map["success"];
				
	        	if(!success){
	        		var errorString = data.map["fail_desc"];
	        		alert('error: ' + errorString); 
	        	}else{
	        		
	    			$('#selectFileDiv').empty();
	    			$('#fileDiv').empty();
			        	
					var str = "";
					//"<a href='#this' id='name_"+value.file_num+"' name='name_"+value.file_num+"'>"+value.original_file_name +
					//"<input type='file' id='file_"+value.file_num+"' name='file_"+value.file_num+"'> ("+value.file_size+"kb)" +
					$.each(data.map["firstList"], function(key, value){
						str += "<p>" + 
						"<input type='hidden' id='storage_file_name' name='file' value='"+value.storage_file_name+"'>" +
						"<input type='hidden' id='folder_name' name='file' value='"+value.folder_name+"'>" +
						"<a href='#this' id='name_"+value.file_num+"' name='file'>"+value.original_file_name + "</a> (" + value.file_size+"kb)" +
						"<a href='#this class='btn' id='delete_"+value.file_num+"' name='delete_"+value.file_num+"' fileNum='"+value.file_num+"'>삭제</a>" +
						 "</p>";
					});
					$('#selectFileDiv').append(str);
					
					$("a[name='file']").on("click", function(e){ //파일 이름
						e.preventDefault();
						fn_downloadFile($(this));
					});
		    		
		    		$("a[name^='delete']").on("click", function(e){ //삭제 버튼
						e.preventDefault();
						fn_deleteFileDB($(this));
						var $dataFileNum = 0;
						 //$dataFileNum = $(this).data('fileNum');
						$dataFileNum = parseInt($(this).attr('fileNum'));
						fn_deleteFileUpdate($dataFileNum);
					});
		    		
											
	        	}
		 	}
		 	
		 	function fn_deleteFileUpdate($dataFileNum){
		 		
		 		var comAjax = new ComAjax();
	        	comAjax.setUrl("<c:url value='/deleteFileUpdate.do' />");
	        	
	        	comAjax.addParam("dataFileNum", $dataFileNum);
				comAjax.setCallback("fn_deleteFileUpdate_Callback");
	        	comAjax.ajax();
	        	
		 	}
		 	
			function fn_deleteFileUpdate_Callback(data){
	        	
	        	var success = data.map["success"];
	        	
	        	if(!success){
	        		var errorString = data.map["fail_desc"];
	        		alert('error: ' + errorString); 
	        	}else{
	        		alert('Project file delete success');
	        	}
	        }
		 	
	        function fn_insertProject(){
	        	
	        	 var cpFormPrjName=$('#cpFormPrjName').val();
	        	cpFormPrjName = cpFormPrjName.replace(/\s+/g, '');
	        	var cpFormAgency=$('#cpFormAgency').val();
	        	cpFormAgency = cpFormAgency.replace(/\s+/g, '');
            	var cpFormCteam=$('#cpFormCteam').val();
                cpFormCteam = cpFormCteam.replace(/\s+/g, '');
                var cpFormPM=$('#cpFormPM').val();
                cpFormPM = cpFormPM.replace(/\s+/g, '');
                var cpFormPD=$('#cpFormPD').val();
                cpFormPD = cpFormPD.replace(/\s+/g, '');
                var cpFormStartDay=$('#cpFormStartDay').val();
                cpFormStartDay = cpFormStartDay.replace(/\s+/g, '');
                var cpFormContCompleteDay1=$('#cpFormContCompleteDay1').val();
                cpFormContCompleteDay1 = cpFormContCompleteDay1.replace(/\s+/g, '');
                var cpFormContCompleteDay2=$('#cpFormContCompleteDay2').val();
                cpFormContCompleteDay2 = cpFormContCompleteDay2.replace(/\s+/g, '');
                var cpFormContCompleteDay3=$('#cpFormContCompleteDay3').val();
                cpFormContCompleteDay3 = cpFormContCompleteDay3.replace(/\s+/g, '');
                var cpFormDeliCompleteDay=$('#cpFormDeliCompleteDay').val();
                cpFormDeliCompleteDay = cpFormDeliCompleteDay.replace(/\s+/g, '');
                var cpFormAdminCloseDay=$('#cpFormAdminCloseDay').val();
                cpFormAdminCloseDay = cpFormAdminCloseDay.replace(/\s+/g, '');
                var cpFormPrjCloseDay=$('#cpFormPrjCloseDay').val();
                cpFormPrjCloseDay = cpFormPrjCloseDay.replace(/\s+/g, '');
                var cpFormStandardYear=$('#cpFormStandardYear').val();
                cpFormStandardYear = cpFormStandardYear.replace(/\s+/g, '');
                var cpFormStandardQuarter=$('#cpFormStandardQuarter').val();
                cpFormStandardQuarter = cpFormStandardQuarter.replace(/\s+/g, '');
                var cpFormPrjStatus=$('#cpFormPrjStatus').val();
                cpFormPrjStatus = cpFormPrjStatus.replace(/\s+/g, '');
                var cpFormContrAmount=$('#cpFormContrAmount').val();
                cpFormContrAmount = cpFormContrAmount.replace(/\s+/g, '');
                var cpFormPrjAmount=$('#cpFormPrjAmount').val();
                cpFormPrjAmount = cpFormPrjAmount.replace(/\s+/g, '');
                var cpFormPrePayRatio=$('#cpFormPrePayRatio').val();
                cpFormPrePayRatio = cpFormPrePayRatio.replace(/\s+/g, '');
                var cpFormPrePay=$('#cpFormPrePay').val();
                cpFormPrePay = cpFormPrePay.replace(/\s+/g, '');
                var cpFormMidlePay1=$('#cpFormMidlePay1').val();
                cpFormMidlePay1 = cpFormMidlePay1.replace(/\s+/g, '');
                var cpFormMidlePay2=$('#cpFormMidlePay2').val();
                cpFormMidlePay2 = cpFormMidlePay2.replace(/\s+/g, '');
                var cpFormMidlePay3=$('#cpFormMidlePay3').val();
                cpFormMidlePay3 = cpFormMidlePay3.replace(/\s+/g, '');
                var cpFormMidlePay4=$('#cpFormMidlePay4').val();
                cpFormMidlePay4 = cpFormMidlePay4.replace(/\s+/g, '');
                var cpFormBalance=$('#cpFormBalance').val();
                cpFormBalance = cpFormBalance.replace(/\s+/g, '');
                var cpFormRegSeal=$('#cpFormRegSeal').val();
                cpFormRegSeal = cpFormRegSeal.replace(/\s+/g, '');
                var cpFormCustomProposal1=$('#cpFormCustomProposal1').val();
                cpFormCustomProposal1 = cpFormCustomProposal1.replace(/\s+/g, '');
                var cpFormCustomProposal2=$('#cpFormCustomProposal2').val();
                cpFormCustomProposal2 = cpFormCustomProposal2.replace(/\s+/g, '');
                var cpFormCustomContractl1=$('#cpFormCustomContractl1').val();
                cpFormCustomContractl1 = cpFormCustomContractl1.replace(/\s+/g, '');
                var cpFormCustomContractl2=$('#cpFormCustomContractl2').val();
                cpFormCustomContractl2 = cpFormCustomContractl2.replace(/\s+/g, '');
                var cpFormRemark1=$('#cpFormRemark1').val();
//                 cpFormRemark1 = cpFormRemark1.replace(/\s+/g, '');
                var cpFormRemark2=$('#cpFormRemark2').val();
//                 cpFormRemark2 = cpFormRemark2.replace(/\s+/g, '');
                var cpFormRemark3=$('#cpFormRemark3').val();
//                 cpFormRemark3 = cpFormRemark3.replace(/\s+/g, '');
                var cpFormRemark4=$('#cpFormRemark4').val();
//                 cpFormRemark4 = cpFormRemark4.replace(/\s+/g, '');
                var cpFormRemark5=$('#cpFormRemark5').val();
//                 cpFormRemark5 = cpFormRemark5.replace(/\s+/g, '');
                var cpFormNagotiation=$('#cpFormNagotiation').val();
//                 cpFormNagotiation = cpFormNagotiation.replace(/\s+/g, '');
				var cpFormReportProgress=$('#cpFormReportProgress').val();
//                 cpFormNagotiation = cpFormNagotiation.replace(/\s+/g, '');
                var cpFormReportResult=$('#cpFormReportResult').val();
//                 cpFormReportResult = cpFormReportResult.replace(/\s+/g, '');
                var cpFormReportSpecial=$('#cpFormReportSpecial').val();
//                 cpFormReportSpecial = cpFormReportSpecial.replace(/\s+/g, '');
                var cpFormDeliveryProduct=$('#cpFormDeliveryProduct').val();
//                 cpFormDeliveryProduct = cpFormDeliveryProduct.replace(/\s+/g, '');
				g_member_name = g_member_name.replace(/\s+/g, '');
                	
	        	if(cpFormPrjName.length < 1){
	        		//fn_showProgress(0);
	        		alert("프로젝트 명은 필수 입력입니다. ");
	        		$('#cpFormPrjName').focus();
	        		return;
	        	}
	        	
	        	//fn_showProgress(1);
	        	
	        	var comAjax = new ComAjax();
	        	comAjax.setUrl("<c:url value='/insertProject.do' />");
	        	
	        	g_project_name = cpFormPrjName;
	        	comAjax.addParam("cpFormPrjName",cpFormPrjName);	
	        	
	        	if(cpFormAgency.length > 0){
	        		comAjax.addParam("cpFormAgency",cpFormAgency);	
	        	}
	        	if(cpFormCteam.length > 0){
	        		g_product_team = cpFormCteam;
	        		comAjax.addParam("cpFormCteam",cpFormCteam);	
	        	}
	        	if(cpFormPM.length > 0){
	        		g_charge_pm = cpFormPM;
	        		comAjax.addParam("cpFormPM",cpFormPM);	
	        	}
	        	if(cpFormPD.length > 0){
	        		g_charge_pd = cpFormPD;
	        		comAjax.addParam("cpFormPD",cpFormPD);	
	        	}
	        	if(cpFormStartDay.length > 0){
	        		comAjax.addParam("cpFormStartDay",cpFormStartDay);	
	        	}
	        	if(cpFormContCompleteDay1.length > 0){
	        		comAjax.addParam("cpFormContCompleteDay1",cpFormContCompleteDay1);	
	        	}
	        	if(cpFormContCompleteDay2.length > 0){
	        		comAjax.addParam("cpFormContCompleteDay2",cpFormContCompleteDay2);	
	        	}
	        	if(cpFormContCompleteDay3.length > 0){
	        		comAjax.addParam("cpFormContCompleteDay3",cpFormContCompleteDay3);	
	        	}
	        	if(cpFormDeliCompleteDay.length > 0){
	        		comAjax.addParam("cpFormDeliCompleteDay",cpFormDeliCompleteDay);	
	        	}
	        	if(cpFormAdminCloseDay.length > 0){
	        		comAjax.addParam("cpFormAdminCloseDay",cpFormAdminCloseDay);	
	        	}
	        	if(cpFormPrjCloseDay.length > 0){
	        		comAjax.addParam("cpFormPrjCloseDay",cpFormPrjCloseDay);	
	        	}
	        	if(cpFormStandardYear.length > 0){
	        		comAjax.addParam("cpFormStandardYear",cpFormStandardYear);	
	        	}
	        	if(cpFormStandardQuarter.length > 0){
	        		comAjax.addParam("cpFormStandardQuarter",cpFormStandardQuarter);	
	        	}
	        	if(cpFormPrjStatus.length > 0){
	        		comAjax.addParam("cpFormPrjStatus",cpFormPrjStatus);	
	        	}
	        	if(cpFormContrAmount.length > 0){
	        		g_contract_amount = cpFormContrAmount;
	        		comAjax.addParam("cpFormContrAmount",cpFormContrAmount);	
	        	}
	        	if(cpFormPrjAmount.length > 0){
	        		g_product_amount = cpFormPrjAmount;
	        		comAjax.addParam("cpFormPrjAmount",cpFormPrjAmount);	
	        	}
	        	if(cpFormPrePayRatio.length > 0){
	        		comAjax.addParam("cpFormPrePayRatio",cpFormPrePayRatio);	
	        	}
	        	if(cpFormPrePay.length > 0){
	        		comAjax.addParam("cpFormPrePay",cpFormPrePay);	
	        	}
	        	if(cpFormMidlePay1.length > 0){
	        		comAjax.addParam("cpFormMidlePay1",cpFormMidlePay1);	
	        	}
	        	if(cpFormMidlePay2.length > 0){
	        		comAjax.addParam("cpFormMidlePay2",cpFormMidlePay2);	
	        	}
	        	if(cpFormMidlePay3.length > 0){
	        		comAjax.addParam("cpFormMidlePay3",cpFormMidlePay3);	
	        	}
	        	if(cpFormMidlePay4.length > 0){
	        		comAjax.addParam("cpFormMidlePay4",cpFormMidlePay4);	
	        	}
	        	if(cpFormBalance.length > 0){
	        		comAjax.addParam("cpFormBalance",cpFormBalance);	
	        	}
	        	if(cpFormRegSeal.length > 0){
	        		comAjax.addParam("cpFormRegSeal",cpFormRegSeal);	
	        	}
	        	if(cpFormCustomProposal1.length > 0){
	        		comAjax.addParam("cpFormCustomProposal1",cpFormCustomProposal1);	
	        	}
	        	if(cpFormCustomProposal2.length > 0){
	        		comAjax.addParam("cpFormCustomProposal2",cpFormCustomProposal2);	
	        	}
	        	if(cpFormCustomContractl1.length > 0){
	        		comAjax.addParam("cpFormCustomContractl1",cpFormCustomContractl1);	
	        	}
	        	if(cpFormCustomContractl2.length > 0){
	        		comAjax.addParam("cpFormCustomContractl2",cpFormCustomContractl2);	
	        	}
	        	if(cpFormRemark1.length > 0){
	        		comAjax.addParam("cpFormRemark1",cpFormRemark1);	
	        	}
	        	if(cpFormRemark2.length > 0){
	        		comAjax.addParam("cpFormRemark2",cpFormRemark2);	
	        	}
	        	if(cpFormRemark3.length > 0){
	        		comAjax.addParam("cpFormRemark3",cpFormRemark3);	
	        	}
	        	if(cpFormRemark4.length > 0){
	        		comAjax.addParam("cpFormRemark4",cpFormRemark4);	
	        	}
	        	if(cpFormRemark5.length > 0){
	        		comAjax.addParam("cpFormRemark5",cpFormRemark5);	
	        	}
	        	if(cpFormNagotiation.length > 0){
	        		comAjax.addParam("cpFormNagotiation",cpFormNagotiation);	
	        	}
	        	if(cpFormReportProgress.length > 0){
	        		comAjax.addParam("cpFormReportProgress",cpFormReportProgress);	
	        	}
	        	if(cpFormReportResult.length > 0){
	        		comAjax.addParam("cpFormReportResult",cpFormReportResult);	
	        	}
	        	if(cpFormReportSpecial.length > 0){
	        		comAjax.addParam("cpFormReportSpecial",cpFormReportSpecial);	
	        	}
	        	if(cpFormDeliveryProduct.length > 0){
	        		comAjax.addParam("cpFormDeliveryProduct",cpFormDeliveryProduct);	
	        	}
	        	
	        	comAjax.addParam("WRITER",g_member_name);
	        	
	        	comAjax.setCallback("fn_insertProject_Callback");
	        	comAjax.ajax();
	        	//fn_showProgress(0);
	        	
				
	        }
	        
			function fn_insertProject_Callback(data){
	        	
				//fn_showProgress(0);
				
	        	var success = data.map["success"];
	        	
	        	if(!success){
	        		var errorString = data.map["fail_desc"];
	        		alert('error: ' + errorString); 
	        	}else{
	        		alert('project insert success');
	        		
	        		//fn_showProgress(1);
	        		
	        		var comSubmit = new ComSubmit("frmCreateProject", "fileDiv");
					comSubmit.setUrl("<c:url value='/insertProjectFile.do' />");
					comSubmit.addParam("PRJ_NAME", g_project_name);
					comSubmit.addParam("PRODUCT_TEAM", g_product_team);
					comSubmit.addParam("CHARGE_PM", g_charge_pm);
					comSubmit.addParam("CHARGE_PD", g_charge_pd);
					comSubmit.addParam("CONTRACT_AMOUNT", g_contract_amount);
					comSubmit.addParam("PRODUCT_AMOUNT", g_product_amount);
					comSubmit.addParam("WRITER", g_member_name);
					comSubmit.setCallback("fn_insertFileProject_Callback");
					comSubmit.submit();
					
	        	}
	        	
	        }
			
			function fn_insertFileProject_Callback(data){
	        	
				//fn_showProgress(0);
				
	        	var success = data.map["success"];
	        	
	        	if(!success){
	        		var errorString = data.map["fail_desc"];
	        		alert('error: ' + errorString); 
	        	}else{
	        		alert('project insertProjectFile success');
					
	        	}
	        	
	        	$('#modal_create_prj').modal('hide');
	        	
	        	$('#id_cpSave').attr('disabled',false); 
	        	
	        } 
			
			 function fn_updateProject(){
		        	//fn_showProgress(1);
		        	
		        	 var cpFormPrjName=$('#cpFormPrjName').val();
		        	cpFormPrjName = cpFormPrjName.replace(/\s+/g, '');
		        	var cpFormAgency=$('#cpFormAgency').val();
		        	cpFormAgency = cpFormAgency.replace(/\s+/g, '');
	            	var cpFormCteam=$('#cpFormCteam').val();
	                cpFormCteam = cpFormCteam.replace(/\s+/g, '');
	                var cpFormPM=$('#cpFormPM').val();
	                cpFormPM = cpFormPM.replace(/\s+/g, '');
	                var cpFormPD=$('#cpFormPD').val();
	                cpFormPD = cpFormPD.replace(/\s+/g, '');
	                var cpFormStartDay=$('#cpFormStartDay').val();
	                cpFormStartDay = cpFormStartDay.replace(/\s+/g, '');
	                var cpFormContCompleteDay1=$('#cpFormContCompleteDay1').val();
	                cpFormContCompleteDay1 = cpFormContCompleteDay1.replace(/\s+/g, '');
	                var cpFormContCompleteDay2=$('#cpFormContCompleteDay2').val();
	                cpFormContCompleteDay2 = cpFormContCompleteDay2.replace(/\s+/g, '');
	                var cpFormContCompleteDay3=$('#cpFormContCompleteDay3').val();
	                cpFormContCompleteDay3 = cpFormContCompleteDay3.replace(/\s+/g, '');
	                var cpFormDeliCompleteDay=$('#cpFormDeliCompleteDay').val();
	                cpFormDeliCompleteDay = cpFormDeliCompleteDay.replace(/\s+/g, '');
	                var cpFormAdminCloseDay=$('#cpFormAdminCloseDay').val();
	                cpFormAdminCloseDay = cpFormAdminCloseDay.replace(/\s+/g, '');
	                var cpFormPrjCloseDay=$('#cpFormPrjCloseDay').val();
	                cpFormPrjCloseDay = cpFormPrjCloseDay.replace(/\s+/g, '');
	                var cpFormStandardYear=$('#cpFormStandardYear').val();
	                cpFormStandardYear = cpFormStandardYear.replace(/\s+/g, '');
	                var cpFormStandardQuarter=$('#cpFormStandardQuarter').val();
	                cpFormStandardQuarter = cpFormStandardQuarter.replace(/\s+/g, '');
	                var cpFormPrjStatus=$('#cpFormPrjStatus').val();
	                cpFormPrjStatus = cpFormPrjStatus.replace(/\s+/g, '');
	                var cpFormContrAmount=$('#cpFormContrAmount').val();
	                cpFormContrAmount = cpFormContrAmount.replace(/\s+/g, '');
	                var cpFormPrjAmount=$('#cpFormPrjAmount').val();
	                cpFormPrjAmount = cpFormPrjAmount.replace(/\s+/g, '');
	                var cpFormPrePayRatio=$('#cpFormPrePayRatio').val();
	                cpFormPrePayRatio = cpFormPrePayRatio.replace(/\s+/g, '');
	                var cpFormPrePay=$('#cpFormPrePay').val();
	                cpFormPrePay = cpFormPrePay.replace(/\s+/g, '');
	                var cpFormMidlePay1=$('#cpFormMidlePay1').val();
	                cpFormMidlePay1 = cpFormMidlePay1.replace(/\s+/g, '');
	                var cpFormMidlePay2=$('#cpFormMidlePay2').val();
	                cpFormMidlePay2 = cpFormMidlePay2.replace(/\s+/g, '');
	                var cpFormMidlePay3=$('#cpFormMidlePay3').val();
	                cpFormMidlePay3 = cpFormMidlePay3.replace(/\s+/g, '');
	                var cpFormMidlePay4=$('#cpFormMidlePay4').val();
	                cpFormMidlePay4 = cpFormMidlePay4.replace(/\s+/g, '');
	                var cpFormBalance=$('#cpFormBalance').val();
	                cpFormBalance = cpFormBalance.replace(/\s+/g, '');
	                var cpFormRegSeal=$('#cpFormRegSeal').val();
	                cpFormRegSeal = cpFormRegSeal.replace(/\s+/g, '');
	                var cpFormCustomProposal1=$('#cpFormCustomProposal1').val();
	                cpFormCustomProposal1 = cpFormCustomProposal1.replace(/\s+/g, '');
	                var cpFormCustomProposal2=$('#cpFormCustomProposal2').val();
	                cpFormCustomProposal2 = cpFormCustomProposal2.replace(/\s+/g, '');
	                var cpFormCustomContractl1=$('#cpFormCustomContractl1').val();
	                cpFormCustomContractl1 = cpFormCustomContractl1.replace(/\s+/g, '');
	                var cpFormCustomContractl2=$('#cpFormCustomContractl2').val();
	                cpFormCustomContractl2 = cpFormCustomContractl2.replace(/\s+/g, '');
	                var cpFormRemark1=$('#cpFormRemark1').val();
//	                 cpFormRemark1 = cpFormRemark1.replace(/\s+/g, '');
	                var cpFormRemark2=$('#cpFormRemark2').val();
//	                 cpFormRemark2 = cpFormRemark2.replace(/\s+/g, '');
	                var cpFormRemark3=$('#cpFormRemark3').val();
//	                 cpFormRemark3 = cpFormRemark3.replace(/\s+/g, '');
	                var cpFormRemark4=$('#cpFormRemark4').val();
//	                 cpFormRemark4 = cpFormRemark4.replace(/\s+/g, '');
	                var cpFormRemark5=$('#cpFormRemark5').val();
//	                 cpFormRemark5 = cpFormRemark5.replace(/\s+/g, '');
	                var cpFormNagotiation=$('#cpFormNagotiation').val();
//	                 cpFormNagotiation = cpFormNagotiation.replace(/\s+/g, '');
					var cpFormReportProgress=$('#cpFormReportProgress').val();
//	                 cpFormNagotiation = cpFormNagotiation.replace(/\s+/g, '');
	                var cpFormReportResult=$('#cpFormReportResult').val();
//	                 cpFormReportResult = cpFormReportResult.replace(/\s+/g, '');
	                var cpFormReportSpecial=$('#cpFormReportSpecial').val();
//	                 cpFormReportSpecial = cpFormReportSpecial.replace(/\s+/g, '');
	                var cpFormDeliveryProduct=$('#cpFormDeliveryProduct').val();
//	                 cpFormDeliveryProduct = cpFormDeliveryProduct.replace(/\s+/g, '');
					g_member_name = g_member_name.replace(/\s+/g, '');
	                	
		        	if(cpFormPrjName.length < 1){
		        		//fn_showProgress(0);
		        		alert("프로젝트 명은 필수 입력입니다. ");
		        		$('#cpFormPrjName').focus();
		        		return;
		        	}
		        	
		        	var comAjax = new ComAjax();
		        	comAjax.setUrl("<c:url value='/updateProject.do' />");
		        	
		        	g_project_name = cpFormPrjName;
		        	comAjax.addParam("cpFormPrjName",cpFormPrjName);	
		        	
		        	if(cpFormAgency.length > 0){
		        		comAjax.addParam("cpFormAgency",cpFormAgency);	
		        	}
		        	if(cpFormCteam.length > 0){
		        		g_product_team = cpFormCteam;
		        		comAjax.addParam("cpFormCteam",cpFormCteam);	
		        	}
		        	if(cpFormPM.length > 0){
		        		g_charge_pm = cpFormPM;
		        		comAjax.addParam("cpFormPM",cpFormPM);	
		        	}
		        	if(cpFormPD.length > 0){
		        		g_charge_pd = cpFormPD;
		        		comAjax.addParam("cpFormPD",cpFormPD);	
		        	}
		        	if(cpFormStartDay.length > 0){
		        		comAjax.addParam("cpFormStartDay",cpFormStartDay);	
		        	}
		        	if(cpFormContCompleteDay1.length > 0){
		        		comAjax.addParam("cpFormContCompleteDay1",cpFormContCompleteDay1);	
		        	}
		        	if(cpFormContCompleteDay2.length > 0){
		        		comAjax.addParam("cpFormContCompleteDay2",cpFormContCompleteDay2);	
		        	}
		        	if(cpFormContCompleteDay3.length > 0){
		        		comAjax.addParam("cpFormContCompleteDay3",cpFormContCompleteDay3);	
		        	}
		        	if(cpFormDeliCompleteDay.length > 0){
		        		comAjax.addParam("cpFormDeliCompleteDay",cpFormDeliCompleteDay);	
		        	}
		        	if(cpFormAdminCloseDay.length > 0){
		        		comAjax.addParam("cpFormAdminCloseDay",cpFormAdminCloseDay);	
		        	}
		        	if(cpFormPrjCloseDay.length > 0){
		        		comAjax.addParam("cpFormPrjCloseDay",cpFormPrjCloseDay);	
		        	}
		        	if(cpFormStandardYear.length > 0){
		        		comAjax.addParam("cpFormStandardYear",cpFormStandardYear);	
		        	}
		        	if(cpFormStandardQuarter.length > 0){
		        		comAjax.addParam("cpFormStandardQuarter",cpFormStandardQuarter);	
		        	}
		        	if(cpFormPrjStatus.length > 0){
		        		comAjax.addParam("cpFormPrjStatus",cpFormPrjStatus);	
		        	}
		        	if(cpFormContrAmount.length > 0){
		        		g_contract_amount = cpFormContrAmount;
		        		comAjax.addParam("cpFormContrAmount",cpFormContrAmount);	
		        	}
		        	if(cpFormPrjAmount.length > 0){
		        		g_product_amount = cpFormPrjAmount;
		        		comAjax.addParam("cpFormPrjAmount",cpFormPrjAmount);	
		        	}
		        	if(cpFormPrePayRatio.length > 0){
		        		comAjax.addParam("cpFormPrePayRatio",cpFormPrePayRatio);	
		        	}
		        	if(cpFormPrePay.length > 0){
		        		comAjax.addParam("cpFormPrePay",cpFormPrePay);	
		        	}
		        	if(cpFormMidlePay1.length > 0){
		        		comAjax.addParam("cpFormMidlePay1",cpFormMidlePay1);	
		        	}
		        	if(cpFormMidlePay2.length > 0){
		        		comAjax.addParam("cpFormMidlePay2",cpFormMidlePay2);	
		        	}
		        	if(cpFormMidlePay3.length > 0){
		        		comAjax.addParam("cpFormMidlePay3",cpFormMidlePay3);	
		        	}
		        	if(cpFormMidlePay4.length > 0){
		        		comAjax.addParam("cpFormMidlePay4",cpFormMidlePay4);	
		        	}
		        	if(cpFormBalance.length > 0){
		        		comAjax.addParam("cpFormBalance",cpFormBalance);	
		        	}
		        	if(cpFormRegSeal.length > 0){
		        		comAjax.addParam("cpFormRegSeal",cpFormRegSeal);	
		        	}
		        	if(cpFormCustomProposal1.length > 0){
		        		comAjax.addParam("cpFormCustomProposal1",cpFormCustomProposal1);	
		        	}
		        	if(cpFormCustomProposal2.length > 0){
		        		comAjax.addParam("cpFormCustomProposal2",cpFormCustomProposal2);	
		        	}
		        	if(cpFormCustomContractl1.length > 0){
		        		comAjax.addParam("cpFormCustomContractl1",cpFormCustomContractl1);	
		        	}
		        	if(cpFormCustomContractl2.length > 0){
		        		comAjax.addParam("cpFormCustomContractl2",cpFormCustomContractl2);	
		        	}
		        	if(cpFormRemark1.length > 0){
		        		comAjax.addParam("cpFormRemark1",cpFormRemark1);	
		        	}
		        	if(cpFormRemark2.length > 0){
		        		comAjax.addParam("cpFormRemark2",cpFormRemark2);	
		        	}
		        	if(cpFormRemark3.length > 0){
		        		comAjax.addParam("cpFormRemark3",cpFormRemark3);	
		        	}
		        	if(cpFormRemark4.length > 0){
		        		comAjax.addParam("cpFormRemark4",cpFormRemark4);	
		        	}
		        	if(cpFormRemark5.length > 0){
		        		comAjax.addParam("cpFormRemark5",cpFormRemark5);	
		        	}
		        	if(cpFormNagotiation.length > 0){
		        		comAjax.addParam("cpFormNagotiation",cpFormNagotiation);	
		        	}
		        	if(cpFormReportProgress.length > 0){
		        		comAjax.addParam("cpFormReportProgress",cpFormReportProgress);	
		        	}
		        	if(cpFormReportResult.length > 0){
		        		comAjax.addParam("cpFormReportResult",cpFormReportResult);	
		        	}
		        	if(cpFormReportSpecial.length > 0){
		        		comAjax.addParam("cpFormReportSpecial",cpFormReportSpecial);	
		        	}
		        	if(cpFormDeliveryProduct.length > 0){
		        		comAjax.addParam("cpFormDeliveryProduct",cpFormDeliveryProduct);	
		        	}
		        	
		        	comAjax.addParam("WRITER",g_member_name);
		        	comAjax.addParam("g_current_project_number",g_current_project_number);
		        	
		        	comAjax.setCallback("fn_updateProject_Callback");
		        	comAjax.ajax();
		        	//fn_showProgress(0);
		        	
					
		        }
		        
				function fn_updateProject_Callback(data){
		        	
					//fn_showProgress(0);
					
		        	var success = data.map["success"];
		        	
		        	if(!success){
		        		var errorString = data.map["fail_desc"];
		        		alert('error: ' + errorString); 
		        	}else{
		        		alert('project update success');
		        		
		        		var comSubmit = new ComSubmit("frmCreateProject", "fileDiv");
						comSubmit.setUrl("<c:url value='/updateProjectFile.do' />");
						comSubmit.addParam("PRJ_NUM", g_current_project_number);
						comSubmit.addParam("WRITER", g_member_name);
						comSubmit.setCallback("fn_updateFileProject_Callback");
						comSubmit.submit();
						
		        	}
		        	 
		        }
            
			function fn_updateFileProject_Callback(data){
	        	
	        	var success = data.map["success"];
	        	
	        	if(!success){
	        		var errorString = data.map["fail_desc"];
	        		alert('error: ' + errorString); 
	        	}else{
	        		alert('project updateProjectFile success');
					
	        	}
	        	
	        	$('#modal_create_prj').modal('hide');
	        	
	        	$('#id_cpSave').attr('disabled',false);
	        }
				
	        function fn_create(){
	        	$('#modal2').modal('show'); 
	        	/* $('#myModal').modal('toggle');
	        	$('#myModal').modal('show');
	        	$('#myModal').modal('hide'); */
	        }
	        
	        function fn_showProgress($isShow){
	        	if($isShow){
	        		$('#modal1').modal('show');
	        	}else{
	        		//$('#modal1').modal('hide');
	        		$("#modal1 .close").click()
	        	}
	        }
	        
	        function fn_logout(){
	        	//fn_showProgress(1);
	        	var comAjax = new ComAjax();
	        	comAjax.setUrl("<c:url value='/logout.do' />");
	        	/* comAjax.setUrl("http://192.168.0.168:8282/innerPrj/login.do"); */
	        	comAjax.setCallback("fn_logoutCallback");
	        	comAjax.ajax();
	        	//fn_showProgress(0);
	        }
	        
	        function fn_logoutCallback(data){
	        	var result = data.SUCCESS;
	        	
	        	 if (result) {  //success
	             	
	        		$('#idButton').text("로그인");
	 	        	$('#idButton').show();
	 	        	
	 	        	$('#menu_logout').hide();
	 	        	$('#menu_project').hide();
	 	    		$('#menu_cost').hide();
	 	    		$('#menu_reception').hide();
// 	 	    		$('#menu_dispatch').hide();
	 	    		
 	        		$('#menu_member').hide();
 	        		$('#menu_team').hide();
 	        		$('#menu_notice').hide();
 	        		$('#menu_import').hide();
 	        		$('#menu_verification').hide();
	 	        	
 	        		location.replace('index.jsp');
 	        		
	             } else {
	            	 alert("data fail !");
	             }
	        }
	        
	        function pageChange($isAdmin) {
	        	$('#idButton').text("로그아웃");
	        	$('#idButton').hide();
	        	
	        	$('#menu_logout').show();
	        	$('#menu_cost').show();
	    		$('#menu_reception').show();
// 	    		$('#menu_dispatch').show();
				$('#menu_notice').show();
	    		
	        	if($isAdmin == 'A'){
	        		$('#menu_project').show();
	        		$('#menu_member').show();
	        		$('#menu_team').show();
	        		$('#menu_import').show();
	        		$('#menu_verification').show();
	        	}
	        	
	        	if($isAdmin == 'B' || $isAdmin == 'C'){
	        		$('#menu_project').show();
	        	}
	        	
	        }
	        
	        function fn_downloadFile(obj){
				var storage_file_name = obj.parent().find("#storage_file_name").val();
				var folder_name = obj.parent().find("#folder_name").val();
				var comDownloadSubmit = new ComDownloadSubmit();
				comDownloadSubmit.setUrl("<c:url value='/common/downloadProjectFile.do' />");
				comDownloadSubmit.addParam("storage_file_name", storage_file_name);
				comDownloadSubmit.addParam("folder_name", folder_name);
				comDownloadSubmit.submit();
			}
	        
		</script>
    </body>
</html>