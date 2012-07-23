<%@ page contentType="text/html;charset=UTF-8" %>
<%@page import="com.drcl.yz.contant.Global"%>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="examscore" name="activemenu" />
	<title>成绩明细</title>
	<link href="${ctx}/css/master.css" type="text/css" rel="stylesheet"/> 
	<link href="${ctx}/css/fancybox/jquery.fancybox-1.3.4.css" rel="stylesheet" type="text/css" media="screen" />
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
	<script type="text/javascript" src="${ctx}/js/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
	<script type="text/javascript" src="${ctx}/js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
	<script src="${ctx}/js/jcommon.js" type="text/javascript"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		$("a#idcardexample").fancybox();
		$("a#picexample").fancybox();
		$("#btnScore").fancybox({
			'titlePosition'		: 'inside',
			'transitionIn'		: 'elastic',
			'transitionOut'		: 'elastic',
			'width'				: 648,
			'height'			: 360,
			'type'				: 'iframe',
			'autoScale': true,
			'showCloseButton':true,
			'hideOnOverlayClick':false,
			'scrolling': 'no',  
			'padding': 0, //边框距离
			'margin':0 //边框距离
		 });
	});
	</script>
</head>
<body>
<div id="wrapper">
	<%@ include file="/common/header.jsp"%>
	<!--the end of head-->
	<div id="content">  
    <div class="content_box">
      <h2>考生成绩查询</h2>
      <div class="pagehead01"></div>
      <!--<div class="pagehead02"></div>-->
      <p class="examination_info">考生个人信息</p>
      <div class="top_serach_box">
      	<ul class="form">
 				<li>
 					<label>用户名</label>${student.username}
 				</li>
 				<li>
 					<label>身份证号</label>
 					<input type="text" id="idcard" name="idcard" value="${student.idcard}"  disabled="disabled" style="width:400px;"/>
 					<s:if test="student.idcardurl!=mull && student.idcardurl!=''">
 						<a id="idcardexample" href="<common:prop name="oems.webapp.uploadUrl" propfilename="sysconfig.properties" defaultvalue="${pageContext.request.contextPath}"/><%=Global.IDCARD_PATH%>${student.idcardurl}" >查看身份证扫描件</a>
 					</s:if>
 					<s:else>
 						<a id="idcardexample" style="display:none" href="#">查看身份证扫描件</a>
 					</s:else>
 				</li>
 				<li>
 					<label>姓名</label>
 					<input type="text" id="name" name="name" value="${student.name}" disabled="disabled" style="width:400px;"/>
 				</li>
 				<li>
 					<label>工作单位</label>
 					<input type="text" id="company" name="company" value="${student.company}" disabled="disabled" style="width:400px;"/>
 				</li>
 				<li class="ll mr30">
 					<label>手机</label>
 					<input id="mobile" name="mobile" value="${student.mobile}" disabled="disabled" type="text" style="width:120px;"/> 
 				</li>
 				<li>
 					固定电话 &nbsp;
 					<input id="tel" name="tel" value="${student.tel}" disabled="disabled" type="text" style="width:120px;"/>
 				</li>
 				<li class="clearb">
 					<label>学历/专业</label>
 					<select disabled="disabled" style="width:150px;"><option>${student.education}</option></select>
 					<input id="major" name="major" value="${student.major}" disabled="disabled" type="text" style="width:245px;" />
 				</li>
 				<li>
 					<label>职称</label>
 					<input type="text" id="professional" name="professional" value="${student.professional}" disabled="disabled" style="width:400px;"/>
 				</li>
 				<li>
 					<label>行业工作经历</label>
 					<input type="text" id="experience" name="experience" value="${student.experience}" disabled="disabled" style="width:100px;"/> 年
 				</li>
 				<li>
 					<label>个人照片</label>
 					<s:if test="student.picurl!=mull && student.picurl!=''">
 						<a id="picexample" href="<common:prop name="oems.webapp.uploadUrl" propfilename="sysconfig.properties" defaultvalue="${pageContext.request.contextPath}"/><%=Global.STUDENTPIC_PATH%>${student.picurl}" >查看个人照片</a>
 					</s:if>
 					<s:else>
 						<a id="picexample" style="display:none" href="#">查看个人照片</a>
 					</s:else>
 				</li>
    		</ul>	
      	</div>
      <p class="examination_info">报考内容</p>
      <div class="top_serach_box">
        <ul class="form_02 form_score">
	    	<li><label>考试项目</label>${etimes.examItem.name}</li>
		    <li><label>项目编号</label>${etimes.examItem.code}</li>
		    <li><label>考次名称</label>${etimes.name}</li>
	    	<li><label>考次编号</label>${etimes.code}</li>
	    	<li><label>科目</label>${subject.name}</li>
	    	<li><label>时间单元</label><s:date name="field.startdate" format="yyyy.MM.dd HH:mm"/>-<s:date name="field.enddate" format="HH:mm"/></li>
	    	<li><label>考区</label>${examSite.examArea.name}</li>
	    	<li><label>考点</label>${examSite.name}</li>
	    	<li><label>考场</label>${examRoom.name}</li>
	    	<li><label>座位号</label>${seat}</li>
	    	<li><label>准考证</label>${cardNo}</li>
	    	<li><label>报名号</label>${reportNo}</li>
    	</ul>
      </div>
      <p class="examination_info">成绩与考试情况</p>
      <div class="top_serach_box">
      	<ul class="form_02 form_score">
   			 <li><label>原始成绩</label>${score}(${scoreStatus})</li>
             <li><label>调整成绩</label>${tscore}(${scoreStatus})</li>
             <li>
             	<s:if test="qualified!=null">
             		<label>合格情况</label>
             		<s:if test="qualified">合格</s:if>
             		<s:else>不合格</s:else>
             	</s:if>
             	<s:else>
             		<button id="btnScore" href="examscore!view.action?id=${id}" class="ml10">调整成绩</button>
             	</s:else>
             </li>
    	</ul>
        <textarea rows="4" cols="100" class="clearb">${remark}</textarea>
        <p class="ta_c mt10">
        	<button type="button" onclick="pageClose();">关闭窗口</button>
        </p>
      </div>      
    </div>

<!--右边结束-->
		</div> <!-- content  end-->  
	</div><!-- wrapper  end-->  
</body>
</html>