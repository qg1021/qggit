<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<script>
$(document).ready(function() {
	
	var activemenu = $('meta[name="activemenu"]').attr("content");
	if(!activemenu){
		if(activemenu.indexOf("outside")!=-1){
			setTab('a',2,2);
		}
		activemenu = $('#activemenu').val();
	}

	if(activemenu){
		if(activemenu.indexOf("outside")!=-1){
			setTab('a',2,2);
		}
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

	function setTab(name,cursel,n){
		for(i=1;i<=n;i++){
			var menu=document.getElementById(name+"_"+i);
			var con=document.getElementById(name+"_"+i+"_list");
			menu.className=i==cursel?"selected":"";
			con.style.display=i==cursel?"block":"none";
		}
	}


</script>
<!--左边tab-->
<div class="left_main">
<ul class="sidebar_tab">
	<security:authorize   ifAnyGranted="省考务管理员">
		<li id="a_1" onclick="setTab('a',1,2)" class="selected">内考务管理</li>
		<li id="a_2" onclick="setTab('a',2,2)">外考务管理</li>
	</security:authorize>
	<security:authorize   ifAnyGranted="省考务业务员 ">
		<li id="a_1" onclick="setTab('a',1,2)" style="display:none" class="selected">内考务管理</li>
		<li id="a_2" onclick="setTab('a',2,2)">外考务管理</li>
	</security:authorize>
</ul>
<div id="a_1_list">
	<ul class="tree">
		<li>
			<a href="#" class="plus" style="outline:none;blr:expression(this.onFocus=this.blur())"><span class="folder">考试项目管理</span></a>
			<ul>
				<li><a id="searchitem" href="${ctx}/province/examitem.action" style="outline:none;blr:expression(this.onFocus=this.blur())"><span class="file">考试项目列表</span></a></li>
				<li><a id="createitem"  href="${ctx}/province/examitem!input.action" style="outline:none;blr:expression(this.onFocus=this.blur())"><span class="file">创建考试项目</span></a></li>
				<li><a id="examtimes"  href="${ctx}/province/examtimes.action" style="outline:none;blr:expression(this.onFocus=this.blur())"><span class="file">考次查询</span></a></li>                
			</ul>
		</li>
		<li>
			<a href="#" class="plus" style="outline:none;blr:expression(this.onFocus=this.blur())"><span class="folder">排考管理</span></a>
			<ul>
				<li><a id="arrange" href="${ctx}/province/arrange.action" style="outline:none;blr:expression(this.onFocus=this.blur())"><span class="file">排考列表</span></a></li>               
			</ul>
		</li>
		<li>
			<a href="#" class="plus" style="outline:none;blr:expression(this.onFocus=this.blur())"><span class="folder">缓考区管理</span></a>
			<ul>
				<li><a id="examexcused" href="${ctx}/province/examexcused.action" style="outline:none;blr:expression(this.onFocus=this.blur())"><span class="file">缓考列表</span></a></li>               
			</ul>
		</li>
		<li><a href="#" class="plus" style="outline:none;blr:expression(this.onFocus=this.blur())"><span class="folder">禁考区管理</span></a>
			<ul>
				<li><a id="ban" href="${ctx}/province/examitem!banlist.action" style="outline:none;blr:expression(this.onFocus=this.blur())"><span class="file">禁考列表</span></a></li>             
			</ul>
		</li>
		<li><a href="#" class="plus" style="outline:none;blr:expression(this.onFocus=this.blur())"><span class="folder">成绩管理</span></a>
			<ul>
				<li><a id="examscore" href="${ctx}/province/examtimes!scorelist.action" style="outline:none;blr:expression(this.onFocus=this.blur())"><span class="file">成绩管理</span></a></li>               
			</ul>
		</li> 
		<li><a href="#" class="plus" style="outline:none;blr:expression(this.onFocus=this.blur())"><span class="folder">组织机构代码管理</span></a>
			<ul>
				<li><a id="organ" href="${ctx}/province/organ.action" style="outline:none;blr:expression(this.onFocus=this.blur())"><span class="file">组织机构代码管理</span></a></li>               
			</ul>
		</li> 
		<li><a href="#" class="plus" style="outline:none;blr:expression(this.onFocus=this.blur())"><span class="folder">证书管理</span></a>
			<ul>
				<li><a id="addcert" href="${ctx}/province/certproject!input.action" style="outline:none;blr:expression(this.onFocus=this.blur())"><span class="file">创建证书项目</span></a></li>  
				<li><a id="listcert" href="${ctx}/province/certproject.action" style="outline:none;blr:expression(this.onFocus=this.blur())"><span class="file">证书项目管理</span></a></li>
				<li><a id="certtemplate" href="${ctx}/province/certtemplate.action" style="outline:none;blr:expression(this.onFocus=this.blur())"><span class="file">证书模板管理</span></a></li>  
				<li><a id="certcodeinput" href="${ctx}/province/certcode!preSave.action" style="outline:none;blr:expression(this.onFocus=this.blur())"><span class="file">生成证书编号</span></a></li>                 
				<li><a id="certcode" href="${ctx}/province/certcode.action" style="outline:none;blr:expression(this.onFocus=this.blur())"><span class="file">证书编号库</span></a></li>               
			</ul>
		</li> 
	</ul>
</div>
<div id="a_2_list" style="display:none">
	<ul class="tree">
		<li><a href="#" class="plus" style="outline:none;blr:expression(this.onFocus=this.blur())"><span class="folder">考务管理</span></a>
			<ul>
				<li><a id="outsideexamlist" href="${ctx}/province/examresource.action" style="outline:none;blr:expression(this.onFocus=this.blur())"><span class="file"></span>考次查询</a></li>
			</ul>
		</li>
		<li><a href="#" class="plus" style="outline:none;blr:expression(this.onFocus=this.blur())"><span class="folder">分支管理管理</span></a>
			<ul>
				<li><a id="outsidearea" href="${ctx}/province/examarea.action" style="outline:none;blr:expression(this.onFocus=this.blur())"><span class="file"></span>考区管理</a></li>
      			<li><a id="outsidesite" href="${ctx}/province/examsite.action" style="outline:none;blr:expression(this.onFocus=this.blur())"><span class="file"></span>考点管理</a></li>
      			<li><a id="outsideroom" href="${ctx}/province/examroom.action" style="outline:none;blr:expression(this.onFocus=this.blur())"><span class="file"></span>考场管理</a></li>                
			</ul>
		</li>
		<security:authorize   ifAnyGranted="省考务管理员">
			<li><a href="#" class="plus" style="outline:none;blr:expression(this.onFocus=this.blur())"><span class="folder">帐号管理</span></a>
				<ul>
					<li><a id="outsideuser" href="${ctx}/province/user.action" style="outline:none;blr:expression(this.onFocus=this.blur())"><span class="file"></span>省考务业务管理员管理</a></li>
				</ul>
			</li>
			<li><a href="#" class="plus" style="outline:none;blr:expression(this.onFocus=this.blur())"><span class="folder">报名流程管理</span></a>
				<ul>
					<li><a id="outsidereport" href="${ctx}/province/reportflow!input.action" style="outline:none;blr:expression(this.onFocus=this.blur())"><span class="file"></span>报名流程管理</a></li>
				</ul>
			</li>
		</security:authorize>
	</ul>
</div>
</div>
<!--左边tab结束-->