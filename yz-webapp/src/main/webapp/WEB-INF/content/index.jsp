<%@ page contentType="text/html;charset=UTF-8" %>
<%@page import="com.drcl.yz.contant.Global"%>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>  
	<%@ include file="/common/meta.jsp" %>
	<meta content="index" name="menu" />            
	<title>掌上扬州-扬州信息平台</title>
	<link href="${ctx}/css/style.css" rel="stylesheet" type="text/css" />
	<link href="${ctx}/css/frontreset.css" rel="stylesheet" type="text/css" />
	<link href="${ctx}/css/site.css" rel="stylesheet" type="text/css" /> 
	<script>
		function setTab(name,cursel,n){
			for(i=1;i<=n;i++){
				var menu=document.getElementById(name+"_"+i);
				var con=document.getElementById(name+"_"+i+"_panels");
				menu.className=i==cursel?"selected style_titlecolor":"";
				con.style.display=i==cursel?"block":"none";
			}
		}
	</script>
</head>
<body>
<div id="wrapper">
	<!--头部开始-->
	<div id="header">
		<%@ include file="/common/header.jsp" %>
	</div>
	<!--头部结束-->
  
  <!--中间内容开始-->
  <div id="content">
  
	  <!--左边内容开始-->
	  <div class="l_col">
	  		<!--左边头部开始-->
	  		<div class="left_news">
	  	  		<div class="column_box">
	        		<span class="style_titlecolor font_set">扬州简介</span>
	        		<p class="dotline_top"></p>
	        		<span class="column_con">
			        	<s:iterator value="intrList">
			        		<a href="${ctx}/web/introduction.action?mtype=0">&nbsp;&nbsp;&nbsp;&nbsp;<common:cut len="300" string="${content}"></common:cut></a>
			        	</s:iterator>
	        		</span>
	      		</div>
	      	</div>
     		<!--左边头部结束-->
  			<div class="column_buttom ll">
	        	<div class="hline_grey">
		        	<div class="style_linecolor hline_set">
		          		<span class="style_titlecolor font_set">新闻焦点</span>
		          	</div>
	          		<div class="curriculum_more" onclick="location.href='${ctx}/web/news.action?mtype=0';"> </div>
	          	</div>
        		<ul>
		        	<s:iterator value="focousList">
			         	<li class="list_b">
			          		<a class="ellipsis" href="${link}" target="_blank" title="${title}">${title}</a>
			          	</li>
				 	</s:iterator>
        		</ul>
      		</div>
  
  			<div class="column_buttom rr">
        		<div class="hline_grey">
		        	<div class="style_linecolor hline_set">
		          		<span class="style_titlecolor font_set">热点资讯</span>
		          	</div>
          			<div class="curriculum_more" onclick="location.href='${ctx}/web/news.action?mtype=1';"> </div>
          		</div>
		        <ul>
		        	<s:iterator value="hotnewsList">
			          	<li class="list_b">
			          		<a class="ellipsis" href="${link}" target="_blank" title="${title}">${title}</a>
			          	</li>
					</s:iterator>
		        </ul>
      		</div>
  		</div>
  		<!--左边内容结束-->
  		<!--右边内容开始-->
  		<div class="r_col">
   			<!--the beginning of 了解我们-->
      		<!--the end of 了解我们-->
     		<!--特色课程推荐选项开始-->
	    	<div class="tab_container">
		        <ul class="tab_container_menu">
		            <li id="a_1" onclick="setTab('a',1,3)" class="selected style_titlecolor">扬州特产</li>
		            <li id="a_2" onclick="setTab('a',2,3)">扬州景点</li>
		            <li id="a_3" onclick="setTab('a',3,3)">扬州旅游</li>
		        </ul>
		        <div id="a_1_panels">
			        <ul class="tab_container_list">
			       		<s:iterator value="specialtyList">
				        	<li class="list_b">
				        		<a href="${link}" class="ellipsis" title="${title}" target="_blank">
				        			<common:cut len="15" string="${title}"></common:cut>
				        		</a> 
				        	</li>
				        </s:iterator>
				        <li class="curriculum_more" style="width:38px;cusror:pointer;" onclick="window.location.href='${ctx}/web/localfeeling.action?mtype=0'"></li> 
			        </ul>
		        </div>
		        <div style="display:none" id="a_2_panels">
			        <ul class="tab_container_list">
				        <s:iterator value="spotsList">
				        	<li class="list_b">
				        		<a href="${link}" class="ellipsis" title="${title}" target="_blank">
				        			<common:cut len="15" string="${title}"></common:cut>
				        		</a> 
				        	</li>
				        </s:iterator>
				        <li class="curriculum_more" style="width:38px;cusror:pointer;" onclick="window.location.href='${ctx}/web/localfeeling.action?mtype=2'"></li>
			        </ul>
		        </div>
		        <div style="display:none" id="a_3_panels">
			        <ul class="tab_container_list">
				        <s:iterator value="tourList">
				        	<li class="list_b">
				        		<a href="${link}" class="ellipsis" title="${title}" target="_blank">
				        			<common:cut len="15" string="${title}"></common:cut>
				        		</a> 
				        	</li>
				        </s:iterator>
				        <li class="curriculum_more" style="width:38px;cusror:pointer;" onclick="window.location.href='${ctx}/web/localfeeling.action?mtype=1'"></li>
			        </ul>
		        </div>
    		</div>
    		<br/>
    		<div class="column_box">
    			<span class="style_titlecolor font_set">天气预报</span>
	        	<p class="dotline_top"></p>
	        	<iframe width='260' height='120' marginwidth="0" marginheight="0"  frameborder="0" scrolling="no" 
				 src='http://m.weather.com.cn/m/pn12/weather.htm?id=101190601T&random=0.11702170415388835'></iframe>
	        </div>

  		</div>
  		<!--右边内容结束-->  
    </div>
    <center>
	    <div class="friendlink" > 
		    <s:iterator value="linksList" status="st">
			    <s:if test="#st.last">
			    	<a style="margin-right:0;" title="${title}" href="${link}" target="_blank">
			    		<img alt="${title}" style="cursor: pointer;" border="0" src="${ctx}/<%=Global.picpath%>${picurl}" width="152" height="43"/>
			    	</a>
			    </s:if>
			    <s:else>
			    	<a href="${link}" target="_blank" title="${title}">
			    		<img alt="${title}" style="cursor: pointer;" border="0" src="${ctx}/<%=Global.picpath%>${picurl}" width="152" height="43"/>
			    	</a>
			    </s:else>
		    </s:iterator> 
	    </div> 
    </center>
    <!--中间内容结束-->
	<div id="footer">
		<%@ include file="/common/footer.jsp" %>
	</div>
</div>
</body>
</html>
