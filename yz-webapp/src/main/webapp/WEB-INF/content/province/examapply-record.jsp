<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@page import="com.drcl.yz.contant.Global"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="examtimes" name="activemenu" />
	<title>报考信息详细</title>
	<link href="${ctx}/css/master.css" type="text/css" rel="stylesheet"/> 
	<link href="${ctx}/js/fancybox/jquery.fancybox-1.3.4.css" rel="stylesheet" type="text/css" media="screen" />
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
	<script type="text/javascript" src="${ctx}/js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
	<script type="text/javascript" src="${ctx}/js/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
	<script  type="text/javascript"  src="${ctx}/js/LodopFuncs.js"></script>
	<object id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0> 
	<embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0 pluginspage="../js/install_lodop.exe"></embed>
	</object>
	<script type="text/javascript">
	$(document).ready(function() {
		$("#idshow").fancybox({
			'titlePosition'		: 'inside',
			'transitionIn'		: 'elastic',
			'transitionOut'		: 'elastic',
			'width'				: 650,
			'height'			: 500
		});

		
	});
	</script>
</head>
<body>
<div id="wrapper">
<br />
<div id="content">
<s:actionmessage theme="custom" cssClass="success"/>
<div class="right_l">

<s:if test="examRecord.status > 12 ">
<button  onclick="window.location.href='examapply!preconfirm.action?id=${examTimes.id}&recordId=${examRecord.id}&status=${status}'">&lt;&lt;上一个</button>
</s:if>
<s:else>
	<button  onclick="window.location.href='examapply!preunpass.action?id=${examTimes.id}&recordId=${examRecord.id}&status=${status}'">&lt;&lt;上一个</button>
</s:else>
</div>

<!-- 右侧内容 column  start -->  
<div class="right_c">


<h2>考生报名信息详细</h2>


<div class="pagehead01"></div>
<!--<div class="pagehead02"></div>-->
	
    <!--<a href="#" class="rr">修改个人信息&gt;&gt;</a>
	--><p class="examination_info">考生个人信息</p>
    <div class="top_serach_box">
    <ul class="form">
    <li><label>用户名</label>${examRecord.student.username }</li>
    <li><label>身份证号</label><input type="text" value="${examRecord.idcard}" disabled="disabled" style="width:400px;"/> <a id="idshow" href="#iddiv">查看身份证扫描件</a></li>

    <li><label>姓名</label><input type="text" value="${examRecord.name }" disabled="disabled" style="width:400px;"/></li>
    <li><label>工作单位</label><input type="text" value="${examRecord.company}" disabled="disabled" style="width:400px;"/></li>
    <li class="ll mr30"><label>手机</label><input value="${examRecord.mobile}" type="text" disabled="disabled" style="width:120px;"/> </li>
    <li>固定电话 &nbsp;<input type="text" value="${examRecord.tel}" disabled="disabled" style="width:120px;"/></li>
    <li class="clearb"><label>学历/专业</label><select disabled="disabled" style="width:150px;"><option>${examRecord.education}</option></select>

    <input type="text" value="${examRecord.major }" disabled="disabled" style="width:245px;" value="请填写专业"/></li>
    <li><label>职称</label><input type="text" value="${examRecord.professional }" disabled="disabled" style="width:400px;"/></li>
    <li><label>行业工作经历</label><input type="text" value="${examRecord.experience }" disabled="disabled" style="width:100px;"/> 年</li>
    <li><label>个人照片</label><img src="<common:prop name="oems.webapp.uploadUrl" propfilename="sysconfig.properties" defaultvalue="${pageContext.request.contextPath}"/><%=Global.STUDENTPIC_PATH%>/${examRecord.picurl}" alt="" width="100px" align="top"/></li>
    </ul>

    </div>
    
    <!--<a href="#" class="rr">修改报考内容&gt;&gt;</a>
    --><p class="examination_info">报考内容</p>
   <div class="top_serach_box">
    <ul class="form_02">
    <li><label>考试项目</label><select disabled="disabled" style="width:300px;"><option>${examTimes.examItem.name}</option></select></li>
    <li><label>考试编号</label>${examTimes.examItem.code}</li>

    <li><label>考次名称</label><select disabled="disabled" style="width:300px;"><option>${examTimes.name}</option></select></li>
    <li><label>考次年月</label>${examTimes.year}.${examTimes.month}</li>
    <li><label>考次编号</label>${examTimes.code}</li>
    <li><label>考区选择</label><select disabled="disabled" style="width:300px;"><option>${examRecord.examArea.name}</option></select></li>
    <li><label>考点选择</label><select disabled="disabled" style="width:300px;"><option>${examRecord.examSite.name}</option></select></li>

    <li><label>报考科目</label>${examRecord.subject.name}</li>
    <li><label>报名时间</label><s:date name="examRecord.reportDate" format="yyyy.MM.dd HH:mm"/></li>
    </ul>
    </div>
    
  <button class="rr" onclick="javascript:previewTable();">打印《报名信息表》</button>
   <p class="examination_info">报考审核与确认</p>

<s:iterator value="examRecord.applyHisList" status="st">
  <ul class="review_info">
  <li class="review_info01">${type}</li>
  <li class="review_info02">${oper}(<s:date name="operDate" format="yyyy.MM.dd HH:mm"/>)</li>
  </ul>
  </s:iterator>
 <s:if test="examTimes.applyStatus <5 && areaStat.pvReportDate == null && areaStat.reportDate != null"> 
  <ul class="review_info">
  <li class="review_info01">省考务报名审核</li>
  <li class="review_info02">${examRecord.statusName}</li>
  <s:if test="examRecord.status==10">
  <li class="review_info03"> 
  <button onclick="window.location.href='examapply!unpass.action?id=${examTimes.id}&recordId=${examRecord.id}&status=${status}'" style="line-height:16px;">不通过</button></li>
  </s:if>
  <s:if test="examRecord.status==11">
  <li class="review_info03"> 
  <button onclick="window.location.href='examapply!pass.action?id=${examTimes.id}&recordId=${examRecord.id}&status=${status}'" style="line-height:16px;">改为通过</button></li>
  </s:if>
  </ul>
</s:if>  
  
  
  
  
</div>
<!-- 右侧内容 column  end-->    

<div class="right_r">

<s:if test="examRecord.status > 12 ">
<button  onclick="window.location.href='examapply!nextconfirm.action?id=${examTimes.id}&recordId=${examRecord.id}&status=${status}'">下一个&gt;&gt;</button>
</s:if>
<s:else>
	<button  onclick="window.location.href='examapply!nextunpass.action?id=${examTimes.id}&recordId=${examRecord.id}&status=${status}'">下一个&gt;&gt;</button>
</s:else>
</div>
		<div style="display: none;">
	
	<!--弹出层开始-->
	<div id="iddiv" class="layer_box">
	<div id="verifymsg" >
		<img src='<common:prop name="oems.webapp.uploadUrl" propfilename="sysconfig.properties" defaultvalue="${pageContext.request.contextPath}"/><%=Global.IDCARD_PATH%>/${examRecord.idcardurl}'/>
	</div>
	</div>
	<!--弹出层结束-->
	</div>
	 <%@ include file="../common/reportprint.jsp"%>

</div>
</div>


</body>
</html>