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
				<li><a id="timecell" href="timecell.action?id=${examTimes.id}">考试资源管理</a></li>
			</ul>
		</li>
		<li class="submenu"><a href="#" class="fontbold">报名管理</a>
			<ul>
				<li><a id="apply" href="examresource!apply.action?id=${examTimes.id}">报名条件查看</a></li>
      			<li><a id="applyinfo" href="examapply!applyinfo.action?id=${examTimes.id}">报名情况汇总</a></li>
      			<li><a id="check" href="examapply!check.action?id=${examTimes.id}" >预报名审核</a></li>                
      			<li><a id="unpassed" href="examapply!unpassed.action?id=${examTimes.id}" >未审核通过的报名</a></li>                
      			<li><a id="checkpassed" href="examapply!checkpassed.action?id=${examTimes.id}" >审核通过的报名记录</a></li>                
			</ul>
		</li>
		<li class="submenu"><a href="#" class="fontbold">排考方案查询</a>
			<ul>
				<li><a id="examrecord" href="examrecord.action?timesid=${examTimes.id}">查看考场编排</a></li>
			</ul>
		</li>
		<li class="submenu"><a href="#" class="fontbold">成绩管理</a>
			<ul>
				<li><a id="score" href="examscore.action?timesid=${examTimes.id}">成绩查询</a></li>
			</ul>
		</li>
	</ul>
</div>
<!--左边tab结束-->
