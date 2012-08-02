<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.springside.modules.security.springsecurity.SpringSecurityUtils" %>
<%@ include file="/common/taglibs.jsp" %>
<%@page import="com.drcl.yz.contant.Global"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>  
	<%@ include file="/common/meta.jsp" %>    
	<meta content="lf${mtype}" name="menu" />             
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
 
     			 <div class="newslist">
					<form id="mainForm" action="localfeeling.action?mtype=${mtype}" method="post">
						<input type="hidden" name="page.pageNo" id="pageNo" value="${page.pageNo}"/>
						<input type="hidden" name="page.orderBy" id="orderBy" value="${page.orderBy}"/>
						<input type="hidden" name="page.order" id="order" value="${page.order}"/>
                    	<ul> 
                        	<s:iterator value="page.result">
                            <li>
                             <span class="rr">
                                    <em><s:date name="pulishdata" format="yyyy.MM.dd"/> </em>
                                </span>
                                <span class="ntitle ">
                                    <a href="${link}" class="ellipsis ll" style="width:400px;" target="_blank" title="${title}"><common:cut string="${title}" len="150"/></a>
                                </span>
                               
                            </li> 
                            </s:iterator>
                        </ul>
                        </form>
               
                        <!--翻页-->
                        <div class="pager">
							<jsp:include page="/common/frontturnpage.jsp"></jsp:include>
                        </div>
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
