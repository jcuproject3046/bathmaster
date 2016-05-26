<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String pathid = request.getParameter("pathid");
%>
<!DOCTYPE html>
<html>
<head>
<title>Book</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jquery.seat-charts.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css">

<link href="<%=request.getContextPath()%>/css/normalize.css" rel="stylesheet"/>
<link href="<%=request.getContextPath()%>/css/jquery-ui.css" rel="stylesheet"/>
<link href="<%=request.getContextPath()%>/css/jquery.idealforms.min.css" rel="stylesheet" media="screen"/>

<link href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="<%=request.getContextPath()%>/bootstrap/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
    

<script src="<%=request.getContextPath()%>/js/jquery-1.11.0.min.js"></script> 
<script src="<%=request.getContextPath()%>/js/jquery.seat-charts.min.js"></script>
<script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/My97DatePicker/WdatePicker.js"></script> 

</head>
<body>
<div style="margin:0 auto;text-align:center;color:blue">
	<a href="<%=request.getContextPath()%>/index.jsp">Home</a> | <a href="<%=request.getContextPath()%>/mylogin/login.action">Login</a> | <a href="<%=request.getContextPath()%>/myreg/reg.action">Register</a>
    <s:if test="#session.SESSION_STUDENT!=null">
     <div style="float:right">Student:<s:property value="#session.SESSION_STUDENT.name"/>(<s:property value="#session.SESSION_STUDENT.code"/>)</div>
    </s:if>
</div>
<div class="wrapper">
   <input type="hidden" id="pathid" name="pathid" value="<%=pathid%>">
  <div class="container">
    <div id="seat-map">
      <div class="front-indicator">Bathroom<s:property value="path.name"/></div>
      <div><input type="text" id="d241" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})" class="Wdate" style="width:200px"/>Pick your time</div>
      
    
    </div>
    <div></div>
    <div class="booking-details">
      <h3>Selected (<span id="counter">0</span>):</h3>
      <ul id="selected-seats">
      </ul>
      <p><button class="myButton" type='button' onclick="recalculateTotal();" >&nbspSubmit</button></p>   
      <div id="legend"></div>
    </div>
  </div>        
</div>

<script>
			var firstSeatLabel = 1;
		    var sc ;
			$(document).ready(function() {
				var pathid  = $("#pathid").val();
				var reserves;
				jQuery.ajax({
		            type: "post",
		            async: false,
		            url: "<%=request.getContextPath()%>/mybath/bath!reserved.action?pathid="+pathid,
		            contentType: "application/json; charset=utf-8",
		            dataType: "json",
		            cache: false,
		            success: function (data) {
		            	//alert(asd);
		                //alert(1);
		                
		            	reserves = data;
		                //alert(datas[0]);
		            },
		            error: function (err) {
		                alert(err);
		            }
		        });
				
				
				var $cart = $('#selected-seats'),
					$counter = $('#counter'),
					$total = $('#total');
					sc = $('#seat-map').seatCharts({
					map: [
						'ffffffffff',
						'ffffffffff',
						'ffffffffff'
					],
					seats: {
						f: {
							
						}				
					
					},
					naming : {
						top : false,
						getLabel : function (character, row, column) {
							return firstSeatLabel++;
						},
					},
					legend : {
						node : $('#legend'),
					    items : [
							[ 'f', 'available',   'OPEN' ],
							[ 'f', 'unavailable', 'RESERVED']
					    ]					
					},
					click: function () {
						if (this.status() == 'available') {
							//alert(this.settings.id);
							$('<li>No. '+this.settings.label+'</b> <a href="#" class="cancel-cart-item">[Delete]</a></li>')
								.attr('id','cart-item-'+this.settings.id)
								.data('seatId', this.settings.id)
								.appendTo($cart);
							
							sc.find('selected').each(function(){
								//alert(this.settings.id)
								$('#cart-item-'+this.settings.id).remove();
								this.click();
							});
							
							$counter.text(sc.find('selected').length+1);
							
							return 'selected';
						} else if (this.status() == 'selected') {
							//update the counter
							$counter.text(sc.find('selected').length-1);
							$('#cart-item-'+this.settings.id).remove();
							//seat has been vacated
							return 'available';
						} else if (this.status() == 'unavailable') {
							//seat has been already booked
							return 'unavailable';
						} else {
							return this.style();
						}
					}
				});

				//this will handle "[cancel]" link clicks
				$('#selected-seats').on('click', '.cancel-cart-item', function () {
					//let's just trigger Click event on the appropriate seat, so we don't have to repeat the logic here
					sc.get($(this).parents('li:first').data('seatId')).click();
				});

				//let's pretend some seats have already been booked
				//sc.get(['1_2', '4_1']).status('unavailable');
				sc.get(reserves).status('unavailable')
		
		});

		function recalculateTotal() {
			//alert(1);
			//var total = 0;
			
			var pathid  = $("#pathid").val();
			//alert(pathid);
		
			var seatid="";
			//basically find every selected seat and sum its price
			sc.find('selected').each(function () {
				seatid = this.settings.id;
			});
			
			if(seatid==''){
				alert("Please Reserve First");
				return false;
			}
			
			jQuery.ajax({
	            type: "post",
	            async: false,
	            url: "<%=request.getContextPath()%>/mybath/bath!submit.action?pathid="+pathid+"&seatid="+seatid,
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
		

		
</body>
</html>
