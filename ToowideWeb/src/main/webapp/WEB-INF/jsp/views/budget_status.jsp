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
        <link href="css/creative.min4.css" rel="stylesheet">
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
                            <a id="menu_member" class="page-scroll" href="listMember.do">직원</a>
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
      
      <header id="id_header">
            <div class="header-content" data-pg-collapsed>
                <div class="header-content-inner">
                    <h1 id="homeHeading">실행예산서</h1>
                </div>
                <form role="form">
                    <div class="form-group"> 
                        <label class="control-label" for="id_s_year">기준년</label>                         
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
                        <label class="control-label" for="id_s_quarter">기준반기</label>                         
                        <select id="id_s_quarter" class="form-control"> 
                            <option>상반기</option>                             
                            <option>하반기</option>                             
                            <option>전체</option>                             
                        </select>
                    </div>
                    <div class="form-group"> 
                        <label class="control-label" for="id_s_team_name">제작팀명</label>                         
                        <select id="id_s_team_name" class="form-control"> 
                        	<option>연출1팀</option>                             
                            <option>연출2팀</option>                             
                            <option>연출3팀</option>    
                            <option>허니티브</option>
                            <option>투와이드미디어</option>
                            <option>외주제작</option>                         
                        </select>
                    </div>                     
                    <div class="form-group"> 
                        <label class="control-label" for="id_s_project_name">프로젝트 명</label>                         
                        <select id="id_s_project_name" class="form-control"> 
<!--                             <option>한국전력기술</option>                              -->
<!--                             <option>한국전력기술</option>                              -->
<!--                             <option>한국전력기술</option>                              -->
                        </select>
                    </div>                     
                                        
                </form>
                
                 <div>
                <button  id="id_budget_status_search" class="btn btn-primary btn-xl page-scroll">조회</button>
                </div>
                
            </div>
        </header>
        <div id="id_session_total">
        <section class="no-padding" id="id_session">
            <div class="call-to-action">
                <h1 id="id_budget_title">&nbsp;기준년: 2017 &nbsp; 기준반기: 상반기 &nbsp; 프로젝트 진행 상태: 편집&nbsp;<br></h1>
            </div>
            <div class="container-fluid">
                <div>
                    <span class="label label-default">실적</span>
                    <table id="id_classCostPerProjectTable" class="table" data-pg-collapsed> 
                        <thead data-pg-collapsed>
                            <tr> 
                                <th>#</th>
                                <th>총 계약금</th>
                                <th>총 지급 제작비</th>
                                <th>외주비</th>
                                <th>진행비</th>
                                <th>내부비</th>
                                <th>제작비 합계</th> 
                                <th>지출합계</th> 
                                <th>총 실적</th>
                                <th>제작 실적률 (%)</th> 
                            </tr>                             
                        </thead>                         
                        <tbody> 
                            <tr> 
                                <td>예상 실행금액</td>
                                <td>100,000,000</td> 
                                <td>100,000,000</td> 
                                <td>100,000,000</td>
                                <td>100,000,000</td>
                                <td>100,000,000</td>
                                <td>100,000,000</td>
                                <td>100,000,000</td>
                                <td>100,000,000</td>
                                <td>100</td> 
                            </tr>
                            <tr> 
                                <td>최종 실행금액</td>
                                <td>100,000,000</td> 
                                <td>100,000,000</td> 
                                <td>100,000,000</td>
                                <td>100,000,000</td>
                                <td>100,000,000</td>
                                <td>100,000,000</td>
                                <td>100,000,000</td>
                                <td>100,000,000</td>
                                <td>100</td> 
                            </tr>                             
                        </tbody>
                    </table>
                </div>
                <div>
                    <span class="label label-default">외주비</span>
                    <table id="id_outsourcingCostPerProjectTable" class="table" data-pg-collapsed> 
                        <thead data-pg-collapsed>
                            <tr> 
                                <th>#</th> 
                                <th>예상 실행금액</th> 
                                <th>최종 실행금액</th> 
                            </tr>                             
                        </thead>                         
                        <tbody>
                            <tr data-pg-collapsed> 
</tr>
                            <tr data-pg-collapsed> 
                                <td>카메라 렌탈</td> 
                                <td>1,000</td> 
                                <td>1,000</td> 
                            </tr>
                            <tr data-pg-collapsed> 
                                <td>기자재비</td> 
                                <td>1,000</td> 
                                <td>1,000</td> 
                            </tr>
                            <tr data-pg-collapsed> 
                                <td>메이크업</td> 
                                <td>1,000</td> 
                                <td>1,000</td> 
                            </tr>
                            <tr data-pg-collapsed> 
                                <td>출연료</td> 
                                <td>1,000</td> 
                                <td>1,000</td> 
                            </tr>
                            <tr data-pg-collapsed> 
                                <td>작가</td> 
                                <td>1,000</td> 
                                <td>1,000</td> 
                            </tr>
                            <tr data-pg-collapsed> 
                                <td>POST PRODUCT</td> 
                                <td>1,000</td> 
                                <td>1,000</td> 
                            </tr>
                            <tr data-pg-collapsed> 
                                <td>녹음료</td> 
                                <td>1,000</td> 
                                <td>1,000</td> 
                            </tr>
                            <tr data-pg-collapsed> 
                                <td>성우료</td> 
                                <td>1,000</td> 
                                <td>1,000</td> 
                            </tr>
                            <tr data-pg-collapsed> 
                                <td>번역료</td> 
                                <td>1,000</td> 
                                <td>1,000</td> 
                            </tr>
                            <tr data-pg-collapsed> 
                                <td>자료 구매</td> 
                                <td>1,000</td> 
                                <td>1,000</td> 
                            </tr>
                            <tr data-pg-collapsed> 
                                <td>미술 및 소품구매</td> 
                                <td>1,000</td> 
                                <td>1,000</td> 
                            </tr>
                            <tr data-pg-collapsed> 
                                <td>미술</td> 
                                <td>1,000</td> 
                                <td>1,000</td> 
                            </tr>
                            <tr data-pg-collapsed> 
                                <td>해외촬영</td> 
                                <td>1,000</td> 
                                <td>1,000</td> 
                            </tr>
                            <tr data-pg-collapsed> 
                                <td>번역 검수</td> 
                                <td>1,000</td> 
                                <td>1,000</td> 
                            </tr>
                            <tr data-pg-collapsed> 
                                <td>번역</td> 
                                <td>1,000</td> 
                                <td>1,000</td> 
                            </tr>
                            <tr data-pg-collapsed> 
                                <td>납품료</td> 
                                <td>1,000</td> 
                                <td>1,000</td> 
                            </tr>
                            <tr data-pg-collapsed> 
                                <td>기타</td> 
                                <td>1,000</td> 
                                <td>1,000</td> 
                            </tr>                             
                        </tbody>
                    </table>
                </div>
                <div>
                    <span class="label label-default">진행비</span>
                    <table id="id_progressCostPerProjectTable" class="table"> 
                        <thead data-pg-collapsed>
                            <tr> 
                                <th>#</th> 
                                <th>예상 실행금액</th> 
                                <th>최종 실행금액</th> 
                            </tr>                             
                        </thead>                         
                        <tbody>
                            <tr data-pg-collapsed> 
</tr>
                            <tr data-pg-collapsed> 
                                <td>식비</td> 
                                <td>1,000</td> 
                                <td>1,000</td> 
                            </tr>
                            <tr data-pg-collapsed> 
                                <td>주유비</td> 
                                <td>1,000</td> 
                                <td>1,000</td> 
                            </tr>
                            <tr data-pg-collapsed> 
                                <td>교통비</td> 
                                <td>1,000</td> 
                                <td>1,000</td> 
                            </tr>
                            <tr data-pg-collapsed> 
                                <td>숙박비</td> 
                                <td>1,000</td> 
                                <td>1,000</td> 
                            </tr>
                            <tr data-pg-collapsed> 
                                <td>부식비</td> 
                                <td>1,000</td> 
                                <td>1,000</td> 
                            </tr>
                            <tr data-pg-collapsed> 
                                <td>주차비</td> 
                                <td>1,000</td> 
                                <td>1,000</td> 
                            </tr>
                            <tr data-pg-collapsed> 
                                <td>비품구매</td> 
                                <td>1,000</td> 
                                <td>1,000</td> 
                            </tr>
                            <tr data-pg-collapsed> 
                                <td>장비렌탈</td> 
                                <td>1,000</td> 
                                <td>1,000</td> 
                            </tr>
                            <tr data-pg-collapsed> 
                                <td>기타</td> 
                                <td>1,000</td> 
                                <td>1,000</td> 
                            </tr>                             
                        </tbody>
                    </table>
                </div>
                <div>
                    <span class="label label-default">내부비</span>
                    <table id="id_internalCostPerProjectTable" class="table"> 
                        <thead data-pg-collapsed>
                            <tr> 
                                <th>#</th> 
                                <th>예상 실행금액</th> 
                                <th>최종 실행금액</th> 
                            </tr>                             
                        </thead>                         
                        <tbody>
                            <tr data-pg-collapsed> 
</tr>
                            <tr data-pg-collapsed> 
                                <td>차량비</td> 
                                <td>1,000</td> 
                                <td>1,000</td> 
                            </tr>
                            <tr data-pg-collapsed> 
                                <td>촬영1팀</td> 
                                <td>1,000</td> 
                                <td>1,000</td> 
                            </tr>
                            <tr data-pg-collapsed> 
                                <td>촬영2팀</td> 
                                <td>1,000</td> 
                                <td>1,000</td> 
                            </tr>
                            <tr data-pg-collapsed> 
                                <td>항공팀</td> 
                                <td>1,000</td> 
                                <td>1,000</td> 
                            </tr>
                            <tr data-pg-collapsed> 
                                <td>작가팀</td> 
                                <td>1,000</td> 
                                <td>1,000</td> 
                            </tr>
                            <tr data-pg-collapsed> 
                                <td>디자이너팀</td> 
                                <td>1,000</td> 
                                <td>1,000</td> 
                            </tr>
                            <tr data-pg-collapsed> 
                                <td>기타</td> 
                                <td>1,000</td> 
                                <td>1,000</td> 
                            </tr>                             
                        </tbody>
                    </table>
                </div>
            </div>
        </section>
        </div>
        <aside class="bg-dark" id="id_before_section_2">
            <div class="container text-center">
                <div class="header-content-inner">
                    <h3 id="homeHeading">지출내역</h3>
                    <a id="id_search_costList" class="btn btn-primary btn-xl page-scroll">지출내역 조회</a>
                    <a id="id_show_costDetail" class="btn btn-primary btn-xl page-scroll">지출상세내용보기 및 업데이트</a>
                    <a id="id_show_costInput" class="btn btn-primary btn-xl page-scroll">내부비 지출입력</a>
                    <a id="id_search_costItemPerNumber" class="btn btn-primary btn-xl page-scroll">승인번호로 조회</a>
                    <a id="id_search_noInputData" class="btn btn-primary btn-xl page-scroll">미입력 카드사용 조회</a>
                </div>
            </div>
        </aside>
        <section class="no-padding" id="id_section_2">
            <div class="container-fluid">
                <div>
                    <span class="label label-default">팀 상세 실적현황</span>
                    <table id="id_costPerProjectTable" class="table"> 
                        <thead>
                            <tr data-pg-collapsed> 
                            	<th>번호</th>
                                <th>구분</th> 
                                <th>프로젝트명</th>
                                <th>제작팀</th>
                                <th>사용자</th>
                                <th>사용자팀</th>
                                <th>대분류</th>
                                <th>중분류</th>
                                <th>소분류</th>
                                <th>카드번호</th>
                                <th>승인번호</th>
                                <th>사용일</th>
                                <th>이용금액</th> 
                            </tr>                             
                        </thead>                         
                        <tbody> 
                            <tr data-pg-collapsed> 
                                <td>번호</td>
                                <td>법인_신한</td>
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
                            <tr data-pg-collapsed> 
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
                            <tr data-pg-collapsed> 
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
                        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>                         
                        <button type="button" class="btn btn-primary">Save changes</button>                         
                    </div>                     
                </div>                 
            </div>             
        </div>
        <div class="modal fade pg-show-modal" id="modal_search_cost" tabindex="-1" role="dialog" aria-hidden="true"> 
            <div class="modal-dialog"> 
                <div class="modal-content"> 
                    <div class="modal-header"> 
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>                         
                        <h4 class="modal-title">승인번호로 검색</h4> 
                    </div>                     
                    <div class="modal-body"> 
                        <p>&nbsp;</p>
                        <form role="form"> 
                            <div class="form-group"> 
                                <label class="control-label" for="msFormApprovalNumber">승인번호 입력</label>                                 
                                <input type="text" class="form-control" id="msFormApprovalNumber" placeholder="">
                            </div>
                        </form>
                    </div>                     
                    <div class="modal-footer"> 
                        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>                         
                        <button id="id_btn_search_cost" type="button" class="btn btn-primary">검색</button>                         
                    </div>                     
                </div>                 
            </div>             
        </div>
        <div class="modal fade pg-show-modal" id="modal_update_cost" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog"> 
                <div class="modal-content"> 
                    <div class="modal-header"> 
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>                         
                        <h4 id="id_cc_title" class="modal-title">지출내역 조회 및 업데이트</h4> 
                    </div> 
                    <div class="modal-body"> 
                    		<div class="form-group"> 
                                <h4  style="color:#ff0000" class="modal-title"><strong>제작팀 및 프로젝트명이 올바른지 확인하세요!</strong></h4>                                 
                            </div>
                        <p>&nbsp;</p>
                        <form role="form"> 
                        	<div class="form-group"> 
                                <label class="control-label" for="ucFormProductTeam">제작팀</label>                                 
                                <input type="text" class="form-control" name="ucFormProductTeam" id="ucFormProductTeam" placeholder="">
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="ucFormPrjName">프로젝트 명</label>                                 
                                <select id="ucFormPrjName" class="form-control"> 
                                    <option>project1</option>                                     
                                    <option>project2</option>                                     
                                    <option>project3</option>
                                </select>
                            </div>
                            <div class="form-group" data-pg-collapsed> 
                                <label class="control-label" for="ucFormFirstClass">비용 대분류</label>                                 
                                <select id="ucFormFirstClass" class="form-control"> 
                                    <option>외주비</option>                                     
                                    <option>진행비</option>                                     
                                    <option>내부비</option>
                                </select>
                            </div>
                            <div class="form-group" data-pg-collapsed> 
                                <label class="control-label" for="ucFormSecondClass">비용 중분류</label>                                 
                                <select id="ucFormSecondClass" class="form-control" data-pg-collapsed> 
                                    <option>카메라렌탈</option>                                     
                                    <option>기자재비</option>                                     
                                    <option>메이크업</option>
                                    <option>출연료</option>                                     
                                    <option>작가</option>                                     
                                    <option>POSTPRODUCT</option>
                                    <option>녹음료</option>                                     
                                    <option>성우료</option>                                     
                                    <option>번역료</option>
                                    <option>자료구매</option>                                     
                                    <option>장소대여</option>                                     
                                    <option>미술및소품구매</option>
                                    <option>미술</option>                                     
                                    <option>해외촬영</option>                                     
                                    <option>번역검수</option>
                                    <option>번역</option>                                     
                                    <option>납품료</option>                                     
                                    <option>식비</option>
                                    <option>주유비</option>
                                    <option>교통비</option>                                     
                                    <option>숙박비</option>
                                    <option>부식비</option>                                     
                                    <option>주차비</option>                                     
                                    <option>비품구매</option>
                                    <option>장비렌탈</option>                                     
                                    <option>현금사용</option>                                     
                                    <option>차량비</option>
                                    <option>촬영1팀</option>                                     
                                    <option>촬영2팀</option>                                     
                                    <option>항공팀</option>
                                    <option>작가팀</option>                                     
                                    <option>디자이너팀</option>                                     
                                    <option>기타</option>
                                </select>
                                <label class="control-label" for="ucFormSecondClassEtc">비용 중분류 기타입력 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                                    <br>
                                </label>
                                <input type="text" class="form-control" id="ucFormSecondClassEtc" placeholder="">
                            </div>
                            <div class="form-group" data-pg-collapsed> 
                                <label class="control-label" for="ucFormThirdClass">비용 소분류</label>                                 
                                <select id="ucFormThirdClass" class="form-control" data-pg-collapsed> 
                                    <option>촬영</option>                                     
                                    <option>항공촬영</option>                                     
                                    <option>조명렌탈</option>
                                    <option>카메라렌탈</option>                                     
                                    <option>메이크업</option>                                     
                                    <option>아기</option>
                                    <option>국문</option>                                     
                                    <option>영문</option>                                     
                                    <option>불문</option>
                                    <option>대관</option>
                                    <option>소품</option>                                     
                                    <option>미술감독</option>                                     
                                    <option>번역</option>
                                    <option>카니발1</option>
                                    <option>카니발2</option>                                     
                                    <option>소나타</option>                                     
                                    <option>레이</option>
                                    <option>기타</option>
                                </select>
                                <label class="control-label" for="ucFormThirdClassEtc">비용 소분류 기타입력 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                                    <br>
                                </label>
                                <input type="text" class="form-control" id="ucFormThirdClassEtc" placeholder="">
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="ucFormContents">내용 ( 최대 한글 100자)</label>
                                <textarea  id="ucFormContents" class="form-control" rows="3"></textarea>
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="ucFormUseDay">사용일 (ex: 2017-05-22 14:22:31, yyyy-mm-dd hh:mm:ss 19자리 숫자입력)</label>                                 
                                <input type="text" class="form-control" id="ucFormUseDay" placeholder="yyyy-mm-dd hh:mm:ss"> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="ucFormDivision">구분</label>                                 
                                <select id="ucFormDivision" class="form-control"> 
                                    <option>현금</option>
                                    <option>내부비</option>
                                    <option>외주비</option>                                     
                                    <option>법인_신한</option>                                     
                                    <option>법인_우리</option>
                                    <option>법인_하나</option>
                                    <option>법인_기업</option>
                                    <option>법인_국민</option>
                                </select>
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="ucFormCardNumber">카드번호</label>                                 
                                <input type="text" class="form-control" id="ucFormCardNumber" placeholder=""> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="ucFormApprovalNumber">승인번호</label>                                 
                                <input type="text" class="form-control" id="ucFormApprovalNumber" placeholder=""> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="ucFormFranchisee">가맹점명</label>                                 
                                <input type="text" class="form-control" id="ucFormFranchisee" placeholder=""> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="ucFormAmountUsed">이용금액&nbsp;</label>                                (단위 원 - won)

                                <input type="text" class="form-control" id="ucFormAmountUsed" placeholder="">
                            </div>
                                                         
                        </form>
                        
                        <form id="frmUpdateCost"  role="form" enctype="multipart/form-data">   
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
                        <button id="id_ucSave" type="button" class="btn btn-primary">저장</button>                         
                    </div>                     
                </div>                 
            </div>                          
        </div>
        <aside class="bg-dark" data-pg-collapsed id="id_before_contact">
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
        
        <%@ include file="/WEB-INF/include/include-body.jspf" %>
        
        <!-- jQuery -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <!-- Bootstrap Core JavaScript -->
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <!-- Plugin JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
        <script src="vendor/scrollreveal/scrollreveal.min.js"></script>
        <script src="vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
        <!-- Theme JavaScript -->
        <script src="js/creative.min.js"></script>
        
        <script type="text/javascript">
        
        var gfv_count = 0;
        var g_isCCUpdate = 0;
        var g_authority;
        
        var g_member_name;
        var g_team_db_name;
        var g_employee_num;
        var g_prj_status;
        
        var g_current_product_team;
        var g_current_project_number;
        var g_current_project_name;
        var g_current_cost_number;
        
        var g_update_project_number;
        var g_update_project_name;
        
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
    		
    		$('#id_budget_status_search').show();
    		$('#id_session').show();
    		$('#id_search_costList').show();
    		
    		var body = $("#id_classCostPerProjectTable > tbody");
			body.empty();
			body = $("#id_outsourcingCostPerProjectTable > tbody");
			body.empty();
			body = $("#id_progressCostPerProjectTable > tbody");
			body.empty();
			body = $("#id_internalCostPerProjectTable > tbody");
			body.empty();
			body = $("#id_costPerProjectTable > tbody");
			body.empty();
			
			$("#id_budget_title").text("기준년:      기준반기:    프로젝트 진행 상태:");
			
			fn_setCurrentYearMonth();
			$('#id_s_quarter').val("전체").prop("selected", true);
			fn_getTeamNames();
    		fn_getSession();
    		
    		//fn_selectMemberList();
    		
    		$("#id_s_year").on('change', function () { 
    			if( g_authority != 'D'){
    				var body = $("#id_classCostPerProjectTable > tbody");
        			body.empty();
        			body = $("#id_outsourcingCostPerProjectTable > tbody");
        			body.empty();
        			body = $("#id_progressCostPerProjectTable > tbody");
        			body.empty();
        			body = $("#id_internalCostPerProjectTable > tbody");
        			body.empty();
        			body = $("#id_costPerProjectTable > tbody");
        			body.empty();
        			$("#id_budget_title").text("기준년:      기준반기:    프로젝트 진행 상태:");
    			}
    			
    			var selectText;
				selectText = $("#id_s_team_name option:selected").val();
				g_current_product_team = selectText.replace(/\s+/g, '');
    			
    			fn_getProjectNameList();
    		});
    		
    		$("#id_s_quarter").on('change', function () { 
    			if( g_authority != 'D'){
    				var body = $("#id_classCostPerProjectTable > tbody");
        			body.empty();
        			body = $("#id_outsourcingCostPerProjectTable > tbody");
        			body.empty();
        			body = $("#id_progressCostPerProjectTable > tbody");
        			body.empty();
        			body = $("#id_internalCostPerProjectTable > tbody");
        			body.empty();
        			body = $("#id_costPerProjectTable > tbody");
        			body.empty();
        			$("#id_budget_title").text("기준년:      기준반기:    프로젝트 진행 상태:");
    			}
    			
    			var selectText;
				selectText = $("#id_s_team_name option:selected").val();
				g_current_product_team = selectText.replace(/\s+/g, '');
    			
    			fn_getProjectNameList();
    		});
    		
    		$("#id_s_team_name").on('change', function () { 
    			if( g_authority != 'D'){
    				var body = $("#id_classCostPerProjectTable > tbody");
        			body.empty();
        			body = $("#id_outsourcingCostPerProjectTable > tbody");
        			body.empty();
        			body = $("#id_progressCostPerProjectTable > tbody");
        			body.empty();
        			body = $("#id_internalCostPerProjectTable > tbody");
        			body.empty();
        			body = $("#id_costPerProjectTable > tbody");
        			body.empty();
        			$("#id_budget_title").text("기준년:      기준반기:    프로젝트 진행 상태:");
    			}
    			
    			var selectText;
				selectText = $("#id_s_team_name option:selected").val();
				g_current_product_team = selectText.replace(/\s+/g, '');
    			
    			fn_getProjectNameList();
    		});
    		
    		$("#id_budget_status_search").bind('click', function () { 
    			var body = $("#id_costPerProjectTable > tbody");
    			body.empty();
    			
    			g_current_cost_number = -1;
    			
    			if( g_authority == 'C' ){
    				if(g_team_db_name != g_current_product_team){
    					alert("엑세스 권한이 없습니다!");
    				    return;
    				}
    			}
    			fn_selectBudgetStatus();
    			fn_selectCostPerProject();
    			
    		});
    		
    		$("#id_search_costList").bind('click', function () { 
    			g_current_cost_number = -1;
    			fn_selectCostPerProject();
    		});
    		
    		$("#id_show_costDetail").bind('click', function () { 
    			$('#modal_update_cost').modal('show');
    			
    			$('#id_cc_title').text("지출내역 조회 및 업데이트");
				$('#id_ucSave').text("수정");
				
				$('#ucFormProductTeam').attr('disabled', true);
				$('#ucFormPrjName').attr('disabled', true);
				$('#ucFormFirstClass').attr('disabled', true);
				
				$('#ucFormUseDay').attr('disabled', true);
				$('#ucFormCardNumber').attr('disabled', true);
				$('#ucFormApprovalNumber').attr('disabled', true);
				$('#ucFormFranchisee').attr('disabled', true);
				$('#ucFormAmountUsed').attr('disabled', true);
				
				$('#ucFormFirstClass').val("진행비").prop("selected", true);
				
    			g_isCCUpdate = 1;
    			fn_selectCostDetailPerProject();
    			fn_selectCostFiles();
    			
    			fn_set_ucFormSecondClass();
    			fn_set_ucFormThirdClass();
    			
    		});
    		
    		$("#id_show_costInput").bind('click', function () { 
    			$('#modal_update_cost').modal('show');
    			
    			$('#id_cc_title').text("지출내역 입력");
				$('#id_ucSave').text("저장");
				
				$('#ucFormProductTeam').attr('disabled', true);
				$('#ucFormPrjName').attr('disabled', true);
				$('#ucFormFirstClass').attr('disabled', true);
				$('#ucFormDivision').attr('disabled', true);
				
				$('#ucFormUseDay').attr('disabled', false);
				$('#ucFormCardNumber').attr('disabled', true);
				$('#ucFormApprovalNumber').attr('disabled', true);
				$('#ucFormFranchisee').attr('disabled', true);
				$('#ucFormAmountUsed').attr('disabled', false);
				
				$('#ucFormProductTeam').val(g_current_product_team);
				$('#ucFormPrjName').val(g_current_project_number).prop("selected", true);
		        $('#ucFormFirstClass').val("내부비").prop("selected", true);
            	$('#ucFormSecondClass').val("").prop("selected", true);
                $('#ucFormSecondClassEtc').val("");
                $('#ucFormThirdClass').val("").prop("selected", true);
                $('#ucFormThirdClassEtc').val("");
                $('#ucFormContents').val("");
                $('#ucFormUseDay').val("");
                $('#ucFormDivision').val("내부비").prop("selected", true);;
                $('#ucFormCardNumber').val("");
                $('#ucFormApprovalNumber').val("");
                $('#ucFormFranchisee').val("");
                $('#ucFormAmountUsed').val("");
                
                $('#selectFileDiv').empty();
    			$('#fileDiv').empty();
    			
    			fn_set_ucFormSecondClass();
    			fn_set_ucFormThirdClass();
				
    			g_isCCUpdate = 0;
    			
    		});
    		
    		$("#id_search_costItemPerNumber").bind('click', function () { 
    			g_current_cost_number = -1;
    			$('#modal_search_cost').modal('show');
    			
    		});
    		
    		$("#id_btn_search_cost").bind('click', function () {
    			
    			g_current_cost_number = -1;
    			fn_searchCostByApproval();
    			$('#modal_search_cost').modal('hide');
    			
    		});
    		
			$("#id_search_noInputData").bind('click', function () {
				g_current_cost_number = -1;
    			fn_searchNoInputData();
    			
    		});
    		
    		$("#id_ucSave").bind('click', function () { 
    			
    			if(g_isCCUpdate){
    			
    				if(g_current_cost_number == -1){
        				alert("비용을 선택해 주세요!");
    				    return;
        			}
    				
    				fn_updateCostDetailPerProject();
    				g_isCCUpdate = 0;
    				
    			}else{
    				
    				fn_insertCostDetailPerProject();	
    			}
    			
    		});
    		
    		$("#ucFormFirstClass").on('change', function () { 
    			
    			fn_set_ucFormSecondClass();
    			fn_set_ucFormThirdClass();
    		});
    		
			$("#ucFormSecondClass").on('change', function () { 
    			
				fn_set_ucFormThirdClass();
    		});
			
			$("#addFile").on("click", function(e){ //파일 추가 버튼
				e.preventDefault();
				fn_addFile();
			});
			
			$("a[name='delete']").on("click", function(e){ //삭제 버튼
				e.preventDefault();
				fn_deleteFile($(this));
			});
			
			$(document).ajaxStart(function () {
				$("#id_contact").fadeOut();
				$("#id_before_contact").fadeOut();
				$("#id_section_2").fadeOut();
				$("#id_before_section_2").fadeOut();
				$("#id_session").fadeOut();
				$("#id_header").fadeOut();
			    $("#id_loading").fadeIn();
		    });

	        $(document).ajaxStop(function () {
	        	$("#id_loading").fadeOut();
			    $("#id_contact").fadeIn();
			    $("#id_before_contact").fadeIn();
			    $("#id_section_2").fadeIn();
			    $("#id_before_section_2").fadeIn();
			    $("#id_session").fadeIn();
			    $("#id_header").fadeIn();
			    
			    if( g_authority == 'D'){
			    	$('#id_budget_status_search').hide();
	        		$('#id_session').hide();
	        		$('#id_search_costList').hide();	
    			}
			    
	        });
    				
	        //ready end
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
	        	
				var str = "";
				$.each(data.map["list"], function(key, value){
					str += "<option>"+value.team_name+"</option>";
				});
				
				$('#id_s_team_name').append(str);
			}
        }
        
        function fn_set_ucFormSecondClass(){
        	
        	var selectText;
        	selectText = $("#ucFormFirstClass option:selected").val();
        	selectText = selectText.replace(/\s+/g, '');
            
        	var str = "";
          	
        	if(selectText == '외주비'){
        		str += "<option>카메라렌탈</option>";                                     
        		str += "<option>기자재비</option>";                                    
        		str += "<option>메이크업</option>";
        		str += "<option>출연료</option>";                                     
        		str += "<option>작가</option>";                                     
        		str += "<option>POSTPRODUCT</option>";
        		str += "<option>녹음료</option>";                                     
        		str += "<option>성우료</option>";                                     
        		str += "<option>번역료</option>";
        		str += "<option>자료구매</option>";                                     
        		str += "<option>장소대여</option>";                                     
        		str += "<option>미술및소품구매</option>";
        		str += "<option>미술</option>";                                    
        		str += "<option>해외촬영</option>";                                     
        		str += "<option>번역검수</option>";
        		str += "<option>번역</option>";                                     
        		str += "<option>납품료</option>";   
        		str += "<option>기타</option>";
        		
        		$("#ucFormSecondClass").find("option").remove();
            	$('#ucFormSecondClass').append(str);
        	}
            
			if(selectText == '진행비'){
				str += "<option>식비</option>";
				str += "<option>주유비</option>";
				str += "<option>교통비</option>";                                     
				str += "<option>숙박비</option>";
				str += "<option>부식비</option>";                                     
				str += "<option>주차비</option>";                                     
				str += "<option>비품구매</option>";
				str += "<option>장비렌탈</option>";                                     
				str += "<option>현금사용</option>";
				str += "<option>기타</option>";
				
				$("#ucFormSecondClass").find("option").remove();
	        	$('#ucFormSecondClass').append(str);
        	}
			
			if(selectText == '내부비'){
				fn_selectInternalClassification();
        	}
        	
        }
        
 		function fn_set_ucFormThirdClass(){
        	
 			var selectText;
        	selectText = $("#ucFormSecondClass option:selected").val();
        	selectText = selectText.replace(/\s+/g, '');
            
        	var str = "";
          	
        	if(selectText == '카메라렌탈'){
        		str += "<option>촬영</option>";                                     
        		str += "<option>항공촬영</option>";                                    
        		str += "<option>조명렌탈</option>";
        		str += "<option>기타</option>";                                     
        	}
        	else if(selectText == '기자재비'){
				str += "<option>카메라렌탈</option>";
				str += "<option>조명렌탈</option>";
				str += "<option>기타</option>";                                     
			}
        	else if(selectText == '메이크업'){
				str += "<option>메이크업</option>";
				str += "<option>기타</option>";
			}
        	else if(selectText == '출연료'){
				str += "<option>아기</option>";
				str += "<option>기타</option>";
        	}
        	else if(selectText == '성우료'){
				str += "<option>국문</option>";
				str += "<option>영문</option>";
				str += "<option>불문</option>";
				str += "<option>기타</option>";
        	}
        	else if(selectText == '장소대여'){
				str += "<option>대관</option>";
				str += "<option>기타</option>";
        	}
        	else if(selectText == '미술및소품구매'){
				str += "<option>소품</option>";
				str += "<option>기타</option>";
        	}
        	else if(selectText == '미술'){
				str += "<option>미술감독</option>";
				str += "<option>기타</option>";
        	}
        	else if(selectText == '번역검수'){
				str += "<option>번역</option>";
				str += "<option>기타</option>";
        	}
        	else if(selectText == '차량비'){
				str += "<option>카니발1</option>";
				str += "<option>카니발2</option>";
				str += "<option>소나타</option>";
				str += "<option>레이</option>";
				str += "<option>기타</option>";
        	}
        	else{
        		str += "<option>기타</option>";
        	}
			
        	$("#ucFormThirdClass").find("option").remove();
        	$('#ucFormThirdClass').append(str);
        }
        
 		function fn_insertCostDetailPerProject(){
			
 			//////fn_showProgress(1);
 			$('#id_ucSave').attr('disabled', true); 
 			
			g_member_name = g_member_name.replace(/\s+/g, '');
         	
        	var comAjax = new ComAjax();
        	comAjax.setUrl("<c:url value='/insertCostDetailPerProject.do' />");
        	
        	comAjax.addParam("g_current_cost_number",g_current_cost_number);
        	comAjax.addParam("g_update_project_number",g_current_project_number);
        	comAjax.addParam("g_update_project_name",g_current_project_name);	
        	comAjax.addParam("g_current_product_team",g_current_product_team);
        	comAjax.addParam("g_member_name",g_member_name);
        	comAjax.addParam("g_team_db_name",g_team_db_name);
        	
        	comAjax.addParam("ucFormFirstClass",$('#ucFormFirstClass').val());
        	comAjax.addParam("ucFormSecondClass",$('#ucFormSecondClass').val());
        	comAjax.addParam("ucFormSecondClassEtc",$('#ucFormSecondClassEtc').val());
        	comAjax.addParam("ucFormThirdClass",$('#ucFormThirdClass').val());
        	comAjax.addParam("ucFormThirdClassEtc",$('#ucFormThirdClassEtc').val());
        	comAjax.addParam("ucFormContents",$('#ucFormContents').val());
        	comAjax.addParam("ucFormUseDay",$('#ucFormUseDay').val());
        	comAjax.addParam("ucFormDivision",$('#ucFormDivision').val());
        	comAjax.addParam("ucFormCardNumber",$('#ucFormCardNumber').val());
        	comAjax.addParam("ucFormApprovalNumber",$('#ucFormApprovalNumber').val());
        	comAjax.addParam("ucFormFranchisee",$('#ucFormFranchisee').val());
        	comAjax.addParam("ucFormAmountUsed",$('#ucFormAmountUsed').val());
        	
        	comAjax.addParam("WRITER",g_member_name);
        	
        	comAjax.setCallback("fn_insertCostDetailPerProject_Callback");
        	comAjax.ajax();
        }
	 
	 	function fn_insertCostDetailPerProject_Callback(data){
        	
	 		//////fn_showProgress(0);
	 		
        	var success = data.map["success"];
        	
        	if(!success){
        		var errorString = data.map["fail_desc"];
        		alert('error: ' + errorString); 
        	}else{
        		alert('cost insert success');
        		
        		//////fn_showProgress(1);
        		var comSubmit = new ComSubmit("frmUpdateCost", "fileDiv");
				comSubmit.setUrl("<c:url value='/insertCostFile.do' />");
				comSubmit.addParam("COST_NUM", g_current_cost_number);
				comSubmit.addParam("WRITER", g_member_name);
				comSubmit.setCallback("fn_insertCostFile_Callback");
				comSubmit.submit();
				
        	}
        	
        }
    
		function fn_insertCostFile_Callback(data){
	    	
			//////fn_showProgress(0);
			
	    	var success = data.map["success"];
	    	
	    	if(!success){
	    		var errorString = data.map["fail_desc"];
	    		alert('error: ' + errorString); 
	    	}else{
	    		alert('project insertCostFile success');
				
	    	}
	    	
	    	$('#modal_update_cost').modal('hide');
	    	
	    	$('#id_ucSave').attr('disabled', false); 
	    }
 		
 	    function fn_updateCostDetailPerProject(){
			
 	    	//////fn_showProgress(1);
 	    	
 	    	$('#id_ucSave').attr('disabled', true); 
 	    	
			g_member_name = g_member_name.replace(/\s+/g, '');
         	
        	var comAjax = new ComAjax();
        	comAjax.setUrl("<c:url value='/updateCostDetailPerProject.do' />");
        	
        	comAjax.addParam("g_current_cost_number",g_current_cost_number);
        	comAjax.addParam("g_update_project_number",g_current_project_number);
        	comAjax.addParam("g_update_project_name",g_current_project_name);	
        	comAjax.addParam("g_current_product_team",g_current_product_team);
        	comAjax.addParam("g_member_name",g_member_name);
        	comAjax.addParam("g_team_db_name",g_team_db_name);
        	
        	comAjax.addParam("ucFormFirstClass",$('#ucFormFirstClass').val());
        	comAjax.addParam("ucFormSecondClass",$('#ucFormSecondClass').val());
        	comAjax.addParam("ucFormSecondClassEtc",$('#ucFormSecondClassEtc').val());
        	comAjax.addParam("ucFormThirdClass",$('#ucFormThirdClass').val());
        	comAjax.addParam("ucFormThirdClassEtc",$('#ucFormThirdClassEtc').val());
        	comAjax.addParam("ucFormContents",$('#ucFormContents').val());
        	comAjax.addParam("ucFormUseDay",$('#ucFormUseDay').val());
        	//comAjax.addParam("ucFormDivision",$('#ucFormDivision').val());
        	//comAjax.addParam("ucFormCardNumber",$('#ucFormCardNumber').val());
        	//comAjax.addParam("ucFormApprovalNumber",$('#ucFormApprovalNumber').val());
        	//comAjax.addParam("ucFormFranchisee",$('#ucFormFranchisee').val());
        	//comAjax.addParam("ucFormAmountUsed",$('#ucFormAmountUsed').val());
        	
        	comAjax.addParam("WRITER",g_member_name);
        	
        	comAjax.setCallback("fn_updateCostDetailPerProject_Callback");
        	comAjax.ajax();
        }
	 
	 	function fn_updateCostDetailPerProject_Callback(data){
        	
	 		//////fn_showProgress(0);
	 		
        	var success = data.map["success"];
        	
        	if(!success){
        		var errorString = data.map["fail_desc"];
        		alert('error: ' + errorString); 
        	}else{
        		alert('cost update success');
        		
        		//////fn_showProgress(1);
        		var comSubmit = new ComSubmit("frmUpdateCost", "fileDiv");
				comSubmit.setUrl("<c:url value='/updateCostFile.do' />");
				comSubmit.addParam("COST_NUM", g_current_cost_number);
				comSubmit.addParam("WRITER", g_member_name);
				comSubmit.setCallback("fn_updateCostFile_Callback");
				comSubmit.submit();
				
        	}
        	 
        }
    
		function fn_updateCostFile_Callback(data){
	    	
			//////fn_showProgress(0);
			
	    	var success = data.map["success"];
	    	
	    	if(!success){
	    		var errorString = data.map["fail_desc"];
	    		alert('error: ' + errorString); 
	    	}else{
	    		alert('project updateCostFile success');
				
	    	}
	    	
	    	$('#modal_update_cost').modal('hide');
	    	
	    	$('#id_ucSave').attr('disabled', false);
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
		
		function fn_deleteFileDB(obj){
			obj.parent().remove();
		}
		
        function fn_getSession(){
        	var comAjax = new ComAjax();
        	comAjax.setUrl("<c:url value='/getSession.do' />");
        	comAjax.setCallback("fn_getSessionCallback");
        	comAjax.ajax();
        }
        
		function fn_getSessionCallback(data){
			        	
        	var session_data = data.map["session_data"]; //is session so 1, 0
        	//var sessionMap= data.map["sessionMap"];
        	g_member_name = data.map["sessionMap"]["MEMBER_NAME"];
        	var team_name = '관리팀';
        	var team_db_name = data.map["sessionMap"]["TEAM_NAME"];
        	g_authority = data.map["sessionMap"]["AUTHORITY"];
        	
        	g_member_name = g_member_name.replace(/\s+/g, '');
        	team_db_name = team_db_name.replace(/\s+/g, '');
        	g_team_db_name = team_db_name;
        	
        	//Map<String,Object> map = data.map["sessionMap"];
        	
        	if(session_data){
        		
        		pageChange(g_authority);
        		
//         		 if( g_authority == 'C' ){
//             			$("#id_s_team_name").find("option").remove();
//             			var optionTemp =  "<option>" + team_db_name + "</option>";
//             			$("#id_s_team_name").append(optionTemp);
//             	}	

				if( g_authority == 'D'){
					$('#id_budget_status_search').hide();
	        		$('#id_session').hide();
	        		$('#id_search_costList').hide();	
				}
				
				id_show_costInput
				$('#id_show_costInput').show();
				if(g_team_db_name != "PM팀"){
					$('#id_show_costInput').hide();
				}
           }
        	
        	// set select option
        	var varIsSession = data.map["sessionMap"]["S_isSession"];
        	
        	if(varIsSession == 'Y'){
        		$('#id_s_year').val(data.map["sessionMap"]["S_STANDARD_YEAR"]).prop("selected", true);
            	$('#id_s_quarter').val(data.map["sessionMap"]["S_STANDARD_QUARTER"]).prop("selected", true);
            	$('#id_s_team_name').val(data.map["sessionMap"]["S_PRODUCT_TEAM"]).prop("selected", true);
            	g_current_project_name = data.map["sessionMap"]["S_PRJ_NAME"];
            	g_current_project_number = data.map["sessionMap"]["S_PRJ_NUMBER"];
            	g_current_product_team = data.map["sessionMap"]["S_PRODUCT_TEAM"];
            	fn_getProjectNameList();
            	fn_selectBudgetStatus();
            	fn_selectCostPerProject();
        	}
        	
        	fn_setSessionN();
		}
		
		function fn_getProjectNameList(){
        	var comAjax = new ComAjax();
        	comAjax.setUrl("<c:url value='/getProjectNameList.do' />");
        	
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
        	
        	comAjax.setCallback("fn_getProjectNameListCallback");
        	comAjax.ajax();
        }
		
		function fn_getProjectNameListCallback(data){
			
			$("#id_s_project_name").find("option").remove();
			$("#ucFormPrjName").find("option").remove();
			
			var success = data.map["success"];
        	
        	if(!success){
        		var errorString = data.map["fail_desc"];
        		alert('error: ' + errorString); 
        	}else{
        		
        		var str = "";
        		var selectText;
        		$.each(data.map["firstList"], function(key, value){
					str += "<option value='"+value.prj_num+"'>"+value.prj_name+"</option>";
// 					g_current_project_name = value.prj_name;
// 					g_current_project_number = value.prj_num;
// 					g_update_project_name = value.prj_name;
// 					g_update_project_number = value.prj_num;
				});
        		
				$('#id_s_project_name').append(str);
				
				$("#id_s_project_name").on('change', function () { 
					
					g_current_project_number = $("#id_s_project_name option:selected").val();
					
					selectText = $("#id_s_project_name option:selected").text();
					g_current_project_name = selectText.replace(/\s+/g, '');
		        	
		      	});
				
				if(g_current_project_name == ''){
					$("#id_s_project_name option:eq(0)").attr("selected", true);
				}else{
					$('#id_s_project_name').val(g_current_project_number).prop("selected", true);
				}
				
				////////
				$('#ucFormPrjName').append(str);
				
				$("#ucFormPrjName").on('change', function () { 
					g_update_project_number = $("#ucFormPrjName option:selected").val();
					
					selectText = $("#ucFormPrjName option:selected").text();
					g_update_project_name = selectText.replace(/\s+/g, '');
		        	
		      	});
				
// 				if(g_current_project_name == ''){
// 					$("#ucFormPrjName option:eq(0)").attr("selected", "selected");
// 				}else{
// 					$('#ucFormPrjName').text(g_current_project_name).prop("selected", true);
// 				}
				
        	}
		}
		
		function fn_selectInternalClassification(){
        	var comAjax = new ComAjax();
        	comAjax.setUrl("<c:url value='/selectInternalClassification.do' />");
        	
        	comAjax.addParam("g_current_project_number", g_current_project_number);
        	
        	comAjax.setCallback("fn_selectInternalClassification_Callback");
        	comAjax.ajax();
        }
		
		function fn_selectInternalClassification_Callback(data){
					
			var success = data.map["success"];
        	
        	if(!success){
        		var errorString = data.map["fail_desc"];
        		alert('error: ' + errorString); 
        	}else{
        		
        		var list_count = data.map["firstListCount"];
            	
    			if(list_count != 0){
    				
    				var str = "";
    				$.each(data.map["firstList"], function(key, value){
    					str += "<option>"+value.internal_team_name+"</option>";
    				});
    				
    				$("#ucFormSecondClass").find("option").remove();
    	        	$('#ucFormSecondClass').append(str);
    				
            	}
        	}
		}
		
		function fn_selectBudgetStatus(){
        	var comAjax = new ComAjax();
        	comAjax.setUrl("<c:url value='/selectBudgetStatus.do' />");
        	
        	comAjax.addParam("g_current_project_number", g_current_project_number);
        	
        	comAjax.setCallback("fn_selectBudgetStatus_Callback");
        	comAjax.ajax();
        }
		
		function fn_selectBudgetStatus_Callback(data){
			
			var success = data.map["success"];
        	
        	if(!success){
        		var errorString = data.map["fail_desc"];
        		alert('error: ' + errorString); 
        	}else{
        		
        		// first //////////////////////////////////////////////////////////////////////
        		var list_count = data.map["firstListCount"];
	        	
	        	var body = $("#id_classCostPerProjectTable > tbody");
				body.empty();
				if(list_count == 0){
					var str = "<tr>" + 
									"<td colspan='10'>조회된 결과가 없습니다.</td>" + 
								"</tr>";
					body.append(str);
				}
				else{
					
					var str = "";
					$.each(data.map["firstList"], function(key, value){
						str += "<tr>" + 
						"<td>" + value.title + "</td>" +
						"<td>" + value.contract_amount + "</td>" +
						"<td>" + value.product_amount + "</td>" + 
						"<td>" + value.outsourcing_cost + "</td>" + 
						"<td>" + value.progress_cost + "</td>" + 
						"<td>" + value.internal_cost + "</td>" +
						"<td>" + value.making_cost + "</td>" +
						"<td>" + value.total_cost + "</td>" +
						"<td>" + value.performance + "</td>" +
						"<td>" + value.lastRatio + "</td>" +
						"</tr>";
						g_prj_status = value.prj_status;
					});
					body.append(str);
				}
				
				// second //////////////////////////////////////////////////////////////////////
        		list_count = data.map["secondListCount"];
	        	
	        	body = $("#id_outsourcingCostPerProjectTable > tbody");
				body.empty();
				if(list_count == 0){
					var str = "<tr>" + 
									"<td colspan='3'>조회된 결과가 없습니다.</td>" + 
								"</tr>";
					body.append(str);
				}
				else{
					
					var str = "";
					$.each(data.map["secondList"], function(key, value){
						str += "<tr>" + 
						"<td>" + value.second_classification + "</td>" +
						"<td>" + value.predict_cost + "</td>" +
						"<td>" + value.real_cost + "</td>" +
						"</tr>";
					});
					body.append(str);
				}
				
				// third //////////////////////////////////////////////////////////////////////
        		list_count = data.map["thirdListCount"];
	        	
	        	body = $("#id_progressCostPerProjectTable > tbody");
				body.empty();
				if(list_count == 0){
					var str = "<tr>" + 
									"<td colspan='3'>조회된 결과가 없습니다.</td>" + 
								"</tr>";
					body.append(str);
				}
				else{
					
					var str = "";
					$.each(data.map["thirdList"], function(key, value){
						str += "<tr>" + 
						"<td>" + value.second_classification + "</td>" +
						"<td>" + value.predict_cost + "</td>" +
						"<td>" + value.real_cost + "</td>" +
						"</tr>";
					});
					body.append(str);
				}
				
				//fourth  //////////////////////////////////////////////////////////////////////
        		list_count = data.map["fourthListCount"];
	        	
	        	body = $("#id_internalCostPerProjectTable > tbody");
				body.empty();
				if(list_count == 0){
					var str = "<tr>" + 
									"<td colspan='3'>조회된 결과가 없습니다.</td>" + 
								"</tr>";
					body.append(str);
				}
				else{
					
					var str = "";
					$.each(data.map["fourthList"], function(key, value){
						str += "<tr>" + 
						"<td>" + value.second_classification + "</td>" +
						"<td>" + value.predict_cost + "</td>" +
						"<td>" + value.real_cost + "</td>" + 
						"</tr>";
					});
					body.append(str);
				}
				
				//set title
				var selectText = $("#id_s_year option:selected").val();
				$("#id_budget_title").text("프로젝트명: "+ g_current_project_name + "   기준년: "+ $("#id_s_year option:selected").val() + "  기준반기: " + 
						$("#id_s_quarter option:selected").val() + "  프로젝트 진행상태: " + g_prj_status);
				
				
        	}
		}
			 
		function fn_searchNoInputData(){
        	var comAjax = new ComAjax();
        	comAjax.setUrl("<c:url value='/searchNoInputData.do' />");
        	
        	comAjax.addParam("g_current_product_team", g_current_product_team);
        	
        	comAjax.setCallback("fn_searchNoInputData_Callback");
        	comAjax.ajax();
        }
		
		function fn_searchNoInputData_Callback(data){
			
			var success = data.map["success"];
        	
        	if(!success){
        		var errorString = data.map["fail_desc"];
        		alert('error: ' + errorString); 
        	}else{
        		
        		// first //////////////////////////////////////////////////////////////////////
        		var list_count = data.map["firstListCount"];
	        	
	        	var body = $("#id_costPerProjectTable > tbody");
				body.empty();
				if(list_count == 0){
					var str = "<tr>" + 
									"<td colspan='13'>조회된 결과가 없습니다.</td>" + 
								"</tr>";
					body.append(str);
				}
				else{
					
					var str = "";
					$.each(data.map["firstList"], function(key, value){
						str += "<tr>" + 
						"<td>" + value.cost_num + "</td>" +
						"<td>" + value.division + "</td>" +
						"<td>" + value.prj_name + "</td>" + 
						"<td>" + value.product_team + "</td>" + 
						"<td>" + value.user + "</td>" + 
						"<td>" + value.team_name + "</td>" +
						"<td>" + value.first_classification + "</td>" +
						"<td>" + value.second_classification + "</td>" +
						"<td>" + value.third_classification + "</td>" +
						"<td>" + value.card_number + "</td>" +
						"<td>" + value.approval_number + "</td>" +
						"<td>" + value.use_day + "</td>" +
						"<td>" + value.amount_used + "</td>" +
						"</tr>";
					});
					body.append(str);
					
					$('#id_costPerProjectTable tbody tr').bind('click', function(e) {
		    			$(e.currentTarget).siblings().children('td, th').css('background-color','#ffffff');
		    			$(e.currentTarget).children('td, th').css('background-color','#fcf8e3');
		    			
		    			$(this).find("td").each(function(i, item){ 
// 			    				console.log("i:"+i+"item:"+ $.trim($(item).html())); 
		    				if(i==0){ 
		    					g_current_cost_number = $.trim($(item).html());
		    				}
		    				if(i==3){ 
		    					g_current_product_team = $.trim($(item).html());
		    				}
		    			});
	    			
	    			}); 
				}
				
        	}
		}
		
		function fn_searchCostByApproval(){
        	var comAjax = new ComAjax();
        	comAjax.setUrl("<c:url value='/searchCostByApproval.do' />");
        	
        	var varText = $('#msFormApprovalNumber').val();
        	varText = varText.replace(/\s+/g, '');
        	comAjax.addParam("msFormApprovalNumber", varText);
        	comAjax.addParam("g_current_product_team", g_current_product_team);
        	
        	comAjax.setCallback("fn_searchCostByApproval_Callback");
        	comAjax.ajax();
        }
		
		function fn_searchCostByApproval_Callback(data){
			
			var success = data.map["success"];
        	
        	if(!success){
        		var errorString = data.map["fail_desc"];
        		alert('error: ' + errorString); 
        	}else{
        		
        		// first //////////////////////////////////////////////////////////////////////
        		var list_count = data.map["firstListCount"];
	        	
	        	var body = $("#id_costPerProjectTable > tbody");
				body.empty();
				if(list_count == 0){
					var str = "<tr>" + 
									"<td colspan='13'>조회된 결과가 없습니다.</td>" + 
								"</tr>";
					body.append(str);
				}
				else{
					
					var str = "";
					$.each(data.map["firstList"], function(key, value){
						str += "<tr>" + 
						"<td>" + value.cost_num + "</td>" +
						"<td>" + value.division + "</td>" +
						"<td>" + value.prj_name + "</td>" + 
						"<td>" + value.product_team + "</td>" + 
						"<td>" + value.user + "</td>" + 
						"<td>" + value.team_name + "</td>" +
						"<td>" + value.first_classification + "</td>" +
						"<td>" + value.second_classification + "</td>" +
						"<td>" + value.third_classification + "</td>" +
						"<td>" + value.card_number + "</td>" +
						"<td>" + value.approval_number + "</td>" +
						"<td>" + value.use_day + "</td>" +
						"<td>" + value.amount_used + "</td>" +
						"</tr>";
					});
					body.append(str);
					
					$('#id_costPerProjectTable tbody tr').bind('click', function(e) {
		    			$(e.currentTarget).siblings().children('td, th').css('background-color','#ffffff');
		    			$(e.currentTarget).children('td, th').css('background-color','#fcf8e3');
		    			
		    			$(this).find("td").each(function(i, item){ 
// 			    				console.log("i:"+i+"item:"+ $.trim($(item).html())); 
		    				if(i==0){ 
		    					g_current_cost_number = $.trim($(item).html());
		    				}
		    				if(i==3){ 
		    					g_current_product_team = $.trim($(item).html());
		    				}
		    			});
	    			
	    			}); 
				}
				
        	}
		}
		
		function fn_selectCostPerProject(){
        	var comAjax = new ComAjax();
        	comAjax.setUrl("<c:url value='/selectCostPerProject.do' />");
        	
        	g_current_project_number = $("#id_s_project_name option:selected").val();
			
        	//g_current_project_number = g_current_project_number.replace(/\s+/g, '');
        	comAjax.addParam("g_current_project_number", g_current_project_number);
        	
        	comAjax.setCallback("fn_selectCostPerProject_Callback");
        	comAjax.ajax();
        }
		
		function fn_selectCostPerProject_Callback(data){
			
			var success = data.map["success"];
        	
        	if(!success){
        		var errorString = data.map["fail_desc"];
        		alert('error: ' + errorString); 
        	}else{
        		
        		// first //////////////////////////////////////////////////////////////////////
        		var list_count = data.map["firstListCount"];
	        	
	        	var body = $("#id_costPerProjectTable > tbody");
				body.empty();
				if(list_count == 0){
					var str = "<tr>" + 
									"<td colspan='13'>조회된 결과가 없습니다.</td>" + 
								"</tr>";
					body.append(str);
				}
				else{
					
					var str = "";
					$.each(data.map["firstList"], function(key, value){
						str += "<tr>" + 
						"<td>" + value.cost_num + "</td>" +
						"<td>" + value.division + "</td>" +
						"<td>" + value.prj_name + "</td>" + 
						"<td>" + value.product_team + "</td>" + 
						"<td>" + value.user + "</td>" + 
						"<td>" + value.team_name + "</td>" +
						"<td>" + value.first_classification + "</td>" +
						"<td>" + value.second_classification + "</td>" +
						"<td>" + value.third_classification + "</td>" +
						"<td>" + value.card_number + "</td>" +
						"<td>" + value.approval_number + "</td>" +
						"<td>" + value.use_day + "</td>" +
						"<td>" + value.amount_used + "</td>" +
						"</tr>";
					});
					body.append(str);
					
					$('#id_costPerProjectTable tbody tr').bind('click', function(e) {
		    			$(e.currentTarget).siblings().children('td, th').css('background-color','#ffffff');
		    			$(e.currentTarget).children('td, th').css('background-color','#fcf8e3');
		    			
		    			$(this).find("td").each(function(i, item){ 
// 			    				console.log("i:"+i+"item:"+ $.trim($(item).html())); 
		    				if(i==0){ 
		    					g_current_cost_number = $.trim($(item).html());
		    				}
// 		    				if(i==2){ 
//		    					g_current_project_name = $.trim($(item).html());
//		    				}
		    				if(i==3){ 
		    					g_current_product_team = $.trim($(item).html());
		    				}
		    			});
	    			
	    			}); 
				}
				
        	}
		}
		
		function fn_selectCostDetailPerProject(){
	 		
			var comAjax = new ComAjax();
        	comAjax.setUrl("<c:url value='/selectCostDetailPerProject.do' />");
        	comAjax.addParam("g_current_cost_number", g_current_cost_number);
        	comAjax.setCallback("fn_selectCostDetailPerProject_CallBack");
        	comAjax.ajax();
        	
	 	}
		
	 	function fn_selectCostDetailPerProject_CallBack(data){
			var success = data.map["success"];
			var isData = data.map["isData"];
        	
        	if(!success){
        		var errorString = data.map["fail_desc"];
        		alert('error: ' + errorString); 
        	}else{
        		
        		if(isData){
        			
        			$('#ucFormProductTeam').val(g_current_product_team);
        			
        			
        			$('#ucFormPrjName').val(g_current_project_number).prop("selected", true);
//     		        $('#ucFormFirstClass').val(data.map["map"]["first_classification"]).prop("selected", true);
    		        $('#ucFormFirstClass').val("진행비").prop("selected", true);
	            	$('#ucFormSecondClass').val(data.map["map"]["second_classification"]).prop("selected", true);
	                $('#ucFormSecondClassEtc').val(data.map["map"]["second_classification_etc"]);
	                $('#ucFormThirdClass').val(data.map["map"]["third_classification"]).prop("selected", true);
	                $('#ucFormThirdClassEtc').val(data.map["map"]["third_classification_etc"]);
	                $('#ucFormContents').val(data.map["map"]["contents"]);
	                
	                $('#ucFormUseDay').val(data.map["map"]["use_day"]);
	                $('#ucFormDivision').val(data.map["map"]["division"]).prop("selected", true);;
	                $('#ucFormCardNumber').val(data.map["map"]["card_number"]);
	                $('#ucFormApprovalNumber').val(data.map["map"]["approval_number"]);
	                $('#ucFormFranchisee').val(data.map["map"]["franchisee"]);
	                $('#ucFormAmountUsed').val(data.map["map"]["amount_used"]);
	                
	                $("input[name=ucFormProductTeam]").attr("readonly",true);
	                $("#ucFormUseDay").attr("readonly",true);
	                $("#ucFormDivision").attr("readonly",true);
	                $("#ucFormCardNumber").attr("readonly",true);
	                $("#ucFormApprovalNumber").attr("readonly",true);
	                $("#ucFormFranchisee").attr("readonly",true);
	                $("#ucFormAmountUsed").attr("readonly",true);
	                
	                //fn_set_ucFormSecondClass();
	                //fn_set_ucFormThirdClass();
	                	
        		}
        	}
	 	}
	 	
	 	function fn_selectCostFiles(){
	 		
			var comAjax = new ComAjax();
        	comAjax.setUrl("<c:url value='/selectCostFiles.do' />");
        	comAjax.addParam("g_current_cost_number",g_current_cost_number);
        	comAjax.setCallback("fn_selectCostFiles_CallBack");
        	comAjax.ajax();
	 	}
	 	
	 	function fn_selectCostFiles_CallBack(data){
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
					fn_deleteCostFileUpdate($dataFileNum);
				});
	    		
										
        	}
	 	}
	 	
	 	function fn_deleteCostFileUpdate($dataFileNum){
	 		
	 		var comAjax = new ComAjax();
        	comAjax.setUrl("<c:url value='/deleteCostFileUpdate.do' />");
        	
        	comAjax.addParam("dataFileNum", $dataFileNum);
			comAjax.setCallback("fn_deleteCostFileUpdate_Callback");
        	comAjax.ajax();
        	
	 	}
	 	
		function fn_deleteCostFileUpdate_Callback(data){
        	
        	var success = data.map["success"];
        	
        	if(!success){
        		var errorString = data.map["fail_desc"];
        		alert('error: ' + errorString); 
        	}else{
        		alert('Cost file delete success');
        	}
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
	        		$('#modal1').modal('hide');
	        	}
	        }
	        
	        function fn_downloadFile(obj){
				var storage_file_name = obj.parent().find("#storage_file_name").val();
				var folder_name = obj.parent().find("#folder_name").val();
				var comDownloadSubmit = new ComDownloadSubmit();
				comDownloadSubmit.setUrl("<c:url value='/common/downloadCostFile.do' />");
				comDownloadSubmit.addParam("storage_file_name", storage_file_name);
				comDownloadSubmit.addParam("folder_name", folder_name);
				comDownloadSubmit.submit();
			}
	        
	        function fn_logout(){
	        	//////fn_showProgress(1);
	        	var comAjax = new ComAjax();
	        	comAjax.setUrl("<c:url value='/logout.do' />");
	        	/* comAjax.setUrl("http://192.168.0.168:8282/innerPrj/login.do"); */
	        	comAjax.setCallback("fn_logoutCallback");
	        	comAjax.ajax();
	        	//////fn_showProgress(0);
	        }
	        
	        function fn_logoutCallback(data){
	        	
	        	//////fn_showProgress(0);
	        	
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
	        
	        function fn_setSessionN(){
	        	var comAjax = new ComAjax();
	        	comAjax.setUrl("<c:url value='/setSession.do' />");
	        	
	        	comAjax.addParam("S_isSession", "N");
	        	
	        	comAjax.setCallback("fn_setSessionNCallback");
	        	comAjax.ajax();
	        }
			
			function fn_setSessionNCallback(data){
				
				var success = data.map["success"];
	        	
	        	if(!success){
	        		var errorString = data.map["fail_desc"];
	        		alert('error: ' + errorString); 
	        	}else{

	        	}
			}
	        
		</script>
    </body>
</html>