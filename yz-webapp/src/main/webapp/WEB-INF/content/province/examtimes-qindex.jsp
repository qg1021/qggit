<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="examtimes" name="activemenu" />
	<title>科目设置</title>
	<link href="${ctx}/css/master.css" type="text/css" rel="stylesheet"/> 
	<link href="${ctx}/js/validate/jquery.validate.css" type="text/css" rel="stylesheet"/>
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
	<script src="${ctx}/js/validate/jquery.validate.js" type="text/javascript"></script>
	<script src="${ctx}/js/validate/messages_cn.js" type="text/javascript"></script>
	<script src="${ctx}/js/jcommon.js" type="text/javascript"></script>
	<script src="${ctx}/js/json2.js" type="text/javascript"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		//聚焦第一个输入框
		initQindex();
		$("#msingleleastnum").focus();
		$("#inputForm").validate({
			rules: {
				msingleleastnum:{required:true,digits: true},
				passseatnum:{required:true,digits: true},
				addsparenum:{required:true,digits: true},
				sparenum:{required:true,digits: true},
				starthandtime:{required:true,digits: true},
				endhandtime:{required:true,digits: true},
				way:"required"
			},
			messages: {
				msingleleastnum: {
					required: "必填",
					digits:"输入数字"
				},
				passseatnum: {
					required: "必填",
					digits:"输入数字"
				},
				addsparenum: {
					required: "必填",
					digits:"输入数字"
				},
				sparenum:{
					required: "必填",
					digits:"输入数字"
				},
				starthandtime:{
					required: "必填",
					digits:"输入数字"
				},
				endhandtime:{
					required: "必填",
					digits:"输入数字"
				},
				way: "必选"
			},
	        errorPlacement: function(error, element) {   
		        if (document.getElementById("error_"+element.attr("name")))  {
		            error.appendTo("#error_"+element.attr("name"));  
		        }
		        else       
		            error.insertAfter(element);   
		        }
		}); 
	});
	function checkWay(vv){
			$("#way").val(vv);
	}
	function initQindex(){
		if(document.getElementById("indexID").value==''){
			$("#msingleleastnum").val(${examTimes.examItem.qualityIndex.msingleleastnum});
			$("#passseatnum").val('${examTimes.examItem.qualityIndex.passseatnum}');
			$("#addsparenum").val('${examTimes.examItem.qualityIndex.addsparenum}');
			$("#issameunit").val('${examTimes.examItem.qualityIndex.issameunit}');
			$("#issameroom").val('${examTimes.examItem.qualityIndex.issameroom}');
			$("#sparenum").val('${examTimes.examItem.qualityIndex.sparenum}');
			$("#starthandtime").val('${examTimes.examItem.qualityIndex.starthandtime}');
			$("#endhandtime").val('${examTimes.examItem.qualityIndex.starthandtime}');
			
			var wayA = '${examTimes.examItem.qualityIndex.iswayA}';
			var wayB = '${examTimes.examItem.qualityIndex.iswayB}';
			var wayC = '${examTimes.examItem.qualityIndex.iswayC}';
			var wayD = '${examTimes.examItem.qualityIndex.iswayD}';
			if(wayA=='true') $("#iswayA").attr("checked",'true');
			if(wayB=='true') $("#iswayB").attr("checked",'true');
			if(wayC=='true') $("#iswayC").attr("checked",'true');
			if(wayD=='true') $("#iswayD").attr("checked",'true');
			
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
			<h2>新增考次</h2>
			<div class="pagehead01"></div>
				<form id="inputForm" action="examtimes!saveQindex.action" method="post">
					<input type="hidden" id="id" name="id" value="${id}"/>
					<input type="hidden" id="indexID" name="indexID" value="${examTimes.qualityIndex.id}"/>
					<table class="tablebox"  >
	    				<tr>
	    					<th width="25%">1 考次设置${examItem.name}<span class="icon_success">&nbsp;</span></th>
	    					<th width="25%">2 科目设置<span class="icon_success">&nbsp;</span></th>
	    					<th width="25%">3 质量管理</th>
	    					<th width="25%">4 场次（时间单元）设置</th>
	    				</tr>
					</table>    
	    			<div class="top_serach_box">
	       				<p class="rr">（默认使用考试项目质量管理模板，可进行修改）</p>
       					<p class="examination_info">本考次的科目配置</p>
       					<p class=" box_dotline_top"></p>
    					<ul class="form">
    						<li><label>排考备用机要求:</label>单考场单场次考生人数小等于
			    				<input id="msingleleastnum" name="msingleleastnum" maxlength="3"  value="${examTimes.qualityIndex.msingleleastnum}" type="text" style="width:50px;"/> <span id="error_msingleleastnum"></span>人至少备用机数<input id="passseatnum" name="passseatnum" value="${examTimes.qualityIndex.passseatnum}" maxlength="3"  type="text" style="width:50px;"/> <span id="error_passseatnum"></span>台</li>
			    			<li class="box_dotline_bottom"><label></label>
			    				备用机与考试机的比率要满足大于或者等1/<input maxlength="3"  id="addsparenum" name="addsparenum" value="${examTimes.qualityIndex.addsparenum}" style="width:50px;"/> <span id="error_addsparenum"></span>
			    			</li>    
    						<li>
    							<label>单科目组卷要求:</label>同时间单元内不同考场 
    							<s:select list="#{'true':'使用同一试卷','false':'区分不同试卷'}"  id="issameunit" name="issameunit"  value="examTimes.qualityIndex.issameunit" cssStyle="width:120px;"/>
    						</li>
    						<li>
    							<label>&nbsp;</label>同考场内 
    							<s:select list="#{'true':'使用同一试卷','false':'区分不同试卷'}"  id="issameroom" name="issameroom"  value="examTimes.qualityIndex.issameroom" cssStyle="width:120px;"/>
    						</li> 
    						<li class="box_dotline_bottom">
    							<label></label>备用卷卷数 
    							<input id="sparenum" maxlength="3"  name="sparenum" value="${examTimes.qualityIndex.sparenum}" style="width:50px;"/><span id="error_sparenum"></span>
    						</li>   
    						<li>
    							<label>考试纪律要求：</label>考试开始后 
    							<input id="starthandtime" maxlength="3"  name="starthandtime" value="${examTimes.qualityIndex.starthandtime}" style="width:50px;"/> 分钟内不得交卷（同最晚入场考试时间）<span id="error_starthandtime"></span>
    						</li>
    						<li class="box_dotline_bottom">
    							<label></label>考试结束前  
    							<input id="endhandtime" maxlength="3"  name="endhandtime" value="${examTimes.qualityIndex.endhandtime}" style="width:50px;"/> 分钟内不得交卷<span id="error_endhandtime"></span>
    						</li>    
    						<li>
    							<label>考试机成绩判分:</label> 
			    				<s:if test="examTimes.qualityIndex!=null && examTimes.qualityIndex.iswayA">
			    					<input type="checkbox" id="iswayA" name="iswayA" value="true"  checked='checked'/>
			    				</s:if>
			    				<s:else>
			    					<input type="checkbox" id="iswayA" name="iswayA" value="true"  />
			    				</s:else>
			    				显示考试成绩总得分
							</li>
    						<li>
    							<label>&nbsp;</label>
			    				<s:if test="examTimes.qualityIndex!=null && examTimes.qualityIndex.iswayB">
			    					<input type="checkbox" id="iswayB" name="iswayB" value="true"  checked='checked'/>
			    				</s:if>
			    				<s:else>
			    					<input type="checkbox" id="iswayB" name="iswayB" value="true" />
			    				</s:else>
    							显示卷面各大题的得分
							</li>
			    			<li>
			    				<label>&nbsp;</label>
			    				<s:if test="examTimes.qualityIndex!=null && examTimes.qualityIndex.iswayC">
			    					<input type="checkbox" id="iswayC" name="iswayC" value="true"  checked='checked'/>
			    				</s:if>
			    				<s:else>
			    					<input type="checkbox" id="iswayC" name="iswayC" value="true"  />
			    				</s:else>
			    				显示通过与否情况  <span class="colorred">若选择该项，则成绩汇总后“调分”功能失效</span>
							</li>
							<li>
								<label>&nbsp;</label>
			    				<s:if test="examTimes.qualityIndex!=null && examTimes.qualityIndex.iswayD">
			    					<input type="checkbox" id="iswayD" name="iswayD" value="true"  checked='checked'/>
			    				</s:if>
			    				<s:else>
			    					<input type="checkbox" id="iswayD" name="iswayD" value="true"  />
			    				</s:else>
			    				显示判卷情况
							</li>
    					</ul>
	    			</div>
	 				<div class="box_solid_blue">
	 					<button class="rr" type="submit">下一步</button>
	 					<button type="button" onclick="window.location.href='examtimes!subject.action?id=${id}'">上一步</button>
	 				</div>
				</form>
			</div>
			<!-- 右侧内容 column  end-->    
		</div> <!-- content  end-->  
	</div><!-- wrapper  end-->  
</body>
</html>