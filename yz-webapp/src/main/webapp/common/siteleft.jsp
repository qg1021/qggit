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
				<li><a id="examlist" href="${ctx}/site/examresource.action" style="outline:none;blr:expression(this.onFocus=this.blur())"><span class="file"></span>考次查询</a></li>
			</ul>
		</li>
		<li><a href="#" class="plus" style="outline:none;blr:expression(this.onFocus=this.blur())"><span class="folder">证书管理</span></a>
			<ul>
      			<li><a id="sitecertcode" href="${ctx}/site/certcode!siteList.action" style="outline:none;blr:expression(this.onFocus=this.blur())"><span class="file"></span>证书编号库管理</a></li>                
			</ul>
		</li>
		<li><a href="#" class="plus" style="outline:none;blr:expression(this.onFocus=this.blur())"><span class="folder">分支管理管理</span></a>
			<ul>
      			<li><a id="room" href="${ctx}/site/examroom.action" style="outline:none;blr:expression(this.onFocus=this.blur())"><span class="file"></span>考场管理</a></li>                
			</ul>
		</li>
		<li><a href="#" class="plus" style="outline:none;blr:expression(this.onFocus=this.blur())"><span class="folder">资讯管理</span></a>
			<ul>
      			<li><a id="newslist" href="${ctx}/site/triannews.action" style="outline:none;blr:expression(this.onFocus=this.blur())"><span class="file"></span>资讯列表</a></li>
      			<li><a id="newsadd" href="${ctx}/site/triannews!input.action" style="outline:none;blr:expression(this.onFocus=this.blur())"><span class="file"></span>新增资讯</a></li>                
			</ul>
		</li>
		<li><a href="#" class="plus" style="outline:none;blr:expression(this.onFocus=this.blur())"><span class="folder">帐号管理</span></a>
			<ul>
				<li><a id="user" href="${ctx}/site/user.action" style="outline:none;blr:expression(this.onFocus=this.blur())"><span class="file"></span>企业用户管理</a></li>
			</ul>
		</li>
	</ul>
</div>