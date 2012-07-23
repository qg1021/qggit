<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<script type="text/javascript">
	function changeBasicAreaAndSite(vv){
		if(vv==''){
				$("#areaid").val('');
				$("#siteid").val('')
				$("#areaid").attr("disabled","true");
				$("#siteid").attr("disabled","true");
				$("#siteid option[value!='']").remove();
		}else{
			$("#areaid").removeAttr("disabled");
			$("#siteid").removeAttr("disabled");
		}
			
	}
	function changeScoreAreaAndSite(vv){
		if(vv==''){
				$("#sareaid").val('');
				$("#ssiteid").val('')
				$("#sareaid").attr("disabled","true");
				$("#ssiteid").attr("disabled","true");
				$("#ssiteid option[value!='']").remove();
		}else{
			$("#sareaid").removeAttr("disabled");
			$("#ssiteid").removeAttr("disabled");
		}
			
	}
	function getScoreSiteByAreaIDAndTimesID() {
		var areaid = $("#sareaid").val();
		var timesid = $("#timesid").val();
		if(areaid) {
			$.post("../relatedsite!siteCurrentTimes.excsec",{"areaid":areaid,"timesid":timesid},function(data) {
				$("#ssiteid option[value!='']").remove();
				var site = eval(data.site);
				if(site==null || site=='' || site.length == 0) return;
				for(var i = 0 ;i < site.length ; i++) {
					$("#ssiteid").append("<option value='"+site[i].value+"'>"+site[i].label+"</option>");
				}
			});
		}
		else {
			$("#ssiteid option[value!='']").remove();
		}
	}
	$(document).ready(function() {
		jQuery.validator.addMethod("positiveinteger", function(value, element) {
			var re = /^[1-9]\d*$/;
			if(re.test(value)){   
		        return true;   
		    }else{    
		        return false;   
		    }      
		}, "输入正整数");
		$("#basicForm").validate({
			rules: {
				passScore:{required:true,positiveinteger: true},
				excetScore:{required:true,positiveinteger: true}
			},
			messages: {
				passScore: {
					required: "必填"
				},
				excetScore: {
					required: "必填"
				}
			},
	        errorPlacement: function(error, element) {   
		        if (document.getElementById("error_"+element.attr("name")))  {
		            error.appendTo("#error_"+element.attr("name"));  
		        }
		        else       
		            error.insertAfter(element);   
		        }
		}); 
		$("#scoreForm").validate({
			rules: {
				ptime:{required:true,positiveinteger: true,range: [10, 99]}
			},
			messages: {
				ptime: {
					required: "必填"
				}
			},
	        errorPlacement: function(error, element) {   
		        if (document.getElementById("error_"+element.attr("name")))  {
		            error.appendTo("#error_"+element.attr("name"));  
		        }
		        else       
		            error.insertAfter(element);   
		        }
		});
		setSelectedDeault();
	});
	function setSelectedDeault(){
		if($("#subjectid").val()==''){
			$("#areaid").attr("disabled","true");
			$("#siteid").attr("disabled","true");
		}
		if($("#ssubjectid").val()==''){
			$("#sareaid").attr("disabled","true");
			$("#ssiteid").attr("disabled","true");
		}
	}
</script>
<div class="score_left">
	<p class="box_solid_grey fontbold">考试基本情况统计</p>
		<input type="hidden" id="timesid" name="timesid" value="${timesid}"/>
		<div class="score_box_list mb10">
			<form id="basicForm" name="basicForm" action="scoresum!basiccount.action" method="post">
				<input type="hidden" id="id" name="timesid" value="${timesid}"/>
			 	<p class="mb5">满分的<input type="text" id="passScore" name="passScore" size="2" value="${param['passScore']}" />%为“通过”成绩</p> 
			    <p>满分的<input type="text" size="2" id="excetScore" name="excetScore" size="2" value="${param['excetScore']}"/>%为“优秀”成绩</p> 
			    <p class="box_dotline_bottom"></p>
			    <ul class="score_select">
			        <li>
			        	<label>科目</label>
			        	<s:select list="subjectList" onchange="changeBasicAreaAndSite(this.value);" listKey="value" listValue="label" id="subjectid" name="subjectid"  value="#parameters.subjectid"  theme="simple" cssStyle="width:150px;" headerKey="" headerValue="--所有--"/>
			        </li>
			        <li>
			        	<label>考区</label>
			        	<s:select list="examAreaList" onchange="getSiteByAreaIDAndTimesID();"  listKey="value" listValue="label" id="areaid" name="areaid"  value="#parameters.areaid"  theme="simple" cssStyle="width:150px;" headerKey="" headerValue="--所有--"/>
			        </li>
			        <li>
			        	<label>考点</label>
			        	<s:select list="examSiteList" listKey="value" listValue="label" id="siteid"  name="siteid"  value="#parameters.siteid"  theme="simple" cssStyle="width:150px;" headerKey="" headerValue="--所有--"/>
			        </li>
			    </ul>
			    <p class="ta_c"><button type="submit">统计分析</button></p>
			 </form>
		</div>
	
	<p class="box_solid_grey fontbold">成绩分布统计</p>
	
		<div class="score_box_list">
			<form id="scoreForm" name="scoreForm" action="scoresum!scorecount.action" method="post">
				<input type="hidden" id="id" name="timesid" value="${timesid}"/>
		    	<p class="mb5">统计值按<input type="text" id="ptime" name="ptime" size="2" value="${param['ptime']}" />分为一个区间</p> 
		        <p class="box_dotline_bottom"></p>
		        <ul class="score_select">
			        <li>
			        	<label>科目</label>
			        	<s:select list="subjectList" onchange="changeScoreAreaAndSite();" listKey="value" listValue="label" id="ssubjectid" name="ssubjectid"  value="#parameters.ssubjectid"  theme="simple" cssStyle="width:150px;" headerKey="" headerValue="--所有--"/>
			        </li>
			        <li>
			        	<label>考区</label>
			        	<s:select list="examAreaList" onchange="getScoreSiteByAreaIDAndTimesID();"  listKey="value" listValue="label" id="sareaid" name="sareaid"  value="#parameters.sareaid"  theme="simple" cssStyle="width:150px;" headerKey="" headerValue="--所有--"/>
			        </li>
			        <li>
			        	<label>考点</label>
			        	<s:select list="examSiteList" listKey="value" listValue="label"  id="ssiteid" name="ssiteid"  value="#parameters.ssiteid"  theme="simple" cssStyle="width:150px;" headerKey="" headerValue="--所有--"/>
			        </li>
			    </ul>
		        <p class="ta_c"><button type="submit">统计分析</button></p>
	        </form>
	    </div>
	
</div>