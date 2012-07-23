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
	$.ajax({
		   type: "POST",
		   url: "<common:prop name="center.webapp.url" propfilename="sysconfig.properties" defaultvalue="${pageContext.request.contextPath}"/>/paper!openpaper.action",
		   data: {'examCode':'${examTimes.code}'},
		   success: function(msg){
			   if(msg == 'true'){
				   $('#download').show();
			   }
		   }
		});
	
});



</script>
<!--左边tab-->
<div class="left_menu">

	<ul class="folder_tree">
		<li class="submenu"><a href="#" class="fontbold">考试资源管理</a>
			<ul>
				<li><a id="subject" href="examresource!info.action?id=${examTimes.id}">考试科目查看</a></li>
				<li><a id="timecell" href="outsideseat.action?id=${examTimes.id}">考试资源上报</a></li>
			</ul>
		</li>
		<li class="submenu"><a href="#" class="fontbold">报名管理</a>
			<ul>
				<li><a id="apply" href="examresource!apply.action?id=${examTimes.id}">报名条件查看</a></li>
      			<li><a id="applyinfo" href="examapply!applyinfo.action?id=${examTimes.id}">报名情况汇总</a></li>
      			<li><a id="check" href="examapply!check.action?id=${examTimes.id}" >预报名管理</a></li>                
      			<li><a id="unpassed" href="examapply!unpassed.action?id=${examTimes.id}" >未审核通过的报名</a></li>                
      			<li><a id="checkpassed" href="examapply!checkpassed.action?id=${examTimes.id}" >审核通过的报名记录</a></li>                
			</ul>
		</li>
		<li class="submenu"><a href="#" class="fontbold">排考方案查询</a>
			<ul>
				<li><a id="examrecord" href="examrecord.action?timesid=${examTimes.id}">查看考场编排</a></li>
				<li><a id="sign" href="sitetable.action?timesid=${examTimes.id}">考场签到表打印</a></li>
				<li><a id="door" href="sitetable!searchDoor.action?timesid=${examTimes.id}">考场门贴打印</a></li>
				<li><a id="record" href="sitetable!searchRecord.action?timesid=${examTimes.id}">考场记录单打印</a></li>
				<li><a id="card" href="examcard.action?timesid=${examTimes.id}">准考证打印</a></li>
			</ul>
		</li>
		<li class="submenu"><a href="#" class="fontbold">考试数据下载</a>
			<ul>
				<li><a id="package" href="examdownload!arrange.action?id=${examTimes.id}">试卷组和排考方案下载</a></li>
				<li class="dn" id="download"><a id="paper" href="examdownload!paper.action?id=${examTimes.id}">纸质备卷下载</a></li>
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
