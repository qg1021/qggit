<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="searchitem" name="activemenu" />
	<title>考试项目</title>
	<link href="${ctx}/css/master.css" type="text/css" rel="stylesheet"/> 
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
	<script type="text/javascript">
	function onLink(itemurl,code,name,warecode){
		if(warecode==''){
			if(itemurl.indexOf("examitem!input.action?id")!=-1){
				$("#searchForm").attr("action",itemurl).submit();
			}else{
				alert("没有关联科目信息不能新建考次相关信息");
			}
		}else{
			if(itemurl!=null && itemurl!=''){
				$("#code").val(code);
				$("#name").val(name);
				$("#searchForm").attr("action",itemurl).submit();
			}
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
			<h2>考试项目管理</h2>
			<div class="pagehead01"></div>
    			<p class="exam_number">已创建<span class="strong">${page.totalCount}</span>个考试项目</p>
    			<form id="searchForm" action="examitem.action" method="post">
    				<input type="hidden" id="code" name="filter_LIKES_examItem$code" value=""/>
    				<input type="hidden" id="name" name="filter_LIKES_examItem$name" value=""/>
    			</form>
    			<form id="mainForm" action="examitem.action" method="post">
	    			<table class="tablebox"  >
	    				<tr>
	    					<th width="10%">项目编号</th>
	    					<th width="35%">考试项目名称 </th>
	    					<th width="10%">已考考次</th>
	    					<th width="10%">待考次数</th>
	    					<th width="15%">考试中考次</th>
	    					<th width="10%">题库ID</th>
	    					<th width="10%">操作</th>  
	    				</tr>
	    				<s:iterator value="page.result" status="st">
						    <tr>
							    <td>${code}</td>
							    <td title="${name}"><common:cut string="${name}" len="20"/></td>
							    <td><a onclick="onLink('examtimes.action?filter_EQI_status=6','${code}','${name}','${warecode}')">${examedTimesSize}</a></td>
							    <td ><a onclick="onLink('examtimes.action?filter_EQI_status=4','${code}','${name}','${warecode}')">${jexamingTimesSize}</a></td>
							    <td><a onclick="onLink('examtimes.action?filter_EQI_status=5','${code}','${name}','${warecode}')">${examingTimesSize}</a></td>
							    <td>${warecode}</td>
							    <td>
								    <select id="operate" name="operate" onchange="onLink(this.value,'${code}','${name}','${warecode}');">
								    	<option value="">请选择操作</option>
								    	<option value="examitem!input.action?id=${id}">编辑考试项目</option>
								    	<option value="examtimes!input.action?itemid=${id}&returnType=base">新建考次</option>
								    	<option value="examtimes.action">考次管理</option>
								    </select>
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