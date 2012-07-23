<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="searchitem" name="activemenu" />
	<title>时间单元</title>
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
			<h2>新建考次</h2>
			<div class="pagehead01"></div>
			<table class="tablebox"  >
			    <tr>
				    <th width="25%">1 考次设置<span class="icon_success">&nbsp;</span></th>
				    <th width="25%">2 科目设置<span class="icon_success">&nbsp;</span></th>
				    <th width="25%">3 质量管理<span class="icon_success">&nbsp;</span></th>
				    <th width="25%">4 场次（时间单元）设置<span class="icon_success">&nbsp;</span></th>
    			</tr>
			</table>
    		<div class="top_serach_box">
			    <div class="exam_success_box">
			    <p class="icon_success mb10">考次设置成功！</p>
			    <!-- <button type="button" onclick="window.close();">关闭窗口</button> -->
			    </div>
    		</div>
				
			</div>
			<!-- 右侧内容 column  end-->    
		</div> <!-- content  end-->  
	</div><!-- wrapper  end-->  
</body>
</html>