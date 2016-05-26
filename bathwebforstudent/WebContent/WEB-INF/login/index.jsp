<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<!--[if IE 8 ]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9 ]> <html lang="en" class="ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en"> <!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Login</title>


<!--[if lt IE 9]>
<script src="js/html5shiv.js"></script>
<![endif]-->

<link href="<%=request.getContextPath()%>/css/normalize.css" rel="stylesheet"/>
<link href="<%=request.getContextPath()%>/css/jquery-ui.css" rel="stylesheet"/>
<link href="<%=request.getContextPath()%>/css/jquery.idealforms.min.css" rel="stylesheet" media="screen"/>

<style type="text/css">
body{font:normal 15px/1.5 Arial, Helvetica, Free Sans, sans-serif;color: #222;background:url(pattern.png);overflow-y:scroll;padding:60px 0 0 0;}
#my-form{width:755px;margin:0 auto;border:1px solid #ccc;padding:3em;border-radius:3px;box-shadow:0 0 2px rgba(0,0,0,.2);}
#comments{width:350px;height:100px;}
</style>

</head>
<body>


<div class="row">

  <div class="eightcol last">

    <!-- Begin Form -->
    
    
    
    
    <form id="my-form" method="post"  action="<%=request.getContextPath()%>/mylogin/login!submit.action">
     <button type="button" style="width: 750px;height: 50px;">Login</button>
    
     <div><font color="red"><s:fielderror></s:fielderror></font></div>
       

          <div><label>Account:</label><input id="account" name="student.account" type="text"/></div>
          <div><label>Password:</label><input id="password" name="student.password" type="password"/></div>
          
      <div>
        <button type="button" onclick="btnSubmit();">Login</button>
        <button id="reset" type="button">reset</button>
      </div>
    </form>
  </div>

</div>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.idealforms.js"></script>
<script type="text/javascript">



var options = {

	onFail: function(){
		alert( $myform.getInvalid().length +' invalid fields.' )
	}
	
};

var $myform = $('#my-form').idealforms(options).data('idealforms');

$('#reset').click(function(){
	$myform.reset().fresh().focusFirst()
});

$myform.focusFirst();
function btnSubmit(){
	var account =$("#account").val();
	var password =$("#password").val();
	
	if(account==''){
		alert("Field 'Account' can not be empty ");
		return false;
	}
	
	if(password==''){
		alert("Field 'Password' can not be empty ");
		return false;
	}
	$('#my-form').submit();
}

</script>
</body>
</html>