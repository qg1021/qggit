<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<% 
      String status = request.getParameter("filter_EQI_status");
	  Integer sid = new Integer(0);
	  if(status != null && !"".equals(status.trim())){
		sid = java.lang.Integer.parseInt(status);
	    request.setAttribute("status",sid) ;
	  }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="examtimes" name="activemenu" />
	<title>考次</title>
	<link href="${ctx}/css/master.css" type="text/css" rel="stylesheet"/> 
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
	<script src="${ctx}/js/jcommon.js" type="text/javascript"></script>
	<script type="text/javascript">
	function onLink(itemurl){
		if(itemurl!=null && itemurl!=''){
			window.location.href = itemurl;
		}
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
			<h2>考次管理</h2>
			<div class="pagehead01"></div>
			<form id="mainForm" action="examtimes.action" method="post">
	    		<div class="top_serach_box_registration">
		        	<ul>
			            <li><label>考试项目名称</label><input id="filter_LIKES_examItem$name" name="filter_LIKES_examItem$name" value="${param['filter_LIKES_examItem$name']}" type="text" size="20" /></li>
			            <li><label>考试项目编号</label><input id="filter_LIKES_examItem$code" name="filter_LIKES_examItem$code" value="${param['filter_LIKES_examItem$code']}"  type="text" size="20" /></li>
			            <li><label>考次编号</label><input id="filter_LIKES_code" name="filter_LIKES_code" value="${param['filter_LIKES_code']}" type="text" size="20" /></li>
		        	</ul>
			        <ul>
			            <li><label>考次名称</label><input id="filter_LIKES_name" name="filter_LIKES_name" value="${param['filter_LIKES_name']}"  type="text" size="20" /></li>
			            <li>
			                <label>考次状态</label>
			                <s:select list="#{'0':'新建','1':'未发布','2':'已发布','3':'已排考','4':'待考','5':'考试中','6':'已考'}"  id="status" name="filter_EQI_status"  value="#request.status" cssStyle="width:85px;" headerKey="" headerValue="--所有--"/>
			            </li>
			            <li><button type="submit">搜索</button></li>
			       </ul>
	
	    		</div>
    			
	    			<table class="tablebox"  >
	    				<tr>
    						<th width="10%">项目编号</th>
    						<th width="25%">项目名称</th>
    						<th width="10%">考次编号</th>
    						<th width="20%">考次名称</th>
    						<th width="10%">开放科目 </th>
    						<th width="10%">状态 </th>
    						<th width="25%">操作</th> 
    					</tr>
	    				<s:iterator value="page.result" status="st">
						    <tr>
							    <td>${examItem.code}</td>
							    <td title="${examItem.name}"><common:cut string="${examItem.name}" len="20"/></td>
							    <td>${code}</td>
							    <td >${name}</td>
							    <td>${subjectSize}</td>
							    <td>${statusName}</td>
							    <td>
								    <a href="examtimes!input.action?id=${id}&itemid=${examItem.id}&returnType=base">考次定义</a>
								    <!--<a href="flow.action?timesid=${id}" target="_blank">考务管理</a>  -->
							    </td>
						    </tr>
					    </s:iterator>
					    <s:if test="page.result.size ==0">
						<tr> 
							<td height="30" align="center" colspan="7"><font color="gray">没有符合条件的记录</font></td>
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