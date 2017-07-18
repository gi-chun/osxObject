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
        <link href="vendor/bootstrap/css/bootstrap-dialog.min.css" rel="stylesheet">
        <!-- Custom Fonts -->
        <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
        <!-- Plugin CSS -->
        <link href="vendor/magnific-popup/magnific-popup.css" rel="stylesheet">
        <!-- login CSS -->
        <link href="vendor/custom/login.css" rel="stylesheet">
        <!-- Theme CSS -->
        <link href="css/creative.min.css" rel="stylesheet">
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
                    <a class="navbar-brand page-scroll" href="index.jsp">TOOWIDE</a>
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
                            <a id="menu_notice" class="page-scroll" href="listNotice.do">공지사항</a>
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
        <header>
            <div class="header-content">
                <div class="header-content-inner">
                    <h1 id="homeHeading">TOOWIDE Project&nbsp;management system</h1>
                    <hr>
                    <p>SJP Lab will help you with your work!</p>
                    <a id="idButton" href="#" class="btn btn-primary" role="button" data-toggle="modal" data-target="#login-modal">로그인</a>
                    <!-- <hr>
                    <a href="mailSending.do" class="btn btn-primary btn-xl page-scroll">move page</a> -->
                </div>
            </div>
        </header>
        <section class="bg-primary" id="about">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2 text-center">
                        <h2 class="section-heading">We've got what you need!</h2>
                        <hr class="light">
                        <p class="text-faded">Have a nice day !</p>
                    </div>
                </div>
            </div>
        </section>
        <section id="services">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <h2 class="section-heading">Great job !</h2>
                        <hr class="primary">
                    </div>
                </div>
            </div>
        </section>
<!--         <section class="no-padding" id="portfolio"> -->
<!--             <div class="container-fluid"> -->
<!--                 <div class="row no-gutter popup-gallery"> -->
<!--                     <div class="col-lg-4 col-sm-6"> -->
<!--                         <a href="img/portfolio/fullsize/1.jpg" class="portfolio-box"> -->
<!--                             <img src="img/portfolio/thumbnails/1.jpg" class="img-responsive" alt=""> -->
<!--                             <div class="portfolio-box-caption"> -->
<!--                                 <div class="portfolio-box-caption-content"> -->
<!--                                     <div class="project-category text-faded"> -->
<!--                                         Category -->
<!-- </div> -->
<!--                                     <div class="project-name">#1</div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </a> -->
<!--                     </div> -->
<!--                     <div class="col-lg-4 col-sm-6"> -->
<!--                         <a href="img/portfolio/fullsize/2.jpg" class="portfolio-box"> -->
<!--                             <img src="img/portfolio/thumbnails/2.jpg" class="img-responsive" alt=""> -->
<!--                             <div class="portfolio-box-caption"> -->
<!--                                 <div class="portfolio-box-caption-content"> -->
<!--                                     <div class="project-category text-faded"> -->
<!--                                         Category -->
<!-- </div> -->
<!--                                     <div class="project-name"> -->
<!--                                         #2 -->
<!-- </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </a> -->
<!--                     </div> -->
<!--                     <div class="col-lg-4 col-sm-6"> -->
<!--                         <a href="img/portfolio/fullsize/3.jpg" class="portfolio-box"> -->
<!--                             <img src="img/portfolio/thumbnails/3.jpg" class="img-responsive" alt=""> -->
<!--                             <div class="portfolio-box-caption"> -->
<!--                                 <div class="portfolio-box-caption-content"> -->
<!--                                     <div class="project-category text-faded"> -->
<!--                                         Category -->
<!-- </div> -->
<!--                                     <div class="project-name"> -->
<!--                                         #3 -->
<!-- </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </a> -->
<!--                     </div> -->
<!--                     <div class="col-lg-4 col-sm-6"> -->
<!--                         <a href="img/portfolio/fullsize/4.jpg" class="portfolio-box"> -->
<!--                             <img src="img/portfolio/thumbnails/4.jpg" class="img-responsive" alt=""> -->
<!--                             <div class="portfolio-box-caption"> -->
<!--                                 <div class="portfolio-box-caption-content"> -->
<!--                                     <div class="project-category text-faded"> -->
<!--                                         Category -->
<!-- </div> -->
<!--                                     <div class="project-name"> -->
<!--                                         #4 -->
<!-- </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </a> -->
<!--                     </div> -->
<!--                     <div class="col-lg-4 col-sm-6"> -->
<!--                         <a href="img/portfolio/fullsize/5.jpg" class="portfolio-box"> -->
<!--                             <img src="img/portfolio/thumbnails/5.jpg" class="img-responsive" alt=""> -->
<!--                             <div class="portfolio-box-caption"> -->
<!--                                 <div class="portfolio-box-caption-content"> -->
<!--                                     <div class="project-category text-faded"> -->
<!--                                         Category -->
<!-- </div> -->
<!--                                     <div class="project-name"> -->
<!--                                         #5 -->
<!-- </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </a> -->
<!--                     </div> -->
<!--                     <div class="col-lg-4 col-sm-6"> -->
<!--                         <a href="img/portfolio/fullsize/6.jpg" class="portfolio-box"> -->
<!--                             <img src="img/portfolio/thumbnails/6.jpg" class="img-responsive" alt=""> -->
<!--                             <div class="portfolio-box-caption"> -->
<!--                                 <div class="portfolio-box-caption-content"> -->
<!--                                     <div class="project-category text-faded"> -->
<!--                                         Category -->
<!-- </div> -->
<!--                                     <div class="project-name"> -->
<!--                                         #6 -->
<!-- </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </a> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </section> -->
        <aside class="bg-dark">
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
                        <p><a href="mailto:ceo.sjplab@gmail.com">ceo.sjplab@gmail.com</a></p>
                    </div>
                </div>
            </div>
        </section>
        
        <!-- BEGIN # MODAL LOGIN -->
	<div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myLoginLabel" aria-hidden="true" style="display: none;">
    	<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" align="center">
					<img class="img" id="img_logo" src="img/logo.png">
					<button id="close_login_btn" type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
					</button>
				</div>
                
                <!-- Begin # DIV Form -->
                <div id="div-forms">
                
                    <!-- Begin # Login Form -->
                    <form id="login-form">
		                <div class="modal-body">
				    		<div id="div-login-msg">
                                <div id="icon-login-msg" class="glyphicon glyphicon-chevron-right"></div>
                                <span id="text-login-msg">Type your username and password.</span>
                            </div>
				    		<input id="login_username" class="form-control" type="text" placeholder="Username (type ERROR for error effect)" required>
				    		<input id="login_password" class="form-control" type="password" placeholder="Password" required>
<!--                             <div class="checkbox"> -->
<!--                                 <label> -->
<!--                                     <input type="checkbox"> Remember me -->
<!--                                 </label> -->
<!--                             </div> -->
        		    	</div>
				        <div class="modal-footer">
                            <div>
                                <button type="submit" class="btn btn-primary btn-lg btn-block">Login</button>
                            </div>
				    	    <!-- <div>
                                <button id="login_lost_btn" type="button" class="btn btn-link">Lost Password?</button>
                                <button id="login_register_btn" type="button" class="btn btn-link">Register</button>
                            </div> -->
				        </div>
                    </form>
                    <!-- End # Login Form -->
                    
                    <!-- Begin | Lost Password Form -->
                    <form id="lost-form" style="display:none;">
    	    		    <div class="modal-body">
		    				<div id="div-lost-msg">
                                <div id="icon-lost-msg" class="glyphicon glyphicon-chevron-right"></div>
                                <span id="text-lost-msg">Type your e-mail.</span>
                            </div>
		    				<input id="lost_email" class="form-control" type="text" placeholder="E-Mail (type ERROR for error effect)" required>
            			</div>
		    		    <div class="modal-footer">
                            <div>
                                <button type="submit" class="btn btn-primary btn-lg btn-block">Send</button>
                            </div>
                            <div>
                                <button id="lost_login_btn" type="button" class="btn btn-link">Log In</button>
                                <button id="lost_register_btn" type="button" class="btn btn-link">Register</button>
                            </div>
		    		    </div>
                    </form>
                    <!-- End | Lost Password Form -->
                    
                    <!-- Begin | Register Form -->
                    <form id="register-form" style="display:none;">
            		    <div class="modal-body">
		    				<div id="div-register-msg">
                                <div id="icon-register-msg" class="glyphicon glyphicon-chevron-right"></div>
                                <span id="text-register-msg">Register an account.</span>
                            </div>
		    				<input id="register_username" class="form-control" type="text" placeholder="Username (type ERROR for error effect)" required>
                            <input id="register_email" class="form-control" type="text" placeholder="E-Mail" required>
                            <input id="register_password" class="form-control" type="password" placeholder="Password" required>
            			</div>
		    		    <div class="modal-footer">
                            <div>
                                <button type="submit" class="btn btn-primary btn-lg btn-block">Register</button>
                            </div>
                            <div>
                                <button id="register_login_btn" type="button" class="btn btn-link">Log In</button>
                                <button id="register_lost_btn" type="button" class="btn btn-link">Lost Password?</button>
                            </div>
		    		    </div>
                    </form>
                    <!-- End | Register Form -->
                    
                </div>
                <!-- End # DIV Form -->
                
			</div>
		</div>
	</div>
    <!-- END # MODAL LOGIN -->
    
    <!-- Creates the bootstrap modal where the image will appear -->
    <div class="modal fade pg-show-modal" id="imagemodal" tabindex="-1" role="dialog" aria-hidden="true"> 
            <div class="modal-dialog"> 
                <div class="modal-content"> 
                    <div class="modal-header"> 
                        <button id="id_img_close2" ype="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>                         
                        <h4 id="frmTitle" class="modal-title"> 등록</h4> 
                    </div>                     
                    <div class="modal-body">
				        <img align="middle" src="" id="imagepreview" class="img-responsive center-block" >
				    </div>
				    <div class="form-group"> 
			          	<textarea id="frmContents" class="form-control" rows="30"></textarea>
			        </div>                  
                    <div class="modal-footer"> 
                        <button id="id_img_close" type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>                         
                    </div>                     
                </div>                 
            </div>             
        </div>
        
        <%@ include file="/WEB-INF/include/include-body.jspf" %>
        
        <!-- jQuery -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <!-- Bootstrap Core JavaScript -->
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap-dialog.min.js"></script>
        <!-- Plugin JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
        <script src="vendor/scrollreveal/scrollreveal.min.js"></script>
        <script src="vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
        <!-- Theme JavaScript -->
        <script src="js/creative.min.js"></script>
        <!-- logic JavaScript -->
        <!-- <script src="vendor/custom/logic.js"></script> -->
        <!-- login JavaScript -->
        <script src="vendor/custom/login.js"></script>
        
        <script type="text/javascript">
        
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
    		
    		$("#id_img_close2").bind('click', function () { 
    			$('#login-modal').modal('hide');
    		});
    		
    		$("#id_img_close").bind('click', function () { 
    			$('#login-modal').modal('hide');
    		});
    		
			fn_getNotice();
			
    		fn_getSession();
			
		});
        
        var $formLogin = $('#login-form');
        var $formLost = $('#lost-form');
        var $formRegister = $('#register-form');
        var $divForms = $('#div-forms');
        var $modalAnimateTime = 300;
        var $msgAnimateTime = 150;
        var $msgShowTime = 2000;
        var g_authority;
        
	        function fn_getNotice(){
	        	var comAjax = new ComAjax();
	        	comAjax.setUrl("<c:url value='/getNotice.do' />");
	        	comAjax.setCallback("fn_getNoticeCallback");
	        	comAjax.ajax();
	        }
	        
			function fn_getNoticeCallback(data){
				        	
				var success = data.map["success"];
				var isData = data.map["isData"];
	        	
	        	if(!success){
	        		var errorString = data.map["fail_desc"];
	        		alert('error: ' + errorString); 
	        	}else{
	        		
	        		if(isData){
						var varText = "[공지사항] ";
						varText += data.map["map"]["subject"];
	        			$('#frmTitle').text(varText);
	        			$('#frmContents').val(data.map["map"]["contents"]);
	        			
	        			$('#frmContents').attr('disabled',true);
	        			$('#imagepreview').attr('src', "img/portfolio-1.jpg");
	        			$('#imagemodal').modal('show');
	        		}
	        	}
			}
		
	        function fn_getSession(){
	        	var comAjax = new ComAjax();
	        	comAjax.setUrl("<c:url value='/getSession.do' />");
	        	comAjax.setCallback("fn_getSessionCallback");
	        	comAjax.ajax();
	        }
	        
			function fn_getSessionCallback(data){
				      
				try {
				
					var success = data.map["success"];
					var isData = data.map["isData"];
		        	
		        	if(!success){
		        		var errorString = data.map["fail_desc"];
		        		alert('error: ' + errorString); 
		        	}else{
		        		
		        		if(isData){
		        			var session_data = data.map["session_data"]; //is session so 1, 0
		    	        	//var sessionMap= data.map["sessionMap"];
		    	        	g_member_name = data.map["sessionMap"]["MEMBER_NAME"];
		    	        	var team_name = '관리팀';
		    	        	var team_db_name = data.map["sessionMap"]["TEAM_NAME"];
		    	        	g_authority = data.map["sessionMap"]["AUTHORITY"];
		    	        	
		    	        	if(session_data){
		    	        		pageChange(g_authority);
		    	        	}
		        		}
		        	}
		        	
	        	
				}
				catch(err) {
// 				    document.getElementById("demo").innerHTML = err.message;
				}
	        	
	        	
			}
        
	        function fn_login($login_user, $login_pwd){
	        	var comAjax = new ComAjax();
	        	comAjax.setUrl("<c:url value='/login.do' />");
	        	comAjax.setCallback("fn_loginCallback");
	        	comAjax.addParam("USER",$login_user);
	        	comAjax.addParam("PASSWORD",$login_pwd);
	        	comAjax.ajax();
	        }
	        
	        function fn_loginCallback(data){
	        	var result = data.SUCCESS;
	        	
	        	 if (result) {  //success
	             	msgChange($('#div-login-msg'), $('#icon-login-msg'), $('#text-login-msg'), "success", "glyphicon-ok", "Login OK");
	             	var team_name = '관리팀';
	             	var team_db_name = data.map["TEAM_NAME"];
	             	g_authority = data.map["AUTHORITY"];
	             	
	        	    pageChange(g_authority);
	        	    
// 	        	    $('#close_login_btn').click();
// 					$('#login-modal').modal('hide');
	        	    
	        	    fn_getNotice();
	        	    
	             } else {
	             	msgChange($('#div-login-msg'), $('#icon-login-msg'), $('#text-login-msg'), "error", "glyphicon-remove", "Login error");
	             }
	        }
	        
	        function fn_logout(){
	        	var comAjax = new ComAjax();
	        	comAjax.setUrl("<c:url value='/logout.do' />");
	        	/* comAjax.setUrl("http://192.168.0.168:8282/innerPrj/login.do"); */
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
	            	 alert("logout fail !");
	             }
	        }
	        
	        function msgFade ($msgId, $msgText) {
	            $msgId.fadeOut($msgAnimateTime, function() {
	                $(this).text($msgText).fadeIn($msgAnimateTime);
	            });
	        }
	        
	        function msgChange($divTag, $iconTag, $textTag, $divClass, $iconClass, $msgText) {
	            var $msgOld = $divTag.text();
	            msgFade($textTag, $msgText);
	            $divTag.addClass($divClass);
	            $iconTag.removeClass("glyphicon-chevron-right");
	            $iconTag.addClass($iconClass + " " + $divClass);
	            setTimeout(function() {
	                msgFade($textTag, $msgOld);
	                $divTag.removeClass($divClass);
	                $iconTag.addClass("glyphicon-chevron-right");
	                $iconTag.removeClass($iconClass + " " + $divClass);
	      		}, $msgShowTime);
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