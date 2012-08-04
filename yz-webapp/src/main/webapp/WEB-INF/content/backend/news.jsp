<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<%@ include file="/common/meta.jsp" %>
	<title>${typeName}</title>
	<link href="${ctx}/css/master.css" type="text/css" rel="stylesheet"/> 
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
	<script src="${ctx}/js/jcommon.js" type="text/javascript"></script>
	<script  type="text/javascript">
	$(document).ready(function() {
		$("#checkall").click(function(){
 			$("input[name='ids']").attr("checked",$(this).attr("checked"));
 		});
	});
	function onBatchDelete(){
		var  isChecked=false;
		$("input[name='ids']:checked").each(function(){
			isChecked = true;
		});
		if(!isChecked){
			alert("选择删除的记录");
			return false;
		}

		if(confirm("确认删除？")){
			$("#mainForm").attr("action","news!batchDelete.action?mtype=${mtype}").submit();
		}
	}
	function onPublish(){
		var  isChecked=false;
		$("input[name='ids']:checked").each(function(){
			isChecked = true;
		});
		if(!isChecked){
			alert("选择发布的记录");
			return false;
		}

		if(confirm("确认发布？")){
			$("#mainForm").attr("action","news!publish.action?mtype=${mtype}").submit();
		}
	}
	function onCancel(){
		var  isChecked=false;
		$("input[name='ids']:checked").each(function(){
			isChecked = true;
		});
		if(!isChecked){
			alert("选择取消发布的记录");
			return false;
		}

		if(confirm("确认取消发布？")){
			$("#mainForm").attr("action","news!cancelPublish.action?mtype=${mtype}").submit();
		}
	}
	</script>
</head>
<body>
<div id="wrapper">
	<%@ include file="/common/top.jsp"%>
	<!--the end of head-->
	<div id="content">  
		<!-- 左侧内容 column  start -->
		<%@ include file="/common/menu.jsp"%>
		<!-- 左侧内容 column  end -->
		<!-- 右侧内容 column  start -->  
		<div class="right_content">
			<table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
				<tr  height="28">
					<td  background="${ctx}/image/admin/title_bg1.jpg">当前位置&gt;&gt;${typeName}</td>
				</tr>
				<tr>
					<td bgcolor="#b1ceef" height="1"></td>
				</tr>
				<tr height="20">
					<td background="${ctx}/image/admin/shadow_bg.jpg"></td>
				</tr>
			</table>
			<div class="pagehead01"></div>
				<div id="message" style="line-height: 35px;">
					<s:actionmessage theme="custom" cssClass="tipbox"/>
				</div>
    			<form id="mainForm" action="news.action?mtype=${mtype}" method="post">
    				<ul class="top_serach_box">
		    		<li class="rr"><button type="submit">搜索</button></li>
			        <li class="ll mr20">标题
			        	<input type="text" id="title" name="filter_LIKES_title" size="15" value="${param['filter_LIKES_title']}"/>
			        </li>
    			</ul>
    			<p class="ll mt15">
    				<button id="btnCreate" type="button" onclick="window.location.href='news!input.action?mtype=${mtype}'">新增</button>
    				<button id="btnDelete" type="button" onclick="onBatchDelete();">删除</button>
    				<button id="btnPublish" type="button" onclick="onPublish();">发布</button>
    				<button id="btnCancel" type="button" onclick="onCancel();">取消发布</button>
    			</p>
	    			<table class="tablebox">
					    <tr>
					    	<th width="5%"><input type="checkbox" id="checkall" name="checkall"/></th>
					        <th width="40%">标题</th>
					        <th width="15%">创建时间</th>
					        <th width="15%">是否发布</th>
					        <th width="25%">操作</th>
					    </tr>
	    				<s:iterator value="page.result" status="st">
						   <tr>
						   		<td title=""><input type="checkbox" id="ids" name="ids" value="${id}"/></td>
						        <td title="${name}"><common:cut string="${title}" len="30"/></td>
						        <td><s:date name="createdate" format="yyyy-MM-dd HH:mm"/></td>
						        <td>${statusName}</td>
						        <td>
						        	<a href="news!input.action?id=${id}&mtype=${mtype}">修改</a>&nbsp;&nbsp;
						        	<a href="javaScript:delRecord('news!delete.action?id=${id}&mtype=${mtype}');">删除</a>
						        </td>
						    </tr>
					    </s:iterator>
					    <s:if test="page.result.size ==0">
							<tr> 
								<td height="30" align="center" colspan="5"><font color="gray">没有符合条件的记录</font></td>
							</tr>  
						</s:if>      
	    			</table>
	    			<!-- 翻页 start  -->
	    			<%@ include file="/common/page.jsp"%>
					<!-- 翻页 end  -->
				</form>
			</div>
			<!-- 右侧内容 column  end-->    
		</div> <!-- content  end-->  
	</div><!-- wrapper  end-->  
</body>
</html>