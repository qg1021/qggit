<%@ page contentType="text/html;charset=UTF-8" %>
<script type="text/javascript">
	//加入收藏
	function addFavor(url,title){
		if (document.all) {  
		  		window.external.AddFavorite(url, title); 
		  } else if (window.sidebar) { 
		  		window.sidebar.addPanel(title, url,""); 
		  } else if ( window.opera && window.print ) { 
				var mbm = document.createElement('a'); 
				  mbm.setAttribute('rel','sidebar'); 
				  mbm.setAttribute('href',url); 
				  mbm.setAttribute('title',title); 
				  mbm.click(); 
		  } else { 
		  		alert("收藏失败！请使用Ctrl+D进行收藏"); 
		  }
		}

	//设为首页
	function setHomepage(pageURL) {
		if (document.all) {
			document.body.style.behavior='url(#default#homepage)';
			document.body.setHomePage(pageURL);
		}
		else if (window.sidebar) {
			if(window.netscape) {
				try {
					netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
				}
				catch (e) {
					alert( "该操作被浏览器拒绝，如果想启用该功能，请在地址栏内输入 about:config,然后将项signed.applets.codebase_principal_support 值该为true" );
				}
			}
			var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components. interfaces.nsIPrefBranch);
			prefs.setCharPref('browser.startup.homepage',pageURL);
		}
	}
	</script> 
	<ul class="style_footerline">
		<li>
			<span class="rr"><a href="javascript:void(0);" onclick="javascript:setHomepage('http://www.sgp-yzip.cn');" style="outline:none;blr:expression(this.onFocus=this.blur())">设为首页</a> | <a href="javascript:void(0);" onclick="addFavor('http://www.sgp-yzip.cn', '掌上扬州信息平台')" style="outline:none;blr:expression(this.onFocus=this.blur())">加入收藏夹</a></span> 
			主办人：孙国平  所在单位 ：江苏省工程勘测研究院有限责任公司 江苏弘盛建设工程集团有限公司 
			</li>
		<li>地址：扬州市盐阜东路工人二村150号 |   电话：13905277611  15905273733   电邮：<a href="mailto:13905277611@163.com" style="outline:none;blr:expression(this.onFocus=this.blur())">13905277611@163.com</a>&nbsp;&nbsp;<a href="mailto:2290123231@qq.com" style="outline:none;blr:expression(this.onFocus=this.blur())">2290123231@qq.com</a></li>
	</ul>
