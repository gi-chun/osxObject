<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

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
        <title>Theme Template for Bootstrap</title>
        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.css" rel="stylesheet">
        <!-- Bootstrap theme -->
        <link href="css/bootstrap-theme.min.css" rel="stylesheet">
        <!-- Custom styles for this template -->
        <link href="css/theme.css" rel="stylesheet">
        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    </head>
    <body role="document">
        <!-- Fixed navbar -->
        <div class="container theme-showcase" role="main">
            <!-- Main jumbotron for a primary marketing message or call to action -->
            <div class="jumbotron">
                <h1><h2>승인내역 확인</h2></h1>
            </div>
            <div class="row">
                <div class="col-md-6" data-pg-collapsed>
                    <table class="table table-bordered">
                        <tbody>
                            <tr data-pg-collapsed>
                                <td data-pg-collapsed><b>업무분야1:</b></td>
                                <td colspan="2">${map.business_field_1 }<br></td>
                            </tr>
                            <tr data-pg-collapsed>
                                <td data-pg-collapsed><b>업무분야1 기타:</b></td>
                                <td colspan="2">${map.business_field_1_etc }<br></td>
                            </tr>
                            <tr data-pg-collapsed>
                                <td data-pg-collapsed><b>업무분야1:</b></td>
                                <td colspan="2">${map.business_field_2 }<br></td>
                            </tr>
                            <tr data-pg-collapsed>
                                <td data-pg-collapsed><b>업무분야2 기타:</b></td>
                                <td colspan="2">${map.business_field_2_etc }<br></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-md-6" data-pg-collapsed>
                    <table class="table table-bordered">
                        <tbody>
                            <tr data-pg-collapsed>
                                <td data-pg-collapsed><b>요청팀:</b></td>
                                <td colspan="2">${map.request_team }<br></td>
                            </tr>
                            <tr data-pg-collapsed>
                                <td data-pg-collapsed><b>요청자:</b></td>
                                <td colspan="2">${map.requester_name }<br></td>
                            </tr>
                            <tr data-pg-collapsed>
                                <td data-pg-collapsed><b>검토팀:</b></td>
                                <td colspan="2">${map.review_team }<br></td>
                            </tr>
                            <tr data-pg-collapsed>
                                <td data-pg-collapsed><b>검토자:</b></td>
                                <td colspan="2">${map.reviewer_name }<br></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-md-6" data-pg-collapsed>
                    <table class="table table-bordered">
                        <tbody>
                            <tr data-pg-collapsed>
                                <td data-pg-collapsed><b>요청날짜:</b></td>
                                <td colspan="2">${map.request_time }<br></td>
                            </tr>
                            <tr data-pg-collapsed>
                                <td data-pg-collapsed><b>결제희망 기한일:</b></td>
                                <td colspan="2">${map.deadline }<br></td>
                            </tr>
                            <tr data-pg-collapsed>
                                <td data-pg-collapsed><b>결제날짜:</b></td>
                                <td colspan="2">${map.approval_date }<br></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-md-6" data-pg-collapsed>
                    <table class="table table-bordered">
                        <tbody data-pg-collapsed>
                            <tr data-pg-collapsed>
                                <td data-pg-collapsed><b>요청내용:</b></td>
                                <td colspan="2">${map.request_details }<br></td>
                            </tr>
                            <tr data-pg-collapsed>
                                <td data-pg-collapsed><b>승인(후속)내용:</b></td>
                                <td colspan="2">${map.approve_details }<br></td>
                            </tr>
                            <tr>
                                <td data-pg-collapsed><b>반려내용:</b></td>
                                <td colspan="2">${map.notallow_details }<br></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-md-6" data-pg-collapsed>
                    <table class="table table-bordered">
                        <tbody data-pg-collapsed>
                            <tr data-pg-collapsed>
                                <td data-pg-collapsed><b>근태/차량 시작일:</b></td>
                                <td colspan="2">${map.start_time }<br></td>
                            </tr>
                            <tr data-pg-collapsed>
                                <td data-pg-collapsed><b>근태/차량 종료일:</b></td>
                                <td colspan="2">${map.end_time }<br></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-md-6" data-pg-collapsed>
                    <table class="table table-bordered">
                        <tbody data-pg-collapsed>
                            <tr data-pg-collapsed>
                                <td data-pg-collapsed><b>제작팀:</b></td>
                                <td colspan="2">${map.product_team }<br></td>
                            </tr>
                            <tr data-pg-collapsed>
                                <td data-pg-collapsed><b>프로젝트명:</b></td>
                                <td colspan="2">${map.prj_name }<br></td>
                            </tr>
                            <tr data-pg-collapsed>
                                <td data-pg-collapsed><b>비용 대분류:</b></td>
                                <td colspan="2">${map.first_classification }<br></td>
                            </tr>
                            <tr data-pg-collapsed>
                                <td data-pg-collapsed><b>비용 중분류:</b></td>
                                <td colspan="2">${map.second_classification }<br></td>
                            </tr>
                            <tr data-pg-collapsed>
                                <td data-pg-collapsed><b>비용 중분류 기타:</b></td>
                                <td colspan="2">${map.second_classification_etc }<br></td>
                            </tr>
                            <tr data-pg-collapsed>
                                <td data-pg-collapsed><b>비용 소분류:</b></td>
                                <td colspan="2">${map.third_classification }<br></td>
                            </tr>
                            <tr data-pg-collapsed>
                                <td data-pg-collapsed><b>비용 소분류 기타:</b></td>
                                <td colspan="2">${map.third_classification_etc }<br></td>
                            </tr>
                            <tr data-pg-collapsed>
                                <td data-pg-collapsed><b>내용:</b></td>
                                <td colspan="2">${map.contents }<br></td>
                            </tr>
                            <tr data-pg-collapsed>
                                <td data-pg-collapsed><b>사용일:</b></td>
                                <td colspan="2">${map.use_day }<br></td>
                            </tr>
                            <tr data-pg-collapsed>
                                <td data-pg-collapsed><b>구분:</b></td>
                                <td colspan="2">${map.division }<br></td>
                            </tr>
                            <tr data-pg-collapsed>
                                <td data-pg-collapsed><b>이용금액/렌트비용:</b></td>
                                <td colspan="2">${map.amount_used }<br></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-md-6">
                    <table class="table table-bordered">
                        <tbody>
                            <tr data-pg-collapsed>
                                <td data-pg-collapsed><b>운전자팀:</b></td>
                                <td colspan="2">${map.driver_team }<br></td>
                            </tr>
                            <tr data-pg-collapsed>
                                <td data-pg-collapsed><b>운전자:</b></td>
                                <td colspan="2">${map.driver }<br></td>
                            </tr>
                            <tr data-pg-collapsed>
                                <td data-pg-collapsed><b>동행인원:</b></td>
                                <td colspan="2">${map.companion }<br></td>
                            </tr>
                            <tr data-pg-collapsed>
                                <td data-pg-collapsed><b>출장및운행 사유:</b></td>
                                <td colspan="2">${map.business_trip_reason }<br></td>
                            </tr>
                            <tr data-pg-collapsed>
                                <td data-pg-collapsed><b>출장지역:</b></td>
                                <td colspan="2">${map.business_trip_area }<br></td>
                            </tr>
                            <tr data-pg-collapsed>
                                <td data-pg-collapsed><b>배차희망차종:</b></td>
                                <td colspan="2">${map.desired_car }<br></td>
                            </tr>
                            <tr data-pg-collapsed>
                                <td data-pg-collapsed><b>운전전 총거리(KM):</b></td>
                                <td colspan="2">${map.before_running_distance }<br></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-md-6">
                    <table class="table table-bordered">
                        <tbody>
                            <tr data-pg-collapsed>
                                <td data-pg-collapsed><b>운전후 총거리(KM):</b></td>
                                <td colspan="2">${map.after_running_distance }<br></td>
                            </tr>
                            <tr data-pg-collapsed>
                                <td data-pg-collapsed><b>사용차량:</b></td>
                                <td colspan="2">${map.use_car }<br></td>
                            </tr>
                            <tr data-pg-collapsed>
                                <td data-pg-collapsed><b>주유상태:</b></td>
                                <td colspan="2">${map.fuel_status }<br></td>
                            </tr>
                            <tr data-pg-collapsed>
                                <td data-pg-collapsed><b>차량내부 정리:</b></td>
                                <td colspan="2">${map.clean_inner }<br></td>
                            </tr>
                            <tr data-pg-collapsed>
                                <td data-pg-collapsed><b>4면 사진촬영:</b></td>
                                <td colspan="2">${map.take_photo_four_sides }<br></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="page-header">
                <p style="">승인내역을 확인합니다. TOOWIDE</p>
                <p>출력일: ${map.today }</p>
            </div>
            <img src="img/logo.png" class="img-thumbnail" alt="A generic square placeholder image with a white border around it, making it resemble a photograph taken with an old instant camera">
            <div class="well">
                <p>주식회사 투와이드컴퍼니</p>
                <p>서울시 서초구 방배동 915-10 우성빌딩 2F Tel 02.593.8451~4</p>
            </div>
        </div>         
        <!-- /container -->
        <!-- Bootstrap core JavaScript
    ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
        <script src="assets/js/ie10-viewport-bug-workaround.js"></script>
    </body>
</html>
