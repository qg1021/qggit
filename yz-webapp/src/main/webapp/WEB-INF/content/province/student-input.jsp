<%@ page contentType="text/html;charset=UTF-8" %>
<%@page import="com.drcl.yz.contant.Global"%>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="arrange" name="activemenu" />
	<title>考生信息修改</title>
	<link href="${ctx}/css/master.css" type="text/css" rel="stylesheet"/> 
	<link href="${ctx}/css/layer.css" rel="stylesheet" type="text/css"/>
	<link href="${ctx}/css/fancybox/jquery.fancybox-1.3.4.css" rel="stylesheet" type="text/css" media="screen" />
	<link href="${ctx}/js/validate/jquery.validate.css" type="text/css" rel="stylesheet"/>
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
	<script src="${ctx}/js/ajaxfileupload.js" type="text/javascript"></script>
	<script src="${ctx}/js/layer.js" type="text/javascript"></script>
	<script src="${ctx}/js/jcommon.js" type="text/javascript"></script>
	<script src="${ctx}/js/validate/jquery.validate.js" type="text/javascript"></script>
	<script src="${ctx}/js/validate/messages_cn.js" type="text/javascript"></script>
	<script type="text/javascript" src="${ctx}/js/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
	<script type="text/javascript" src="${ctx}/js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
	<script src="${ctx}/js/jcommon.js" type="text/javascript"></script>
	<script type="text/javascript">
	
	
	$(document).ready(function() {
		$("a#idcardexample").fancybox();
		$("a#picexample").fancybox();
			$("#idcard").focus();

			//自定义验证规则
	 		$.validator.addMethod("validateIDCard",function(value,element,params){
	 	 		var card=$.trim($("#idcard").val());
	  
	 			// 身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X
	 			var reg = /(^\d{15}$)|(^\d{17}(\d|X)$)/;
	 			if(reg.test(card) === false)
	 			{
	 				return false;
	 			}
	 			return true;
			},"身份证号格式错误");
			
	 		$("#inputForm").validate({
				rules: {
					idcard: {
						required: true, 
						validateIDCard:true,
						remote: "student!checkIdCard.action?oldIdcard=${idcard}"
					},
					name: "required"
				},		
				messages: {
					idcard:{
						required:"请输入身份证号",
						remote:"身份证号的用户已存在,请重新输入"
					}, 
					name:{
						required:"请输入姓名" 
					} 
				} ,
		        errorPlacement: function(error, element) {   
			        if (document.getElementById("error_"+element.attr("name")))  {
			            error.appendTo("#error_"+element.attr("name"));  
			        }
			        else       
			            error.insertAfter(element);   
			        },
			        errorElement: "em"
			}); 
		});	
	function onClose(){
		parent.location.reload();
		parent.$.fancybox.close();
	}
	</script>
</head>
<body>
	<!-- JS遮罩层 --> 
	<div id="fullbg"></div> 
	<!-- end JS遮罩层 --> 
	<!-- 对话框 --> 
	<div id="dialog"> 
		<div id="dialog_content"></div> 
	</div>
	<!--修改个人信息 start-->  
	<div class="layer_box">
	<p class="examination_info">修改考生个人信息</p>
		<form id="inputForm" name="inputForm" action="student!save.action" method="post" >
		<input type="hidden" id="id" name="id" value="${id}"/>
		<input type="hidden" id="picurl" name="picurl" value="${picurl}"/>
		<input type="hidden" id="idcardurl" name="idcardurl" value="${idcardurl}"/>
		<input type="hidden" id="picbaseurl" name="picbaseurl" value="<common:prop name="oems.webapp.uploadUrl" propfilename="sysconfig.properties" defaultvalue="${pageContext.request.contextPath}"/><%=Global.STUDENTPIC_PATH%>"/>
		<input type="hidden" id="idcardbaseurl" name="idcardbaseurl" value="<common:prop name="oems.webapp.uploadUrl" propfilename="sysconfig.properties" defaultvalue="${pageContext.request.contextPath}"/><%=Global.IDCARD_PATH%>"/>
		<div id="message" style="line-height: 35px;">
			<s:actionmessage theme="custom" cssClass="tipbox"/>
		</div>
		<ul class="form">
    		<li>
    			<label>用户名</label>${username}</li>
    		<li>
    			<label>身份证号</label>
    			<input id="idcard" name="idcard" value="${idcard}" maxlength="25" type="text" style="width:300px;"/>
    		</li>
    		<li>
    			<label>姓名</label>
    			<input type="text" id="name" name="name" value="${name}" maxlength="15" style="width:300px;"/>
    		</li>
    		<li>
    			<label>工作单位</label>
    			<input type="text" id="company" name="company" value="${company}" maxlength="50" style="width:300px;"/>
    		</li>
    		<li class="ll mr30">
    			<label>手机</label>
    			<input type="text" id="mobile" name="mobile" value="${mobile}" maxlength="15" style="width:100px;"/> 
    		</li>
    		<li>
    			固定电话&nbsp; 
    			<input type="text" id="tel" name="tel" value="${tel}" maxlength="20" style="width:100px;"/>
    		</li>
    		<li class="clearb">
    			<label>学历/专业</label>
    			<s:select list="educationList" listKey="value" listValue="label" id="education" name="education" value="education"  cssStyle="width:120px;" headerKey="" headerValue="请选择学历"/>
    			<input type="text" id="major" name="major" value="${major}" maxlength="50" style="width:175px;" />
    		</li>
    		<li>
    			<label>职称</label>
    			<input type="text" id="professional" name="professional" value="${professional}" style="width:300px;"/>
    		</li>
    		<li>
    			<label>行业工作经历</label>
    			<input type="text"  id="experience" name="experience" value="${experience}" style="width:100px;"/> 年
    		</li>
    		<li>
    			<label>个人照片</label>
    			<input type="file" id="file" name="file" onchange="ajaxUploadPic('../upload!pic.excsec');" />
    			<s:if test="picurl!=mull && picurl!=''">
 					<span id="picspan"><a id="picexample" href="<common:prop name="oems.webapp.uploadUrl" propfilename="sysconfig.properties" defaultvalue="${pageContext.request.contextPath}"/><%=Global.STUDENTPIC_PATH%>${picurl}" >查看个人照片</a></span>
 				</s:if>
 				<s:else>
 					<span id="picspan" style="display:none" ><a id="picexample" href="#">查看个人照片</a></span>
 				</s:else>
    		</li>
    		<li>
    			<label>身份证扫描件</label>
    			<input type="file" id="idimage" name="idimage"   onchange="ajaxUploadIdcard('../upload!idcard.excsec');"/>
    			<s:if test="idcardurl!=mull && idcardurl!=''">
 					<span id="idcardspan"><a id="idcardexample" href="<common:prop name="oems.webapp.uploadUrl" propfilename="sysconfig.properties" defaultvalue="${pageContext.request.contextPath}"/><%=Global.IDCARD_PATH%>${idcardurl}" >查看身份证扫描件</a></span>
 				</s:if>
 				<s:else>
 					<span id="idcardspan" style="display:none"><a id="idcardexample"  href="#">查看身份证扫描件</a></span>
 				</s:else>
    		</li>
    		<li class="ml_100"></li>
    	</ul>
    	<p class="button_box">
    		<button id="btnSave" type="submit">确定</button> 
    		<button id="btnCancel" type="button" onclick="onClose();">取消</button>
    	</p>
    	</form>
	</div>
<!--修改个人信息 end -->
</body>
</html>