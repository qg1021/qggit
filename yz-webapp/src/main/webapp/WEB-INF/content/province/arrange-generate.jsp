<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="arrange" name="activemenu" />
	<title>报考策略管理</title>
	<link href="${ctx}/css/master.css" type="text/css" rel="stylesheet"/> 
	<link href="${ctx}/js/validate/jquery.validate.css" type="text/css" rel="stylesheet"/>
	<link href="${ctx}/css/fancybox/jquery.fancybox-1.3.4.css" rel="stylesheet" type="text/css" media="screen" />
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
	<script src="${ctx}/js/validate/jquery.validate.js" type="text/javascript"></script>
	<script type="text/javascript" src="${ctx}/js/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
	<script type="text/javascript" src="${ctx}/js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
	<script src="${ctx}/js/jcommon.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			setTabClass(5);
		});
		function onCreate(){
			window.location.href='arrange!generateCode.action?timesid=${timesid}';
		}

	</script>

</head>
<body>
<div id="wrapper">
	<%@ include file="/common/header.jsp"%>
	<!--the end of head-->
	<div id="content">  
		<!-- top 统计板块 start-->
		<%@ include file="arrange-base.jsp"%>
		<!-- top 统计板块 end-->
		<!-- tab05 start -->
	<div id="tabid5">
	    <p class="right3pxborder">准考证生成情况</p>   
	    <table class="tablebox" style="width: 600px; margin: 0 auto;">
		    <tr>
			    <th width="50%">报考人数</th>
			    <td>${tsize}</td>
		    </tr>
		    <tr>
			    <th>已获准考证人数</th>
			    <td>${csize}</td>
		    </tr>
		    <tr>
			    <th>未获准考证人数</th>
			    <td>${vsize}</td>
		    </tr>
	    </table>
	    <p class="ta_c mt10">
	    	<s:if test="examTimes.status==3">
	    		<button type="button" onclick="onCreate();">生成准考证</button>
	    	</s:if>
	    	<s:if test="examTimes.status==4">
	    		<button type="button" onclick="onCreate();">追加生成准考证</button>
	    	</s:if>
	    </p>
	    <p class="right3pxborder">准考证生成记录</p>
	    <table class="tablebox" style="width: 600px; margin: 0 auto;">
		    <tr>
			    <th>时间</th>
			    <th>操作</th>
			    <th>操作者</th>
		    </tr>
		    <s:iterator value="examTimes.cardLogList">
			    <tr>
				    <td><s:date name="createDate" format="yyyy.MM.dd HH:mm"/></td>
				    <td>${typeName}</td>
				    <td>${createBy}</td>
			    </tr>
		    </s:iterator>
	    </table>
    </div>
<!-- tab05 end -->
	<!-- tab03 end -->
	</div> <!-- content  end-->  
</div><!-- wrapper  end-->  
</body>
</html>