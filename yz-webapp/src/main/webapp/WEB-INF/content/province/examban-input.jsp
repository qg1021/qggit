<%@ page contentType="text/html;charset=UTF-8" %>
<%@page import="com.drcl.yz.contant.Global"%>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="ban" name="activemenu" />
	<title>禁考列表</title>
	<link href="${ctx}/css/master.css" type="text/css" rel="stylesheet"/> 
	<link href="${ctx}/css/layer.css" rel="stylesheet" type="text/css"/>
	<link href="${ctx}/css/fancybox/jquery.fancybox-1.3.4.css" rel="stylesheet" type="text/css" media="screen" />
	<link href="${ctx}/js/validate/jquery.validate.css" type="text/css" rel="stylesheet"/>
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
	<script type="text/javascript" src="${ctx}/js/DatePicker/WdatePicker.js" ></script>
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
		$("a#picexample").fancybox();
		$("a#idcardexample").fancybox();
			$("#idcard").focus();
			setDeafault();

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
						validateIDCard:true
					},
					name: "required",
					subjectid: "required",
					startDate: "required",
					endDate: "required",
					remark: "required"
				},		
				messages: {
					idcard:{
						required:"请输入身份证号"
					}, 
					name:{
						required:"请输入姓名" 
					},
					subjectid: "选择禁考科目",
					startDate: "选择禁考开始时间",
					endDate: "选择禁考结束时间",
					remark: "输入禁考原因" 
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
	function setDeafault(){
		if($("#id").val()!=''){
			$('input,select,textarea,radio,checkbox').attr('disabled',true);
		}
	}
	function getStudentInfo(){
		if($("#idcard").val()!=''){
			$("#studentid").val('');
			
			$("#name").val('');
			$("#company").val('');
			$("#mobile").val('');
			$("#tel").val('');
			$("#education").val('');
			$("#professional").val('');
			$("#major").val('');
			$("#experience").val('');
			$("#picurl").val('');
			$("#picexample").attr("href",'');
			$("#picspan").hide();
			$("#idcardurl").val('');
			$("#idcardexample").attr("href",'');
			$("#idcardspan").hide();
			$.post("examban!student.excsec",{"idcard":$("#idcard").val()},function(data) {
				var data = eval(data);
				if(data!=null && data.idcard!=null && data.idcard!='' ){
					$("#studentid").val(data.id);
					
					$("#name").val(data.name);
					$("#company").val(data.company);
					$("#mobile").val(data.mobile);
					$("#tel").val(data.tel);
					$("#education").val(data.education);
					$("#professional").val(data.professional);
					$("#major").val(data.major);
					$("#experience").val(data.experience);
					
					if(data.picurl!=null && data.picurl!=''){
						var example="<a id='picexample' href='"+$("#picbaseurl").val()+data.picurl+"'>查看个人照片</a>"
						$("#picurl").val(data.picurl);
						$("#picspan").show();
						document.getElementById("picspan").innerHTML = example;
						$("a#picexample").fancybox();
					}
					if(data.idcardurl!=null && data.idcardurl!=''){
						var example="<a id='idcardexample' href='"+$("#idcardbaseurl").val()+data.idcardurl+"'>查看身份证扫描件</a>"
						$("#idcardurl").val(data.idcardurl);
						$("#idcardspan").show();
						document.getElementById("idcardspan").innerHTML = example;
						$("a#idcardexample").fancybox();
					}
				}
				
			});
		}
	} 
	function getTimesValue(){
		var startTime = document.getElementById("startDate").value;
		var endTime = document.getElementById("endDate").value;
		if(startTime!='' && endTime!=''){
			var times = timesBetween(startTime,endTime);
			if(times<=0){
				return false;
			}
			return true;
		}
	}
	function timesBetween(TimeOne,TimeTwo)   
	{   var startY = TimeOne.substring(0,4);//年2010-03-23
		var startT = TimeOne.substring(5,7);//月   
		var startD = TimeOne.substring(8,10);//月

		var endY = TimeTwo.substring(0,4);//年2010-03-23
		var endT = TimeTwo.substring(5,7);//月   
		var endD = TimeTwo.substring(8,10);//月
	
	    var startH = TimeOne.substring(10,TimeOne.lastIndexOf (':'));  
	    var endH = TimeTwo.substring(10,TimeTwo.lastIndexOf (':'));
	    var startM = TimeOne.substring(TimeOne.lastIndexOf (':')+1,TimeOne.length);  
	    var endM = TimeTwo.substring(TimeTwo.lastIndexOf (':')+1,TimeTwo.length); 
   		var c = endY*1+endT*1+endD*1+endH*60+endM*1-startY*1-startT*1-startD*1-startH*60-startM*1;
	    return c;   
	}
	function onSave(){
		if(!$("#inputForm").valid()){ return false;}
		if(!getTimesValue()){
			alert("考试日期输入不合法,考试时间不能大于等于结束时间");
			return false;
		}else{
			$("#inputForm").submit();
		}
	}
	function onBack(){
		window.location.href="examban.action?itemid=${itemid}";
	}
		</script>
</head>
<body>
<div id="wrapper">
	<%@ include file="/common/header.jsp"%>
	<!--the end of head-->
	<div id="content">  
		<!-- 右侧内容 column  start -->
    	<div class="content_box">
      	<h2>添加禁考记录</h2>
      	<div class="pagehead01"></div>
      	<!--<div class="pagehead02"></div>-->
      <p class="examination_info">考生个人信息</p>
      <form id="inputForm" name="inputForm" action="examban!save.action" method="post"/>
      	<input type="hidden" id="id" name="id" value="${id}"/>
      	<input type="hidden" id="itemid" name="itemid" value="${itemid}"/>
      	<input type="hidden" id="studentid" name="studentid" value="${cstudent.id}"/>
		<input type="hidden" id="picurl" name="picurl" value="${cstudent.picurl}"/>
		<input type="hidden" id="idcardurl" name="idcardurl" value="${cstudent.idcardurl}"/>
		<input type="hidden" id="picbaseurl" name="picbaseurl" value="<common:prop name="oems.webapp.uploadUrl" propfilename="sysconfig.properties" defaultvalue="${pageContext.request.contextPath}"/><%=Global.STUDENTPIC_PATH%>"/>
		<input type="hidden" id="idcardbaseurl" name="idcardbaseurl" value="<common:prop name="oems.webapp.uploadUrl" propfilename="sysconfig.properties" defaultvalue="${pageContext.request.contextPath}"/><%=Global.IDCARD_PATH%>"/>
      <div class="top_serach_box">
        <ul class="form">
          <li>
            <label>身份证号<span class="colorred">*</span></label>
            <input type="text" id="idcard" name="idcard" value="${cstudent.idcard}" onkeyup="getStudentInfo();"   style="width:400px;"/>
            <span id="error_idcard"></span>
          </li>
          <li>
            <label>姓名<span class="colorred">*</span></label>
            <input type="text" id="name" name="name" maxlength="50" value="${cstudent.name}" style="width:400px;"/>
            <span id="error_name"></span>
          </li>
          <li>
            <label>工作单位</label>
            <input type="text" id="company" name="company" value="${cstudent.company}" style="width:400px;"/>
          </li>
          <li class="ll mr30">
            <label>手机</label>
            <input type="text" id="mobile" name="mobile" value="${cstudent.mobile}" style="width:120px;"/>
          </li>
          <li>
          	<label>固定电话</label>
            <input type="text" id="tel" name="tel" value="${cstudent.tel}" style="width:120px;"/>
          </li>
          <li class="clearb">
            <label>学历/专业</label>
            <s:select list="educationList" listKey="value" listValue="label" id="education" name="education" value="cstudent.education"  cssStyle="width:120px;" headerKey="" headerValue="请选择学历"/>
    		<input type="text" id="major" name="major" value="${cstudent.major}" maxlength="50" style="width:175px;" />
          </li>
          <li>
            <label>职称</label>
            <input type="text" id="professional" name="professional" value="${cstudent.professional}" style="width:400px;"/>
          </li>
          <li>
            <label>行业工作经历</label>
            <input type="text" id="experience" name="experience" value="${cstudent.experience}" style="width:100px;"/>年
          </li>
          <li>
   				<label>个人照片</label>
   				<input type="file" id="file" name="file" onchange="ajaxUploadPic('../upload!pic.excsec');" />
   				<s:if test="cstudent.picurl!=mull && cstudent.picurl!=''">
					<span id="picspan"><a id="picexample" href="<common:prop name="oems.webapp.uploadUrl" propfilename="sysconfig.properties" defaultvalue="${pageContext.request.contextPath}"/><%=Global.STUDENTPIC_PATH%>${cstudent.picurl}" >查看个人照片</a></span>
				</s:if>
				<s:else>
					<span id="picspan" style="display:none" ><a id="picexample" href="#">查看个人照片</a></span>
				</s:else>
    	 </li>
    	 <li>
    			<label>身份证扫描件</label>
    			<input type="file" id="idimage" name="idimage"   onchange="ajaxUploadIdcard('../upload!idcard.excsec');"/>
    			<s:if test="cstudent.idcardurl!=mull && cstudent.idcardurl!=''">
 					<span id="idcardspan"><a id="idcardexample" href="<common:prop name="oems.webapp.uploadUrl" propfilename="sysconfig.properties" defaultvalue="${pageContext.request.contextPath}"/><%=Global.IDCARD_PATH%>${cstudent.idcardurl}" >查看身份证扫描件</a></span>
 				</s:if>
 				<s:else>
 					<span id="idcardspan" style="display:none"><a id="idcardexample"  href="#">查看身份证扫描件</a></span>
 				</s:else>
    		</li>
        </ul>
      </div>
      <p class="examination_info">禁考内容</p>
      <div class="top_serach_box">
      	<ul class="form_02">
        	<li>
            	<label>禁考科目</label>
            	<s:select list="subjectbList" listKey="value" listValue="label" id="subjectid" name="subjectid"  value="subject.id"  theme="simple" cssStyle="width:300px;" headerKey="" headerValue="--选择--"/>
          		<span id="error_subjectid"></span>
          	</li>
          	<li>
            	<label>禁考时间</label>
	            <input type="text" id="startDate" name="startDate" class="Wdate" value="<s:date name="startDate" format="yyyy-MM-dd HH:mm"/>"  onmousemove="getTimesValue();" readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'});"/><b>开 始</b>
	     		<span id="error_startDate"></span>
	     		<input type="text" id="endDate" name="endDate" class="Wdate" value="<s:date name="endDate" format="yyyy-MM-dd HH:mm"/>" readonly="readonly" onmousemove="getTimesValue();" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'});"/><b>结 束</b>
     			<span id="error_endDate"></span>
           </li>
           <li>
            	<label>禁考原因</label>
            	<textarea id="remark" name="remark"  style="width:400px;height:40px;">${remark}</textarea>
            	<span id="error_remark"></span>
           </li>
        </ul>
      </div>
      <p class="button_box">
        <input id="btnSave" name="btnSave" type="button" onclick="onSave();" value="添加禁考记录"/>
        <button id="btnBack" type="button" name="btnBack" onclick="onBack();">返回列表</button>
      </p>
    </div>

    <!-- 右侧内容 column  end-->    
		</div> <!-- content  end-->  
	</div><!-- wrapper  end-->  
</body>
</html>