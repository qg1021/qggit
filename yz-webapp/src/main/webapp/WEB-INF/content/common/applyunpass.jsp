<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="examtimes" name="activemenu" />
	<title>考次查询</title>
	<link href="${ctx}/css/master.css" type="text/css" rel="stylesheet"/> 
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		$("#checkall").click(function(){
 			$("input[name='ids']").attr("checked",$(this).attr("checked"));
 		});
	});

	function setexport(){
		var inputs = document.getElementById("mainForm").getElementsByTagName("input") ;
		var eform = $('#exportForm');
		var i = 0;
		eform.find('input').remove();
		for(i;i<inputs.length;i++)
		{
			if(inputs[i].type == 'checkbox'){
				if(inputs[i].checked)
					eform.append('<input type="hidden" name="'+inputs[i].name+'" value="'+inputs[i].value+'"/>');
			}else{
		 		eform.append('<input type="hidden" name="'+inputs[i].name+'" value="'+inputs[i].value+'"/>');
			}
		} 
		var select = document.getElementById("mainForm").getElementsByTagName("select") ;
		i = 0;
		for(i;i<select.length;i++)
		{
		 	eform.append('<input type="hidden" name="'+select[i].name+'" value="'+select[i].value+'"/>');
		} 
	}

	function getSites(value){
		$('#siteSelects').empty().append('<option value="">请选择</option>');
		if(value == ''){
			return;
		}

		$.ajax({
			   type: "POST",
			   url: "examapply!getSites.action",
			   data: {'id':value},
			   success: function(msg){
				   if(msg != null && msg!=''){
			    		var sites = eval("("+msg+")");
			    		for(var ele in sites){
			    			$('#siteSelects').append('<option value="'+ele+'">'+sites[ele]+'</option>');
				    		}
				   }
			   }
			});
	}
	
	</script>
</head>
<body>

<form id="mainForm" action=<s:if test="status == 8">"examapply!areaunpass.action?id=${examTimes.id}"</s:if><s:else>"examapply!pvunpass.action?id=${examTimes.id}"</s:else> method="post">
<input type="hidden" name="status" value="${status}"/>
<div class="top_serach_box_registration clearb">
<ul>

	<li><label>身份证</label><input  name="filter_LIKES_idcard" value="${param['filter_LIKES_idcard']}"  type="text" size="15" /></li>
    <li><label>姓名</label><input name="filter_LIKES_name" value="${param['filter_LIKES_name']}"  type="text" size="15" /></li>
    <li><label>科目</label>
    <s:select list="examTimes.subjectList" listKey="id" listValue="name" name="filter_EQL_sbid" value="@java.lang.Long@parseLong(#parameters.filter_EQL_sbid)" id="education" headerKey="" headerValue="请选择" theme="simple"  cssClass="top_serach_select_01"></s:select>
    </li>
    <security:authorize ifAnyGranted="考区管理员,考区业务员">
    <li><label>考点</label>
    <s:select list="examArea.examSiteList" listKey="id" listValue="name" name="filter_EQL_sid" value="@java.lang.Long@parseLong(#parameters.filter_EQL_sid)"  headerKey="" headerValue="请选择" theme="simple" ></s:select>
    </li>
    </security:authorize>
	 <li><button>搜索</button></li>

</ul>
<security:authorize ifAnyGranted="省考务管理员,省考务业务员">
	<ul>
	    <li><label>考区</label>
	    <s:select list="areaSelects" listKey="id" onchange="getSites(this.options[this.options.selectedIndex].value)" listValue="name" name="filter_EQL_aid" value="@java.lang.Long@parseLong(#parameters.filter_EQL_aid)"  headerKey="" headerValue="请选择" theme="simple" ></s:select>
	    </li>
	    <li><label>考点</label>
	    <select id="siteSelects" name="filter_EQL_sid"><option value="">请选择</option></select>
	    </li>
    </ul>
    </security:authorize>
</div>
<!-- top_serach_box_registration end -->


				<!-- datatable  start -->
				<table class="tablebox">
				    <tr>
				    <th width="30"><input type="checkbox" id="checkall" name="checkall"/>全选</th>
					<th width="60">报名号</th>
				    <th width="150">身份证号</th>
				    <th width="60">姓名</th>
				    <th>报名科目</th>
				
				    <th>考区</th>
				    <th>考点</th>
				    <th width="30">操作</th>
				    </tr>
				    <s:iterator value="page.result" status="st">
				    <tr>
				    <td><input type="checkbox" name="ids" value="${id}"/></td>
				    <td>${regNo}</td>
				    <td>${idcard}</td>
				    <td>${name}</td>
				
				    <td >${subject.name }</td>
				    <td>${examArea.name }</td>
				    <td>${examSite.name }</td>
				    <td><a href="examapply!checkstudent.action?id=${examTimes.id}&recordId=${id}&status=${status}" target="_blank">详细</a></td>
				    </tr>
				    </s:iterator>
				</table>
				<!-- datatable  end -->

				<!-- 翻页 start  -->
	    			<%@ include file="/common/page.jsp"%>
					<!-- 翻页 end  -->
	</form>		
<form id="exportForm" action ="recordexport.action?id=${examTimes.id}" method="post">
			<p class="ll mt15"><button onclick="setexport()" class="mt10">记录导出至XSL文件</button></p>
</form>
			

</body>
</html>