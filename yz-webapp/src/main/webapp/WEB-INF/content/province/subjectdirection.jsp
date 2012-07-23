<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="outsidesite" name="activemenu" />
	<title>科目方向</title>
	<link href="${ctx}/css/master.css" type="text/css" rel="stylesheet"/> 
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
	<script src="${ctx}/js/jcommon.js" type="text/javascript"></script>

</head>
<body>
<div id="wrapper">
	<div id="content">  

		<div class="right_content">
			
			<div class="layer_box"  style="width:550px;">
				<p class="right3pxborder">方向科目管理</p>
				<table class="tablebox"  >
	    				<tr>
    						<th width="35%">科目方向编号</th>
    						<th width="35%">科目方向名称</th>
    						<th width="30%">操作</th> 
    					</tr>
	    				<s:iterator value="page.result" status="st">
		    				<tr>
	    						<td>${code}</td>
	    						<td>${name}</td>
	    						<td><a href="javaScript:delRecord('subjectdirection!delete.action?id=${id}&subjectid=${sbid}');">删除</a></td> 
	    					</tr>
	    				</s:iterator>
	    		</table>
				<p class="m10"><button type="button" onclick="location.href='subjectdirection!input.action?subjectid=${subjectid}'">新增方向</button></p>
				


			</div>   
		</div> <!-- content  end-->  
	</div><!-- wrapper  end--> 
	</div> 
</body>
</html>