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
		
		//设置usbkey
		function setUsbKey(roomID,usbkey) {
			//
			$.post("../relatedsite.excsec",{"areaid":areaid},function(data) {
				$("#siteid option[value!='']").remove();
				var site = eval(data.site);
				if(site==null || site=='' || site.length == 0) return;
				for(var i = 0 ;i < site.length ; i++) {
					$("#siteid").append("<option value='"+site[i].value+"'>"+site[i].label+"</option>");
				}
			});
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
					<li id='tab1' class="switch_tab_current"  >考场现状列表</li>
					<li id='tab2' onclick="location.href='examroom!searchUnAudit.action'">考场座位变更申请审核</li>
					<li id='tab3' onclick="location.href='examroom!search.action'" >已审的考场座位变更申请</li>   
				</ul>
				<form id="mainForm" action="examroom.action" method="post">
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
					        <th width="15%">考场编号</th>
					        <th width="15%">考场名称</th>
					        <th width="15%">所属考点</th>
					        <th width="15%">所属考区</th>
					        <th width="10%">座位数</th>
					        <th width="30%">操作</th>
					    </tr>
	    				<s:iterator value="page.result" status="st">
						   <tr>
						        <td>${code}</td>
						        <td>${name}</td>
						        <td title="${examSite.name}"><common:cut string="${examSite.name}" len="25"/></td>
						        <td title="${examSite.examArea.name}"><common:cut string="${examSite.examArea.name}" len="25"/></td>
						        <td>${currentSeatSize}</td>
						        <td>
						        	<a href="examroom!input.action?id=${id}&returnType=info">信息修改</a>&nbsp;
						        	<a href="examroom!input.action?id=${id}&returnType=seat">座位修改</a>&nbsp;
						        	<a href="javaScript:delRecord('examroom!delete.action?id=${id}');">删除</a>
						        </td>
						    </tr>
					    </s:iterator>
					 </table>
	    			<!-- 翻页 start  -->
	    			<%@ include file="/common/page.jsp"%>
	    			<p class="ll mt15"><button id="btnCreate" type="button" onclick="window.location.href='examroom!input.action'">新增考场</button></p>
					<!-- 翻页 end  -->
				</form>
				
			</div>
			<!-- 右侧内容 column  end-->    
		</div> <!-- content  end-->  
	</div><!-- wrapper  end-->  
</body>
</html>