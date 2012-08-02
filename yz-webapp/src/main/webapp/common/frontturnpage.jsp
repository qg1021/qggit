<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script>
$(document).ready(function() {
	$("#allnum").html(Math.ceil(${page.totalCount}/${page.pageSize}));
})
function skipsubmit() {
	if ( isNaN($("#num").val())) {
		alert("请输入数字！");
		$("#num").val("");
		$("#num").focus();
		return false;
	}
	if ( $("#num").val() > Math.ceil(${page.totalCount}/${page.pageSize})) {
		alert("输入的跳转页码超过最大页码！");
		$("#num").val("");
		$("#num").focus();
		return false;
	} else if ($("#num").val()!= ""){
		$("#pageNo").val($("#num").val());
		$("#mainForm").submit();
	}
}
</script>
 	<a style="text-decoration: none;">第${page.pageNo}/<span id="allnum"></span>页</a>
	<a class="sheer" style="text-decoration: none;">转到 <input type="text" id="num" width="5px" size="1" onkeypress="if(event.keyCode==13) {skipsubmit();}">页</a>
 	<a href="javascript:jumpPage(1)" class="sheer">首页</a>
 	<s:if test="page.hasPre"><a href="javascript:jumpPage(${page.prePage})" class="sheer">上一页</a></s:if>
 	<s:if test="page.hasNext"><a href="javascript:jumpPage(${page.nextPage})" class="sheer">下一页</a></s:if>
 	<a href="javascript:jumpPage(${page.totalPages})" class="sheer">末页</a>
 