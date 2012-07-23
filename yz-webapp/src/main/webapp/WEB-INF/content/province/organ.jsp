<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="organ" name="activemenu" />
	<title>组织机构代码管理</title>
	<link href="${ctx}/css/master.css" type="text/css" rel="stylesheet"/> 
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
	<link href="${ctx}/js/validate/jquery.validate.css" type="text/css" rel="stylesheet"/>
	<script src="${ctx}/js/validate/jquery.validate.js" type="text/javascript"></script>
	<script src="${ctx}/js/validate/messages_cn.js" type="text/javascript"></script> 
	<script src="${ctx}/js/jcommon.js" type="text/javascript"></script>
	<script src="${ctx}/js/table.js" type="text/javascript"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		//聚焦第一个输入框
		$("#filter_LIKES_orgName").focus();
		$("#form1").validate({
 			rules: {
 				upload: {
						required:true,
						accept:"xls|xlsx"
					}  
 			},
 			messages: {
 				upload: {
 					required: "请选择xls文件",
 					accept:"请选择xls文件"
 				} 
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
			<h2>组织机构代码管理</h2>
			<div class="pagehead01"></div>
			<div id="message" style="line-height: 35px;">
			 	<s:actionmessage theme="custom" cssClass="tipbox"/> 
			</div>
			<div class="top_info_column">
			<form id="form1" name="form1" action="${ctx}/province/organ!batchAdd.action" method="post" enctype="multipart/form-data">
			<p class="course_title"><span style=" background: none repeat scroll 0 0 #B5B4B4;float: left;height: 15px;margin-right: 8px;overflow: hidden;width: 3px;">&nbsp;</span>批量导入组织机构代码</p>
		    <p class="lh180">1. 使用MicroSoft Office Excel编辑用户数据； 编辑完成，选择保存类型".xls"，点击保存完成；在本界面上传保存好的xls文件，并且点击提交完成。<br />
		      2. 表格中每一行单元格只能填写一条数据， 单元格字段顺序为：组织机构名称、组织机构代码。<a href="${ctx}/templatedownload.excsec?name=组织机构代码.xls">下载XLS样本</a></p>
		    <p><span class="fontbold">XLS文件<span class="colorred">*</span>：</span>
      		<s:file name="upload" id="upload" size="30"/>
      		<input type="submit" value="上传文件" id="uploadBtn"/><em id="error_upload"></em>
    		</p>
    		</form>
			</div> 
    		
    		<div class="top_serach_box_registration clearb">
	        <form action="${ctx}/province/organ.action" method="post" name="mainForm" id="mainForm">
	        <input type="hidden" name="page.pageNo" id="pageNo" value="${page.pageNo}"/>
		    <input type="hidden" name="page.orderBy" id="orderBy" value="${page.orderBy}"/>
		    <input type="hidden" name="page.order" id="order" value="${page.order}"/>   
			<ul>
		    <li><label>组织机构名称</label><input type="text" size="20" name="filter_LIKES_orgName" id="filter_LIKES_orgName" value="${param['filter_LIKES_orgName']}"/></li>
		    <li><label>组织机构代码</label><input type="text" size="20" name="filter_LIKES_orgCode" id="" value="${param['filter_LIKES_orgCode']}"/></li>
		    <li><input type="button" onclick="search();" value="搜索" /></li>
			</ul>
			</form>
			</div> 
    		
		    <table class="tablebox">
		    <tr>
		    <th width="5%">NO</th>
		    <th width="40%">组织机构名称</th>
		    <th width="40%">组织机构代码</th>
		    <th width="15%">操作</th>
		    </tr>
		    <s:iterator value="page.result" status="st">
		    <tr>
		    <td>${page.first + st.index}</td>
		    <td>${orgName}</td>
		    <td>${orgCode}</td> 
		    <td><a href="${ctx}/province/organ!input.action?id=${id}">修改</a>&nbsp;<a href="javascript:void(0)" onclick="delRecord('${ctx}/province/organ!delete.action?id=${id}');">删除</a></td> 
		    </tr> 
		    </s:iterator>     
		    </table>  
    
		    <!-- 翻页 start  -->
			<%@ include file="/common/page.jsp"%>
			<!-- 翻页 end  -->
				
			</div>
			<!-- 右侧内容 column  end-->    
		</div> <!-- content  end-->  
	</div><!-- wrapper  end-->  
</body>
</html>