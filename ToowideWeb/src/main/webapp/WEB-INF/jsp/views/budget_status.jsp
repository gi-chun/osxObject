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
                    <a class="navbar-brand page-scroll" href="#page-top">SJP Lab</a>
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
                            <a id="menu_cost" class="page-scroll" href="budget_status.do">지출내역 및 입력</a>
                        </li>
                        <li>
                            <a id="menu_reception" class="page-scroll" href="#portfolio">업무요청 수신</a>
                        </li>
                        <li>
                            <a id="menu_dispatch" class="page-scroll" href="#contact">업무요청</a>
                        </li>
                        <li>
                            <a id="menu_member" class="page-scroll" href="listMember.do">직원</a>
                        </li>
                        <li>
                            <a id="menu_notice" class="page-scroll" href="#contact">공지사항</a>
                        </li>
                        <li>
                            <a id="menu_import" class="page-scroll" href="#contact">카드승인 데이터 적재</a>
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
      <header>
            <div class="header-content" data-pg-collapsed>
                <div class="header-content-inner">
                    <h1 id="homeHeading">예산서 및 내역서</h1>
                </div>
                <form role="form">
                    <div class="form-group">
                        <label class="control-label"> 
                            <input class="control-label" type="checkbox" value="">&nbsp;카드사용내용 입력 데이터 조회 (해당 팀명을 선택하시면 관련 데이터만 조회됨)&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                        </label>                         
                    </div>
                    
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
                        <label class="control-label" for="formInput45">팀명</label>                         
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
                    <div class="form-group"> 
                        <label class="control-label" for="formInput45">프로젝트 명</label>                         
                        <select id="id_s_project_name" class="form-control"> 
                            <option>한국전력기술</option>                             
                            <option>한국전력기술</option>                             
                            <option>한국전력기술</option>                             
                        </select>
                    </div>                     
                                        
                </form>
                
                 <div>
                <button  id="id_budget_search" class="btn btn-primary btn-xl page-scroll">조회</button>
                </div>
                
            </div>
        </header>
        <section class="no-padding" id="portfolio">
            <div class="call-to-action">
                <h1 id="homeHeading">&nbsp;기준년: 2017 &nbsp; 기준반기: 상반기 &nbsp; 프로젝트 진행 상태: 편집&nbsp;<br></h1>
            </div>
            <div class="container-fluid">
                <div>
                    <span class="label label-default">실적</span>
                    <table class="table" data-pg-collapsed> 
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
                                <th>실적률 (%)</th> 
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
                    <table class="table" data-pg-collapsed> 
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
                    <table class="table"> 
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
                    <table class="table"> 
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
        <aside class="bg-dark">
            <div class="container text-center">
                <div class="header-content-inner">
                    <h3 id="homeHeading">지출내역</h3>
                    <a id="id_show_prjInfo" class="btn btn-primary btn-xl page-scroll">지출상세내용보기 및 업데이트</a>
                    <a href="id_show_prjBudget" class="btn btn-primary btn-xl page-scroll">승인번호로 조회</a>
                </div>
            </div>
        </aside>
        <section class="no-padding" id="portfolio">
            <div class="container-fluid">
                <div>
                    <span class="label label-default">팀 상세 실적현황</span>
                    <table class="table"> 
                        <thead>
                            <tr data-pg-collapsed> 
                                <th>구분</th> 
                                <th>프로젝트멩</th>
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
        <div class="modal fade pg-show-modal" id="modal2" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog"> 
                <div class="modal-content"> 
                    <div class="modal-header"> 
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>                         
                        <h4 class="modal-title">지출내역 조회 및 업데이트</h4> 
                    </div>                     
                    <div class="modal-body"> 
                        <p>&nbsp;</p>
                        <form role="form"> 
                            <div class="form-group"> 
                                <label class="control-label" for="exampleInputEmail1">프로젝트 명</label>                                 
                                <input type="email" class="form-control" id="exampleInputEmail1" placeholder="프로젝트 명"> 
                            </div>
                            <div class="form-group" data-pg-collapsed> 
                                <label class="control-label" for="formInput49">제작팀</label>                                 
                                <select id="formInput49" class="form-control"> 
                                    <option>연출1팀</option>                                     
                                    <option>연출2팀</option>                                     
                                    <option>연출3팀</option>
                                    <option>허니티브</option>
                                    <option>투와이드미디어</option>
                                    <option>외주제작</option>
                                </select>
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="exampleInputEmail1">사용자 (ex: 홍길동, 이름만 기입)
                                    <br>
                                </label>
                                <input type="email" class="form-control" id="exampleInputEmail1" placeholder=""> 
                            </div>
                            <div class="form-group" data-pg-collapsed> 
                                <label class="control-label" for="formInput49">사용자팀</label>                                 
                                <select id="formInput49" class="form-control"> 
                                    <option>연출1팀</option>                                     
                                    <option>연출2팀</option>                                     
                                    <option>연출3팀</option>
                                    <option>허니티브</option>
                                    <option>투와이드미디어</option>
                                    <option>외주제작</option>
                                </select>
                            </div>
                            <div class="form-group" data-pg-collapsed> 
                                <label class="control-label" for="formInput49">비용 대분류</label>                                 
                                <select id="formInput49" class="form-control"> 
                                    <option>외부 외주비</option>                                     
                                    <option>진행비</option>                                     
                                    <option>내부비</option>
                                </select>
                            </div>
                            <div class="form-group" data-pg-collapsed> 
                                <label class="control-label" for="formInput49">비용 중분류</label>                                 
                                <select id="formInput49" class="form-control" data-pg-collapsed> 
                                    <option>차량비</option>                                     
                                    <option>촬영1팀</option>                                     
                                    <option>촬영2팀</option>
                                </select>
                                <label class="control-label" for="exampleInputEmail1">비용 중분류 기타입력 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                                    <br>
                                </label>
                                <input type="email" class="form-control" id="exampleInputEmail1" placeholder="">
                            </div>
                            <div class="form-group" data-pg-collapsed> 
                                <label class="control-label" for="formInput49">비용 소분류</label>                                 
                                <select id="formInput49" class="form-control" data-pg-collapsed> 
                                    <option>차량비</option>                                     
                                    <option>촬영1팀</option>                                     
                                    <option>촬영2팀</option>
                                </select>
                                <label class="control-label" for="exampleInputEmail1">비용 소분류 기타입력 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                                    <br>
                                </label>
                                <input type="email" class="form-control" id="exampleInputEmail1" placeholder="">
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="exampleInputEmail1">내용 ( 최대 한글 100자)</label>
                                <textarea class="form-control" rows="3"></textarea>
                            </div>
                            <div class="form-group" data-pg-collapsed> 
                                <label class="control-label" for="formInput49">내용입력완료</label>                                 
                                <select id="formInput49" class="form-control"> 
                                    <option>Y</option>                                     
                                    <option>N</option>                                     
                                </select>
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="exampleInputEmail1">사용일 (ex: 20170522, yyyymmdd 8자리 숫자입력)</label>                                 
                                <input type="email" class="form-control" id="exampleInputEmail1" placeholder="yyyymmdd"> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="exampleInputEmail1">카드번호</label>                                 
                                <input type="email" class="form-control" id="exampleInputEmail1" placeholder=""> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="exampleInputEmail1">승인번호</label>                                 
                                <input type="email" class="form-control" id="exampleInputEmail1" placeholder=""> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="exampleInputEmail1">가맹점명</label>                                 
                                <input type="email" class="form-control" id="exampleInputEmail1" placeholder=""> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="exampleInputEmail1">이용금액&nbsp;</label>                                (단위 원 - won)

                                <input type="email" class="form-control" id="exampleInputEmail1" placeholder="">
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="exampleInputFile">File input</label>
                                <input type="file" id="exampleInputFile"> 
                                <p class="help-block">Example block-level help text here.</p> 
                            </div>                             
                        </form>
                    </div>                     
                    <div class="modal-footer"> 
                        <button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>                         
                        <button id="id_save" type="button" class="btn btn-primary">저장</button>                         
                    </div>                     
                </div>                 
            </div>                          
        </div>
        <aside class="bg-dark" data-pg-collapsed>
            <div class="container text-center">
                <div class="call-to-action">
</div>
            </div>
        </aside>
        <section id="contact">
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
        
        $(document).ready(function(){
			
        	$('#menu_logout').hide();
        	$('#menu_project').hide();
    		$('#menu_cost').hide();
    		$('#menu_reception').hide();
    		$('#menu_dispatch').hide();
    		
        	$('#menu_member').hide();
    		$('#menu_notice').hide();
    		$('#menu_import').hide();
    		$('#menu_verification').hide();
    		
    		fn_getSession();
    		
    		//fn_selectMemberList();
    		
    		$("#id_save").bind('click', function () { 
    			//alert('hello!'); 
    			var employee_num=$('#id_employee_num').val();
    			employee_num = employee_num.replace(/\s+/g, '');
                var member_name=$('#id_member_name').val();
                member_name = member_name.replace(/\s+/g, '');
                var email_addr=$('#id_email_addr').val();
                email_addr = email_addr.replace(/\s+/g, '');
                var password=$('#id_password').val();
                password = password.replace(/\s+/g, '');
                var team_name=$('#id_team_name').val();
                team_name = team_name.replace(/\s+/g, '');
                var position=$('#id_position').val();
                position = position.replace(/\s+/g, '');
                g_member_name = g_member_name.replace(/\s+/g, '');
             	fn_insertMemberList(employee_num, member_name, email_addr, password, team_name, position, g_member_name);
             	location.reload();
    		});
    		
    		$('#id_memberTable tbody tr').bind('click', function(e) {
    		 		$(e.currentTarget).siblings().children('td, th').css('background-color','#ffffff');
			    	$(e.currentTarget).children('td, th').css('background-color','#fcf8e3');
			    			
			    	$(this).find("td").each(function(i, item){ 
// 			    		console.log("i:"+i+"item:"+ $.trim($(item).html())); 
			    		if(i==0){ 
			    			g_employee_num = $.trim($(item).html());
			    		}
			    	});
                
    		}); 
    		
    		$("#btn_createPrj").bind('click', function () { 
        		
    			$('#modal_create_prj').modal('show');
    			
    		});
    		
			$("#id_cbModify").bind('click', function () { 
        		
    			$('#modal_create_budget').modal('show');
    			
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
    		
		});
        
        var g_member_name;
        var g_employee_num;
        
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
        	//Map<String,Object> map = data.map["sessionMap"];
        	
        	if(session_data){
        		if(team_name == team_db_name){
        			pageChange(1);
        		}else{
        			pageChange(0);
        		}
        	}
        	
		}
		
	        function fn_deleteMember(){
	        	fn_showProgress(1);
	        
	        	var comAjax = new ComAjax();
	        	comAjax.setUrl("<c:url value='/deleteMember.do' />");
	        	comAjax.addParam("EMPLOYEE_NUM",g_employee_num);
	        	comAjax.setCallback("fn_deleteMember_Callback");
	        	comAjax.ajax();
	        	
	        	fn_showProgress(0);
	        }
	        
			function fn_deleteMember_Callback(data){
	        	
	        	var success = data.map["success"];
	        	
	        	if(!success){
	        		var errorString = data.map["fail_desc"];
	        		alert('error: ' + errorString); 
	        	}else{
	        		alert('delete success');
	        	}
	        }
        
	        function fn_insertMemberList($employee_num, $member_name, $email_addr, $password, $team_name, $position, $writer){
	        	fn_showProgress(1);
	        	var comAjax = new ComAjax();
	        	comAjax.setUrl("<c:url value='/insertMember.do' />");
	        	comAjax.addParam("EMPLOYEE_NUM",$employee_num);
	        	comAjax.addParam("MEMBER_NAME",$member_name);
	        	comAjax.addParam("EMAIL_ADDR",$email_addr);
	        	comAjax.addParam("PASSWORD",$password);
	        	comAjax.addParam("TEAM_NAME",$team_name);
	        	comAjax.addParam("POSITION",$position);
	        	comAjax.addParam("WRITER",$writer);
	        	comAjax.setCallback("fn_insertMemberList_Callback");
	        	comAjax.ajax();
	        	fn_showProgress(0);
	        }
	        
			function fn_insertMemberList_Callback(data){
	        	
	        	var success = data.map["success"];
	        	
	        	if(!success){
	        		var errorString = data.map["fail_desc"];
	        		alert('error: ' + errorString); 
	        	}else{
	        		alert('insert success');
	        	}
	        }
        
	        function fn_selectMemberList(){
	        	fn_showProgress(1);
	        
	        	var comAjax = new ComAjax();
	        	comAjax.setUrl("<c:url value='/selectMemberList.do' />");
	        	comAjax.setCallback("fn_selectMemberList_Callback");
	        	comAjax.ajax();
	        	
	        	fn_showProgress(0);
	        }
	        
	        function fn_selectMemberList_Callback(data){
	        	
	        	var session_data = data.map["session_data"]; //is session so 1, 0
	        	//var sessionMap= data.map["sessionMap"];
	        	g_member_name = data.map["sessionMap"]["MEMBER_NAME"];
	        	var team_name = '관리팀';
	        	var team_db_name = data.map["sessionMap"]["TEAM_NAME"];
	        	//Map<String,Object> map = data.map["sessionMap"];
	        	
	        	if(session_data){
	        		if(team_name == team_db_name){
	        			pageChange(1);
	        		}else{
	        			pageChange(0);
	        		}
	        	}
	        	
	        	var list_count = data.map["list_count"];
	        	//List<Map<String,Object>> list = data.map["list"];
	        	
	        	var body = $("#id_memberTable > tbody");
				body.empty();
				/* list_count  = 0; */
				if(list_count == 0){
					var str = "<tr>" + 
									"<td colspan='6'>조회된 결과가 없습니다.</td>" + 
								"</tr>";
					body.append(str);
				}
				else{
					
					var str = "";
					$.each(data.map["list"], function(key, value){
						str += "<tr>" + 
						"<td>" + value.EMPLOYEE_NUM + "</td>" +
						"<td>" + value.EMPLOYEE_NUM + "</td>" + 
						"<td>" + value.MEMBER_NAME + "</td>" + 
						"<td>" + value.EMAIL_ADDR + "</td>" + 
						"<td>" + value.TEAM_NAME + "</td>" +
						"<td>" + value.POSITION + "</td>" +
					"</tr>";
					});
					body.append(str);
					
					/* $("a[name='title']").on("click", function(e){ //제목 
						e.preventDefault();
						fn_openBoardDetail($(this));
					}); */
					
// 					$('#id_memberTable tbody tr').bind('click', function(e) {
// 			    			$(e.currentTarget).siblings().children('td, th').css('background-color','#ffffff');
// 			    			$(e.currentTarget).children('td, th').css('background-color','#fcf8e3');
			    			
// 			    			$(this).find("td").each(function(i, item){ 
// // 			    				console.log("i:"+i+"item:"+ $.trim($(item).html())); 
// 			    				if(i==0){ 
// 			    					g_employee_num = $.trim($(item).html());
// 			    				}
// 			    			});
			    			
// 			    	}); 
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
	        
	        function fn_logout(){
	        	fn_showProgress(1);
	        	var comAjax = new ComAjax();
	        	comAjax.setUrl("<c:url value='/logout.do' />");
	        	/* comAjax.setUrl("http://192.168.0.168:8282/innerPrj/login.do"); */
	        	comAjax.setCallback("fn_logoutCallback");
	        	comAjax.ajax();
	        	fn_showProgress(0);
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
	 	    		$('#menu_dispatch').hide();
	 	    		
 	        		$('#menu_member').hide();
 	        		$('#menu_notice').hide();
 	        		$('#menu_import').hide();
 	        		$('#menu_verification').hide();
	 	        	
	             } else {
	            	 alert("data fail !");
	             }
	        }
	        
	        function pageChange($isAdmin) {
	        	//idButton
	        	$('#idButton').text("로그아웃");
	        	$('#idButton').hide();
	        	
	        	$('#menu_logout').show();
	        	$('#menu_project').show();
	    		$('#menu_cost').show();
	    		$('#menu_reception').show();
	    		$('#menu_dispatch').show();
	    		
	        	if($isAdmin){
	        		$('#menu_member').show();
	        		$('#menu_notice').show();
	        		$('#menu_import').show();
	        		$('#menu_verification').show();
	        	}
	        	
	        }
	        
		</script>
    </body>
</html>