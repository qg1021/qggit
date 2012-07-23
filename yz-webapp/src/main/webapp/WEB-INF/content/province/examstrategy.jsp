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
			//聚焦第一个输入框
			$("#msingleleastnum").focus();
			setTabClass(3);
			$("#inputForm").validate({
				rules: {
				msingleleastnum:{required:true,digits: true},
				passseatnum:{required:true,digits: true},
				addsparenum:{required:true,digits: true},
				sway:"required"
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
					sway: "必选"
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
			$("#sway").val(vv);
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
		<!-- tab03 start -->
		<form id="inputForm" action="examstrategy!saveQindex.action" method="post">
			<input type="hidden" id="timesid" name="timesid" value="${timesid}"/>
			<input type="hidden" id="indexID" name="indexID" value="${examTimes.qualityIndex.id}"/>
				
			<div id="tabid3">
	    		<p class="right3pxborder">考试备用机要求</p>
		        <ul class="text_list">
		            <li>单考场单场次考生人数小等于<input id="msingleleastnum" maxlength="3" disabled="disabled" size="5" name="msingleleastnum" value="${examTimes.qualityIndex.msingleleastnum}" type="text"  />人至少备用机数<input maxlength="3" disabled="disabled" size="5"  id="passseatnum" name="passseatnum" value="${examTimes.qualityIndex.passseatnum}"/>台</li>
		            <li>备用机与考试机的比率要满足大于或者等1/<input maxlength="3" disabled="disabled"  size="5"  id="addsparenum" name="addsparenum" value="${examTimes.qualityIndex.addsparenum}" type="text" /></li>
		        </ul>
	        	<p class="right3pxborder">多科目编排原则要求</p>
		        <ul class="text_list">
		            <li>
	    				<s:if test="examTimes.qualityIndex.sway!=null && examTimes.qualityIndex.sway==0 ">
	    					<input type="radio" id="radioway1" name="radioway" value="0" onclick="checkWay(this.value);" checked='checked'/>
	    				</s:if>
	    				<s:else>
	    					<input type="radio" id="radioway1" name="radioway" value="0" onclick="checkWay(this.value);"/>
	    				</s:else>
  							同考场内单科目编排，不允许科目混排
  					</li>
  					 <li>
	    				<s:if test="examTimes.qualityIndex.sway!=null && examTimes.qualityIndex.sway==1 ">
	    					<input type="radio" id="radioway2" name="radioway" value="1" onclick="checkWay(this.value);" checked='checked'/>
	    				</s:if>
	    				<s:else>
	    					<input type="radio" id="radioway2" name="radioway" value="1" onclick="checkWay(this.value);"/>
	    				</s:else>
  							同考场内允许科目混排，以达到卷数最少原则
  					</li>
  					 <li>
	    				<s:if test="examTimes.qualityIndex.sway!=null && examTimes.qualityIndex.sway==2 ">
	    					<input type="radio" id="radioway3" name="radioway" value="2" onclick="checkWay(this.value);" checked='checked'/>
	    				</s:if>
	    				<s:else>
	    					<input type="radio" id="radioway3" name="radioway" value="2" onclick="checkWay(this.value);"/>
	    				</s:else>
  							同考场内单科目编排优先，但允许尾考场合并
  					</li>
  					<li><input type="hidden" id="sway" name="sway" value="${examTimes.qualityIndex.sway}"/></li>
		        </ul>
	        	<p class="ta_c"><button type="submit">保存设置</button></p>
    		</div>

		</form>
	<!-- tab03 end -->
	</div> <!-- content  end-->  
</div><!-- wrapper  end-->  
</body>
</html>