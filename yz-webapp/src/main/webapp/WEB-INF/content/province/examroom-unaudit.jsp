<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="outsideroom" name="activemenu" />
	<title>考场</title>
	<link href="${ctx}/css/master.css" type="text/css" rel="stylesheet"/> 
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
	<script src="${ctx}/js/jcommon.js" type="text/javascript"></script>
	<script type="text/javascript">
		function onSubmit(){
				$("#mainForm").submit();
		}
	</script>
</head>
<body>
<div id="wrapper">
	<%@ include file="/common/header.jsp"%>
	<!--the end of head-->
	<div id="content">  
		<!-- 左侧内容 column  start -->
		<%@ include file="/common/left.jsp"%>
		<!-- 左侧内容 column  end -->
		<!-- 右侧内容 column  start -->  

		<div class="right_content">
			<h2>考场管理</h2>
			<div class="pagehead01"></div>
				<ul class="switch_tab mb10">
					<li id='tab1'   onclick="location.href='examroom.action'">考场现状列表</li>
					<li id='tab2' class="switch_tab_current">考场座位变更申请审核</li>
					<li id='tab3' onclick="location.href='examroom!search.action'" >已审的考场座位变更申请</li>   
				</ul>
				<form id="mainForm" action="examroom!searchUnAudit.action" method="post">
				<ul class="top_serach_box">
			    		<li class="rr"><button type="submit">搜索</button></li>
				        <li class="ll mr20">考区
				        	<s:select onchange="getSiteByAreaID();" list="examAreaList" listKey="value" listValue="label" id="areaid" name="areaid"  value="#parameters.areaid"  theme="simple" cssStyle="width:200px;" headerKey="" headerValue="--选择--"/>  
				        </li>
				        <li>考点
				        	<s:select list="examSiteList" onchange="onSubmit();" listKey="value" listValue="label" id="siteid" name="filter_EQL_examSite$id"  value="#parameters.filter_EQL_examSite$id"  theme="simple" cssStyle="width:200px;" headerKey="" headerValue="--选择--"/>  
				        </li>
    				</ul>
					<div id="message" style="line-height: 35px;">
						<s:actionmessage theme="custom" cssClass="tipbox"/>
					</div>
    			
	    			<table class="tablebox">
					    <tr>
					        <th width="10%">考场编号</th>
					        <th width="15%">考场名称</th>
					        <th width="15%">所属考点</th>
					        <th width="15%">所属考区</th>
					        <th width="10%">原座位数</th>
					        <th width="10%">现座位数</th>
					        <th width="15%">提交时间</th>
					        <th width="10%">操作</th>
					    </tr>
	    				<s:iterator value="page.result" status="st">
						   <tr>
						        <td>${code}</td>
						        <td>${name}</td>
						        <td title="${examSite.name}"><common:cut string="${examSite.name}" len="25"/></td>
						        <td title="${examSite.examArea.name}"><common:cut string="${examSite.examArea.name}" len="25"/></td>
						        <td>${deaultSeatSize}</td>
						        <td>${currentSeatSize}</td>
						        <td><s:date name="createDate" format="yyyy.MM.dd HH:mm"/></td>
						        <td>
						        	<a href="examroom!view.action?id=${id}&returnType=view">审核考场</a>
						        </td>
						    </tr>
					    </s:iterator>
					    <s:if test="page.result.size ==0">
							<tr> 
								<td height="30" align="center" colspan="8"><font color="gray">没有符合条件的记录</font></td>
							</tr>  
						</s:if>      
	    			</table>
	    			<!-- 翻页 start  -->
	    			<%@ include file="/common/page.jsp"%>
	    			
					<!-- 翻页 end  -->
				</form>
				
			</div>
			<!-- 右侧内容 column  end-->    
		</div> <!-- content  end-->  
	</div><!-- wrapper  end-->  
</body>
</html>