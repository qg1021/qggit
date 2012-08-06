<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<script src="${ctx}/js/jquery.js" type="text/javascript"></script> 
<script type="text/javascript">
<!--
var curMenuName = null;
var didplayCurMenu = true;
 
$(document).ready(function() {

	
	$('a[name="one_menu"]').bind({
		mouseover:function() {
			curmenu = this;
			hideOthers();
		 	 
			this.className="nav_selected style_nav_selected";
			didplayCurMenu = false;
		},
		mouseout:function() {
			this.className = "";
			hiddenMenu(this.id);
		}
	});
 
	curMenuName = $('meta[name="menu"]').attr("content");
	timeoutDidplayCurMenu();
	handleclick(curMenuName);


})

function timeoutDidplayCurMenu(){
	window.setTimeout("displayCurMenu()",500);
}

function displayCurMenu(){
	if(!didplayCurMenu)return;
	$('#'+curMenuName).attr('className','nav_selected style_nav_selected');
}

//先隐藏其他的
function hideOthers(){ 
	$('#index').attr('className','');
	$('#news0').attr('className','');
	$('#news1').attr('className','');
	$('#localfeeling1').attr('className','');		
	$('#localfeeling2').attr('className','');
	$('#localfeeling0').attr('className','');
	$('#aboutus').attr('className','');		
	$('#bussiess').attr('className','');
}

function hiddenMenu(objid){ 
	$('#'+objid).attr('className','');
	didplayCurMenu = true;
	timeoutDidplayCurMenu();
}

function handleover(parentMenuid){	
	$('#'+parentMenuid).attr('className','nav_selected style_nav_selected');
	didplayCurMenu = false;
}

function handleclick(parentMenuid){	
	$('#'+parentMenuid).attr('className','nav_selected style_nav_selected');
	didplayCurMenu = true;
}

//-->
</script> 
	<div class="top_head">
		<img src="${ctx}/image/top1.jpg" alt="" width="960" height="150"/>
		<div class="head_logo">
			<a href="http://www.yangzhou-ip.com" class="logo" title="http://www.yangzhou-ip.com"></a>
		</div>
		
	</div>
	
	<div class="nav" id="menu">
		<span class="nav_bgl style_navbg_left">&nbsp;</span>
		<div class="nav_bgc style_navbg_centent">
			<ul>
			   <li><a name="one_menu" id="index" href="${ctx }/index.action" title="首页" style="outline:none;blr:expression(this.onFocus=this.blur())">首 页</a></li>
			   <li><a name="one_menu" id="news0" href="${ctx }/web/news.action?mtype=0" title="新闻焦点" style="outline:none;blr:expression(this.onFocus=this.blur())">新闻焦点</a></li>
			   <li><a name="one_menu" id="news1" href="${ctx}/web/news.action?mtype=1" title="热点资讯" style="outline:none;blr:expression(this.onFocus=this.blur())">热点资讯</a></li>
			   <li><a name="one_menu" id="lf1" href="${ctx}/web/localfeeling.action?mtype=1" title="扬州旅游" style="outline:none;blr:expression(this.onFocus=this.blur())">扬州旅游</a></li>
			   <li><a name="one_menu" id="lf2" href="${ctx}/web/localfeeling.action?mtype=2" title="扬州景点" style="outline:none;blr:expression(this.onFocus=this.blur())">扬州景点</a></li>
			   <li><a name="one_menu" id="lf0" href="${ctx}/web/localfeeling.action?mtype=0" title="扬州特产" style="outline:none;blr:expression(this.onFocus=this.blur())">扬州特产</a></li>
			   <li><a name="one_menu" id="it1" href="${ctx}/web/introduction.action?mtype=1" title="联系我们" style="outline:none;blr:expression(this.onFocus=this.blur())">联系我们</a></li>
			   <li><a name="one_menu" id="business" href="${ctx}/web/business.action" title="资源出售" style="outline:none;blr:expression(this.onFocus=this.blur())">资源出售</a></li>
		  	</ul>
 		</div>
 
 		<div class="nav_bgr style_navbg_right">
 		
               <div>
	        	
	      	</div>
		</div>
 
 <!--the end of menu_bottom-->
   
</div>
<!--nav 结束--> 