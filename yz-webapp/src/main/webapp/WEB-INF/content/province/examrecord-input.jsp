<%@ page contentType="text/html;charset=UTF-8" %>
<%@page import="com.drcl.yz.contant.Global"%>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="arrange" name="activemenu" />
	<title>缓考的报名信息详细</title>
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
		$("#btnStudent").fancybox({
			'titlePosition'		: 'inside',
			'transitionIn'		: 'elastic',
			'transitionOut'		: 'elastic',
			'width'				: 648,
			'height'			: 503,
			'type'				: 'iframe',
			'autoScale': true,
			'showCloseButton':false,
			'hideOnOverlayClick':false,
			'scrolling': 'no',  
			'padding': 0, //边框距离
			'margin':0 //边框距离
		 });
		$("#btnRecord").fancybox({
			'titlePosition'		: 'inside',
			'transitionIn'		: 'elastic',
			'transitionOut'		: 'elastic',
			'width'				: 648,
			'height'			: 503,
			'type'				: 'iframe',
			'autoScale': true,
			'showCloseButton':false,
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
		<div class="right_l">
			<button>&lt;&lt;上一个</button>
		</div>
		<!-- 右侧内容 column  start -->  
		<div class="right_c">
			<h2> 缓考的报名信息详细</h2>
			<div class="pagehead01"></div>
			<!--<div class="pagehead02"></div>-->
    			<a id="btnStudent" href="student!input.action?id=${student.id}" class="rr">修改个人信息&gt;&gt;</a>
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
    			<a id="btnRecord" href="examrecord!input.action?id=${id}&returnType=part&timesid=${examTimes.id}" class="rr">修改报考内容&gt;&gt;</a>
    			<p class="examination_info">报考内容</p>
   				<div class="top_serach_box">
    				<ul class="form_02">
    					<li>
    						<label>考试项目</label>
   							<select disabled="disabled" style="width:300px;">
   								<option>${examTimes.examItem.name}</option>
   							</select>
    					</li>
    					<li>
    						<label>考试编号</label>${examTimes.examItem.code}
    					</li>
    					<li>
    						<label>考次名称</label>
    						<select disabled="disabled" style="width:300px;">
    							<option>${examTimes.name}</option>
    						</select>
    					</li>
    					<li>
    						<label>考次年月</label>${examTimes.year}.${examTimes.month}
    					</li>
    					<li>
    						<label>考次编号</label>${examTimes.code}
    					</li>
    					<li>
    						<label>考区选择</label>
    						<select disabled="disabled" style="width:300px;"><option>${examArea.name}</option></select>
    					</li>
    					<li>
    						<label>考点选择</label>
    						<select disabled="disabled" style="width:300px;"><option>${examSite.name}</option></select>
    					</li>
    					<li>
    						<label>报考科目</label>${subject.name}
    					</li>
    					<li><label>报名时间</label><s:date name="reportDate" format="yyyy.MM.dd HH:mm"/></li>
    				</ul>
    			</div>
  				<button class="rr">打印《报名信息表》</button>
   				<p class="examination_info">报考审核与确认</p>
  				<ul class="review_info">
  					<li class="review_info01">考点预报名上报</li>
  					<li class="review_info02">设为有效报名(2011.04.01 14:00)</li>
  					<li class="review_info03">&nbsp;</li>
  				</ul>
  				<ul class="review_info">
  					<li class="review_info01">考区报名审核</li>
  					<li class="review_info02">考区审核通过(2011.04.01 14:00)</li>
  					<li class="review_info03">&nbsp;</li>
  				</ul>
  				<ul class="review_info">
  					<li class="review_info01">省考务报名审核</li>
  					<li class="review_info02">省考务审核通过(2011.04.01 14:00)</li>
  					<li class="review_info03">&nbsp;</li>
  				</ul>
   				<ul class="review_info">
  					<li class="review_info01">考点（考区）报名确认</li>
  					<li class="review_info02">考区已确认报名(2011.04.01 14:00)</li>
  					<li class="review_info03">&nbsp;</li>
  				</ul>
  				<ul class="review_info">
  					<li class="review_info01">考区报名确认上报</li>
  					<li class="review_info02">考区已上报省考务(2011.04.01 14:00)</li>
  					<li class="review_info03">&nbsp;</li>
  				</ul> 
   				<ul class="review_info">
  					<li class="review_info01">准考证</li>
  					<li class="review_info02">缓考</li>
  					<li class="review_info03">&nbsp;</li>
  				</ul>
			</div>
			<!-- 右侧内容 column  end-->    
			<div class="right_r">
				<button>下一个&gt;&gt;</button>
			</div>
		</div> <!-- content  end-->  
	</div><!-- wrapper  end-->  
</body>
</html>