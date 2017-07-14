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
        <link href="css/creative.min2.css" rel="stylesheet">
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
        
        <header id="id_header">
            <div class="header-content">
                <div class="header-content-inner">
                    <h1 id="homeHeading">Employee Information</h1>
                    <a id="btn_delete"  class="btn btn-primary btn-xl page-scroll">삭제</a>
                    <a id=btn_create class="btn btn-primary btn-xl page-scroll" onclick="fn_create()" href="javascript:void(0);">생성</a>
                    <a id=btn_refresh class="btn btn-primary btn-xl page-scroll" >새로고침</a>
                    
                </div>
            </div>
        </header>
        <section class="no-padding" id="id_session">
            <div class="container">
                <table id="id_memberTable" class="table"> 
                    <thead> 
                        <tr> 
                            <th>직원넘버</th> 
                            <th>사번</th> 
                            <th>이름</th>
                            <th>메일주소</th>
                            <th>팀명</th>
                            <th>직책</th> 
                            <th>권한</th>
                        </tr>                         
                    </thead>                     
                    <tbody> 
                        <tr> 
                            <td>Mark</td> 
                            <td>Otto</td> 
                            <td>@mdo</td>
                            <td>@mdo</td>
                            <td>@mdo</td>
                            <td>@mdo</td> 
                        </tr>                         
                        <tr> 
                            <td>Jacob</td> 
                            <td>Thornton</td> 
                            <td>@fat</td>
                            <td>@fat</td>
                            <td>@fat</td>
                            <td>@fat</td> 
                        </tr>                         
                        <tr> 
                            <td>Larry</td> 
                            <td>the Bird</td> 
                            <td>@twitter</td>
                            <td>@twitter</td>
                            <td>@twitter</td>
                            <td>@twitter</td> 
                        </tr>                         
                    </tbody>
                </table>
                
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
                        <h4 class="modal-title">직원 등록</h4> 
                    </div>                     
                    <div class="modal-body"> 
                        <p>&nbsp;</p>
                        <form role="form"> 
                            <div class="form-group"> 
                                <label class="control-label" for="exampleInputEmail1">사번</label>                                 
                                <input type="number" class="form-control" id="id_employee_num" placeholder="사번"> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="exampleInputEmail1">이름</label>                                 
                                <input type="text" class="form-control" id="id_member_name" placeholder="이름"> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="exampleInputEmail1">메일주소</label>                                 
                                <input type="email" class="form-control" id="id_email_addr" placeholder="메일주소"> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="exampleInputEmail1">비밀번호</label>                                 
                                <input type="number" class="form-control" id="id_password" placeholder="비밀번호"> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="id_access_level">권한등급</label>                                 
                                <select id="id_access_level" class="form-control"> 
                                    <option>A</option>                                     
                                    <option>B</option>                                     
                                    <option>C</option>
                                    <option>D</option>
                                </select> 
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="formInput78">팀명</label>                                 
                                <select id="id_team_name" class="form-control"> 
                                    <option>관리팀</option>                                     
                                    <option>연출1팀</option>                                     
                                    <option>연출2팀</option>
                                    <option>연출3팀</option>
                                    <option>촬영1팀</option>
                                    <option>촬영2팀</option>
                                    <option>항공팀</option>
                                    <option>디자이너팀</option>
                                    <option>기획팀</option>
                                    <option>부산기획팀</option>
                                    <option>PM팀</option>                                     
                                </select>
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="formInput78">직책</label>                                 
                                <select id="id_position" class="form-control"> 
                                    <option>CEO</option>                                     
                                    <option>소장</option>                                     
                                    <option>실장</option>
                                    <option>팀장</option>
                                    <option>감독</option>
                                    <option>연출</option>
                                    <option>조연출</option>
                                    <option>사원</option>
                                </select>
                            </div>                             
                        </form>
                    </div>                     
                    <div class="modal-footer"> 
                        <button id="id_close" type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>                         
                        <button id="id_save" type="button" class="btn btn-primary">저장</button>                         
                    </div>                     
                </div>                 
            </div>             
        </div>
        <aside class="bg-dark" id="id_before_contact">
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
        
        var g_authority;
        
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
    		
    		fn_selectMemberList();
    		
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
             	
             	//location.reload();
             	fn_selectMemberList();
    		});
    		
//     		$('#id_memberTable tbody tr').bind('click', function(e) {
//     		 		$(e.currentTarget).siblings().children('td, th').css('background-color','#ffffff');
// 			    	$(e.currentTarget).children('td, th').css('background-color','#fcf8e3');
			    			
// 			    	$(this).find("td").each(function(i, item){ 
// // 			    		console.log("i:"+i+"item:"+ $.trim($(item).html())); 
// 			    		if(i==0){ 
// 			    			g_employee_num = $.trim($(item).html());
// 			    		}
// 			    	});
                
//     		}); 
    		
    		$("#btn_refresh").bind('click', function () { 
    		
    			//location.reload();
    		
    			fn_selectMemberList();
    			//alert('hello!'); 
    		});
    		
    		$("#btn_delete").bind('click', function () { 
    			fn_deleteMember();
    			fn_selectMemberList();
    			//location.reload();
    			//alert('hello!'); 
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
			    
	        });
    		
    		//ready end
		});
        
        var g_member_name;
        var g_employee_num;
        
	        function fn_deleteMember(){
	        	////fn_showProgress(1);
	        
	        	var comAjax = new ComAjax();
	        	comAjax.setUrl("<c:url value='/deleteMember.do' />");
	        	comAjax.addParam("EMPLOYEE_NUM",g_employee_num);
	        	comAjax.setCallback("fn_deleteMember_Callback");
	        	comAjax.ajax();
	        	
	        	////fn_showProgress(0);
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
	        	////fn_showProgress(1);
	        	var comAjax = new ComAjax();
	        	comAjax.setUrl("<c:url value='/insertMember.do' />");
	        	comAjax.addParam("EMPLOYEE_NUM",$employee_num);
	        	comAjax.addParam("MEMBER_NAME",$member_name);
	        	comAjax.addParam("EMAIL_ADDR",$email_addr);
	        	comAjax.addParam("PASSWORD",$password);
	        	var access_level=$('#id_access_level').val();
	        	access_level = access_level.replace(/\s+/g, '');
	        	comAjax.addParam("ACCESS_LEVEL",access_level);
	        	comAjax.addParam("TEAM_NAME",$team_name);
	        	comAjax.addParam("POSITION",$position);
	        	comAjax.addParam("WRITER",$writer);
	        	comAjax.setCallback("fn_insertMemberList_Callback");
	        	comAjax.ajax();
	        	////fn_showProgress(0);
	        }
	        
			function fn_insertMemberList_Callback(data){
	        	
	        	var success = data.map["success"];
	        	
	        	if(!success){
	        		var errorString = data.map["fail_desc"];
	        		alert('error: ' + errorString); 
	        	}else{
	        		alert('insert success');
	        	}
	        	
	        	$('#modal2').modal('hide');
	        }
        
	        function fn_selectMemberList(){
	        	////fn_showProgress(1);
	        
	        	var comAjax = new ComAjax();
	        	comAjax.setUrl("<c:url value='/selectMemberList.do' />");
	        	comAjax.setCallback("fn_selectMemberList_Callback");
	        	comAjax.ajax();
	        	
	        	////fn_showProgress(0);
	        }
	        
	        function fn_selectMemberList_Callback(data){
	        	
	        	var session_data = data.map["session_data"]; //is session so 1, 0
	        	//var sessionMap= data.map["sessionMap"];
	        	g_member_name = data.map["sessionMap"]["MEMBER_NAME"];
	        	var team_name = '관리팀';
	        	var team_db_name = data.map["sessionMap"]["TEAM_NAME"];
	        	g_authority = data.map["sessionMap"]["AUTHORITY"];
	        	
	        	if(session_data){
	        		pageChange(g_authority);
	        	}
	        	//Map<String,Object> map = data.map["sessionMap"];
	        	
	        	var list_count = data.map["list_count"];
	        	//List<Map<String,Object>> list = data.map["list"];
	        	
	        	var body = $("#id_memberTable > tbody");
				body.empty();
				/* list_count  = 0; */
				if(list_count == 0){
					var str = "<tr>" + 
									"<td colspan='7'>조회된 결과가 없습니다.</td>" + 
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
						"<td>" + value.AUTHORITY + "</td>" +
					"</tr>";
					});
					body.append(str);
					
					$('#id_memberTable tbody tr').bind('click', function(e) {
	    		 		$(e.currentTarget).siblings().children('td, th').css('background-color','#ffffff');
				    	$(e.currentTarget).children('td, th').css('background-color','#fcf8e3');
				    			
				    	$(this).find("td").each(function(i, item){ 
//	 			    		console.log("i:"+i+"item:"+ $.trim($(item).html())); 
				    		if(i==0){ 
				    			g_employee_num = $.trim($(item).html());
				    		}
				    	});
	                
	    			}); 
					
				}
	        }
	        
	        
	        function fn_getTeamNames(){
	        	var comAjax = new ComAjax();
	        	comAjax.setUrl("<c:url value='/selectTeamNames.do' />");
	        	comAjax.setCallback("fn_getTeamNames_Callback");
	        	comAjax.ajax();
	        }
	        
	        function fn_getTeamNames_Callback(data){
	        	
	        	var list_count = data.map["list_count"];
	        	
	        	$("#id_team_name").find("option").remove();
	        	
				if(list_count != 0){
					
					var str = "";
					$.each(data.map["list"], function(key, value){
						str += "<option>"+value.team_name+"</option>";
					});
					
					$('#id_team_name').append(str);
	        	}
	        }
	        
	        function fn_create(){
	        	
	            fn_getTeamNames();
	            
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
	        	////fn_showProgress(1);
	        	var comAjax = new ComAjax();
	        	comAjax.setUrl("<c:url value='/logout.do' />");
	        	/* comAjax.setUrl("http://192.168.0.168:8282/innerPrj/login.do"); */
	        	comAjax.setCallback("fn_logoutCallback");
	        	comAjax.ajax();
	        	////fn_showProgress(0);
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