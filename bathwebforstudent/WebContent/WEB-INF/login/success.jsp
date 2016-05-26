<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link href="<%=request.getContextPath()%>/css/normalize.css" rel="stylesheet"/>
<link href="<%=request.getContextPath()%>/css/jquery-ui.css" rel="stylesheet"/>
<link href="<%=request.getContextPath()%>/css/jquery.idealforms.min.css" rel="stylesheet" media="screen"/>

<title>Login Success</title>
<script src="<%=request.getContextPath()%>/js/jquery-1.11.0.min.js"></script> 
</head>
<body>
<div style="margin:0 auto;text-align:center;color:red">login Success</div>
<div style="margin:0 auto;text-align:center;color:blue">
	<a href="<%=request.getContextPath()%>/index.jsp">Home</a>
</div>
<br/><br/>
<div style="margin:0 auto;text-align:center;"><button class="Button" type='button' onclick="recalculateTotal();" style="height: 50px;width: 500px;">Start Bath</button></div>
</body>
<script type="text/javascript">
function recalculateTotal() {
	
	
	jQuery.ajax({
        type: "post",
        async: false,
        url: "<%=request.getContextPath()%>/mylogin/login!bath.action",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        cache: false,
        success: function (data) {
        	alert(data[0].result);
        },
        error: function (err) {
            alert(err);
        }
    });
	
}

</script>
</html>