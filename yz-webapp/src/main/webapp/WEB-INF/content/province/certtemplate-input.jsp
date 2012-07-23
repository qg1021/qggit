<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<%@page import="com.drcl.yz.contant.Global"%><html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="certtemplate" name="activemenu" />
	<title>创建证书项目</title>
	<link href="${ctx}/css/master.css" type="text/css" rel="stylesheet"/> 
	<link href="${ctx}/js/validate/jquery.validate.css" type="text/css" rel="stylesheet"/>
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
	<script src="${ctx}/js/validate/jquery.validate.js" type="text/javascript"></script>
	<script src="${ctx}/js/validate/messages_cn.js" type="text/javascript"></script>
	<script src="${ctx}/js/jcommon.js" type="text/javascript"></script>
	<script src="${ctx}/js/ajaxfileupload.js" type="text/javascript"></script>
	<script  type="text/javascript"  src="${ctx}/js/LodopFuncs.js"></script>
	<link href="${ctx}/css/layer.css" type="text/css" rel="stylesheet"/>  
	<script src="${ctx}/js/layer.js" type="text/javascript"></script>
	<object id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0> 
	<embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0 pluginspage="../js/install_lodop.exe"></embed>
	</object>
	<script type="text/javascript">
	$(document).ready(function() {
		//聚焦第一个输入框
		$("#name").focus();

		//自定义验证规则
		$.validator.addMethod("validateContent",function(value,element,params){
			var contFlag = $.trim($("#contFlag").val());
	 		 
	 		if (contFlag==null || ""==contFlag)
	 	    {   
	 	    	return false;
	 		} 
	 		return true;
		},"请进行模板设计");

		 
		$("#form1").validate({
			rules: {
				name:"required",
				subject:"validateContent"  
			},
			messages: {
				name: "请输入证书模板名称"
			},
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
	//判断上传照片格式
	function onValidate()
	{   
		//var picFile = document.getElementById('file').value;
		//var picfileObj = picFile.substr(picFile.lastIndexOf(".")).toLowerCase(); 
			//if(picfileObj!=".jpg" && picfileObj!=".JPG" ){
				//alert("上传图片格式不正确，请重新上传.");
				//document.getElementById('error_picurl').style.display="block";
				//document.getElementById('hid_picName').value="";
				//document.getElementById('filespan').innerHTML='<input type="file" name="file" id="file" size="30" onchange="onValidate();"/>';
				//return;
			//}else
				ajaxFileUpload();
	}
	
	//自定义照片上传
	function ajaxFileUpload(){
		showLayer('dialog','dialog_content',"<span style='text-align:center'><img align='top' alt='正在上传...' src='../image/loading.gif'/></span>");
				$.ajaxFileUpload
				(
					{
						url:'../upload!uploadCertTemImage.excsec',//用于文件上传的服务器端请求地址
						secureuri:false,//一般设置为false
						fileElementId:'file',//文件上传空间的id属性  <input type="file" id="file" name="file" />
						dataType: 'json',//返回值类型 一般设置为json
						success: function (data, status)  //服务器成功响应处理函数
						{ 
						closeLayer();//关闭提示层
						if(data!=null){
							if(data.message!=null){
								alert(data.message);//错误提示信息，如附件太大，上传失败
								//上传失败后，清空上传文件框
								document.getElementById('filespan').innerHTML='<input type="file" name="file" id="file" size="30" onchange="onValidate();"/>';
								return;
							}else{
								var fileName = data.fileName; 
								$("#imageName").val(fileName);
							}
						}	
							if(typeof(data.error) != 'undefined')
							{
								if(data.error != '')
								{
									alert(data.error);
								}else
								{
									
									alert(data.message);
								}
							}
						},
						error: function (data, status, e)//服务器响应失败处理函数
						{
							alert(e);
						}
					}
				)
				return false;
	}
	
	var LODOP; //声明为全局变量
	function myPrintSetup2() {	
		//生成打印内容
		createPage(); 

		//去除打印内容中的图片打印字符串
		var subject = LODOP.PRINT_DESIGN();
		var index= subject.lastIndexOf("</img>\");");
		var subj= subject.substr(index+9,subject.length);
 	 
		//将打印内容保存到对象属性中
		$("#subject").val(subj);
		$("#contFlag").val("contFlag");
	};

	//生成打印内容
	function createPage() {
		var avUrl=	$("#ava_url").val();
		var imageName=$("#imageName").val();
		var contFlag=$("#contFlag").val();
		
		LODOP=getLodop(document.getElementById('LODOP_OB'),document.getElementById('LODOP_EM'));  
		if(contFlag==null || ""==contFlag){//新增
			LODOP.PRINT_INIT("证书打印_装载背景图");
			LODOP.ADD_PRINT_TEXT(295,150,125,30,"姓名");
			LODOP.ADD_PRINT_TEXT(335,150,125,30,"身份证号");
			LODOP.ADD_PRINT_TEXT(375,150,125,30,"岗位名称");
			LODOP.ADD_PRINT_TEXT(415,150,125,30,"证书编号");
			LODOP.ADD_PRINT_TEXT(58,402,90,30,"考试时的姓名");
			LODOP.ADD_PRINT_TEXT(58,497,90,30,"考试的年份");
			LODOP.ADD_PRINT_TEXT(58,592,90,30,"考试的月份");
			LODOP.ADD_PRINT_TEXT(58,687,90,30,"考试的日期");
			LODOP.ADD_PRINT_TEXT(385,525,85,30,"当前年份"); 
			LODOP.ADD_PRINT_TEXT(385,615,85,30,"当前月份"); 
			LODOP.ADD_PRINT_TEXT(385,705,85,30,"当前日期"); 
		}else{ //修改
			LODOP.PRINT_INIT("证书打印_装载背景图");
			eval('${subject}');
		}
		//打印图片
		LODOP.ADD_PRINT_SETUP_BKIMG('<img border="0" src="'+avUrl+imageName+'"></img>');
	};
	</script>
</head>
<body>
<!--浮动层-->
	<!-- JS遮罩层 --> 
	<div id="fullbg"></div> 
	<!-- end JS遮罩层 --> 
	<!-- 对话框 --> 
	<div id="dialog"> 
		<div id="dialog_content"></div> 
	</div>
 
    <!--浮动层 end --> 
<div id="wrapper">
	<%@ include file="/common/header.jsp"%>
	<div id="content">  
	<!--左边tab-->
	<%@ include file="/common/left.jsp"%>
	<!--左边tab结束-->
	<!--右边-->
	<form action="${ctx}/province/certtemplate!save.action" method="post" id="form1" name="form1">
	<input type="hidden" name="id" value="${id}" /> 
    <input type="hidden" name="imageName" id="imageName" value="${imageName}"/>
    <input type="hidden" name="contFlag" id="contFlag" value="<c:if test="${not empty subject}">contFlag</c:if>"/>
    <input type="hidden" name="subject" id="subject" value=""/>
 	<input id="ava_url" name="ava_url" type="hidden" value="<common:prop name="oems.webapp.uploadUrl" propfilename="sysconfig.properties" defaultvalue="${pageContext.request.contextPath}"/><%=Global.CETTEMPLATE_PATH%>"/>    
	
	<div class="right_content">
		<h2>创建证书模板</h2>
		<div class="pagehead01"></div>
		<!--<div class="pagehead02"></div>-->
		<div class="top_serach_box">
		 <div class="district_edit_form">
		    <ul class="form">
		    <li><label>证书模板名称<span class="colorred">*</span></label><input type="text" name="name" id="name" value="${name}" maxlength="50" style="width:300px;" /></li>
		    <li><label>证书模板设计<span class="colorred">*</span></label><input type="file" name="file" id="file" size="30" onchange="onValidate();"/><input type="button" onclick="myPrintSetup2();" value="模板设计"/> <em id="error_subject"></em></li>
		    </ul>
		    <p class="dotline"></p>  
		    <p class="button_box"><input type="submit" class="btn_confirm" value="确定"/> <input type="button" class="btn_cancell" value="取消" onclick="location.href='${ctx}/province/certtemplate.action';"/></p>
		  </div>
		  </div> 
	</div>
	</form>
	<!--右边结束--> 
</div> <!-- content  end-->  
</div><!-- wrapper  end-->  
</body>
</html>