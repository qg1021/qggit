<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="examtimes" name="activemenu" />
	<title>时间单元</title>
	<link href="${ctx}/css/master.css" type="text/css" rel="stylesheet"/> 
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
	<script src="${ctx}/js/jcommon.js" type="text/javascript"></script>
	<script type="text/javascript">
	function onComplete(){
		var size = '${page.totalCount}';
		if(size*1<=0){
			alert("时间单元不能空");
			return false;
		}
		window.location.href="field!complete.action?timesid=${timesid}";
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
				    <th width="25%">4 场次（时间单元）设置</th>
    			</tr>
			</table>
    		<p class="examination_info">当前考次的时间单元列表</p>
       		<p class="h2info box_dotline_bottom">设置时间单元时需根据考试科目的最长时长，并预留相应的延考缓冲时间。</p>
			<p class="mt10"><span class="rr">&nbsp;</span>已设置 
				<span class="strong">${page.totalCount}</span> 个时间单元
				<button id="btnCreate" type="button" onclick="window.location.href='field!input.action?timesid=${timesid}'">新增时间单元</button>
			</p>
			<div id="message" style="line-height: 35px;">
				<s:actionmessage theme="custom" cssClass="tipbox"/>
			</div>
    		<form id="mainForm" action="field.action" method="post">
    			<input id="timesid" name="timesid" type="hidden" value="${timesid}"/>
	    		<table class="tablebox"  >
	    			<tr>
						<th width="15%">场次 ID</th>
					    <th width="50%">时间单元 </th>
					    <th width="30%">操作</th>
					</tr>
	    			<s:iterator value="page.result" status="st">
					    <tr>
						    <td>${code}</td>
						    <td><s:date name="startdate" format="MM月dd日 HH:mm"/>-<s:date name="enddate" format="HH:mm"/>(${dateTimeBetween}分钟)</td>
						    <td>
						    	<a href="field!input.action?id=${id}&timesid=${timesid}">修 改</a>
						    	<a href="javaScript:delRecord('field!delete.action?id=${id}&timesid=${timesid}');">删 除</a>
						    </td>
					    </tr>
					</s:iterator>
					<s:if test="page.result.size ==0">
						<tr> 
							<td height="30" align="center" colspan="4"><font color="gray">没有符合条件的记录</font></td>
						</tr>  
					</s:if>      
	    		</table>
	    		<div class="box_solid_blue">
	 				<button class="rr" type="button" onclick="onComplete();">完成</button>
	 				<button type="button" onclick="window.location.href='examtimes!qindex.action?id=${timesid}'">上一步</button>
	 			</div>
	    			
			</form>
				
			</div>
			<!-- 右侧内容 column  end-->    
		</div> <!-- content  end-->  
	</div><!-- wrapper  end-->  
</body>
</html>