<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<script>
$(document).ready(function() {
	$(".submenu").find("ul").hide();

	$(".submenu").bind("click", function(){
		$(this).parent()
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
		tag.addClass('folder_tree_active');
		tag.parent().parent().show()
	}


	
});
</script>
<!-- 左侧内容 column  start -->
<div class="left_menu">
	<ul class="folder_tree">
    	<li class="submenu"><a href="flow.action?timesid=${timesid}" class="fontbold"><span class="icon_progess"></span> 工作进度概况</a></li>
		<li class="submenu"><span class="icon_triumph"></span><b id="menu">考试准备管理</b>
        	<ul>
            	<li><a id="timecell" href="${ctx}/province/timecell!search.action?timesid=${timesid}"><span class="icon_point"></span>时间单元分配</a></li>
              	<!-- <li><a id="createitem"  href="#"><span class="icon_point"></span>报名条件和时间设置</a></li>
              	<li><a id="seat"  href="${ctx}/province/seat.action?timesid=${timesid}" ><span class="icon_point"></span>考试资源汇总</a></li> -->
            </ul>
        </li>
        <!-- 
        <li class="submenu"><span class="icon_triumph"></span><b id="menu">报名管理</b>
        	<ul >
            	<li><a id="cash" href="#"><span class="icon_point"></span>报名时间和条件管理</a></li>
              	<li><a id="ban" href="#"><span class="icon_point"></span>报名情况汇总</a></li>
              	<li><a id="ban" href="#"><span class="icon_point"></span>省考务待审报名记录</a></li>
              	<li><a id="ban" href="#"><span class="icon_point"></span>未通过审核的报名记录</a></li>
              	<li><a id="ban" href="#"><span class="icon_point"></span>审核通过的报名记录</a></li>
            </ul>
        </li>
        <li class="submenu"><span class="icon_triumph"></span> <b id="menu">排考管理</b>
        	<ul>
            	<li><a id="area" href="${ctx}/province/examarea.action""><span class="icon_point"></span>排考管理</a></li>
              	<li><a id="site" href="${ctx}/province/examsite.action"><span class="icon_point"></span>正式报考记录</a></li>
              	<li><a id="room" href="${ctx}/province/examroom.action" ><span class="icon_point"></span>查考考场编排</a></li>
            </ul>
        </li>
        <li class="submenu"><span class="icon_triumph"></span> <b id="menu">成绩管理</b>
        	<ul>
            	<li><a id="admin" ><span class="icon_point"></span>成绩发布管理</a></li>
            </ul>
        </li>-->
	</ul> 

</div>
<!-- 左侧内容 column  end -->