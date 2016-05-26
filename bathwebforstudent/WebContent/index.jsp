<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<%@page import="com.path.core.entity.TbPath"%>
<%@page import="java.util.List"%>
<%@page import="com.path.util.BathUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
BathUtil util = new BathUtil();
List<TbPath> baths = util.qry();
System.out.println(baths.size());
StringBuffer sb  = new StringBuffer();
if(baths!=null &&baths.size()>0){
	for(TbPath path:baths){
		sb.append("<option value="+path.getPathid()+">"+path.getName()+"</option>");
	}
}

%>
<!DOCTYPE html>
<html>
<head> 
<title>BJUT Public bathroom</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jquery.seat-charts.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css">
<script src="<%=request.getContextPath()%>/js/jquery-1.11.0.min.js"></script> 
<script src="<%=request.getContextPath()%>/js/jquery.seat-charts.min.js"></script>





 


</head>
<body>

<div style="margin:0 auto;text-align:center;color:blue">
	<a href="<%=request.getContextPath()%>/mylogin/login.action">Login</a> | <a href="<%=request.getContextPath()%>/myreg/reg.action">Register</a>
    
</div>
<div class="wrapper">


  <div class="container">
    <div id="seat-map">
      <div class="front-indicator">The BJUT Public Bathroom</div>
      <section>
      
        <select style="width:500px;height:50px;" onchange="clickChange(this.value)">
        <option value="">------------------------------------------please select a Bathroom------------------------------------------</option>
        <%=sb.toString()%>
        </select>
      </section>
    </div>
    <marquee id=go1 onMouseOver=go1.stop()                        onMouseOut=go1.start() scrollamount=2 scrolldelay=100
                        direction=left><FONT color=#ff80c0> 
                        Having a nice day </FONT></MARQUEE>
    
  </div>
  </div>>
  
  
  <div><%@include file="test2.html"%></div>
  
</body>
<script type="text/javascript">
function clickChange(value){
	if(value==''){
		return false;
	}
	window.location.href="<%=request.getContextPath()%>/mybath/bath.action?pathid="+value;
	
}

</script>
</html>
