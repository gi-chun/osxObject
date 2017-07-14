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
                    <h1 id="homeHeading">업무요청 및 수신</h1>
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
                        <label class="control-label" for="id_s_month">기준월</label>                         
                        <select id="id_s_month" class="form-control"> 
                            <option>1</option>                             
                            <option>2</option>                             
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                            <option>6</option>
                            <option>7</option>
                            <option>8</option>
                            <option>9</option>
                            <option>10</option>
                            <option>11</option>
                            <option>12</option>                             
                        </select>
                    </div>
                    <div class="form-group"> 
                        <label class="control-label" for="id_s_team_name">소속팀</label>                         
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
                        <label class="control-label" for="id_s_member">팀원</label>                         
                        <select id="id_s_member" class="form-control"> 
<!--                             <option>한국전력기술</option>                              -->
<!--                             <option>한국전력기술</option>                              -->
<!--                             <option>한국전력기술</option>                              -->
                        </select>
                    </div>                     
                    <div class="form-group"> 
                        <label class="control-label" for="id_s_business_field">업무분야</label>                         
                        <select id="id_s_business_field" class="form-control"> 
                        	<option>재무</option>                             
                            <option>인사</option>                             
                            <option>계약</option>
                            <option>행정</option>                             
                            <option>품의</option>                             
                            <option>근태</option>
                            <option>업무용차량신청(사용전)</option>                             
                            <option>업무용차량신청(사용후)</option>                             
                            <option>지출예산/내역서(사용전)</option>
                            <option>지출예산/내역서(사용후)</option>   
                            <option>기타</option>
                            <option>전체</option>                          
                        </select>
                    </div>    
                                        
                </form>
                
                 <div>
                <a id="id_team_receive_search" class="btn btn-primary btn-xl page-scroll btn-other1">팀수신 조회</a>
                <a id="id_team_receive_approve_search" class="btn btn-primary btn-xl page-scroll btn-other1">팀수신승인 조회</a>
                <a id="id_team_receive_refuse_search" class="btn btn-primary btn-xl page-scroll btn-other1">팀수신반려 조회</a>
                <a id="id_receive_request_search" class="btn btn-primary btn-xl page-scroll">업무요청수신 조회</a>
                <a id="id_receive_request_approve_search" class="btn btn-primary btn-xl page-scroll">업무요청수신승인 조회</a>
                <a id="id_receive_request_refuse_search" class="btn btn-primary btn-xl page-scroll">업무요청수신반려 조회</a>
                <a id="id_request_search" class="btn btn-primary btn-xl page-scroll btn-other2">업무요청 조회</a>
                <a id="id_request_approve_search" class="btn btn-primary btn-xl page-scroll btn-other2">업무요청승인 조회</a>
                <a id="id_request_refuse_search" class="btn btn-primary btn-xl page-scroll btn-other2">업무요청반려 조회</a>
                 
                </div>
                
            </div>
        </header>
        <div id="id_session_total">
        <section class="no-padding" id="id_session">
            <div class="call-to-action">
                <h1 id="id_request_title">&nbsp;기준년: 2017 &nbsp; 기준월: 6월  &nbsp; 소속팀: 연출팀 &nbsp; 팀원: 이길동 <br></h1>
            </div>
            <div class="container-fluid">
                <div>
                    <table id="id_requestTable" class="table" data-pg-collapsed> 
                        <thead data-pg-collapsed>
                            <tr> 
                                <th>요청 넘버</th>
                                <th>요청자</th>
                                <th>요청팀</th>
                                <th>검토자</th>
                                <th>검토팀</th>
                                <th>상태</th>
                                <th>요청날짜</th> 
                                <th>검토날짜</th>
                                <th>업무분야_1</th> 
                                <th>업무분야_2</th>
                                <th>요청위치</th> 
                            </tr>                             
                        </thead>                         
                        <tbody> 
                            <tr> 
                                <td>1</td>
                                <td>이길동</td> 
                                <td>연출1팀</td> 
                                <td>홍길동</td>
                                <td>관리팀</td>
                                <td>요청</td>
                                <td>2017-06-29 14:12:12</td>
                                <td>2017-06-29 14:12:12</td>
                                <td>재무</td>
                                <td>개인현금정산</td>
                                <td></td> 
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
                    <a id="id_request_detail_search" class="btn btn-primary btn-xl page-scroll">요청내역 보기</a>
                    <a id="id_create_request" class="btn btn-primary btn-xl page-scroll">업무요청 생성</a>
                </div>
            </div>
        </aside>
       
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
        <div class="modal fade pg-show-modal" id="modal_selectCreateType" tabindex="-1" role="dialog" aria-hidden="true"> 
            <div class="modal-dialog"> 
                <div class="modal-content"> 
                    <div class="modal-header"> 
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>                         
                        <h4 class="modal-title">요청양식 선택</h4> 
                    </div>                     
                    <div class="modal-body"> 
                        <p>&nbsp;</p>
                        <form role="form"> 
                            <div class="form-group"> 
                                <label class="control-label" for="scFormType">요청양식 선태</label>                                 
                                <select id="scFormType" class="form-control"> 
                                    <option>재무업무요청(현금정산&결제요청-외주비)</option>                                     
                                    <option>업무용차량신청</option>                                     
                                    <option>일반업무요청</option>
                                </select>
                            </div>
                        </form>
                    </div>                     
                    <div class="modal-footer"> 
                        <button id="id_btn_close_type" type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>                         
                        <button id="id_btn_search_type" type="button" class="btn btn-primary">확인</button>                         
                    </div>                     
                </div>                 
            </div>             
        </div>
        <div class="modal fade pg-show-modal" id="modal_createRequest_cost" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog"> 
                <div class="modal-content"> 
                    <div class="modal-header"> 
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>                         
                        <h4 id="id_cr_title" class="modal-title">재무 업무요청</h4> 
                    </div> 
                    <div class="modal-body"> 
                    		<div class="form-group"> 
                                <h4  style="color:#ff0000" class="modal-title"><strong>제작팀 및 프로젝트명이 올바른지 확인하세요! 해당사항 없으면 없음선택</strong></h4>                                 
                            </div>
                        <p>&nbsp;</p>
                        <form role="form"> 
                        	<div class="form-group"> 
                                <label class="control-label" for="crFormBusiness1">업무분야 1</label>                                 
                                <select id="crFormBusiness1" class="form-control"> 
                                    <option>재무</option>                                     
                                </select>
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="crFormBusiness2">업무분야 2</label>                                 
                                <select id="crFormBusiness2" class="form-control"> 
                                    <option>개인현금정산</option>
                                    <option>결제요청(외주비)</option>
                                    <option>기타</option>                                      
                                </select>
                                <label class="control-label" for="crFormBusiness2Etc">업무분야 2 기타입력 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                                    <br>
                                </label>
                                <input type="text" class="form-control" id="crFormBusiness2Etc" placeholder="">
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="crFormRequestTeam">요청팀</label>                                 
                                <input type="text" class="form-control" id="crFormRequestTeam" placeholder="">
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="crFormRequester">요청자</label>                                 
                                <input type="text" class="form-control" id="crFormRequester" placeholder="">
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="crFormReceiveTeam">수신팀</label>                                 
                                <select id="crFormReceiveTeam" class="form-control"> 
                                    <option>관리본부</option>                                     
                                </select>
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="crFormRequestTime">요청날짜 (ex: 2017-05-22 14:22:31, yyyy-mm-dd hh:mm:ss 19자리 숫자)</label>                                 
                                <input type="text" class="form-control" id="crFormRequestTime" placeholder="yyyy-mm-dd hh:mm:ss"> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="crFormDeadLine">결제희망 기한일 (ex: 2017-05-22 14:22:31, yyyy-mm-dd hh:mm:ss 19자리 숫자입력)</label>                                 
                                <input type="text" class="form-control" id="crFormDeadLine" placeholder="yyyy-mm-dd hh:mm:ss"> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="crFormApprovalDate">결제날짜 (ex: 2017-05-22 14:22:31, yyyy-mm-dd hh:mm:ss 19자리 숫자)</label>                                 
                                <input type="text" class="form-control" id="crFormApprovalDate" placeholder="yyyy-mm-dd hh:mm:ss"> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="crFormRequestDetails">요청내용(최대 한글 200자)</label>
                                <textarea id="crFormRequestDetails" class="form-control" rows="3"></textarea>
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="crFormApproveDetails">후속내용(최대 한글 200자)</label>
                                <textarea id="crFormApproveDetails" class="form-control" rows="3"></textarea>
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="crFormNotAllowDetails">반려내용(최대 한글 200자)</label>
                                <textarea id="crFormNotAllowDetails" class="form-control" rows="3"></textarea>
                            </div>
                        	<div class="form-group"> 
                                <label class="control-label" for="crFormProductTeam">제작팀</label>                                 
                                <select id="crFormProductTeam" class="form-control"> 
                                    <option>없음</option>                                     
                                </select>
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="crFormPrjName">프로젝트 명</label>                                 
                                <select id="crFormPrjName" class="form-control"> 
                                    <option value='0'>없음</option>                                     
                                </select>
                            </div>
                            <div class="form-group" data-pg-collapsed> 
                                <label class="control-label" for="crFormFirstClass">비용 대분류</label>                                 
                                <select id="crFormFirstClass" class="form-control"> 
                                    <option>외주비</option>                                     
                                    <option>진행비</option>                                     
                                </select>
                            </div>
                            <div class="form-group" data-pg-collapsed> 
                                <label class="control-label" for="crFormSecondClass">비용 중분류</label>                                 
                                <select id="crFormSecondClass" class="form-control" data-pg-collapsed> 
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
                                <label class="control-label" for="crFormSecondClassEtc">비용 중분류 기타입력 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                                    <br>
                                </label>
                                <input type="text" class="form-control" id="crFormSecondClassEtc" placeholder="">
                            </div>
                            <div class="form-group" data-pg-collapsed> 
                                <label class="control-label" for="crFormThirdClass">비용 소분류</label>                                 
                                <select id="crFormThirdClass" class="form-control" data-pg-collapsed> 
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
                                <label class="control-label" for="crFormThirdClassEtc">비용 소분류 기타입력 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                                    <br>
                                </label>
                                <input type="text" class="form-control" id="crFormThirdClassEtc" placeholder="">
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="crFormContents">내용 ( 최대 한글 100자)</label>
                                <textarea  id="crFormContents" class="form-control" rows="3"></textarea>
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="crFormUseDay">사용일 (ex: 2017-05-22 14:22:31, yyyy-mm-dd hh:mm:ss 19자리 숫자입력)</label>                                 
                                <input type="text" class="form-control" id="crFormUseDay" placeholder="yyyy-mm-dd hh:mm:ss"> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="crFormDivision">구분</label>                                 
                                <select id="crFormDivision" class="form-control"> 
                                    <option>현금</option>
                                    <option>외주비</option>                                     
                                 </select>
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="crFormAmountUsed">이용금액&nbsp;</label>                                (단위 원 - won)

                                <input type="text" class="form-control" id="crFormAmountUsed" placeholder="">
                            </div>
                                                         
                        </form>
                        
                        <form id="frmCreateRequestCost"  role="form" enctype="multipart/form-data">   
	                        <div id="selectFileDivCost">
								
							</div>           
						     <div id="fileDivCost">
								<!-- <p>
									<input type="file" id="file" name="file_0">
									<a href="#this" class="btn" id="delete" name="delete">삭제</a>
								</p> -->
							</div> 
							<div id="addFileDivCost">
								<br/><br/>
								<a href="#this" class="btn" id="addFileCost">파일 추가</a>  
							</div>
							   
						</form>
						
                    </div>                     
                    <div class="modal-footer"> 
                        <button id="id_costClose" type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>                         
                        <button id="id_costSave" type="button" class="btn btn-primary">요청</button> 
                        <button id="id_costRetry" type="button" class="btn btn-primary">재요청</button> 
                        <button id="id_costApprove" type="button" class="btn btn-primary">승인</button> 
                        <button id="id_costNotAllow" type="button" class="btn btn-primary">반려</button> 
                        <button id="id_costReport" type="button" class="btn btn-primary">출력</button>
                    </div>                     
                </div>                 
            </div>                          
        </div>
        <div class="modal fade pg-show-modal" id="modal_createRequest_car" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog"> 
                <div class="modal-content"> 
                    <div class="modal-header"> 
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>                         
                        <h4 id="id_crc_title" class="modal-title">업무요청</h4> 
                    </div> 
                    <div class="modal-body"> 
                    		<div class="form-group"> 
                                <h4  style="color:#ff0000" class="modal-title"><strong>제작팀 및 프로젝트명이 올바른지 확인하세요! 해당사항 없으면 없음선택</strong></h4>                                 
                            </div>
                        <p>&nbsp;</p>
                        <form role="form">
                        	<div class="form-group"> 
                                <label class="control-label" for="crcFormBusiness1">업무분야 1</label>                                 
                                <select id="crcFormBusiness1" class="form-control"> 
                                    <option>업무용차량신청서(사용전)</option>
                                    <option>업무용차량신청서(사용후)</option>                                     
                                </select>
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="crcFormRequestTeam">요청팀</label>                                 
                                <input type="text" class="form-control" id="crcFormRequestTeam" placeholder="">
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="crcFormRequester">요청자</label>                                 
                                <input type="text" class="form-control" id="crcFormRequester" placeholder="">
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="crcFormReceiveTeam">수신팀</label>                                 
                                <select id="crcFormReceiveTeam" class="form-control"> 
                                    <option>관리본부</option>                                     
                                </select>
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="crcFormRequestTime">요청날짜 (ex: 2017-05-22 14:22:31, yyyy-mm-dd hh:mm:ss 19자리 숫자)</label>                                 
                                <input type="text" class="form-control" id="crcFormRequestTime" placeholder="yyyy-mm-dd hh:mm:ss"> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="crcFormStartTime">사용일시 시작일(ex: 2017-05-22 14:22:31, yyyy-mm-dd hh:mm:ss 19자리 숫자입력)</label>                                 
                                <input type="text" class="form-control" id="crcFormStartTime" placeholder="yyyy-mm-dd hh:mm:ss"> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="crcFormEndTime">사용일시 종료일(ex: 2017-05-22 14:22:31, yyyy-mm-dd hh:mm:ss 19자리 숫자입력)</label>                                 
                                <input type="text" class="form-control" id="crcFormEndTime" placeholder="yyyy-mm-dd hh:mm:ss"> 
                            </div>  
                            <div class="form-group"> 
                                <label class="control-label" for="crcFormDeadLine">결제희망 기한일 (ex: 2017-05-22 14:22:31, yyyy-mm-dd hh:mm:ss 19자리 숫자입력)</label>                                 
                                <input type="text" class="form-control" id="crcFormDeadLine" placeholder="yyyy-mm-dd hh:mm:ss"> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="crcFormApprovalDate">결제날짜 (ex: 2017-05-22 14:22:31, yyyy-mm-dd hh:mm:ss 19자리 숫자)</label>                                 
                                <input type="text" class="form-control" id="crcFormApprovalDate" placeholder="yyyy-mm-dd hh:mm:ss"> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="crcFormRequestDetails">요청내용(최대 한글 200자)</label>
                                <textarea id="crcFormRequestDetails" class="form-control" rows="3"></textarea>
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="crcFormApproveDetails">후속내용(최대 한글 200자)</label>
                                <textarea id="crcFormApproveDetails" class="form-control" rows="3"></textarea>
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="crcFormNotAllowDetails">반려내용(최대 한글 200자)</label>
                                <textarea id="crcFormNotAllowDetails" class="form-control" rows="3"></textarea>
                            </div> 
                        	<div class="form-group"> 
                                <label class="control-label" for="crcFormProductTeam">제작팀</label>                                 
                                <select id="crcFormProductTeam" class="form-control"> 
                                    <option>team1</option>                                     
                                    <option>team2</option>                                     
                                    <option>team3</option>
                                </select>
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="crcFormPrjName">프로젝트 명</label>                                 
                                <select id="crcFormPrjName" class="form-control"> 
                                    <option>없음</option> 
                                </select>
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="crcFormUseOrder">요청위치</label>                                 
                                <input type="text" class="form-control" id="crcFormUseOrder" placeholder="">
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="crcFormDriverTeam">운전자팀</label>                                 
                                <select id="crcFormDriverTeam" class="form-control"> 
                                    <option>team1</option>                                     
                                    <option>team2</option>                                     
                                    <option>team3</option>
                                </select>
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="crcFormDriver">운전자</label>                                 
                                <select id="crcFormDriver" class="form-control"> 
                                    <option>team1</option>                                     
                                    <option>team2</option>                                     
                                    <option>team3</option>
                                </select>
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="crcFormCompanion">동행인원(최대 한글 100자)</label>
                                <textarea id="crcFormCompanion" class="form-control" rows="3"></textarea>
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="crcFormReason">출장및운행 사유(최대 한글 200자)</label>
                                <textarea id="crcFormReason" class="form-control" rows="3"></textarea>
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="crcFormTripArea">출장지역(최대 한글 20자)</label>
                                <input type="text" class="form-control" id="crcFormTripArea" placeholder="">
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="crcFormDesiredCar">배차희망차종(최대 한글12자)</label>
                                <input type="text" class="form-control" id="crcFormDesiredCar" placeholder="">
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="crcFormBeforeDistance">운행전 총거리(KM)</label>
                                <input type="number" class="form-control" id="crcFormBeforeDistance" placeholder="">
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="crcFormAfterDistance">운행후 총거리(KM)</label>
                                <input type="number" class="form-control" id="crcFormAfterDistance" placeholder="">
                            </div>  
                            <div class="form-group"> 
                                <label class="control-label" for="crcFormUseCar">사용차량(최대 한글12자)</label>
                                <input type="text" class="form-control" id="crcFormUseCar" placeholder="">
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="crcFormFuelStatus">주유상태</label>
                                <select id="crcFormFuelStatus" class="form-control"> 
                                    <option>1</option>                                     
                                    <option>2</option>                                     
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                                </select>
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="crcFormCleanInner">차량내부 정리</label>
                                <select id="crcFormCleanInner" class="form-control"> 
                                    <option>Y</option>                                     
                                    <option>N</option>                                     
                                </select>
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="crcFormTakePhoto">4면 사진촬영</label>
                                <select id="crcFormTakePhoto" class="form-control"> 
                                    <option>Y</option>                                     
                                    <option>N</option>                                     
                                </select>
                            </div>
                            <div id="id_divRentCost" class="form-group"> 
                                <label class="control-label" for="crcFormRentCost">렌트비용</label>
                                <input type="number" class="form-control" id="crcFormRentCost" placeholder="">
                            </div>
                                                                                 
                        </form>
                        
                        <form id="frmCreateRequestCar"  role="form" enctype="multipart/form-data">   
	                        <div id="selectFileDivCar">
								
							</div>           
						     <div id="fileDivCar">
								<!-- <p>
									<input type="file" id="file" name="file_0">
									<a href="#this" class="btn" id="delete" name="delete">삭제</a>
								</p> -->
							</div> 
							<div id="addFileDivCar">
								<br/><br/>
								<a href="#this" class="btn" id="addFileCar">파일 추가</a>  
							</div>
							   
						</form>
						
                    </div>                     
                    <div class="modal-footer"> 
                        <button id="id_carClose" type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>                         
                        <button id="id_carSave" type="button" class="btn btn-primary">저장</button> 
                        <button id="id_carRetry" type="button" class="btn btn-primary">재요청</button> 
                        <button id="id_carApprove" type="button" class="btn btn-primary">승인</button> 
                        <button id="id_carNotAllow" type="button" class="btn btn-primary">반려</button>    
                        <button id="id_carReport" type="button" class="btn btn-primary">출력</button>                    
                    </div>                     
                </div>                 
            </div>                          
        </div>
        <div class="modal fade pg-show-modal" id="modal_createRequest_normal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog"> 
                <div class="modal-content"> 
                    <div class="modal-header"> 
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>                         
                        <h4 id="id_cc_title" class="modal-title">업무요청</h4> 
                    </div> 
                    <div class="modal-body"> 
                    		
                        <p>&nbsp;</p>
                        <form role="form"> 
                        	<div class="form-group"> 
                                <label class="control-label" for="crnFormBusiness1">업무분야 1</label>                                 
                                <select id="crnFormBusiness1" class="form-control"> 
                                    <option>인사</option>
                                    <option>계약</option>
                                    <option>행정</option>
                                    <option>품의</option>
                                    <option>근태</option>
                                    <option>지출예산/내역서(사용전)</option>
                                    <option>지출예산/내역서(사용후)</option>
                                    <option>기타</option>
                                </select>
                                <label class="control-label" for="crnFormBusiness1Etc">업무분야 1 기타입력 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                                    <br>
                                </label>
                                <input type="text" class="form-control" id="crnFormBusiness1Etc" placeholder="">
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="crnFormBusiness2">업무분야 2</label>                                 
                                <select id="crnFormBusiness2" class="form-control"> 
                                    <option>채용공고등록</option>
                                    <option>계약체결</option>
                                    <option>선금청구</option>
                                    <option>잔금청구</option>
                                    <option>잔금청구</option>
                                    <option>계약서류요청</option>
                                    <option>입찰서류요청</option>
                                    <option>각종증명서요청</option>
                                    <option>시행</option>
                                    <option>지출</option>
                                    <option>출장</option>
                                    <option>야근</option>
                                    <option>연차</option>
                                    <option>외출</option>
                                    <option>훈련</option>
                                    <option>기타</option>                                      
                                </select>
                                <label class="control-label" for="crnFormBusiness2Etc">업무분야 2 기타입력 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                                    <br>
                                </label>
                                <input type="text" class="form-control" id="crnFormBusiness2Etc" placeholder="">
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="crnFormRequestTeam">요청팀</label>                                 
                                <input type="text" class="form-control" id="crnFormRequestTeam" placeholder="">
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="crnFormRequester">요청자</label>                                 
                                <input type="text" class="form-control" id="crnFormRequester" placeholder="">
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="crnFormReceiveTeam">수신팀</label>                                 
                                <select id="crnFormReceiveTeam" class="form-control"> 
                                    <option>team1</option>                                     
                                    <option>team2</option>                                     
                                    <option>team3</option>
                                </select>
                            </div>
                            <div id="id_receiverDiv" class="form-group"> 
                                <label class="control-label" for="crnFormReceiver">수신자</label>                                 
                                <select id="crnFormReceiver" class="form-control"> 
                                    <option>team1</option>                                     
                                    <option>team2</option>                                     
                                    <option>team3</option>
                                </select>
                            </div>
                            <div id="id_useOrderDiv" class="form-group"> 
                                <label class="control-label" for="crnFormUseOrder">요청위치</label>                                 
                                <input type="text" class="form-control" id="crnFormUseOrder" placeholder="">
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="crnFormRequestTime">요청날짜 (ex: 2017-05-22 14:22:31, yyyy-mm-dd hh:mm:ss 19자리 숫자)</label>                                 
                                <input type="text" class="form-control" id="crnFormRequestTime" placeholder="yyyy-mm-dd hh:mm:ss"> 
                            </div>
                            <div  id="id_startTimeDiv" class="form-group"> 
                                <label class="control-label" for="crnFormStartTime">근태/야근/출장기간 시작일(ex: 2017-05-22 14:22:31, yyyy-mm-dd hh:mm:ss 19자리 숫자입력)</label>                                 
                                <input type="text" class="form-control" id="crnFormStartTime" placeholder="yyyy-mm-dd hh:mm:ss"> 
                            </div>
                            <div  id="id_endTimeDiv" class="form-group"> 
                                <label class="control-label" for="crnFormEndTime">근태/야근/출장기간 종료일(ex: 2017-05-22 14:22:31, yyyy-mm-dd hh:mm:ss 19자리 숫자입력)</label>                                 
                                <input type="text" class="form-control" id="crnFormEndTime" placeholder="yyyy-mm-dd hh:mm:ss"> 
                            </div>  
                            <div class="form-group"> 
                                <label class="control-label" for="crnFormDeadLine">결제희망 기한일 (ex: 2017-05-22 14:22:31, yyyy-mm-dd hh:mm:ss 19자리 숫자입력)</label>                                 
                                <input type="text" class="form-control" id="crnFormDeadLine" placeholder="yyyy-mm-dd hh:mm:ss"> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="crnFormApprovalDate">결제날짜 (ex: 2017-05-22 14:22:31, yyyy-mm-dd hh:mm:ss 19자리 숫자)</label>                                 
                                <input type="text" class="form-control" id="crnFormApprovalDate" placeholder="yyyy-mm-dd hh:mm:ss"> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="crnFormRequestDetails">요청내용(최대 한글 200자)</label>
                                <textarea id="crnFormRequestDetails" class="form-control" rows="3"></textarea>
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="crnFormApproveDetails">후속내용(최대 한글 200자)</label>
                                <textarea id="crnFormApproveDetails" class="form-control" rows="3"></textarea>
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="crnFormNotAllowDetails">반려내용(최대 한글 200자)</label>
                                <textarea id="crnFormNotAllowDetails" class="form-control" rows="3"></textarea>
                            </div>                                                         
                        </form>
                        
                        <form id="frmCreateRequestNormal"  role="form" enctype="multipart/form-data">   
	                        <div id="selectFileDivNormal">
								
							</div>           
						     <div id="fileDivNormal">
								<!-- <p>
									<input type="file" id="file" name="file_0">
									<a href="#this" class="btn" id="delete" name="delete">삭제</a>
								</p> -->
							</div> 
							<div id="addFileDivNormal">
								<br/><br/>
								<a href="#this" class="btn" id="addFileNormal">파일 추가</a>  
							</div>
							   
						</form>
						
                    </div>                     
                    <div class="modal-footer"> 
                        <button id="id_normalClose" type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>                         
                        <button id="id_normalSave" type="button" class="btn btn-primary">요청</button>   
                        <button id="id_normalRetry" type="button" class="btn btn-primary">재요청</button> 
                        <button id="id_normalApprove" type="button" class="btn btn-primary">승인</button> 
                        <button id="id_normalNotAllow" type="button" class="btn btn-primary">반려</button>
                        <button id="id_normalReport" type="button" class="btn btn-primary">출력</button>                       
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
        var g_authority;
        var g_employee_num;
        var g_request_prg_num;
        var g_cost_prg_num;
        
        var g_s_year;
        var g_s_month;
        var g_team_db_name;
        var g_member_name;
        var g_current_team_name;
        var g_current_member_name;
        var g_current_receive_team;
        var g_current_receiver;
        
        var g_business_field_1;
        var g_request_status;
        var g_team_receive = 1; //0: no 1: yes
        
        var g_isUpdate;
        var g_searchKind; // 1:받은요청 2:받은승인 3:받은반려 4:전달요청 5:전달승인 6:전달반려 
        
        var g_current_business_field_1 = "";
        var g_current_request_num  = "";
        var g_current_request_prg_num;
        var g_current_request_status  = "";
        
        var g_current_driver_team;
        var g_current_driver;
        var g_current_request_mod; //cost, car, normal
        
        var g_current_product_team;
        var g_current_project_number;
        var g_current_project_name;
        var g_current_cost_number;
        
        var g_maxRequestNumber;
        
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
    		
    		
    		var body = $("#id_requestTable > tbody");
			body.empty();
			
			$("#id_request_title").text("기준년:      기준월:    소속팀:     팀원:");
			
			fn_setCurrentYearMonth();
			fn_getTeamNames();
    		fn_getSession();
    		fn_getMembers();
    		
    		g_current_team_name = g_team_db_name;
    		g_current_member_name = g_member_name;
    		
			$('#id_s_business_field').val("전체").prop("selected", true);
			g_business_field_1 = "전체";
    		
    		$("#id_s_year").on('change', function () { 
    			
    			var selectText;
				selectText = $("#id_s_year option:selected").val();
				g_s_year = selectText.replace(/\s+/g, '');
				
    		});
    		
			$("#id_s_month").on('change', function () { 
    			
    			var selectText;
				selectText = $("#id_s_month option:selected").val();
				g_s_month = selectText.replace(/\s+/g, '');
				
    		});
			
			$("#id_s_team_name").on('change', function () { 
    			
    			var selectText;
				selectText = $("#id_s_team_name option:selected").val();
				g_current_team_name = selectText.replace(/\s+/g, '');
				fn_getMembersChange();
				
    		});
			
			$("#id_s_member").on('change', function () { 
    			
    			var selectText;
				selectText = $("#id_s_member option:selected").val();
				g_current_member_name = selectText.replace(/\s+/g, '');
				
    		});
			
			$("#id_s_business_field").on('change', function () { 
    			
    			var selectText;
				selectText = $("#id_s_business_field option:selected").val();
				g_business_field_1 = selectText.replace(/\s+/g, '');
				
    		});
			
			$("#id_team_receive_search").bind('click', function () { 
				
				$("#id_request_title").text("기준년: "+ g_s_year + ",   기준월: "+ g_s_month + ",  소속팀: " + 
	        			g_current_team_name + ",  팀원: " + g_current_member_name + ", 팀수신 조회");
				
    			var body = $("#id_requestTable > tbody");
    			body.empty();
    			
    			g_searchKind = 1;
    			g_request_status = "요청";
    			fn_selectTeamReceiveRequest();
    			
    			$('#id_costSave').hide();
    			$('#id_costRetry').hide();
				$('#id_costApprove').show();
				$('#id_costNotAllow').show();
				
				$('#id_carSave').hide();
				$('#id_carRetry').hide();
				$('#id_carApprove').show();
				$('#id_carNotAllow').show();
				
				$('#id_normalSave').hide();
				$('#id_normalRetry').hide();
				$('#id_normalApprove').show();
				$('#id_normalNotAllow').show();
				
				$('#addFileDivCost').hide();
				$('#addFileDivCar').hide();
				$('#addFileDivNormal').hide();
    			
    		});
			
			$("#id_team_receive_approve_search").bind('click', function () { 
				
				$("#id_request_title").text("기준년: "+ g_s_year + ",   기준월: "+ g_s_month + ",  소속팀: " + 
	        			g_current_team_name + ",  팀원: " + g_current_member_name + ", 팀수신승인 조회");
				
    			var body = $("#id_requestTable > tbody");
    			body.empty();
    			
    			g_searchKind = 2;
    			g_request_status = "승인";
    			fn_selectTeamReceiveRequest();
    			
    			$('#id_costSave').hide();
    			$('#id_costRetry').hide();
				$('#id_costApprove').hide();
				$('#id_costNotAllow').hide();
				
				$('#id_carSave').hide();
				$('#id_carRetry').hide();
				$('#id_carApprove').hide();
				$('#id_carNotAllow').hide();
				
				$('#id_normalSave').hide();
				$('#id_normalRetry').hide();
				$('#id_normalApprove').hide();
				$('#id_normalNotAllow').hide();
				
				$('#addFileDivCost').hide();
				$('#addFileDivCar').hide();
				$('#addFileDivNormal').hide();
    			
    		});
			
			$("#id_team_receive_refuse_search").bind('click', function () { 
				
				$("#id_request_title").text("기준년: "+ g_s_year + ",   기준월: "+ g_s_month + ",  소속팀: " + 
	        			g_current_team_name + ",  팀원: " + g_current_member_name + ", 팀수신반려 조회");
				
    			var body = $("#id_requestTable > tbody");
    			body.empty();
    			
    			g_searchKind = 3;
    			g_request_status = "반려";
    			fn_selectTeamReceiveRequest();
    			
    			$('#id_costSave').hide();
    			$('#id_costRetry').hide();
				$('#id_costApprove').hide();
				$('#id_costNotAllow').hide();
				
				$('#id_carSave').hide();
				$('#id_carRetry').hide();
				$('#id_carApprove').hide();
				$('#id_carNotAllow').hide();
				
				$('#id_normalSave').hide();
				$('#id_normalRetry').hide();
				$('#id_normalApprove').hide();
				$('#id_normalNotAllow').hide();
				
				$('#addFileDivCost').hide();
				$('#addFileDivCar').hide();
				$('#addFileDivNormal').hide();
    			
    		});
			
			$("#id_receive_request_search").bind('click', function () { 
				
				$("#id_request_title").text("기준년: "+ g_s_year + ",   기준월: "+ g_s_month + ",  소속팀: " + 
	        			g_current_team_name + ",  팀원: " + g_current_member_name + ", 업무요청수신 조회");
				
    			var body = $("#id_requestTable > tbody");
    			body.empty();
    			
    			g_searchKind = 1;
    			g_request_status = "요청";
    			fn_selectReceiveRequest();
    			
    			$('#id_costSave').hide();
    			$('#id_costRetry').hide();
				$('#id_costApprove').show();
				$('#id_costNotAllow').show();
				
				$('#id_carSave').hide();
				$('#id_carRetry').hide();
				$('#id_carApprove').show();
				$('#id_carNotAllow').show();
				
				$('#id_normalSave').hide();
				$('#id_normalRetry').hide();
				$('#id_normalApprove').show();
				$('#id_normalNotAllow').show();
				
				$('#addFileDivCost').hide();
				$('#addFileDivCar').hide();
				$('#addFileDivNormal').hide();
    			
    		});
			
			$("#id_receive_request_approve_search").bind('click', function () { 
				
				$("#id_request_title").text("기준년: "+ g_s_year + ",   기준월: "+ g_s_month + ",  소속팀: " + 
	        			g_current_team_name + ",  팀원: " + g_current_member_name + ", 업무요청수신승인 조회");
				
    			var body = $("#id_requestTable > tbody");
    			body.empty();
    			
    			g_searchKind = 2;
    			g_request_status = "승인";
    			fn_selectReceiveRequest();
    			
    			$('#id_costSave').hide();
    			$('#id_costRetry').hide();
				$('#id_costApprove').hide();
				$('#id_costNotAllow').hide();
				
				$('#id_carSave').hide();
				$('#id_carRetry').hide();
				$('#id_carApprove').hide();
				$('#id_carNotAllow').hide();
				
				$('#id_normalSave').hide();
				$('#id_normalRetry').hide();
				$('#id_normalApprove').hide();
				$('#id_normalNotAllow').hide();
				
				$('#addFileDivCost').hide();
				$('#addFileDivCar').hide();
				$('#addFileDivNormal').hide();
    			
    		});
			
			$("#id_receive_request_refuse_search").bind('click', function () { 
				
				$("#id_request_title").text("기준년: "+ g_s_year + ",   기준월: "+ g_s_month + ",  소속팀: " + 
	        			g_current_team_name + ",  팀원: " + g_current_member_name + ", 업무요청수신반려 조회");
				
    			var body = $("#id_requestTable > tbody");
    			body.empty();
    			
    			g_searchKind = 3;
    			g_request_status = "반려";
    			fn_selectReceiveRequest();
    			
    			$('#id_costSave').hide();
    			$('#id_costRetry').hide();
				$('#id_costApprove').hide();
				$('#id_costNotAllow').hide();
				
				$('#id_carSave').hide();
				$('#id_carRetry').hide();
				$('#id_carApprove').hide();
				$('#id_carNotAllow').hide();
				
				$('#id_normalSave').hide();
				$('#id_normalRetry').hide();
				$('#id_normalApprove').hide();
				$('#id_normalNotAllow').hide();
				
				$('#addFileDivCost').hide();
				$('#addFileDivCar').hide();
				$('#addFileDivNormal').hide();
    			
    		});
			
			$("#id_request_search").bind('click', function () { 
				
				$("#id_request_title").text("기준년: "+ g_s_year + ",   기준월: "+ g_s_month + ",  소속팀: " + 
	        			g_current_team_name + ",  팀원: " + g_current_member_name + ", 업무요청 조회");
				
    			var body = $("#id_requestTable > tbody");
    			body.empty();
    			
    			g_searchKind = 4;
    			g_request_status = "요청";
    			fn_selectRequest();
    			
    			$('#id_costSave').hide();
    			$('#id_costRetry').hide();
				$('#id_costApprove').hide();
				$('#id_costNotAllow').hide();
				
				$('#id_carSave').hide();
				$('#id_carRetry').hide();
				$('#id_carApprove').hide();
				$('#id_carNotAllow').hide();
				
				$('#id_normalSave').hide();
				$('#id_normalRetry').hide();
				$('#id_normalApprove').hide();
				$('#id_normalNotAllow').hide();
				
				$('#addFileDivCost').hide();
				$('#addFileDivCar').hide();
				$('#addFileDivNormal').hide();
    			
    		});
			
			$("#id_request_approve_search").bind('click', function () { 
				
				$("#id_request_title").text("기준년: "+ g_s_year + ",   기준월: "+ g_s_month + ",  소속팀: " + 
	        			g_current_team_name + ",  팀원: " + g_current_member_name + ", 업무요청승인 조회");
				
    			var body = $("#id_requestTable > tbody");
    			body.empty();
    			
    			g_searchKind = 5;
    			g_request_status = "승인";
    			fn_selectRequest();
    			
    			$('#id_costSave').hide();
    			$('#id_costRetry').hide();
				$('#id_costApprove').hide();
				$('#id_costNotAllow').hide();
				
				$('#id_carSave').hide();
				$('#id_carRetry').hide();
				$('#id_carApprove').hide();
				$('#id_carNotAllow').hide();
				
				$('#id_normalSave').hide();
				$('#id_normalRetry').hide();
				$('#id_normalApprove').hide();
				$('#id_normalNotAllow').hide();
				
				$('#addFileDivCost').hide();
				$('#addFileDivCar').hide();
				$('#addFileDivNormal').hide();
    			
    		});
			
			$("#id_request_refuse_search").bind('click', function () { 
				
				$("#id_request_title").text("기준년: "+ g_s_year + ",   기준월: "+ g_s_month + ",  소속팀: " + 
	        			g_current_team_name + ",  팀원: " + g_current_member_name + ", 업무요청반려 조회");
				
    			var body = $("#id_requestTable > tbody");
    			body.empty();
    			
    			g_searchKind = 6;
    			g_request_status = "반려";
    			fn_selectRequest();
    			
    			$('#id_costSave').hide();
    			$('#id_costRetry').hide();
				$('#id_costApprove').hide();
				$('#id_costNotAllow').hide();
				
				$('#id_carSave').hide();
				$('#id_carRetry').hide();
				$('#id_carApprove').hide();
				$('#id_carNotAllow').hide();
				
				$('#id_normalSave').hide();
				$('#id_normalRetry').hide();
				$('#id_normalApprove').hide();
				$('#id_normalNotAllow').hide();
				
				$('#addFileDivCost').hide();
				$('#addFileDivCar').hide();
				$('#addFileDivNormal').hide();
    			
    		});
    		
			$("#id_create_request").bind('click', function () { 
    			
				$('#id_costSave').show();
    			$('#id_costRetry').hide();
				$('#id_costApprove').hide();
				$('#id_costNotAllow').hide();
				
				$('#id_carSave').show();
				$('#id_carRetry').hide();
				$('#id_carApprove').hide();
				$('#id_carNotAllow').hide();
				
				$('#id_normalSave').show();
				$('#id_normalRetry').hide();
				$('#id_normalApprove').hide();
				$('#id_normalNotAllow').hide();
				
				$('#addFileDivCost').show();
				$('#addFileDivCar').show();
				$('#addFileDivNormal').show();
				
				g_isUpdate = 0;
				$('#modal_selectCreateType').modal('show');
				
    		});
			
			$("#id_btn_search_type").bind('click', function () { 
    			
				$('#id_costRetry').hide();
				$('#id_costApprove').hide();
				$('#id_costNotAllow').hide();
				
				$('#id_carRetry').hide();
				$('#id_carApprove').hide();
				$('#id_carNotAllow').hide();
				
				$('#id_normalRetry').hide();
				$('#id_normalApprove').hide();
				$('#id_normalNotAllow').hide();
				
				$('#addFileDivCost').show();
				$('#addFileDivCar').show();
				$('#addFileDivNormal').show();
				
				var selectText;
				selectText = $("#scFormType option:selected").val();
				
				if(selectText == "재무업무요청(현금정산&결제요청-외주비)"){
					
					fn_initCreateRequest_cost();
					fn_set_crFormSecondClass();
					fn_set_crFormThirdClass();
					$('#modal_createRequest_cost').modal('show');
					
				}else if(selectText == "업무용차량신청"){
					
					$("#crcFormBusiness1").find("option").remove();
		        	var str = "";
		        	str += "<option>업무용차량신청서(사용전)</option>";
		        	str += "<option>업무용차량신청서(사용후)</option>";
		        	$('#crcFormBusiness1').append(str);
					$('#crcFormBusiness1').attr('disabled',false);
					
					fn_initCreateRequest_car();
					$('#modal_createRequest_car').modal('show');
					
				}else if(selectText == "일반업무요청"){
					
					$("#crnFormBusiness1").find("option").remove();
		        	var str = "";
		        	str += "<option>인사</option>";
		        	str += "<option>계약</option>";
		        	str += "<option>행정</option>";
		        	str += "<option>품의</option>";
		        	str += "<option>근태</option>";
		        	str += "<option>지출예산/내역서(사용전)</option>";
		        	//str += "<option>지출예산/내역서(사용후)</option>";
		        	str += "<option>기타</option>";
					$('#crnFormBusiness1').append(str);
		        	
					fn_initCreateRequest_normal();
					$('#crnFormBusiness1').attr('disabled',false);
					$('#modal_createRequest_normal').modal('show');
				}
				
    		});
			
			$("#id_btn_close_type").bind('click', function () { 
    			
				var selectText;
				selectText = $("#scFormType option:selected").val();
				
    		});
			
			$("#id_costClose").bind('click', function () { 
    			
				$('#modal_selectCreateType').modal('hide');
				
    		});
			
			$("#id_costSave").bind('click', function () { 
    			
				g_current_request_mod = "cost";
				if(fn_checkValue_costSave()){
					fn_selectMaxRequestNumber();
				}
    		});
			
			$("#id_carClose").bind('click', function () { 
    			
				$('#modal_selectCreateType').modal('hide');
				
    		});
			
			$("#id_carSave").bind('click', function () { 
    			
				g_current_request_mod = "car";
			    if(fn_checkValue_carSave()){
			    	fn_selectMaxRequestNumber();
			    }
				
    		});
			
			$("#id_normalClose").bind('click', function () { 
    			
				$('#modal_selectCreateType').modal('hide');
				
    		});
			
			$("#id_normalSave").bind('click', function () { 
    			
				g_current_request_mod = "normal";
			    if(fn_checkValue_normalSave()){
			    	fn_selectMaxRequestNumber();
			    }
// 				$('#modal_selectCreateType').modal('hide');
// 				$('#modal_createRequest_normal').modal('hide');
				
    		});
			
			$("#id_costReport").bind('click', function () { 
    			fn_show_report_page();
    		});
    		
			$("#id_carReport").bind('click', function () { 
				fn_show_report_page();
			});
			
			$("#id_normalReport").bind('click', function () { 
    			fn_show_report_page();
    		});
			
			$("#id_request_detail_search").bind('click', function () { 
				g_isUpdate = 1;
				
				if(g_current_business_field_1 == "재무"){
					
					g_current_request_mod = "cost";
					fn_initCreateRequest_cost();
					fn_set_crFormSecondClass();
					fn_set_crFormThirdClass();
					$('#modal_createRequest_cost').modal('show');
					
				}else if(g_current_business_field_1.indexOf("업무용차량신청") != -1){
					
					g_current_request_mod = "car";
					fn_initCreateRequest_car();
					$('#modal_createRequest_car').modal('show');
					
				}else{
					
					g_current_request_mod = "normal";
					
					$("#crnFormBusiness1").find("option").remove();
		        	var str = "";
		        	str += "<option>인사</option>";
		        	str += "<option>계약</option>";
		        	str += "<option>행정</option>";
		        	str += "<option>품의</option>";
		        	str += "<option>근태</option>";
		        	str += "<option>지출예산/내역서(사용전)</option>";
		        	str += "<option>지출예산/내역서(사용후)</option>";
		        	str += "<option>기타</option>";
					$('#crnFormBusiness1').append(str);
					
					fn_initCreateRequest_normal();
					$('#modal_createRequest_normal').modal('show');
					$('#id_receiverDiv').show();
				}
				
				fn_selectRequestPerRequestNumber();
				
    		});
			
			$("#id_costApprove").bind('click', function () { 
				
				g_current_request_mod = "cost";
				g_request_status = "승인";
				fn_updateRequestPerRequestNumber();
				fn_updateCostPerRequestNumber();
				
    		});
			
			$("#id_costNotAllow").bind('click', function () { 
				
				g_current_request_mod = "cost";
				g_request_status = "반려";
				fn_updateRequestPerRequestNumber();
				fn_updateCostPerRequestNumber();
				
    		});
			
			$("#id_costRetry").bind('click', function () { 
				
				g_current_request_mod = "cost";
				if(g_searchKind == 6) { //전달반려
					g_request_status = "요청";
				}
				fn_updateRequestPerRequestNumber();
				fn_updateCostPerRequestNumber();
				
    		});
			
			$("#id_carApprove").bind('click', function () { 
				
				g_current_request_mod = "car";
				g_request_status = "승인";
				fn_updateRequestPerRequestNumber();
				var varText = $('#crcFormUseOrder').val();
				varText = varText.replace(/\s+/g, '');
				if(varText == "사용후"){
					if(fn_checkValue_carApprove()){
						fn_selectMaxCostNumberForCar();	
					}	
				}
				
    		});
			
			$("#id_carNotAllow").bind('click', function () { 
				
				g_current_request_mod = "car";
				g_request_status = "반려";
				fn_updateRequestPerRequestNumber();
				
    		});
			
			$("#id_carRetry").bind('click', function () { 
				
				g_current_request_mod = "car";
				if(g_searchKind == 5){ //전달승인
					g_request_status = "요청";
				}else if(g_searchKind == 6) { //전달반려
					g_request_status = "요청";
				}
				fn_updateRequestPerRequestNumber();
				
    		});
			
			$("#id_normalApprove").bind('click', function () { 
				
				g_current_request_mod = "normal";
				g_request_status = "승인";
				fn_updateRequestPerRequestNumber();
				
    		});
			
			$("#id_normalNotAllow").bind('click', function () { 
				
				g_current_request_mod = "normal";
				g_request_status = "반려";
				fn_updateRequestPerRequestNumber();
				
    		});
			
			$("#id_normalRetry").bind('click', function () { 
				
				g_current_request_mod = "normal";
				
				if(g_searchKind == 5){ //전달승인
					g_request_status = "요청";
				}else if(g_searchKind == 6) { //전달반려
					g_request_status = "요청";
				}
				
				fn_updateRequestPerRequestNumber();
				
    		});
			
			$("#crFormProductTeam").on('change', function () { 
    			
    			var selectText;
				selectText = $("#crFormProductTeam option:selected").val();
				g_current_product_team = selectText.replace(/\s+/g, '');
    			
    			fn_getProjectNameList();
    		});
			
			$("#crcFormProductTeam").on('change', function () { 
    			
    			var selectText;
				selectText = $("#crcFormProductTeam option:selected").val();
				g_current_product_team = selectText.replace(/\s+/g, '');
    			
    			fn_getProjectNameListCar();
    		});
			
			$("#crcFormDriverTeam").on('change', function () { 
    			
    			var selectText;
				selectText = $("#crcFormDriverTeam option:selected").val();
				g_current_driver_team = selectText.replace(/\s+/g, '');
    			
				fn_getMembersCar();
    		});
			
			$("#crcFormDriver").on('change', function () { 
    			
    			var selectText;
				selectText = $("#crcFormDriver option:selected").val();
				g_current_driver = selectText.replace(/\s+/g, '');
    			
			});
			
			$("#crFormFirstClass").on('change', function () { 
    			
    			fn_set_crFormSecondClass();
    			fn_set_crFormThirdClass();
    		});
			
			$("#crFormSecondClass").on('change', function () { 
    			
				fn_set_crFormThirdClass();
    		});
			
			$("#crFormBusiness2").on('change', function () { 
    			
				var selectText;
	        	selectText = $("#crFormBusiness2 option:selected").val();
	        	selectText = selectText.replace(/\s+/g, '');
	            
	        	if(selectText == '결제요청(외주비)'){
	        		$('#crFormDivision').val("외주비").prop("selected", true);
	        	}else{
	        		$('#crFormDivision').val("현금").prop("selected", true);
	        	}
	        	
    		});
			
			$("#crnFormReceiveTeam").on('change', function () { 
    			
    			var selectText;
				selectText = $("#crnFormReceiveTeam option:selected").val();
				g_current_receive_team = selectText.replace(/\s+/g, '');
    			
				fn_getMembersNormal();
    		});
			
			$("#crnFormReceiver").on('change', function () { 
    			
    			var selectText;
				selectText = $("#crnFormReceiver option:selected").val();
				g_current_receiver = selectText.replace(/\s+/g, '');
    			
			});
			
			$("#crnFormBusiness1").on('change', function () { 
    			
    			fn_set_crnFormBusiness2();
    		});
			
			$("#addFileCost").on("click", function(e){ //파일 추가 버튼
				e.preventDefault();
				fn_addFileCost();
			});
			$("#addFileCar").on("click", function(e){ //파일 추가 버튼
				e.preventDefault();
				fn_addFileCar();
			});
			$("#addFileNormal").on("click", function(e){ //파일 추가 버튼
				e.preventDefault();
				fn_addFileNormal();
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
// 			    	$('#id_session').hide();
	        	}
			    
	        });
    				
	        //ready end
		});
        
		function fn_updateRequestPerRequestNumber(){
			
 	    	$('#id_costApprove').attr('disabled', true);
			$('#id_costNotAllow').attr('disabled', true);
			
			$('#id_carApprove').attr('disabled', true);
			$('#id_carNotAllow').attr('disabled', true);
			$('#id_carRetry').attr('disabled', true);
			
			$('#id_normalApprove').attr('disabled', true);
			$('#id_normalNotAllow').attr('disabled', true);
			$('#id_normalRetry').attr('disabled', true);
 	    	
			g_member_name = g_member_name.replace(/\s+/g, '');
         	
        	var comAjax = new ComAjax();
        	comAjax.setUrl("<c:url value='/updateRequestPerRequestNumber.do' />");
        	
        	comAjax.addParam("g_current_request_num",g_current_request_num);
        	comAjax.addParam("g_request_status",g_request_status);
        	
        	if(g_current_request_mod == "cost"){
        	
        		comAjax.addParam("FormBusiness1",$('#crFormBusiness1').val());
            	comAjax.addParam("FormBusiness2",$('#crFormBusiness2').val());
            	comAjax.addParam("FormRequestTeam",$('#crFormRequestTeam').val());
            	comAjax.addParam("FormRequester",$('#crFormRequester').val());
            	comAjax.addParam("FormReceiveTeam",$('#crFormReceiveTeam').val());
            	comAjax.addParam("FormReceiver","");
            	comAjax.addParam("FormRequestDetails",$('#crFormRequestDetails').val());
        		comAjax.addParam("FormApproveDetails",$('#crFormApproveDetails').val());
            	comAjax.addParam("FormNotAllowDetails",$('#crFormNotAllowDetails').val());
            	
            	comAjax.addParam("FormUseOrder", "");
            	comAjax.addParam("FormBeforeDistance","0");
            	comAjax.addParam("FormAfterDistance","0");
            	comAjax.addParam("FormUseCar","");
            	comAjax.addParam("FormFuelStatus","1");
            	comAjax.addParam("FormCleanInner","N");
            	comAjax.addParam("FormTakePhoto","N");
            	
        	}else if(g_current_request_mod == "car"){
        		
            	var varText = $('#crcFormUseOrder').val();
            	varText = varText.replace(/\s+/g, '');
            	if(g_searchKind == 5 && g_request_status == "요청" && varText == "사용전"){
            		$('#crcFormUseOrder').val("사용후");
//             		$("#crcFormBusiness1").find("option").remove();
// 	    			$('#crcFormBusiness1').append("<option>업무용차량신청서(사용후)</option>");
	    			$('#crcFormBusiness1').val("업무용차량신청서(사용후)").prop("selected", true);
				}
            	
            	comAjax.addParam("FormBusiness1",$('#crcFormBusiness1').val());
            	comAjax.addParam("FormBusiness2",$('#crcFormBusiness2').val());
            	comAjax.addParam("FormRequestTeam",$('#crcFormRequestTeam').val());
            	comAjax.addParam("FormRequester",$('#crcFormRequester').val());
            	comAjax.addParam("FormReceiveTeam",$('#crcFormReceiveTeam').val());
            	comAjax.addParam("FormReceiver","");
            	comAjax.addParam("FormRequestDetails",$('#crcFormRequestDetails').val());
        		comAjax.addParam("FormApproveDetails",$('#crcFormApproveDetails').val());
            	comAjax.addParam("FormNotAllowDetails",$('#crcFormNotAllowDetails').val());
            	
            	comAjax.addParam("FormUseOrder",$('#crcFormUseOrder').val());
            	comAjax.addParam("FormBeforeDistance",$('#crcFormBeforeDistance').val());
            	comAjax.addParam("FormAfterDistance",$('#crcFormAfterDistance').val());
            	comAjax.addParam("FormUseCar",$('#crcFormUseCar').val());
            	comAjax.addParam("FormFuelStatus",$('#crcFormFuelStatus').val());
            	comAjax.addParam("FormCleanInner",$('#crcFormCleanInner').val());
            	comAjax.addParam("FormTakePhoto",$('#crcFormTakePhoto').val());
            	
        	}else if(g_current_request_mod == "normal"){
        		
            	var varText = $('#crnFormUseOrder').val();
            	varText = varText.replace(/\s+/g, '');
            	if(g_searchKind == 5 && g_request_status == "요청" && varText == "사용전"){
            		$('#crnFormUseOrder').val("사용후");
            		$('#crnFormBusiness1').val("지출예산/내역서(사용후)").prop("selected", true);
				}
            	
            	comAjax.addParam("FormBusiness1",$('#crnFormBusiness1').val());
            	comAjax.addParam("FormBusiness2",$('#crnFormBusiness2').val());
            	comAjax.addParam("FormRequestTeam",$('#crnFormRequestTeam').val());
            	comAjax.addParam("FormRequester",$('#crnFormRequester').val());
            	comAjax.addParam("FormReceiveTeam",$('#crnFormReceiveTeam').val());
            	comAjax.addParam("FormReceiver",$('#crnFormReceiver').val());
            	comAjax.addParam("FormRequestDetails",$('#crnFormRequestDetails').val());
        		comAjax.addParam("FormApproveDetails",$('#crnFormApproveDetails').val());
            	comAjax.addParam("FormNotAllowDetails",$('#crnFormNotAllowDetails').val());
            	
            	comAjax.addParam("FormUseOrder",$('#crnFormUseOrder').val());
            	comAjax.addParam("FormBeforeDistance","0");
            	comAjax.addParam("FormAfterDistance","0");
            	comAjax.addParam("FormUseCar","");
            	comAjax.addParam("FormFuelStatus","1");
            	comAjax.addParam("FormCleanInner","N");
            	comAjax.addParam("FormTakePhoto","N");
           }
        	
        	comAjax.addParam("WRITER",g_member_name);
        	
        	comAjax.setCallback("fn_updateRequestPerRequestNumber_Callback");
        	comAjax.ajax();
        }
	 
	 	function fn_updateRequestPerRequestNumber_Callback(data){
        	
	 		
        	var success = data.map["success"];
        	
        	if(!success){
        		var errorString = data.map["fail_desc"];
        		alert('error: ' + errorString); 
        	}else{
        		
        		$('#id_costApprove').attr('disabled', false);
    			$('#id_costNotAllow').attr('disabled', false);
    			
    			$('#id_carApprove').attr('disabled', false);
    			$('#id_carNotAllow').attr('disabled', false);
    			$('#id_carRetry').attr('disabled', false);
    			
    			$('#id_normalApprove').attr('disabled', false);
    			$('#id_normalNotAllow').attr('disabled', false);
    			$('#id_normalRetry').attr('disabled', false);
    			
    			if(g_current_request_mod == "cost"){
    				alert('cost updateRequestPerRequestNumber success');
    				
					if(g_request_status == "요청"){
    					
    	        		var comSubmit;
    	        		comSubmit = new ComSubmit("frmCreateRequestCost", "fileDivCost");
    	        		comSubmit.setUrl("<c:url value='/insertCostFile.do' />");
    					comSubmit.addParam("REQUEST_NUM", g_current_request_num);
    					comSubmit.addParam("WRITER", g_member_name);
    					comSubmit.setCallback("fn_insertRequestFile_Callback");
    					comSubmit.submit();
    				}
    			}
    			
    			if(g_current_request_mod == "car"){
    				
    				alert('cat updateRequestPerRequestNumber success');
    				
    				var varText = $('#crcFormUseOrder').val();
    				varText = varText.replace(/\s+/g, '');
    				if(g_request_status == "승인" || g_request_status == "반려"){	
    					$('#modal_createRequest_car').modal('hide');	
    				}
    				
					if(g_request_status == "요청"){
    					
    	        		var comSubmit;
    	        		comSubmit = new ComSubmit("frmCreateRequestCar", "fileDivCar");
    	        		comSubmit.setUrl("<c:url value='/insertRequestFile.do' />");
    					comSubmit.addParam("REQUEST_NUM", g_current_request_num);
    					comSubmit.addParam("WRITER", g_member_name);
    					comSubmit.setCallback("fn_insertRequestFile_Callback");
    					comSubmit.submit();
    				}
    				
    			}
    			
				if(g_current_request_mod == "normal"){
					alert('normal updateRequestPerRequestNumber success');
					
					var varText = $('#crnFormUseOrder').val();
    				varText = varText.replace(/\s+/g, '');
    				if(g_request_status == "승인" || g_request_status == "반려"){	
    					$('#modal_createRequest_normal').modal('hide');	
    				}
    				
					if(g_request_status == "요청"){
    					
    	        		var comSubmit;
    	        		comSubmit = new ComSubmit("frmCreateRequestNormal", "fileDivNormal");
    	        		comSubmit.setUrl("<c:url value='/insertRequestFile.do' />");
    					comSubmit.addParam("REQUEST_NUM", g_current_request_num);
    					comSubmit.addParam("WRITER", g_member_name);
    					comSubmit.setCallback("fn_insertRequestFile_Callback");
    					comSubmit.submit();
    				}
    				
					//$('#modal_createRequest_normal').modal('hide');
    			}
        	}
        	 
        }
	 	
function fn_updateCostPerRequestNumber(){
			
        	var comAjax = new ComAjax();
        	comAjax.setUrl("<c:url value='/updateCostPerRequestNumber.do' />");
        	
        	comAjax.addParam("g_current_request_prg_num", g_current_request_prg_num);
        	comAjax.addParam("g_request_status", g_request_status);
        	
        	comAjax.addParam("crFormFirstClass",$('#crFormFirstClass').val());
        	comAjax.addParam("crFormSecondClass",$('#crFormSecondClass').val());
        	comAjax.addParam("crFormSecondClassEtc",$('#crFormSecondClassEtc').val());
        	comAjax.addParam("crFormThirdClass",$('#crFormThirdClass').val());
        	comAjax.addParam("crFormThirdClassEtc",$('#crFormThirdClassEtc').val());
        	comAjax.addParam("crFormContents",$('#crFormContents').val());
        	comAjax.addParam("crFormUseDay",$('#crFormUseDay').val());
        	comAjax.addParam("crFormDivision",$('#crFormDivision').val());
        	comAjax.addParam("crFormAmountUsed",$('#crFormAmountUsed').val());
        	
        	comAjax.addParam("WRITER",g_member_name);
        	
        	comAjax.setCallback("fn_updateCostPerRequestNumber_Callback");
        	comAjax.ajax();
        }
	 
	 	function fn_updateCostPerRequestNumber_Callback(data){
        	
	 		
        	var success = data.map["success"];
        	
        	if(!success){
        		var errorString = data.map["fail_desc"];
        		alert('error: ' + errorString); 
        	}else{
        		alert('cost fn_updateCostPerRequestNumber success');
        		
        		$('#modal_createRequest_cost').modal('hide');
       		}
        	 
        }
	 	
		function fn_insertCostDetailPerRequest(){
			
	        	var comAjax = new ComAjax();
	        	comAjax.setUrl("<c:url value='/insertCostDetailPerRequest.do' />");
	        	
	        	comAjax.addParam("g_cost_prg_num", g_cost_prg_num);
	        	comAjax.addParam("g_request_prg_num",g_request_prg_num);
	        	
	        	if(g_current_product_team != "없음"){
	        		comAjax.addParam("g_current_product_team",g_current_product_team);	
	        	}
	        	
	        	if(g_current_project_name != "없음"){
	        		comAjax.addParam("g_current_project_number",g_current_project_number);
	            	comAjax.addParam("g_current_project_name",g_current_project_name);
	        	}
	        	
	        	comAjax.addParam("g_member_name",g_member_name);
	        	comAjax.addParam("g_team_db_name",g_team_db_name);
	        	
	        	comAjax.addParam("crFormFirstClass",$('#crFormFirstClass').val());
	        	comAjax.addParam("crFormSecondClass",$('#crFormSecondClass').val());
	        	comAjax.addParam("crFormSecondClassEtc",$('#crFormSecondClassEtc').val());
	        	comAjax.addParam("crFormThirdClass",$('#crFormThirdClass').val());
	        	comAjax.addParam("crFormThirdClassEtc",$('#crFormThirdClassEtc').val());
	        	comAjax.addParam("crFormContents",$('#crFormContents').val());
	        	comAjax.addParam("crFormUseDay",$('#crFormUseDay').val());
	        	comAjax.addParam("crFormDivision",$('#crFormDivision').val());
	        	comAjax.addParam("crFormAmountUsed",$('#crFormAmountUsed').val());
	        	
	        	comAjax.addParam("WRITER",g_member_name);
	        	
	        	comAjax.setCallback("fn_insertCostDetailPerRequest_Callback");
	        	comAjax.ajax();
        }
	 
	 	function fn_insertCostDetailPerRequest_Callback(data){
        	
        	var success = data.map["success"];
        	
        	if(!success){
        		var errorString = data.map["fail_desc"];
        		alert('error: ' + errorString); 
        	}else{
        		//alert('cost insert success');
        		fn_selectCostNumber();
        	}
        	
        }
	 	
	 	function fn_insertCostDetailPerRequestForCar(){
			
        	var comAjax = new ComAjax();
        	comAjax.setUrl("<c:url value='/insertCostDetailPerRequestForCar.do' />");
        	
        	comAjax.addParam("g_cost_prg_num", g_cost_prg_num);
        	comAjax.addParam("g_request_prg_num",g_request_prg_num);
        	
        	if(g_current_product_team != "없음"){
        		comAjax.addParam("g_current_product_team",g_current_product_team);	
        	}
        	
        	if(g_current_project_name != "없음"){
        		comAjax.addParam("g_current_project_number",g_current_project_number);
            	comAjax.addParam("g_current_project_name",g_current_project_name);
        	}
        	
        	comAjax.addParam("g_member_name",g_member_name);
        	comAjax.addParam("g_team_db_name",g_team_db_name);
        	
        	comAjax.addParam("crcFormFirstClass","내부비");
        	comAjax.addParam("crcFormSecondClass","차량비");
        	comAjax.addParam("crcFormContents","내부차량사용");
        	comAjax.addParam("crcFormDivision","내부비");
        	comAjax.addParam("crcFormRentCost",$('#crcFormRentCost').val());
        	
        	comAjax.addParam("WRITER",g_member_name);
        	
        	comAjax.setCallback("fn_insertCostDetailPerRequestForCar_Callback");
        	comAjax.ajax();
    }
 
 	function fn_insertCostDetailPerRequestForCar_Callback(data){
    	
    	var success = data.map["success"];
    	
    	if(!success){
    		var errorString = data.map["fail_desc"];
    		alert('error: ' + errorString); 
    	}else{
    		//alert('cost insert success');
    		//fn_selectCostNumber();
    	}
    	
    }
	 	
	 	function fn_show_report_page(){
			
	    	var comSubmit = new ComSubmitOriginal();
			comSubmit.setUrl("<c:url value='/showReportPage.do' />");
			comSubmit.addParam("g_cost_prg_num", g_cost_prg_num);
			comSubmit.submit();
	    }
	 	
		function fn_selectCostNumber(){
			
		    var comAjax = new ComAjax();
        	comAjax.setUrl("<c:url value='/selectCostNumber.do' />");
        	
        	comAjax.addParam("g_cost_prg_num", g_cost_prg_num);
        	
           	comAjax.setCallback("fn_selectCostNumber_Callback");
        	comAjax.ajax();
        }
	 
	 	function fn_selectCostNumber_Callback(data){
        	
	 		var success = data.map["success"];
        	
        	if(!success){
        		var errorString = data.map["fail_desc"];
        		alert('error: ' + errorString); 
        	}else{
        		//alert('costRequest insert success');
        		g_current_cost_number = data.map["g_current_cost_number"];
        		
        		var comSubmit = new ComSubmit("frmCreateRequestCost", "fileDivCost");
				comSubmit.setUrl("<c:url value='/insertCostFile.do' />");
				comSubmit.addParam("COST_NUM", g_current_cost_number);
				comSubmit.addParam("WRITER", g_member_name);
				comSubmit.setCallback("fn_insertCostFile_Callback");
				comSubmit.submit();
        		
        	}
        	
        }
	 	
		function fn_insertCostFile_Callback(data){
	    	
			var success = data.map["success"];
	    	
	    	if(!success){
	    		var errorString = data.map["fail_desc"];
	    		alert('error: ' + errorString); 
	    	}else{
	    		alert('send request success');
				
	    	}
	    	
			$('#modal_selectCreateType').modal('hide');
			$('#modal_createRequest_cost').modal('hide');
			$('#id_costSave').attr('disabled', false);

	    }
		
		function fn_selectRequestNumber(){
			
		    var comAjax = new ComAjax();
        	comAjax.setUrl("<c:url value='/selectRequestNumber.do' />");
        	
        	comAjax.addParam("g_request_prg_num", g_request_prg_num);
        	
           	comAjax.setCallback("fn_selectRequestNumber_Callback");
        	comAjax.ajax();
        }
	 
	 	function fn_selectRequestNumber_Callback(data){
        	
	 		var success = data.map["success"];
        	
        	if(!success){
        		var errorString = data.map["fail_desc"];
        		alert('error: ' + errorString); 
        	}else{
        		//alert('costRequest insert success');
        		g_current_request_num = data.map["g_current_request_num"];
        		
        		var comSubmit;
        		if(g_current_request_mod == "car"){
            		
        			comSubmit = new ComSubmit("frmCreateRequestCar", "fileDivCar");
        		
        		}else if(g_current_request_mod == "normal"){
        		
        			comSubmit = new ComSubmit("frmCreateRequestNormal", "fileDivNormal");
        		}
        		
        		comSubmit.setUrl("<c:url value='/insertRequestFile.do' />");
				comSubmit.addParam("REQUEST_NUM", g_current_request_num);
				comSubmit.addParam("WRITER", g_member_name);
				comSubmit.setCallback("fn_insertRequestFile_Callback");
				comSubmit.submit();
        		
        	}
        	
        }
	 	
		function fn_insertRequestFile_Callback(data){
	    	
			var success = data.map["success"];
	    	
	    	if(!success){
	    		var errorString = data.map["fail_desc"];
	    		alert('error: ' + errorString); 
	    	}else{
	    		
				if(g_current_request_mod == "cost"){
	        		
	    			alert('send cost request success');
	    			
		    		$('#modal_selectCreateType').modal('hide');
					$('#modal_createRequest_cost').modal('hide');
					$('#id_costSave').attr('disabled', false);
					$('#id_costRetry').attr('disabled', false);
	    		
	    		}else if(g_current_request_mod == "car"){
	        		
	    			alert('send car request success');
	    			
		    		$('#modal_selectCreateType').modal('hide');
					$('#modal_createRequest_car').modal('hide');
					$('#id_carSave').attr('disabled', false);
					$('#id_carRetry').attr('disabled', false);
	    		
	    		}else if(g_current_request_mod == "normal"){
	    		
	    			alert('send normal request success');
	    			
	    			$('#modal_selectCreateType').modal('hide');
	    			$('#modal_createRequest_normal').modal('hide');
	    			$('#id_normalSave').attr('disabled', false);
	    			$('#id_normalRetry').attr('disabled', false);
	    		}
	    	}

	    }
	    
		function fn_insertCostRequest(){
			
			var selectText = "";
        	var comAjax = new ComAjax();
        	comAjax.setUrl("<c:url value='/insertCostRequest.do' />");
        	
        	comAjax.addParam("g_member_name",g_member_name);
        	comAjax.addParam("g_team_db_name",g_team_db_name);
        	
        	if(g_current_product_team != "없음"){
        		comAjax.addParam("g_current_product_team",g_current_product_team);	
        	}
        	
        	if(g_current_project_name != "없음"){
        		comAjax.addParam("g_current_project_number",g_current_project_number);
            	comAjax.addParam("g_current_project_name",g_current_project_name);
        	}
        	
        	selectText = $('#crFormBusiness1').val();
			selectText = selectText.replace(/\s+/g, '');
        	comAjax.addParam("crFormBusiness1",selectText);
        	selectText = $('#crFormBusiness2').val();
			selectText = selectText.replace(/\s+/g, '');
        	comAjax.addParam("crFormBusiness2",selectText);
        	selectText = $('#crFormBusiness2Etc').val();
			selectText = selectText.replace(/\s+/g, '');
        	comAjax.addParam("crFormBusiness2Etc",selectText);
        	selectText = $('#crFormReceiveTeam').val();
			selectText = selectText.replace(/\s+/g, '');
        	comAjax.addParam("crFormReceiveTeam",selectText);
        	comAjax.addParam("crFormRequestTime", $('#crFormRequestTime').val());
        	selectText = $('#crFormDeadLine').val();
			selectText = selectText.replace(/\s+/g, '');
			if(selectText.length > 0){
				comAjax.addParam("crFormDeadLine",$('#crFormDeadLine').val());
			}
        	comAjax.addParam("crFormRequestDetails",$('#crFormRequestDetails').val());
        	comAjax.addParam("g_request_prg_num",g_request_prg_num);
        	
        	comAjax.addParam("WRITER",g_member_name);
        	
        	comAjax.setCallback("fn_insertCostRequest_Callback");
        	comAjax.ajax();
        }
	 
	 	function fn_insertCostRequest_Callback(data){
        	
	 		var success = data.map["success"];
        	
        	if(!success){
        		var errorString = data.map["fail_desc"];
        		alert('error: ' + errorString); 
        	}else{
        		//alert('costRequest insert success');
        		fn_selectMaxCostNumber();
        	}
        	
        }
	 	
		function fn_insertCarRequest(){
			
        	var comAjax = new ComAjax();
        	comAjax.setUrl("<c:url value='/insertCarRequest.do' />");
        	
        	comAjax.addParam("g_request_prg_num",g_request_prg_num);
        	comAjax.addParam("g_member_name",g_member_name);
        	comAjax.addParam("g_team_db_name",g_team_db_name);
        	
        	if(g_current_product_team != "없음"){
        		comAjax.addParam("g_current_product_team",g_current_product_team);	
        	}
        	
        	if(g_current_project_name != "없음"){
        		comAjax.addParam("g_current_project_number",g_current_project_number);
            	comAjax.addParam("g_current_project_name",g_current_project_name);
        	}
        	
        	comAjax.addParam("crcFormBusiness1",$('#crcFormBusiness1').val().replace(/\s+/g, ''));
        	comAjax.addParam("crcFormReceiveTeam",$('#crcFormReceiveTeam').val().replace(/\s+/g, ''));
        	comAjax.addParam("crcFormRequestTime",$('#crcFormRequestTime').val());
        	comAjax.addParam("crcFormStartTime",$('#crcFormStartTime').val());
        	comAjax.addParam("crcFormEndTime",$('#crcFormEndTime').val());
        	var selectText = $('#crcFormDeadLine').val();
			selectText = selectText.replace(/\s+/g, '');
			if(selectText.length > 0){
				comAjax.addParam("crcFormDeadLine",$('#crcFormDeadLine').val());
			}
        	comAjax.addParam("crcFormRequestDetails",$('#crcFormRequestDetails').val());
        	comAjax.addParam("crcFormUseOrder",$('#crcFormUseOrder').val().replace(/\s+/g, ''));
        	comAjax.addParam("crcFormDriverTeam",$('#crcFormDriverTeam').val().replace(/\s+/g, ''));
        	comAjax.addParam("crcFormDriver",$('#crcFormDriver').val().replace(/\s+/g, ''));
        	comAjax.addParam("crcFormCompanion",$('#crcFormCompanion').val());
        	comAjax.addParam("crcFormReason",$('#crcFormReason').val());
        	comAjax.addParam("crcFormTripArea",$('#crcFormTripArea').val());
        	comAjax.addParam("crcFormDesiredCar",$('#crcFormDesiredCar').val());
        	
        	comAjax.addParam("WRITER",g_member_name);
        	
        	comAjax.setCallback("fn_insertCarRequest_Callback");
        	comAjax.ajax();
        }
	 
	 	function fn_insertCarRequest_Callback(data){
        	
	 		var success = data.map["success"];
        	
        	if(!success){
        		var errorString = data.map["fail_desc"];
        		alert('error: ' + errorString); 
        	}else{
        		fn_selectRequestNumber();
        	}
        	
        }
	 	
		function fn_insertNormalRequest(){
			
        	var comAjax = new ComAjax();
        	comAjax.setUrl("<c:url value='/insertNormalRequest.do' />");
        	
        	comAjax.addParam("g_request_prg_num",g_request_prg_num);
        	comAjax.addParam("g_member_name",g_member_name);
        	comAjax.addParam("g_team_db_name",g_team_db_name);
        	
        	comAjax.addParam("crnFormBusiness1",$('#crnFormBusiness1').val().replace(/\s+/g, ''));
        	comAjax.addParam("crnFormBusiness1Etc",$('#crnFormBusiness1Etc').val().replace(/\s+/g, ''));
        	comAjax.addParam("crnFormBusiness2",$('#crnFormBusiness2').val().replace(/\s+/g, ''));
        	comAjax.addParam("crnFormBusiness2Etc",$('#crnFormBusiness2Etc').val().replace(/\s+/g, ''));
        	comAjax.addParam("crnFormReceiveTeam",$('#crnFormReceiveTeam').val().replace(/\s+/g, ''));
        	var selectText;
			selectText = $('#crnFormBusiness1').val();
			selectText = selectText.replace(/\s+/g, '');
			if(selectText != "기타"){
				comAjax.addParam("crnFormReceiver", "");
			}else{
				comAjax.addParam("crnFormReceiver",$('#crnFormReceiver').val().replace(/\s+/g, ''));
			}
        	comAjax.addParam("crnFormRequestTime",$('#crnFormRequestTime').val());
        	selectText = $('#crnFormStartTime').val();
			selectText = selectText.replace(/\s+/g, '');
			if(selectText.length > 0){
				comAjax.addParam("crnFormStartTime",$('#crnFormStartTime').val());
			}
			selectText = $('#crnFormEndTime').val();
			selectText = selectText.replace(/\s+/g, '');
			if(selectText.length > 0){
				comAjax.addParam("crnFormEndTime",$('#crnFormEndTime').val());
			}
			selectText = $('#crnFormDeadLine').val();
			selectText = selectText.replace(/\s+/g, '');
			if(selectText.length > 0){
				comAjax.addParam("crnFormDeadLine",$('#crnFormDeadLine').val());
			}
        	comAjax.addParam("crnFormRequestDetails",$('#crnFormRequestDetails').val());
        	comAjax.addParam("crnFormUseOrder",$('#crnFormUseOrder').val().replace(/\s+/g, ''));
        	comAjax.addParam("WRITER",g_member_name);
        	
        	comAjax.setCallback("fn_insertNormalRequest_Callback");
        	comAjax.ajax();
        }
	 
	 	function fn_insertNormalRequest_Callback(data){
        	
	 		var success = data.map["success"];
        	
        	if(!success){
        		var errorString = data.map["fail_desc"];
        		alert('error: ' + errorString); 
        	}else{
        		fn_selectRequestNumber();
        	}
        	
        }
	 	
		function fn_selectMaxRequestNumber(){
			
			if(g_current_request_mod == "cost"){
    			
				$('#id_costSave').attr('disabled', true); 
    		
			}else if(g_current_request_mod == "car"){
    		
				$('#id_carSave').attr('disabled', true); 
    		}else if(g_current_request_mod == "normal"){
    		
				$('#id_normalSave').attr('disabled', true); 
    		}
			
        	var comAjax = new ComAjax();
        	comAjax.setUrl("<c:url value='/selectMaxRequestNumber.do' />");
        	
           	comAjax.setCallback("fn_selectMaxRequestNumber_Callback");
        	comAjax.ajax();
        }
	 
	 	function fn_selectMaxRequestNumber_Callback(data){
        	
	 		var success = data.map["success"];
        	
        	if(!success){
        		var errorString = data.map["fail_desc"];
        		alert('error: ' + errorString); 
        	}else{
        		//alert('costRequest insert success');
        		g_maxRequestNumber = data.map["g_maxRequestNumber"];
        		var intMaxRequestNumber = parseInt(g_maxRequestNumber);
        		intMaxRequestNumber++;
        		g_request_prg_num = g_employee_num + "_" +  intMaxRequestNumber;
        		
        		if(g_current_request_mod == "cost"){
        			
        			fn_insertCostRequest();
        		}else if(g_current_request_mod == "car"){
        			fn_insertCarRequest();
        		}else if(g_current_request_mod == "normal"){
        			fn_insertNormalRequest();
        		}
        		
        	}
        	
        }
	 	
		function fn_selectMaxCostNumber(){
		
        	var comAjax = new ComAjax();
        	comAjax.setUrl("<c:url value='/selectMaxCostNumber.do' />");
        	
           	comAjax.setCallback("fn_selectMaxCostNumber_Callback");
        	comAjax.ajax();
        }
	 
	 	function fn_selectMaxCostNumber_Callback(data){
        	
	 		var success = data.map["success"];
        	
        	if(!success){
        		var errorString = data.map["fail_desc"];
        		alert('error: ' + errorString); 
        	}else{
        		//alert('costRequest insert success');
        		var maxCostNumber = data.map["maxCostNumber"];
        		var intMaxCostNumber = parseInt(maxCostNumber);
        		intMaxCostNumber++;
        		g_cost_prg_num = g_employee_num + "_" +  intMaxCostNumber;
        		
        		fn_insertCostDetailPerRequest();
        		
        	}
        	
        }
	 	
		function fn_selectMaxCostNumberForCar(){
			
        	var comAjax = new ComAjax();
        	comAjax.setUrl("<c:url value='/selectMaxCostNumber.do' />");
        	
           	comAjax.setCallback("fn_selectMaxCostNumberForCar_Callback");
        	comAjax.ajax();
        }
	 
	 	function fn_selectMaxCostNumberForCar_Callback(data){
        	
	 		var success = data.map["success"];
        	
        	if(!success){
        		var errorString = data.map["fail_desc"];
        		alert('error: ' + errorString); 
        	}else{
        		//alert('costRequest insert success');
        		var maxCostNumber = data.map["maxCostNumber"];
        		var intMaxCostNumber = parseInt(maxCostNumber);
        		intMaxCostNumber++;
        		g_cost_prg_num = g_employee_num + "_" +  intMaxCostNumber;
        		
        		fn_insertCostDetailPerRequestForCar();
        		
        	}
        	
        }
        
        function fn_checkValue_costSave(){
        	var varTemp = "";
        	varTemp =  $('#crFormRequestDetails').val();
        	if(varTemp.length < 1){
        		alert("요청내용을 입력해 주세요!");
        		$('#crFormRequestDetails').focus();
        		return false;
        	}
        	varTemp =  $('#crFormContents').val();
        	if(varTemp.length < 1){
        		alert("비용 내용을 입력해 주세요!");
        		$('#crFormContents').focus();
        		return false ;
        	}
        	varTemp =  $('#crFormUseDay').val();
        	if(varTemp.length < 1){
        		alert("사용날짜를 입력해 주세요!");
        		$('#crFormUseDay').focus();
        		return false;
        	}
        	varTemp =  $('#crFormAmountUsed').val();
        	if(varTemp.length < 1){
        		alert("사용금액을 입력해 주세요!");
        		$('#crFormAmountUsed').focus();
        		return false;
        	}
        	
        	return true;
        }
        
        function fn_checkValue_carSave(){
        	var varTemp = "";
        	varTemp =  $('#crcFormRequestDetails').val();
        	if(varTemp.length < 1){
        		alert("요청내용을 입력해 주세요!");
        		$('#crcFormRequestDetails').focus();
        		return false;
        	}
        	
        	varTemp =  $('#crcFormStartTime').val();
        	if(varTemp.length < 1){
        		alert("사용 시작일을  입력해 주세요!");
        		$('#crcFormStartTime').focus();
        		return false;
        	}
        	
        	varTemp =  $('#crcFormEndTime').val();
        	if(varTemp.length < 1){
        		alert("사용 종료일을  입력해 주세요!");
        		$('#crcFormEndTime').focus();
        		return false ;
        	}
        	
        	return true;
        }
        
        function fn_checkValue_carApprove(){
        	var varTemp;
        	varTemp =  parseInt($('#crcFormRentCost').val());
        	if(varTemp < 1){
        		alert("렌트비용을 입력해 주세요! 제작팀 및 프로젝트 선택시 내부비에 자동 적용됨 ");
        		$('#crcFormRentCost').focus();
        		return false;
        	}
        	
        	return true;
        }
        
        function fn_checkValue_normalSave(){
        	var varTemp = "";
        	varTemp =  $('#crnFormRequestDetails').val();
        	if(varTemp.length < 1){
        		alert("요청내용을 입력해 주세요!");
        		$('#crnFormRequestDetails').focus();
        		return false;
        	}
        	
        	return true;
        }
        
        function fn_addFileCost(){
			var str = "<p>" +
					"<input type='file' id='file_"+(gfv_count)+"' name='file_"+(gfv_count)+"'>"+
					"<a href='#this' class='btn' id='delete_"+(gfv_count)+"' name='delete_"+(gfv_count)+"'>삭제</a>" +
				"</p>";
			$("#fileDivCost").append(str);
			$("#delete_"+(gfv_count++)).on("click", function(e){ //삭제 버튼
				e.preventDefault();
				fn_deleteFile($(this));
			});
		}
        
        function fn_addFileCar(){
			var str = "<p>" +
					"<input type='file' id='file_"+(gfv_count)+"' name='file_"+(gfv_count)+"'>"+
					"<a href='#this' class='btn' id='delete_"+(gfv_count)+"' name='delete_"+(gfv_count)+"'>삭제</a>" +
				"</p>";
			$("#fileDivCar").append(str);
			$("#delete_"+(gfv_count++)).on("click", function(e){ //삭제 버튼
				e.preventDefault();
				fn_deleteFile($(this));
			});
		}
        
        function fn_addFileNormal(){
			var str = "<p>" +
					"<input type='file' id='file_"+(gfv_count)+"' name='file_"+(gfv_count)+"'>"+
					"<a href='#this' class='btn' id='delete_"+(gfv_count)+"' name='delete_"+(gfv_count)+"'>삭제</a>" +
				"</p>";
			$("#fileDivNormal").append(str);
			$("#delete_"+(gfv_count++)).on("click", function(e){ //삭제 버튼
				e.preventDefault();
				fn_deleteFile($(this));
			});
		}
		
		function fn_deleteFile(obj){
			gfv_count--;
			obj.parent().remove();
		}
		
		function fn_set_crnFormBusiness2(){
        	
        	var selectText;
        	selectText = $("#crnFormBusiness1 option:selected").val();
        	selectText = selectText.replace(/\s+/g, '');
        	
        	if(selectText.length < 1){
        		selectText = $("#crnFormBusiness1 option:eq(0)").val();
            	selectText = selectText.replace(/\s+/g, '');
        	}
            
        	$('#id_receiverDiv').hide();
        	$('#id_startTimeDiv').hide();
        	$('#id_endTimeDiv').hide();
    		$('#crnFormReceiveTeam').val("관리본부").prop("selected", true);
    		g_current_receive_team = "관리본부";
    		$('#crnFormUseOrder').val("");
        	
        	var str = "";
          	
        	if(selectText == '인사'){
        		str += "<option>채용공고등록</option>";                                     
        		str += "<option>기타</option>";                                    
        	}
        	
        	if(selectText == '계약'){
        		str += "<option>계약체결</option>";                                     
        		str += "<option>선금청구</option>";
        		str += "<option>잔금청구</option>";
        		str += "<option>기타</option>";
        	}
        	
        	if(selectText == '행정'){
        		str += "<option>계약서류요청</option>";                                     
        		str += "<option>입찰서류요청</option>";
        		str += "<option>각종증명서발급</option>";
        		str += "<option>기타</option>";
        	}
        	
        	if(selectText == '품의'){
        		str += "<option>시행</option>";                                     
        		str += "<option>지출</option>";
        		str += "<option>기타</option>";
        	}
        	
        	if(selectText == '근태'){
        		str += "<option>출장</option>";                                     
        		str += "<option>야근</option>";
        		str += "<option>연차</option>";                                     
        		str += "<option>월차</option>";
        		str += "<option>외출</option>";                                     
        		str += "<option>훈련</option>";
        		str += "<option>기타</option>";
        		
        		$('#id_startTimeDiv').show();
            	$('#id_endTimeDiv').show();
        	}
        	
        	if(selectText == '기타'){
        		str += "<option>기타</option>";
        		
        		$('#id_receiverDiv').show();
        	}
        	
        	$("#crnFormBusiness2").find("option").remove();
        	$('#crnFormBusiness2').append(str);
        	
        	var str2 = "";
        	$.each(g_teamNameArray, function(index, value){
        		str2 += "<option>"+value+"</option>";
			});
        	$("#crnFormReceiveTeam").find("option").remove();
			$('#crnFormReceiveTeam').append(str2);
        	$('#crnFormReceiveTeam').val("관리본부").prop("selected", true);
			g_current_receive_team = "관리본부";
			
			if(selectText == '지출예산/내역서(사용전)'){
        		str = "<option>기타</option>";
        		$("#crnFormBusiness2").find("option").remove();
            	$('#crnFormBusiness2').append(str);
            	
        		$("#crnFormReceiveTeam").find("option").remove();
        		$('#crnFormReceiveTeam').append("<option>PM팀</option>");
        		$('#crnFormReceiveTeam').val("PM팀").prop("selected", true);
        		g_current_receive_team = "PM팀";
        		$('#id_useOrderDiv').show();
        		$('#crnFormUseOrder').val("사용전");
        	}
        
        }
        
		 function fn_set_crFormSecondClass(){
        	
        	var selectText;
        	selectText = $("#crFormFirstClass option:selected").val();
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
        		
        		$("#crFormSecondClass").find("option").remove();
            	$('#crFormSecondClass').append(str);
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
				
				$("#crFormSecondClass").find("option").remove();
	        	$('#crFormSecondClass').append(str);
        	}
			
			$("#crFormSecondClass option:eq(0)").attr("selected", "selected");
        }
 
	 function fn_set_crFormThirdClass(){
	 	
		var selectText;
	 	selectText = $("#crFormSecondClass option:selected").val();
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
			
	 	$("#crFormThirdClass").find("option").remove();
	 	$('#crFormThirdClass').append(str);
	 }
 
        function fn_getProjectNameList(){
        	var comAjax = new ComAjax();
        	comAjax.setUrl("<c:url value='/getProjectNameList.do' />");
        	
        	g_s_year = g_s_year.replace(/\s+/g, '');
        	comAjax.addParam("STANDARD_YEAR", g_s_year);
        	
        	g_current_product_team = g_current_product_team.replace(/\s+/g, '');
        	comAjax.addParam("PRODUCT_TEAM", g_current_product_team);
        	
        	comAjax.setCallback("fn_getProjectNameListCallback");
        	comAjax.ajax();
        }
		
		function fn_getProjectNameListCallback(data){
			
			$("#crFormPrjName").find("option").remove();
			
			var success = data.map["success"];
        	
        	if(!success){
        		var errorString = data.map["fail_desc"];
        		alert('error: ' + errorString); 
        	}else{
        		
        		var str = "";
        		var selectText;
        		$.each(data.map["firstList"], function(key, value){
					str += "<option value='"+value.prj_num+"'>"+value.prj_name+"</option>";
				});
        		
        		str += "<option value='0'>없음</option>";
        		
				$('#crFormPrjName').append(str);
				
				g_current_project_number = $("#crFormPrjName option:eq(0)").val();
				selectText = $("#crFormPrjName option:eq(0)").text();
				g_current_project_name = selectText.replace(/\s+/g, '');
				
				$("#crFormPrjName").on('change', function () { 
					
					g_current_project_number = $("#crFormPrjName option:selected").val();
					
					selectText = $("#crFormPrjName option:selected").text();
					g_current_project_name = selectText.replace(/\s+/g, '');
		        	
		      	});
				
        	}
		}
		
		function fn_getProjectNameListCar(){
        	var comAjax = new ComAjax();
        	comAjax.setUrl("<c:url value='/getProjectNameList.do' />");
        	
        	g_s_year = g_s_year.replace(/\s+/g, '');
        	comAjax.addParam("STANDARD_YEAR", g_s_year);
        	
        	g_current_product_team = g_current_product_team.replace(/\s+/g, '');
        	comAjax.addParam("PRODUCT_TEAM", g_current_product_team);
        	
        	comAjax.setCallback("fn_getProjectNameListCarCallback");
        	comAjax.ajax();
        }
		
		function fn_getProjectNameListCarCallback(data){
			
			$("#crcFormPrjName").find("option").remove();
			
			var success = data.map["success"];
        	
        	if(!success){
        		var errorString = data.map["fail_desc"];
        		alert('error: ' + errorString); 
        	}else{
        		
        		var str = "";
        		var selectText;
        		$.each(data.map["firstList"], function(key, value){
					str += "<option value='"+value.prj_num+"'>"+value.prj_name+"</option>";
				});
        		
        		str += "<option value='0'>없음</option>";
        		
				$('#crcFormPrjName').append(str);
				
				g_current_project_number = $("#crcFormPrjName option:eq(0)").val();
				selectText = $("#crcFormPrjName option:eq(0)").text();
				g_current_project_name = selectText.replace(/\s+/g, '');
				
				$("#crcFormPrjName").on('change', function () { 
					
					g_current_project_number = $("#crcFormPrjName option:selected").val();
					
					selectText = $("#crcFormPrjName option:selected").text();
					g_current_project_name = selectText.replace(/\s+/g, '');
		        	
		      	});
				
        	}
		}
		
        function fn_initCreateRequest_cost(){
        	
        	$('#crFormRequestTeam').val(g_team_db_name);
        	$('#crFormRequester').val(g_member_name);
        	
        	$('#id_costApprove').attr('disabled', false);
			$('#id_costNotAllow').attr('disabled', false);
			
        	$('#crFormBusiness1').attr('disabled',true);
        	$('#crFormRequestTeam').attr('disabled',true); 
        	$('#crFormRequester').attr('disabled',true); 
        	$('#crFormRequestTime').attr('disabled',true);
        	$('#crFormReceiveTeam').attr('disabled',true);
        	$('#crFormApprovalDate').attr('disabled',true);
        	
        	var today = new Date();
        	var curr_date = today.getDate();
            var curr_month = today.getMonth();
            curr_month = curr_month + 1;
            var curr_year = today.getFullYear();
            var curr_min = today.getMinutes();
            var curr_hr= today.getHours();
            var curr_sc= today.getSeconds();
            if(curr_month.toString().length == 1)
            curr_month = '0' + curr_month;      
            if(curr_date.toString().length == 1)
            curr_date = '0' + curr_date;
            if(curr_hr.toString().length == 1)
            curr_hr = '0' + curr_hr;
            if(curr_min.toString().length == 1)
            curr_min = '0' + curr_min;
            if(curr_sc.toString().length == 1)
            	curr_sc = '0' + curr_sc;
            
        	var varTemp =  curr_year + "-" + curr_month +"-" + curr_date + " " + curr_hr + ":" + curr_min + ":" + curr_sc;
        	$('#crFormRequestTime').val(varTemp);
        	
        	$("#crFormProductTeam").find("option").remove();
        	$("#crFormPrjName").find("option").remove();
        	
        	var str = "";
        	$.each(g_teamNameArray, function(index, value){
				str += "<option>"+value+"</option>";
			});
			
			str += "<option>없음</option>";
			
			$('#crFormProductTeam').append(str);
			$('#crFormPrjName').append("<option value='0'>없음</option>");
			
			$('#crFormProductTeam').val("없음").prop("selected", true);
			$('#crFormPrjName').val("없음").prop("selected", true);
			g_current_product_team = "없음";
			g_current_project_name = "없음";
			$('#crFormDeadLine').val("");
			$('#crFormRequestDetails').val("");
			$('#crFormNotAllowDetails').val("");
			$('#crFormContents').val("");
			
			$('#selectFileDivCost').empty();
			$('#fileDivCost').empty();
        	
        	
        }
        
		function fn_initCreateRequest_car(){
        	
			$('#id_divRentCost').show();
			if(g_team_db_name != "관리본부"){
				$('#id_divRentCost').hide();
			}
			
        	$('#crcFormRequestTeam').val(g_team_db_name);
        	$('#crcFormRequester').val(g_member_name);
        	$('#crcFormUseOrder').val("사용전");
        	
        	$('#crcFormBusiness1').attr('disabled',true);
        	$('#crcFormRequestTeam').attr('disabled',true); 
        	$('#crcFormRequester').attr('disabled',true); 
        	$('#crcFormRequestTime').attr('disabled',true);
        	
        	$('#crcFormApprovalDate').attr('disabled',true);
        	$('#crcFormUseOrder').attr('disabled',true);
        	
//         	$('#crcFormReceiveTeam').attr('disabled',true);
        	
        	var today = new Date();
        	var curr_date = today.getDate();
            var curr_month = today.getMonth();
            curr_month = curr_month + 1;
            var curr_year = today.getFullYear();
            var curr_min = today.getMinutes();
            var curr_hr= today.getHours();
            var curr_sc= today.getSeconds();
            if(curr_month.toString().length == 1)
            curr_month = '0' + curr_month;      
            if(curr_date.toString().length == 1)
            curr_date = '0' + curr_date;
            if(curr_hr.toString().length == 1)
            curr_hr = '0' + curr_hr;
            if(curr_min.toString().length == 1)
            curr_min = '0' + curr_min;
            if(curr_sc.toString().length == 1)
            	curr_sc = '0' + curr_sc;
            
        	var varTemp =  curr_year + "-" + curr_month +"-" + curr_date + " " + curr_hr + ":" + curr_min + ":" + curr_sc;
        	$('#crcFormRequestTime').val(varTemp);
        	
        	$("#crcFormProductTeam").find("option").remove();
        	$("#crcFormPrjName").find("option").remove();
        	
        	var str = "";
        	$.each(g_teamNameArray, function(index, value){
				str += "<option>"+value+"</option>";
			});
			
        	$('#crcFormDriverTeam').append(str);
        	
			str += "<option>없음</option>";
			
			$('#crcFormProductTeam').append(str);
			$('#crcFormPrjName').append("<option>없음</option>");
			
			$('#crcFormProductTeam').val("없음").prop("selected", true);
			$('#crcFormPrjName').val("없음").prop("selected", true);
			$('#crcFormDeadLine').val("");
			$('#crcFormStartTime').val("");
			$('#crcFormEndTime').val("");
			$('#crcFormRequestDetails').val("");
			$('#crcFormNotAllowDetails').val("");
			
			$('#selectFileDivCar').empty();
			$('#fileDivCar').empty();
        	
        }
		
		function fn_initCreateRequest_normal(){
        	
        	$('#crnFormRequestTeam').val(g_team_db_name);
        	$('#crnFormRequester').val(g_member_name);
        	
        	$('#crnFormUseOrder').val("");
        	
        	$('#crnFormBusiness1').attr('disabled',true);
        	$('#crnFormRequestTeam').attr('disabled',true); 
        	$('#crnFormRequester').attr('disabled',true); 
        	$('#crnFormRequestTime').attr('disabled',true);
        	$('#crnFormApprovalDate').attr('disabled',true);
        	$('#crnFormUseOrder').attr('disabled',true);
        	
        	var today = new Date();
        	var curr_date = today.getDate();
            var curr_month = today.getMonth();
            curr_month = curr_month + 1;
            var curr_year = today.getFullYear();
            var curr_min = today.getMinutes();
            var curr_hr= today.getHours();
            var curr_sc= today.getSeconds();
            if(curr_month.toString().length == 1)
            curr_month = '0' + curr_month;      
            if(curr_date.toString().length == 1)
            curr_date = '0' + curr_date;
            if(curr_hr.toString().length == 1)
            curr_hr = '0' + curr_hr;
            if(curr_min.toString().length == 1)
            curr_min = '0' + curr_min;
            if(curr_sc.toString().length == 1)
            	curr_sc = '0' + curr_sc;
            
        	var varTemp =  curr_year + "-" + curr_month +"-" + curr_date + " " + curr_hr + ":" + curr_min + ":" + curr_sc;
        	$('#crnFormRequestTime').val(varTemp);
        	
        	$("#crnFormReceiveTeam").find("option").remove();
        	
        	var str = "";
        	$.each(g_teamNameArray, function(index, value){
				str += "<option>"+value+"</option>";
			});
			
        	$('#crnFormReceiveTeam').append(str);
        	
			$('#crnFormReceiveTeam').val("관리본부").prop("selected", true);
			g_current_receive_team = "관리본부";
			$('#crnFormDeadLine').val("");
			$('#crnFormStartTime').val("");
			$('#crnFormEndTime').val("");
			$('#crnFormRequestDetails').val("");
			$('#crnFormNotAllowDetails').val("");
			
			fn_getMembersNormal();
			
			fn_set_crnFormBusiness2();
			
			$('#selectFileDivNormal').empty();
			$('#fileDivNormal').empty();
        }
        
		function fn_selectTeamReceiveRequest(){
        	
//         	$("#id_request_title").text("기준년: "+ g_s_year + ",   기준월: "+ g_s_month + ",  소속팀: " + 
//         			g_current_team_name + ",  팀원: " + g_current_member_name);
        	
        	var comAjax = new ComAjax();
        	comAjax.setUrl("<c:url value='/selectTeamReceiveRequest.do' />");
        	
        	comAjax.addParam("g_s_year", g_s_year);
        	comAjax.addParam("g_s_month", g_s_month);
        	comAjax.addParam("g_team_db_name", g_current_team_name);
        	comAjax.addParam("g_business_field_1", g_business_field_1);
        	comAjax.addParam("g_request_status", g_request_status);
        	
        	comAjax.setCallback("fn_selectTeamReceiveRequest_Callback");
        	comAjax.ajax();
        }
		
		function fn_selectTeamReceiveRequest_Callback(data){
			
			var success = data.map["success"];
        	
        	if(!success){
        		var errorString = data.map["fail_desc"];
        		alert('error: ' + errorString); 
        	}else{
        		
        		// first //////////////////////////////////////////////////////////////////////
        		var list_count = data.map["firstListCount"];
	        	
	        	var body = $("#id_requestTable > tbody");
				body.empty();
				if(list_count == 0){
					var str = "<tr>" + 
									"<td colspan='11'>조회된 결과가 없습니다.</td>" + 
								"</tr>";
					body.append(str);
				}
				else{
					
					var str = "";
					$.each(data.map["firstList"], function(key, value){
						str += "<tr>" + 
						"<td>" + value.request_num + "</td>" +
						"<td>" + value.requester_name + "</td>" +
						"<td>" + value.request_team + "</td>" + 
						"<td>" + value.reviewer_name + "</td>" + 
						"<td>" + value.review_team + "</td>" + 
						"<td>" + value.status + "</td>" +
						"<td>" + value.request_time + "</td>" +
						"<td>" + value.approval_date + "</td>" +
						"<td>" + value.business_field_1 + "</td>" +
						"<td>" + value.business_field_2 + "</td>" +
						"<td>" + value.use_order + "</td>" +
						"</tr>";
					});
					body.append(str);
					
					$('#id_requestTable tbody tr').bind('click', function(e) {
		    			$(e.currentTarget).siblings().children('td, th').css('background-color','#ffffff');
		    			$(e.currentTarget).children('td, th').css('background-color','#fcf8e3');
		    			
		    			$(this).find("td").each(function(i, item){ 
		    				if(i==0){ 
		    					g_current_request_num = $.trim($(item).html());
		    				}
		    				if(i==5){ 
		    					g_current_request_status = $.trim($(item).html());
		    				}
		    				if(i==8){ 
		    					g_current_business_field_1 = $.trim($(item).html());
		    				}
		    				
		    			});
	    			
	    			}); 
				}
				
        	}
		}
		
        function fn_selectReceiveRequest(){
        	
//         	$("#id_request_title").text("기준년: "+ g_s_year + ",   기준월: "+ g_s_month + ",  소속팀: " + 
//         			g_current_team_name + ",  팀원: " + g_current_member_name);
        	
        	var comAjax = new ComAjax();
        	comAjax.setUrl("<c:url value='/selectReceiveRequest.do' />");
        	
        	comAjax.addParam("g_s_year", g_s_year);
        	comAjax.addParam("g_s_month", g_s_month);
        	comAjax.addParam("g_team_db_name", g_current_team_name);
        	comAjax.addParam("g_member_name", g_current_member_name);
        	comAjax.addParam("g_business_field_1", g_business_field_1);
        	comAjax.addParam("g_request_status", g_request_status);
        	
        	comAjax.setCallback("fn_selectReceiveRequest_Callback");
        	comAjax.ajax();
        }
		
		function fn_selectReceiveRequest_Callback(data){
			
			var success = data.map["success"];
        	
        	if(!success){
        		var errorString = data.map["fail_desc"];
        		alert('error: ' + errorString); 
        	}else{
        		
        		// first //////////////////////////////////////////////////////////////////////
        		var list_count = data.map["firstListCount"];
	        	
	        	var body = $("#id_requestTable > tbody");
				body.empty();
				if(list_count == 0){
					var str = "<tr>" + 
									"<td colspan='11'>조회된 결과가 없습니다.</td>" + 
								"</tr>";
					body.append(str);
				}
				else{
					
					var str = "";
					$.each(data.map["firstList"], function(key, value){
						str += "<tr>" + 
						"<td>" + value.request_num + "</td>" +
						"<td>" + value.requester_name + "</td>" +
						"<td>" + value.request_team + "</td>" + 
						"<td>" + value.reviewer_name + "</td>" + 
						"<td>" + value.review_team + "</td>" + 
						"<td>" + value.status + "</td>" +
						"<td>" + value.request_time + "</td>" +
						"<td>" + value.approval_date + "</td>" +
						"<td>" + value.business_field_1 + "</td>" +
						"<td>" + value.business_field_2 + "</td>" +
						"<td>" + value.use_order + "</td>" +
						"</tr>";
					});
					body.append(str);
					
					$('#id_requestTable tbody tr').bind('click', function(e) {
		    			$(e.currentTarget).siblings().children('td, th').css('background-color','#ffffff');
		    			$(e.currentTarget).children('td, th').css('background-color','#fcf8e3');
		    			
		    			$(this).find("td").each(function(i, item){ 
		    				if(i==0){ 
		    					g_current_request_num = $.trim($(item).html());
		    				}
		    				if(i==5){ 
		    					g_current_request_status = $.trim($(item).html());
		    				}
		    				if(i==8){ 
		    					g_current_business_field_1 = $.trim($(item).html());
		    				}
		    				
		    			});
	    			
	    			}); 
				}
				
        	}
		}
		
		function fn_selectRequestPerRequestNumber(){
        	
        	var comAjax = new ComAjax();
        	comAjax.setUrl("<c:url value='/selectRequestPerRequestNumber.do' />");
        	
        	comAjax.addParam("g_current_request_num", g_current_request_num);
        	
        	comAjax.setCallback("fn_selectRequestPerRequestNumber_Callback");
        	comAjax.ajax();
        }
		
		function fn_selectRequestPerRequestNumber_Callback(data){
			
			var success = data.map["success"];
			var isData = data.map["isData"];
			var tempText = "";
        	
        	if(!success){
        		var errorString = data.map["fail_desc"];
        		alert('error: ' + errorString); 
        	}else{
        		
        		if(isData){
					
        			g_current_request_prg_num = data.map["map"]["request_prg_num"];
        			
					if(g_current_request_mod == "cost"){ //재무
					
						$('#crFormBusiness2').val(data.map["map"]["business_field_2"]).prop("selected", true);
	    		        $('#crFormBusiness2Etc').val(data.map["map"]["business_field_2_etc"]);
		            	$('#crFormRequestTeam').val(data.map["map"]["request_team"]);
		                $('#crFormRequester').val(data.map["map"]["requester_name"]);
		                $('#crFormReceiveTeam').val(data.map["map"]["review_team"]).prop("selected", true);
		                $('#crFormRequestTime').val(data.map["map"]["request_time"]);
		                $('#crFormDeadLine').val(data.map["map"]["deadline"]);
		                $('#crFormApprovalDate').val(data.map["map"]["approval_date"]);
		                $('#crFormRequestDetails').val(data.map["map"]["request_details"]);
		                $('#crFormApproveDetails').val(data.map["map"]["approve_details"]);
		                $('#crFormNotAllowDetails').val(data.map["map"]["notallow_details"]);
		                $('#crFormProductTeam').val(data.map["map"]["product_team"]).prop("selected", true);
		                $('#crFormPrjName').find("option").remove();
		                tempText = "<option value='"+data.map["map"]["prj_num"]+"'>"+data.map["map"]["prj_name"]+"</option>"
		                $('#crFormPrjName').append(tempText);
		             
		                fn_selectCostDetailPerRequestPRGNumber();
		                
		                if(g_searchKind == 6){
							$('#id_costRetry').show();
							$('#addFileDivCost').show();
						}
		              
					}else if(g_current_request_mod == "car"){ //업무용차량신청
						
						var varText = data.map["map"]["use_order"];
						varText = varText.replace(/\s+/g, '');
						
						if(g_searchKind == 5 && varText == "사용전"){
							$('#id_carRetry').show();
							$('#addFileDivCar').show();
						}
						
						if(g_searchKind == 6){
							$('#id_carRetry').show();
							$('#addFileDivCar').show();
						}
						
						$('#crcFormBusiness1').val(data.map["map"]["business_field_1"]).prop("selected", true);
						$('#crcFormRequestTeam').val(data.map["map"]["request_team"]);
		                $('#crcFormRequester').val(data.map["map"]["requester_name"]);
		                $('#crcFormReceiveTeam').val(data.map["map"]["review_team"]).prop("selected", true);
		                $('#crcFormRequestTime').val(data.map["map"]["request_time"]);
		                $('#crcFormStartTime').val(data.map["map"]["start_time"]);
		                $('#crcFormEndTime').val(data.map["map"]["end_time"]);
		                $('#crcFormDeadLine').val(data.map["map"]["deadline"]);
		                $('#crcFormApprovalDate').val(data.map["map"]["approval_date"]);
		                $('#crcFormRequestDetails').val(data.map["map"]["request_details"]);
		                $('#crcFormApproveDetails').val(data.map["map"]["approve_details"]);
		                $('#crcFormNotAllowDetails').val(data.map["map"]["notallow_details"]);
		                $('#crcFormProductTeam').val(data.map["map"]["product_team"]).prop("selected", true);
		                g_current_product_team = data.map["map"]["product_team"];
		                $('#crcFormPrjName').find("option").remove();
		                tempText = "<option value='"+data.map["map"]["prj_num"]+"'>"+data.map["map"]["prj_name"]+"</option>"
		                $('#crcFormPrjName').append(tempText);
		                g_current_project_number = data.map["map"]["prj_num"];
		                g_current_project_name = data.map["map"]["prj_name"];
		                $('#crcFormUseOrder').val(data.map["map"]["use_order"]);
		                $('#crcFormDriverTeam').val(data.map["map"]["driver_team"]).prop("selected", true);
		                
		                $('#crcFormDriver').find("option").remove();
		                tempText = "<option>"+data.map["map"]["driver"]+"</option>"
		                $('#crcFormDriver').append(tempText);
		                
		                $('#crcFormCompanion').val(data.map["map"]["companion"]);
		                $('#crcFormReason').val(data.map["map"]["business_trip_reason"]);
		                $('#crcFormTripArea').val(data.map["map"]["business_trip_area"]);
		                $('#crcFormDesiredCar').val(data.map["map"]["desired_car"]);
		                $('#crcFormBeforeDistance').val(data.map["map"]["before_running_distance"]);
		                $('#crcFormAfterDistance').val(data.map["map"]["after_running_distance"]);
		                $('#crcFormUseCar').val(data.map["map"]["use_car"]);
		                $('#crcFormFuelStatus').val(data.map["map"]["fuel_status"]).prop("selected", true);
		                $('#crcFormCleanInner').val(data.map["map"]["clean_inner"]).prop("selected", true);
		                $('#crcFormFuelStatus').val(data.map["map"]["fuel_status"]).prop("selected", true);
		                $('#crcFormTakePhoto').val(data.map["map"]["take_photo_four_sides"]).prop("selected", true);
		                $('#crcFormRentCost').val(data.map["map"]["internal_car_rent_cost"]);
		                
		                fn_selectRequestFiles();
						
					}else if(g_current_request_mod == "normal"){//일반업무
						
						var varText = data.map["map"]["use_order"];
						varText = varText.replace(/\s+/g, '');
						
						if(g_searchKind == 5 && varText == "사용전"){
							$('#id_normalRetry').show();
							$('#addFileDivNormal').show();
						}
						
						if(g_searchKind == 6){
							$('#id_normalRetry').show();
							$('#addFileDivNormal').show();
						}
						
						$('#crnFormBusiness1').val(data.map["map"]["business_field_1"]).prop("selected", true);
						$('#crnFormBusiness1Etc').val(data.map["map"]["business_field_1_etc"]);
						$('#crnFormBusiness2').find("option").remove();
			            tempText = "<option>"+data.map["map"]["business_field_2"]+"</option>"
			            $('#crnFormBusiness2').append(tempText);
						$('#crnFormBusiness2Etc').val(data.map["map"]["business_field_2_etc"]);
						$('#crnFormRequestTeam').val(data.map["map"]["request_team"]);
		                $('#crnFormRequester').val(data.map["map"]["requester_name"]);
		                
		                $("#crnFormReceiveTeam").find("option").remove();
		    			$('#crnFormReceiveTeam').append("<option>"+data.map["map"]["review_team"]+"</option>");
		    			$('#crnFormReceiveTeam').val(data.map["map"]["review_team"]).prop("selected", true);
		    			g_current_receive_team = data.map["map"]["review_team"];
		    			
		    			$("#crnFormReceiver").find("option").remove();
		    			$('#crnFormReceiver').append("<option>"+data.map["map"]["reviewer_name"]+"</option>");
		    			$('#crnFormReceiver').val(data.map["map"]["reviewer_name"]).prop("selected", true);
		    			g_current_receiver = data.map["map"]["reviewer_name"];
		    			
		                $('#crnFormUseOrder').val(data.map["map"]["use_order"]);
		                $('#crnFormRequestTime').val(data.map["map"]["request_time"]);
		                $('#crnFormStartTime').val(data.map["map"]["start_time"]);
		                $('#crnFormEndTime').val(data.map["map"]["end_time"]);
		                $('#crnFormDeadLine').val(data.map["map"]["deadline"]);
		                $('#crnFormApprovalDate').val(data.map["map"]["approval_date"]);
		                $('#crnFormRequestDetails').val(data.map["map"]["request_details"]);
		                $('#crnFormApproveDetails').val(data.map["map"]["approve_details"]);
		                $('#crnFormNotAllowDetails').val(data.map["map"]["notallow_details"]);
		                
		                fn_selectRequestFiles();
					}
					
				}
				
        	}
		}
		
	function fn_selectCostDetailPerRequestPRGNumber(){
	 		
			var comAjax = new ComAjax();
        	comAjax.setUrl("<c:url value='/selectCostDetailPerRequestPRGNumber.do' />");
        	comAjax.addParam("g_current_request_prg_num", g_current_request_prg_num);
        	comAjax.setCallback("fn_selectCostDetailPerRequestPRGNumber_CallBack");
        	comAjax.ajax();
        	
	 	}
		
	 	function fn_selectCostDetailPerRequestPRGNumber_CallBack(data){
			var success = data.map["success"];
			var isData = data.map["isData"];
        	
        	if(!success){
        		var errorString = data.map["fail_desc"];
        		alert('error: ' + errorString); 
        	}else{
        		
        		if(isData){
        			fn_set_crFormSecondClass();
					fn_set_crFormThirdClass();
					
        			g_current_cost_number =  data.map["map"]["cost_num"];
        			$('#crFormFirstClass').val(data.map["map"]["first_classification"]).prop("selected", true);
	            	$('#crFormSecondClass').val(data.map["map"]["second_classification"]).prop("selected", true);
	                $('#crFormSecondClassEtc').val(data.map["map"]["second_classification_etc"]);
	                $('#crFormThirdClass').val(data.map["map"]["third_classification"]).prop("selected", true);
	                $('#crFormThirdClassEtc').val(data.map["map"]["third_classification_etc"]);
	                $('#crFormContents').val(data.map["map"]["contents"]);
	                $('#crFormUseDay').val(data.map["map"]["use_day"]);
	                $('#crFormDivision').val(data.map["map"]["division"]).prop("selected", true);
	                $('#crFormAmountUsed').val(data.map["map"]["amount_used"]);
	                
	                fn_selectCostFiles();
	                	
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
        		
    			$('#selectFileDivCost').empty();
    			$('#fileDivCost').empty();
		        	
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
				$('#selectFileDivCost').append(str);
				
				$("a[name='file']").on("click", function(e){ //파일 이름
					e.preventDefault();
					fn_downloadCostFile($(this));
				});
				
				if(g_searchKind == 6){
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
	 	}
	 	
function fn_selectRequestFiles(){
	 		
			var comAjax = new ComAjax();
        	comAjax.setUrl("<c:url value='/selectRequestFiles.do' />");
        	comAjax.addParam("g_current_request_num",g_current_request_num);
        	comAjax.setCallback("fn_selectRequestFiles_CallBack");
        	comAjax.ajax();
	 	}
	 	
	 	function fn_selectRequestFiles_CallBack(data){
			var success = data.map["success"];
			
        	if(!success){
        		var errorString = data.map["fail_desc"];
        		alert('error: ' + errorString); 
        	}else{
        		
        		if(g_current_request_mod == "car"){ //업무용차량신청
        			$('#selectFileDivCar').empty();
        			$('#fileDivCar').empty();
        		}else{
        			$('#selectFileDivNormal').empty();
        			$('#fileDivNormal').empty();
        		}
    				
				var str = "";
				
				$.each(data.map["firstList"], function(key, value){
					str += "<p>" + 
					"<input type='hidden' id='storage_file_name' name='file' value='"+value.storage_file_name+"'>" +
					"<input type='hidden' id='folder_name' name='file' value='"+value.folder_name+"'>" +
					"<a href='#this' id='name_"+value.file_num+"' name='file'>"+value.original_file_name + "</a> (" + value.file_size+"kb)" +
					"<a href='#this class='btn' id='delete_"+value.file_num+"' name='delete_"+value.file_num+"' fileNum='"+value.file_num+"'>삭제</a>" +
					 "</p>";
				});
				
				if(g_current_request_mod == "car"){ //업무용차량신청
					$('#selectFileDivCar').append(str);	
				}else{
					$('#selectFileDivNormal').append(str);
				}
				
				$("a[name='file']").on("click", function(e){ //파일 이름
					e.preventDefault();
					fn_downloadRequestFile($(this));
				});
				
				if(g_searchKind == 6){
					$("a[name^='delete']").on("click", function(e){ //삭제 버튼
						e.preventDefault();
						fn_deleteFileDB($(this));
						var $dataFileNum = 0;
						 //$dataFileNum = $(this).data('fileNum');
						$dataFileNum = parseInt($(this).attr('fileNum'));
						fn_deleteRequestFileUpdate($dataFileNum);
					});
				}
	    		
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
		
	function fn_deleteRequestFileUpdate($dataFileNum){
	 		
	 		var comAjax = new ComAjax();
        	comAjax.setUrl("<c:url value='/deleteRequestFileUpdate.do' />");
        	
        	comAjax.addParam("dataFileNum", $dataFileNum);
			comAjax.setCallback("fn_deleteRequestFileUpdate_Callback");
        	comAjax.ajax();
        	
	 	}
	 	
		function fn_deleteRequestFileUpdate_Callback(data){
        	
        	var success = data.map["success"];
        	
        	if(!success){
        		var errorString = data.map["fail_desc"];
        		alert('error: ' + errorString); 
        	}else{
        		alert('Request file delete success');
        	}
        }
		
		function fn_downloadCostFile(obj){
			var storage_file_name = obj.parent().find("#storage_file_name").val();
			var folder_name = obj.parent().find("#folder_name").val();
			var comDownloadSubmit = new ComDownloadSubmit();
			comDownloadSubmit.setUrl("<c:url value='/common/downloadCostFile.do' />");
			comDownloadSubmit.addParam("storage_file_name", storage_file_name);
			comDownloadSubmit.addParam("folder_name", folder_name);
			comDownloadSubmit.submit();
		}
		
		function fn_downloadRequestFile(obj){
			var storage_file_name = obj.parent().find("#storage_file_name").val();
			var folder_name = obj.parent().find("#folder_name").val();
			var comDownloadSubmit = new ComDownloadSubmit();
			comDownloadSubmit.setUrl("<c:url value='/common/downloadRequestFile.do' />");
			comDownloadSubmit.addParam("storage_file_name", storage_file_name);
			comDownloadSubmit.addParam("folder_name", folder_name);
			comDownloadSubmit.submit();
		}
		
		 function fn_selectRequest(){
			 
// 			 $("#id_request_title").text("기준년: "+ g_s_year + ",   기준월: "+ g_s_month + ",  소속팀: " + 
// 					 g_current_team_name + ",  팀원: " + g_current_member_name);

			 
	        	var comAjax = new ComAjax();
	        	comAjax.setUrl("<c:url value='/selectRequest.do' />");
	        	
	        	comAjax.addParam("g_s_year", g_s_year);
	        	comAjax.addParam("g_s_month", g_s_month);
	        	comAjax.addParam("g_team_db_name", g_current_team_name);
	        	comAjax.addParam("g_member_name", g_current_member_name);
	        	comAjax.addParam("g_business_field_1", g_business_field_1);
	        	comAjax.addParam("g_request_status", g_request_status);
	        	
	        	comAjax.setCallback("fn_selectRequest_Callback");
	        	comAjax.ajax();
	        }
			
			function fn_selectRequest_Callback(data){
				
				var success = data.map["success"];
	        	
	        	if(!success){
	        		var errorString = data.map["fail_desc"];
	        		alert('error: ' + errorString); 
	        	}else{
	        		
	        		// first //////////////////////////////////////////////////////////////////////
	        		var list_count = data.map["firstListCount"];
		        	
		        	var body = $("#id_requestTable > tbody");
					body.empty();
					if(list_count == 0){
						var str = "<tr>" + 
										"<td colspan='11'>조회된 결과가 없습니다.</td>" + 
									"</tr>";
						body.append(str);
					}
					else{
						
						var str = "";
						$.each(data.map["firstList"], function(key, value){
							str += "<tr>" + 
							"<td>" + value.request_num + "</td>" +
							"<td>" + value.requester_name + "</td>" +
							"<td>" + value.request_team + "</td>" + 
							"<td>" + value.reviewer_name + "</td>" + 
							"<td>" + value.review_team + "</td>" + 
							"<td>" + value.status + "</td>" +
							"<td>" + value.request_time + "</td>" +
							"<td>" + value.approval_date + "</td>" +
							"<td>" + value.business_field_1 + "</td>" +
							"<td>" + value.business_field_2 + "</td>" +
							"<td>" + value.use_order + "</td>" +
							"</tr>";
						});
						body.append(str);
						
						$('#id_requestTable tbody tr').bind('click', function(e) {
			    			$(e.currentTarget).siblings().children('td, th').css('background-color','#ffffff');
			    			$(e.currentTarget).children('td, th').css('background-color','#fcf8e3');
			    			
			    			$(this).find("td").each(function(i, item){ 
			    				if(i==0){ 
			    					g_current_request_num = $.trim($(item).html());
			    				}
			    				if(i==5){ 
			    					g_current_request_status = $.trim($(item).html());
			    				}
			    				if(i==8){ 
			    					g_current_business_field_1 = $.trim($(item).html());
			    				}
			    			});
		    			
		    			}); 
					}
					
	        	}
			}
		
        function fn_setCurrentYearMonth(){
        	
        	var d = new Date();
            n = d.getMonth();
            n++;
            y = d.getFullYear();
            
            g_s_year = y.toString();
            g_s_month = n.toString();
        	$('#id_s_year').val(y).prop("selected", true);
        	$('#id_s_month').val(n).prop("selected", true);
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
					g_teamNameArray.push(value.team_name);
				});
				
				str += "<option>전체</option>";
				
				$('#id_s_team_name').append(str);
			}
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
        	g_member_name = data.map["sessionMap"]["MEMBER_NAME"];
        	var team_db_name = data.map["sessionMap"]["TEAM_NAME"];
        	g_authority = data.map["sessionMap"]["AUTHORITY"];
        	g_employee_num = data.map["sessionMap"]["EMPLOYEE_NUM"];
        	
        	g_member_name = g_member_name.replace(/\s+/g, '');
        	team_db_name = team_db_name.replace(/\s+/g, '');
        	g_team_db_name = team_db_name;
        	
        	if(session_data){
        		
        		pageChange(g_authority);

        		$('#id_s_team_name').attr('disabled', false);
				$('#id_s_member').attr('disabled', false);
				
				$('#id_team_receive_search').show();
				$('#id_team_receive_approve_search').show();
				$('#id_team_receive_refuse_search').show();
				
				if( g_authority != 'A'){
					$('#id_s_team_name').attr('disabled',true);
					$('#id_s_member').attr('disabled',true);
					
				}
				
				if(g_team_db_name != "관리본부" && g_team_db_name != "PM팀"){
					
					$('#id_team_receive_search').hide();
					$('#id_team_receive_approve_search').hide();
					$('#id_team_receive_refuse_search').hide();
					
				}
				
				$('#id_s_team_name').val(g_team_db_name).prop("selected", true);
           }
        	
		}
		
		//session get Members
		function fn_getMembers(){
        	var comAjax = new ComAjax();
        	comAjax.setUrl("<c:url value='/selectMembersPerTeam.do' />");
        	comAjax.addParam("g_team_db_name", g_team_db_name);
        	comAjax.setCallback("fn_getMembersCallback");
        	comAjax.ajax();
        }
        
		function fn_getMembersCallback(data){
				
			var list_count = data.map["list_count"];
        	
			if(list_count != 0){
				
				$("#id_s_member").find("option").remove();
	        	
				var str = "";
				$.each(data.map["list"], function(key, value){
					str += "<option>"+value.member_name+"</option>";
				});
				
				str += "<option>전체</option>";
				
				$('#id_s_member').append(str);
			}
				
			$('#id_s_member').val(g_member_name).prop("selected", true);
        }
		
		//change get Members
		function fn_getMembersChange(){
        	var comAjax = new ComAjax();
        	comAjax.setUrl("<c:url value='/selectMembersPerTeam.do' />");
        	comAjax.addParam("g_team_db_name", g_current_team_name);
        	comAjax.setCallback("fn_getMembersChangeCallback");
        	comAjax.ajax();
        }
        
		function fn_getMembersChangeCallback(data){
				
			var list_count = data.map["list_count"];
        	
			if(list_count != 0){
				
				$("#id_s_member").find("option").remove();
	        	
				var str = "";
				$.each(data.map["list"], function(key, value){
					str += "<option>"+value.member_name+"</option>";
				});
				
				str += "<option>전체</option>";
				
				$('#id_s_member').append(str);
			}
				
			$("#id_s_member option:eq(0)").attr("selected", "selected");
        }
		
		//create car request change get Members
		function fn_getMembersCar(){
        	var comAjax = new ComAjax();
        	comAjax.setUrl("<c:url value='/selectMembersPerTeam.do' />");
        	comAjax.addParam("g_team_db_name", g_current_driver_team);
        	comAjax.setCallback("fn_getMembersCarCallback");
        	comAjax.ajax();
        }
        
		function fn_getMembersCarCallback(data){
				
			var list_count = data.map["list_count"];
        	
			$("#crcFormDriver").find("option").remove();
			if(list_count != 0){
				
				var str = "";
				$.each(data.map["list"], function(key, value){
					str += "<option>"+value.member_name+"</option>";
				});
				
				$('#crcFormDriver').append(str);
			}
				
			$("#crcFormDriver option:eq(0)").attr("selected", "selected");
        }
		
		//create normal request change get Members
		function fn_getMembersNormal(){
        	var comAjax = new ComAjax();
        	comAjax.setUrl("<c:url value='/selectMembersPerTeam.do' />");
        	comAjax.addParam("g_team_db_name", g_current_receive_team);
        	comAjax.setCallback("fn_getMembersNormalCallback");
        	comAjax.ajax();
        }
        
		function fn_getMembersNormalCallback(data){
				
			var list_count = data.map["list_count"];
        	
			$("#crnFormReceiver").find("option").remove();
			if(list_count != 0){
				
				var str = "";
				$.each(data.map["list"], function(key, value){
					str += "<option>"+value.member_name+"</option>";
				});
				
				$('#crnFormReceiver').append(str);
			}
				
			$("#crnFormReceiver option:eq(0)").attr("selected", "selected");
			g_current_receiver = $("#crnFormReceiver option:eq(0)").val();
			
			//fn_set_crnFormBusiness2();
			
        }
			 
	        function fn_create(){
	        	$('#modal2').modal('show'); 
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
	        	var comAjax = new ComAjax();
	        	comAjax.setUrl("<c:url value='/logout.do' />");
	        	comAjax.setCallback("fn_logoutCallback");
	        	comAjax.ajax();
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
	        
	      	        
		</script>
    </body>
</html>