<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<script>
$(document).ready(function() {
	//$(".submenu").find("ul").hide();

	$(".submenu").bind("click", function(){
		$(".submenu").each(function(){
 			$(this).find("ul").hide();
    	 });
		$(this).find("ul").show();
	})
	var activemenu = $('meta[name="activemenu"]').attr("content");
	if(!activemenu)
		activemenu = $('#activemenu').val();
	if(activemenu){
		var tag = $('#' + activemenu);
		$(".submenu").each(function(){
 			$(this).find("ul").hide();
    	 });
		tag.addClass('folder_tree_active');
		tag.parent().parent().show()
	}


	
});



</script>
<!--左边tab-->
<div class="left_menu">

	<ul class="folder_tree">
		<li class="submenu"><a href="#" class="fontbold">考试资源管理</a>
			<ul>
				<li><a id="subject" href="examresource!info.action?id=${examTimes.id}">考试科目查看</a></li>
				<li><a id="timecell" href="timecell!search.action?id=${examTimes.id}">时间单元分配和发布</a></li>
			</ul>
		</li>
		<li class="submenu"><a href="#" class="fontbold">报名管理</a>
			<ul>
				<li><a id="apply" href="examresource!apply.action?id=${examTimes.id}">报名条件和时间表设置</a></li>
      			<li><a id="applyinfo" href="examapply!applyinfo.action?id=${examTimes.id}">报名情况汇总</a></li>
      			<li><a id="unpassed" href="examapply!unpassed.action?id=${examTimes.id}" >未通过审核的报名</a></li>                
      			<li><a id="checkpassed" href="examapply!checkpassed.action?id=${examTimes.id}" >审核通过的报名记录</a></li>                
			</ul>
		</li>
	</ul>
</div>
<!--左边tab结束-->
