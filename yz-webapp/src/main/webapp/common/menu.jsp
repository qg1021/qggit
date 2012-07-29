<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %> 
<script type="text/javascript">
	$(document).ready(function() { 
		var activemenu = $('#activemenu').val();
 
		if(activemenu){
    		var tag = $('#' + activemenu);
			tag.css("background-color","#4dabf5");
		}
	});
	function expand(el)
	{
		childObj = document.getElementById("child" + el);

		if (childObj.style.display == 'none')
		{
			childObj.style.display = 'block';
		}
		else
		{
			childObj.style.display = 'none';
		}
		return;
	}
//-->
</script>

<div class="left_menu">
<table  height="100%" border="0">
	<tr>
		<td valign="top" align="center">
			<table cellspacing="0" cellpadding="0" width="100%" border=0>
				<tr>
					<td height=10></td>
				</tr>
			</table>
			<table cellspacing="0" cellpadding="0" width="150" border="0">
				<tr height="22">
					<td background="${ctx}/image/admin/menu_bt.jpg"  align="center">
						<a class="menuParent" onclick="expand(1)" href="javascript:void(0);">功能模块</a></td>
				</tr>
				<tr height="4">
					<td></td>
				</tr>
			</table>
			<table id="child1"  cellspacing="0" cellpadding="0" width="150" border="0">
				<tr height="20">
					<td  width="10">
						&nbsp;
					</td>
					<td>
						<img height="9" src="${ctx}/image/admin/menu_icon.gif" width="9">
						<a class="menuChild" href="basedata.action">基础数据</a>
					</td>
				</tr>
				<tr height="20">
					<td  width="10">
						&nbsp;
					</td>
					<td>
						<img height="9" src="${ctx}/image/admin/menu_icon.gif" width="9"/>
						<a class="menuChild" href="news.action?mtype=0">新闻焦点</a>
					</td>
				</tr>
				<tr height="20">
					<td  width="10">
						&nbsp;
					</td>
					<td>
						<img height="9" src="${ctx}/image/admin/menu_icon.gif" width="9"/>
						<a class="menuChild" href="news.action?mtype=1">热点资讯</a>
					</td>
				</tr>

	
				<tr height="4">
					<td colSpan="2"></td>
				</tr>
			</table>
			
		</td>
		<td width="1" bgColor="#d1e6f7"></td>
	</tr>
</table>
</div>
