<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<script>
$(document).ready(function() {
	
	var activemenu = $('meta[name="activemenu"]').attr("content");
	if(!activemenu)
		activemenu = $('#activemenu').val();
	if(activemenu){
		var tag = $('#' + activemenu);
		tag.addClass('folder_tree_active');
		$('.tree ul').hide();
		$(tag.parent().parent().parent().find("a[class='plus']")).toggleClass('cut');
		tag.parent().parent().toggle();
	}
	$('.plus').click(function(){
		$(this).toggleClass('cut').next('ul').toggle();
		//$(this).parent().find("ul").toggle();
	})
	
});
</script>
<!--左边tab-->
<div class="left_main">
	<ul class="tree">
		<li><a href="#" class="plus" style="outline:none;blr:expression(this.onFocus=this.blur())"><span class="folder">考务管理</span></a>
			<ul>
				<li><a id="examtimes" href="${ctx}/area/examresource.action" style="outline:none;blr:expression(this.onFocus=this.blur())"><span class="file"></span>考次查询</a></li>
			</ul>
		</li>
		<li><a href="#" class="plus" style="outline:none;blr:expression(this.onFocus=this.blur())"><span class="folder">证书管理</span></a>
			<ul>
      			<li><a id="examcert" href="${ctx}/area/certcode!areaList.action" style="outline:none;blr:expression(this.onFocus=this.blur())"><span class="file"></span>证书编号库管理</a></li>
			</ul>
		</li>
		<li><a href="#" class="plus" style="outline:none;blr:expression(this.onFocus=this.blur())"><span class="folder">分支管理管理</span></a>
			<ul>
      			<li><a id="site" href="${ctx}/area/examsite.action" style="outline:none;blr:expression(this.onFocus=this.blur())"><span class="file"></span>考点管理</a></li>
      			<li><a id="room" href="${ctx}/area/examroom.action" style="outline:none;blr:expression(this.onFocus=this.blur())"><span class="file"></span>考场管理</a></li>                
			</ul>
		</li>
		<security:authorize ifAnyGranted="考区管理员">
		<li><a href="#" class="plus" style="outline:none;blr:expression(this.onFocus=this.blur())"><span class="folder">帐号管理</span></a>
			<ul>
				<li><a id="user" href="${ctx}/area/user.action" style="outline:none;blr:expression(this.onFocus=this.blur())"><span class="file"></span>考区业务管理员管理</a></li>
			</ul>
		</li>
		</security:authorize>
	</ul>
</div>