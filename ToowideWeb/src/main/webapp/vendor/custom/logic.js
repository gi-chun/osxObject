/* #####################################################################
   #
   #   Project       : SJPLab PMS
   #   Author        : gclee
   #   Version       : 1.0
   #   Created       : 05/15/2017
   #   Last Change   : 05/15/2017
   #
   ##################################################################### */
    
function fn_login($login_user, $login_pwd){
	var comAjax = new ComAjax();
//	comAjax.setUrl("<c:url value='/login.do' />");
	comAjax.setUrl("http://192.168.0.168:8282/innerPrj/login.do");
	comAjax.setCallback("fn_loginCallback");
	comAjax.addParam("USER",$login_user);
	comAjax.addParam("PASSWORD",$login_pwd);
	comAjax.ajax();
}

function fn_loginCallback(data){
	var result = data.SUCCESS;
	if(result == 0){
		
		return false;
	}
	else{
		
		return true;
	}
	
}