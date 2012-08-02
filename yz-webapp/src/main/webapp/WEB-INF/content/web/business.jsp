<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.springside.modules.security.springsecurity.SpringSecurityUtils" %>
<%@ include file="/common/taglibs.jsp" %>
<%@page import="com.drcl.yz.contant.Global"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>  
	<%@ include file="/common/meta.jsp" %>    
	<meta content="business" name="menu" />             
	<title>掌上扬州-${typeName}</title> 
	<link href="${ctx}/css/style.css" rel="stylesheet" type="text/css" />
	<link href="${ctx}/css/frontreset.css" rel="stylesheet" type="text/css" />
	<link href="${ctx}/css/site.css" rel="stylesheet" type="text/css" /> 
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script> 
	<script src="${ctx}/js/table.js" type="text/javascript"></script>	
</head>
<body>
<div id="wrapper">
	<!--头部开始-->
	<div id="header">
		<%@ include file="/common/header.jsp" %>
	</div>
	<!--头部结束-->  
  	<!--中间内容开始-->
  	<div id="content">
		<!--左边内容开始-->
  		<div class="l_col">
  
  			<!--title 开始-->
  			<div class="title">
      			<span class="title_icon">&nbsp;</span>
      			<ul>
       	 			<li class="ll">${typeName}</li>
        			
      			</ul>
    		</div>
  	<!--title end-->
 			<div class="detailbox">
				<span class="news_details_con"> 
					<s:iterator value="page.result">
					${content}
					</s:iterator>
				</span>
      		</div> 
  
  			</div>
  		<!--左边内容结束-->
  
		  <!--右边内容开始-->
		  <div class="r_col">
               <%@ include file="right.jsp" %>
		  </div>
		  <!--右边内容结束-->  
 	</div>
    <!--中间内容结束-->

	<div id="footer">
		<%@ include file="/common/footer.jsp" %>
	</div> 
</div>
</body>
</html>
