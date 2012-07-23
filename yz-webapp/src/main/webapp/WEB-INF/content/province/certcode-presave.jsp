<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%><html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="certcodeinput" name="activemenu" />
	<title>生成证书编号</title>
	<link href="${ctx}/css/master.css" type="text/css" rel="stylesheet"/> 
	<link href="${ctx}/js/validate/jquery.validate.css" type="text/css" rel="stylesheet"/>
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
	<script src="${ctx}/js/validate/jquery.validate.js" type="text/javascript"></script>
	<script src="${ctx}/js/validate/messages_cn.js" type="text/javascript"></script>
	<script src="${ctx}/js/jcommon.js" type="text/javascript"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		//聚焦第一个输入框
		$("#certProId").focus();

		//合法分数验证
		$.validator.addMethod("validScore",function(value,element,params){
			if($("#scorelimit").attr("checked")){
				var score= $("#score").val();
				var re=/^([1-9]\d*|0)(?:\.\d{0}[0-9])?$/;
				if(!re.test(score)) return false;
				else return true;
			}else
				return true;
			
		},"请输入合法的分数");

		//合法年龄验证
		$.validator.addMethod("validStartAge",function(value,element,params){
			var startAge= $("#startAge").val();
			if($("#agelimit").attr("checked")){
				var re=/^[0-9]*[1-9][0-9]*$/;
					if(!re.test(startAge)) return false;
					else return true;
			}else
				return true;
			
		},"请输入合法的年龄");
		
		//合法年龄验证
		$.validator.addMethod("validEndAge",function(value,element,params){
			var endAge= $("#endAge").val();
			var selIndex=$("#opertage").get(0).selectedIndex;
			if($("#agelimit").attr("checked") && selIndex==2){
				var re=/^[0-9]*[1-9][0-9]*$/;
					if(!re.test(endAge)) return false;
					else {
						var startAge= $("#startAge").val();
						if(parseInt(endAge)<=parseInt(startAge)) return false;
						else return true;
					}	
			}else
				return true;
			
		},"请输入合法的结束年龄");
		
		$("#form1").validate({
			submitHandler: function(form) {   //表单提交句柄,为一回调函数，带一个参数：form
			var procertId=$("#certProId").val();
			var timesId=$("#timesId").val();
			var subjectId=$("#subjectId").val();
			$.post("../province/certcode!checkIsExists.excsec",{"procertId":procertId,"timesId":timesId,"subjectId":subjectId},function(data) {
				 var values=data.value;
				 if(values=="notadd")
					 alert("该证书编号已存在并已下发,无法重新生成,请确认");
				 else if(values=="mayadd"){
					 if(confirm("该证书编号已存在,请确认是否重新生成"))
						 form.submit();
				 }else if(values=="canadd")
					 form.submit();
			});
			
			},
			rules: {
				certProId:"required",
				certTempId:"required",
				itemId:"required",   
				timesId:"required",   
				subjectId:"required",
				score:"validScore",
				startAge:"validStartAge",
				endAge:"validEndAge",
				codeRule:{
					"required" :true
					//"validScore":true
				} 
			},
			messages: {
				certProId: "请选择证书项目",
				certTempId: "请选择证书模板",
				itemId: "请选择考试项目", 
				timesId: "请选择考次", 
				subjectId: "请选择科目",
				codeRule:"请选择编号规则"
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

	
	//根据考试项目ID操作考次
	function getTimesByItemId() {
		var examItemId = $("#itemId").val();
		if(examItemId) {
			$.post("../province/certcode!ajaxTimesByItemId.excsec",{"examItemId":examItemId},function(data) {
				//操作考次
				$("#timesId option[value!='']").remove();
				var times = eval(data.lv);
				if(times==null || times=='' || times.length == 0) return;
				for(var i = 0 ;i < times.length ; i++) {
					$("#timesId").append("<option value='"+times[i].label+"'>"+times[i].value+"</option>");
				} 
			});
		} 
	} 

	//根据考次ID操作考次科目
	function getSubjectsByTimesId() {
		var examTimesId = $("#timesId").val();
		if(examTimesId) {
			$.post("../province/certcode!ajaxSubjectsByTimesId.excsec",{"examTimesId":examTimesId},function(data) {
				//操作考次
				$("#subjectId option[value!='']").remove();
				var subjects = eval(data.lv);
				if(subjects==null || subjects=='' || subjects.length == 0) return;
				for(var i = 0 ;i < subjects.length ; i++) {
					$("#subjectId").append("<option value='"+subjects[i].label+"'>"+subjects[i].value+"</option>");
				} 
			});
		} 
	} 
	
	//控制选择考试成绩还是选择考试合格情况
	function onScorelimit(){
		if($("#scorelimit").attr("checked")){
			$("#qualiScoreLimit").attr("disabled","");
			$("#opertScore").attr("disabled","");
			$("#score").attr("disabled","");
		}else{
			$("#quascore").show();
			$("#quali").hide();
			$("#qualiScoreLimit").get(0).options[0].selected = true; //让下拉列表第一项默认选中
			$("#opertScore").get(0).options[0].selected = true; //让下拉列表第一项默认选中
			$("#score").val("");
			$("#qualiScoreLimit").attr("disabled","disabled");
			$("#opertScore").attr("disabled","disabled");
		}
	}

	//控制考试成绩范围
	function onQualiScoreLimit(){
		if($("#qualiScoreLimit").get(0).selectedIndex==0){
			$("#quascore").show();
			$("#quali").hide();
			$("#opertScore").attr("disabled","");
			$("#score").attr("disabled","");
		}else{ 
			$("#opertScore").attr("disabled","disabled");
			$("#score").attr("disabled","disabled");
			$("#quascore").hide();
			$("#quali").show();
		}
	} 

	//控制报考年龄
	function onCheckAge(){
		if($("#agelimit").attr("checked")){
			$("#opertage").attr("disabled","");
			$("#startAge").attr("disabled","");
		}else{
			$("#opertage").get(0).options[0].selected = true; //让下拉列表第一项默认选中
			$("#startAge").val("");
			$("#cert_age").hide();
			$("#opertage").attr("disabled","disabled");
			$("#startAge").attr("disabled","disabled");
		}
	}

	//年龄方式的切换
	function onChangeOpertAge(){
		var selIndex=$("#opertage").get(0).selectedIndex;
		if(selIndex==2)
			$("#cert_age").show();
		else
			$("#cert_age").hide();
	}
	</script>
</head>
<body>
 <div id="wrapper"> 
	<%@ include file="/common/header.jsp"%>
      <div id="content"> 
        <!--左边tab-->
        <%@ include file="/common/left.jsp"%>
        <!--左边tab结束--> 
        <!--右边-->
        <div class="right_content">
          <h2>生成证书编号</h2>
          <div class="pagehead01"></div>
          <!--<div class="pagehead02"></div>-->
          <form action="${ctx}/province/certcode!input.action" method="post" id="form1" name="form1">
          <!--证书内容开始--> 
          <div class="certi_manage">
            <p class="mb10"><span class="examination_info">目标证书</span>（选择所需生成证书编号的证书项目）</p>
            <ul>
              <li>
                <label>证书项目选择</label> 
                <s:select list="certProjectsList" listKey="id" listValue="name" id="certProId" name="certProId"  value="#parameters.certProId"  theme="simple" cssStyle="width:200px;" headerKey="" headerValue="--请选择证书项目--"/>
              </li>
            </ul>
          </div>
         <div class="certi_manage">
            <p class="mb10"><span class="examination_info">证书模板</span>（选择所需生成证书用于打印的证书模板）</p>
            <ul>
              <li>
                <label>证书模板选择</label> 
                <s:select list="certTemplateList" listKey="id" listValue="name" id="certTempId" name="certTempId"  value="#parameters.certTempId"  theme="simple" cssStyle="width:200px;" headerKey="" headerValue="--请选择证书模板--"/>
              </li>
            </ul>
          </div>
          <div class="certi_manage">
            <p class="mb10"><span class="examination_info">成绩库来源</span>（选择获证人参加的考试项目、考次和科目）</p>
            <ul>
              <li>
                <label>考试项目选择</label>
                <s:select list="examItemsList" onchange="getTimesByItemId();" listKey="id" listValue="name" id="itemId" name="itemId"  value="#parameters.itemId"  theme="simple" cssStyle="width:200px;" headerKey="" headerValue="--请选择考试项目--"/>
              </li>
              <li>
                <label>考次选择</label>
                <s:select list="examTimesList" onchange="getSubjectsByTimesId();" listKey="label" listValue="value" id="timesId" name="timesId"  value="#parameters.timesId"  theme="simple" cssStyle="width:200px;" headerKey="" headerValue="--请选择考次--"/>
              </li>
              <li>
                <label>考试科目选择</label>
                <s:select list="subjectsList" listKey="label" listValue="value" id="subjectId" name="subjectId"  value="#parameters.subjectId"  theme="simple" cssStyle="width:200px;" headerKey="" headerValue="--请选择科目--"/>
              </li>
            </ul>
          </div>
          <div class="certi_manage">
            <p class="mb10"><span class="examination_info">获证条件</span>（选择获证人的成绩、年龄等条件）</p>
            <ul>
              <li>
              <s:checkbox name="scorelimit" id="scorelimit" theme="simple" onclick="onScorelimit();"></s:checkbox>
              	<select name="qualiScoreLimit" id="qualiScoreLimit" disabled="disabled" onchange="onQualiScoreLimit();">
              		<option value="1">按考试成绩</option>
              		<option value="2">按合格情况</option>
              	</select>
              	<span id="quascore">
              	<select name="opertScore" id="opertScore" disabled="disabled">
                  <option value="1">大于</option>
                  <option value="2">大于或等于</option>
                </select>
                <input type="text" name="score" id="score" value="<s:if test="id==null"></s:if><s:else>${score}</s:else>" disabled="disabled"/>
               	 分&nbsp;<em id="error_score"></em>
               	 </span>
               	<span id="quali" style="display: none;">取成绩合格的记录</span> 
              </li> 
              <li>
               	<s:checkbox name="agelimit" id="agelimit" value="agelimit" theme="simple" onclick="onCheckAge();">报考年龄</s:checkbox>
                <select name="opertage" id="opertage" disabled="disabled" onchange="onChangeOpertAge();">
                  <option value="1">大于</option>
                  <option value="2">大于或等于</option>
                  <option value="3">介于</option>
                  <option value="4">小于</option>
                  <option value="5">小于或等于</option>
                </select>
                <input type="text" name="startAge" id="startAge" value="<s:if test="id==null"></s:if><s:else>${startAge}</s:else>" disabled="disabled"/><span id="cert_age" style="display: none;">至<input type="text" name="endAge" id="endAge" value="<s:if test="id==null"></s:if><s:else>${endAge}</s:else>"/></span>
               	 岁&nbsp;<em id="error_startAge"></em>&nbsp;<em id="error_endAge"></em>
              </li>
            </ul>
          </div>
           <div class="certi_manage">
            <p class="mb10"><span class="examination_info">印章号</span></p>
            <ul>
              <li>
              是否生成印章号 <s:radio list="#{'true':'是','false':'否'}"  name="signet" id="signet" theme="simple" value="'false'" ></s:radio>&nbsp;<em id="error_sex"></em>
              </li>
            </ul>
          </div>
<!--          <div class="certi_manage">-->
<!--            <p class="mb10"><span class="examination_info">证书编号规则</span></p>-->
<!--            <ul>-->
<!--              <li>-->
<!--                <input type="radio" name="codeRule" id="codeRule1" value="true"/>-->
<!--               	 继续之前的编号&nbsp;<em id="error_codeRule"></em></li>-->
<!--              <li>-->
<!--                <input type="radio" name="codeRule" id="codeRule2" value="false"/>-->
<!--               	 从新编号开始-->
<!--                <input type="text"  name="newCode" id="newCode" value="${newCode}"/>-->
<!--              </li>-->
<!--            </ul>-->
<!--          </div>-->
          <p class="button_box">
            <input type="submit" style="width:100px;" value="继续"/>
          </p> 
          </form>
          <!--证书编号已生成-->
        </div>
        <!--右边结束--> 
      </div>
      <!-- content  end--> 
    </div>
    <!-- wrapper  end-->
</body>
</html>