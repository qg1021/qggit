<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="com.drcl.yz.contant.Global"%><html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="certcode" name="activemenu" />
	<title>证书编号查询(未下发的证书编号库)</title>
	<link href="${ctx}/css/master.css" type="text/css" rel="stylesheet"/> 
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
	<script src="${ctx}/js/table.js" type="text/javascript"></script>
	<script src="${ctx}/js/jcommon.js" type="text/javascript"></script>
	<link  href="${ctx}/css/fancybox/jquery.fancybox-1.3.4.css" rel="stylesheet" type="text/css" media="screen" />
	<script type="text/javascript" src="${ctx}/js/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
	<script type="text/javascript" src="${ctx}/js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
	<script type="text/javascript" src="${ctx}/js/certmsgpic.js"></script> 
</head>
<body>
<div id="wrapper">
	<%@ include file="/common/header.jsp"%>
<div id="content"> 
 
<a href="${ctx}/province/certcode.action" class="rr mt10">返回证书编号库列表&gt;&gt;</a>
<h2>证书编号库</h2>
<div class="pagehead01"></div>
<!--<div class="pagehead02"></div>-->

<!-- top 统计板块 start-->
<div class="top_info_column">
	<dl class="info2_box">
    <dt>证书生成批次</dt>
    <dd>${requestScope.certCode.batchCode}</dd>    
    </dl>
	<dl class="info2_box">
    <dt>生成时间</dt>
    <dd><s:date name="#request.certCode.createDate" format="yyyy.MM.dd HH:mm"/></dd>    
    </dl>
    <p class="clearb">&nbsp;</p>
     <dl class="info2_box">
    <dt>证书项目名称</dt>
    <dd>${requestScope.certCode.certProject.name}</dd>    
    </dl>
	<dl class="info2_box">
    <dt>证书项目编号</dt>
    <dd>${requestScope.certCode.certProject.code}</dd>    
    </dl>
    <p class="del_float"></p>
    <p class="dotline"></p>
     <dl class="info2_box">
    <dt>对应考试项目</dt>
    <dd>${requestScope.certCode.examItem.name}</dd>    
    </dl>
	<dl class="info2_box">
    <dt>对应考试项目编号</dt>
    <dd>${requestScope.certCode.examItem.code}</dd>    
    </dl>
    <p class="clearb"></p>
     <dl class="certi_info">
    <dt>对应考次名称</dt><dd>${requestScope.certCode.examTimes.name}</dd>    
    </dl>
	<dl class="certi_info">
    <dt>对应考次时间</dt><dd>${requestScope.certCode.examTimes.year}.${requestScope.certCode.examTimes.month}</dd>    
    </dl>    
	<dl class="certi_info">
    <dt>对应考次编号</dt><dd>${requestScope.certCode.examTimes.code}</dd>    
    </dl>
</div>
<div id="message" style="line-height: 35px;">
	 	<s:actionmessage theme="custom" cssClass="tipbox"/> 
	</div>
	<!-- top 统计板块 end-->
			<% 
      		String value = request.getParameter("filter_EQL_examArea.id");
				Long areaid = new Long(0);
			 	if(value != null && !"".equals(value.trim()))
			 		areaid = java.lang.Long.parseLong(value);
			 		request.setAttribute("areaid",areaid) ;
			 		
			 		String value1 = request.getParameter("filter_EQL_examSite.id");
					Long siteid = new Long(0);
				 	if(value1 != null && !"".equals(value1.trim()))
				 	   siteid = java.lang.Long.parseLong(value1);
				 		request.setAttribute("siteid",siteid) ;
		%> 	
	<div class="top_serach_box_registration">
	<form action="${ctx}/province/certmsg.action" method="post" name="mainForm" id="mainForm">
	<input type="hidden" name="page.pageNo" id="pageNo" value="${page.pageNo}"/>
	<input type="hidden" name="page.orderBy" id="orderBy" value="${page.orderBy}"/>
	<input type="hidden" name="page.order" id="order" value="${page.order}"/>  
	<input type="hidden" name="certCodeId" id="certCodeId" value="${certCodeId}"/>  
	<ul>
		<li><label>证书编号</label><input type="text" name="filter_LIKES_certficateCode" id="filter_LIKES_certficateCode" value="${param['filter_LIKES_certficateCode']}" size="15" /></li>
	    <li><label>身份证</label><input type="text" name="filter_LIKES_idCard" id="filter_LIKES_idCard" value="${param['filter_LIKES_idCard']}" size="15" /></li>
	    <li><label>姓名</label><input name="filter_LIKES_name" id="filter_LIKES_name" value="${param['filter_LIKES_name']}" type="text" size="15" /></li>
	    <li><label>考区</label><s:select onchange="getSiteByAreaID();" list="examAreaList" listKey="value" listValue="label" id="areaid" name="filter_EQL_examArea.id"  value="#request.areaid"  theme="simple" cssStyle="width:120px;" headerKey="" headerValue="所有考区"/></li>
	    <li><label>考点</label><s:select list="examSiteList" listKey="value" listValue="label" id="siteid" name="filter_EQL_examSite.id"  value="#request.siteid"  theme="simple" cssStyle="width:120px;" headerKey="" headerValue="所有考点"/></li>
	      <li><input type="button" onclick="search();" value="搜索"/></li>
	</ul>
	</form>
	</div>

    <table class="tablebox">
    <tr>
    <th>证号编号</th>
    <th>印章号</th>
    <th>身份证号</th>
    <th>姓名</th>
    <th>报名科目</th>
    <th>考区</th>
    <th>考点</th>
    <th>操作</th>
    </tr>
    <s:iterator value="page.result">
    <tr>
    <td>${certficateCode}</td>
    <td>${signetCode}</td>
    <td>${idCard}</td>
    <td><a class="showPicurlClass" id="various1" href="#inline1" globalUrl="<common:prop name="oems.webapp.uploadUrl" propfilename="sysconfig.properties" defaultvalue="${pageContext.request.contextPath}"/><%=Global.STUDENTPIC_PATH%>" picUrl="${picurl}">${name}</a></td>
    <td>${subjectName}</td>
    <td>${examArea.name}</td>
    <td>${examSite.name}</td>
    <td><s:if test="status || certCode.status">取消证书</s:if><s:else><a href="${ctx}/province/certmsg!updateStatus.action?id=${id}&certCodeId=${certCodeId}">取消证书</a></s:else></td>
    </tr>   
    </s:iterator>  
    </table>  
    <!--照片弹出层 start-->
    <div style="display: none;">
	    <div id="inline1" style="background: none repeat scroll 0 0 #F2F2F2;border: 1px solid #CCCCCC;padding: 10px;"> 
		      &nbsp;
	    </div>
    </div>
    <!--照片弹出层 end-->
    
    <!-- 翻页 start  -->
 <%@ include file="/common/page.jsp"%>
<!-- 翻页 end  -->


</div> <!-- content  end-->  

</div><!-- wrapper  end-->  
</body>
</html>