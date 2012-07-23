<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="timecell" name="activemenu" />
	<title>时间单元分配</title>
	<link href="${ctx}/css/master.css" type="text/css" rel="stylesheet"/> 
	<link href="${ctx}/css/fancybox/jquery.fancybox-1.3.4.css" rel="stylesheet" type="text/css" media="screen" />
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
	<script type="text/javascript" src="${ctx}/js/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
	<script type="text/javascript" src="${ctx}/js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
	<script type="text/javascript" >
	$(document).ready(function(){    
		$("input.siteclass").fancybox({
 			'titlePosition'		: 'inside',
			'transitionIn'		: 'elastic',
			'transitionOut'		: 'elastic',
			'type':'iframe',
			'width': 650,
			'height': 160,
			'scrolling': 'no', 
			'showCloseButton':false,
			'hideOnOverlayClick':false,
			'padding': 0, //边框距离
			'margin':0, //边框距离 
			'onClosed': function() { //关闭时是否刷新弹出框d
            	//location.reload(true);
       		},
       		'onComplete':function() { //加载完成后,让第一个表单元素获得焦点
       			
       		}
		}
		); 
	}); 
	function showSiteFanBox(areaid){
		
		$("input.siteclass").attr("href","timecell!initSite.action?fieldid=${field.id}&id=${examTimes.id}&areaid="+areaid);	
	}
	//关闭弹出框
	function onFancyboxCancel()
	{
		$.fancybox.close();
	}
	function setChecked(obj,areaid) {
		if($("#areaid_"+areaid).val()=='true'){
			$(obj).attr("checked","true");
			alert("此考区下的考点已设置,不能取消勾选");
			return false;
		}
		if($(obj).attr("checked")){
			$(obj).parent().parent().find('td').eq(4).find('input').show();
		}else{
			$(obj).parent().parent().find('td').eq(4).find('input').hide();
		}
	}
	function onSave(){
		var isChecked = false;
		var isFlag = true;  
		$("input[id='areaids']:checked").each(function(){
			isChecked = true;
			/*if($(this).parent().find("input[name='areaid_flag']").val()=='0'){
				isFlag = false;
			}*/
		});

		if(!isChecked){
	 		alert("选择设置的考区");
	 		return false;
		}	
		if(!isFlag){
			alert("设置的所选考区的考点");
			return false;
		}
		$("#inputForm").submit();
	}
	</script>
</head>
<body>
<div id="wrapper">
	<%@ include file="/common/header.jsp"%>
	<!--the end of head-->
	<div id="content">  
		<%@ include file="../common/examtop.jsp"%>
		
		<!-- 左侧内容 column  start -->
		<%@ include file="../common/exammenu.jsp"%>
		<!-- 左侧内容 column  end -->
		<!-- 右侧内容 column  start -->  
		<div class="right_content">
			<h2>时间单元分配</h2>
			<div class="pagehead01"></div>
      		<p class="examination_info">时间单元设置</p>
      		<form id="inputForm" name="inputForm" action="timecell!areaSave.action" method="post">
      			<input type="hidden" id="id" name="id" value="${examTimes.id}"/>
      			<input type="hidden" id="fieldid" name="fieldid" value="${fieldid}"/>
	      		<div class="top_serach_box">
	        		<p>时间单元：<span class="fontbold"><s:date name="field.startdate" format="MM月dd日 HH:mm"/>-<s:date name="field.enddate" format="HH:mm"/></span></p>
	        		<p class="box_dotline_bottom mb10">时长：${field.dateTimeBetween}分钟</p>
	        		<p class="mb5">在下列列表中选择考区可将该时间单元分配给考区。</p>
	        		<p>点击"考点设置"可直接分配该时间单元给考点，若勾选<span class="icon_lock">&nbsp;</span>"锁定分配"则该时间单元对该考区进行锁定，考区管理员不可进行更改。</p>
	        		<div id="message" style="line-height: 35px;">
						<s:actionmessage theme="custom" cssClass="tipbox"/>
					</div>
			        <table class="tablebox"  >
				        <tr>
				          <th width="10%">开考</th>
				          <th width="35%">考区名称 </th>
				          <th width="20%">考区编号</th>
				          <th width="20%">下辖考点数</th>
				          <th width="15%">操作</th>
				        </tr>
				        <s:iterator value="examAreasList" status="st">
					        <tr>
					          <td>
					          	<s:if test="isChecked">
					          		<input type="checkbox" id="areaids" name="areaids" value="${examArea.id}" checked="checked" onclick="setChecked(this,${examArea.id});"/>
					          		<input type="hidden" id="areaid_${examArea.id}" name="areaid_flag" value="true"/>
					          	</s:if>
					          	<s:else>
					          		<input type="checkbox" id="areaids" name="areaids" value="${examArea.id}" onclick="setChecked(this,${examArea.id});"/>
					          		<input type="hidden" id="areaid_${examArea.id}" name="areaid_flag" value="false"/>
					          	</s:else>
					          </td>
					          <td>
					          	${examArea.name}
					          	<s:if test="plock">
					          		<span class="icon_lock">&nbsp;</span>
					          	</s:if>
					          	<s:else>
					          		<span id="lock_${examArea.id}" style="display:none" class="icon_lock">&nbsp;</span>
					          	</s:else>
					          	
					          </td>
					          <td>${examArea.code}</td>
					          <td>${examArea.siteSize}</td>
					          <td>
					          	<s:if test="isChecked">
					          		<input type="button"  class="siteclass" value="考点设置"  onclick="javaScript:showSiteFanBox(${examArea.id});"/>
					          	</s:if>
					          	<s:else>
					          		<input type="button" style="display:none" class="siteclass" value="考点设置"  onclick="javaScript:showSiteFanBox(${examArea.id});"/>
					          	</s:else>
					          	
					          </td>
					        </tr>
				        </s:iterator>
	      			</table>
	      			<p class="button_box">
	      				<button type="button" onclick="onSave();">保存设置</button>
	      				<button type="button" onclick="window.location.href='timecell!search.action?id=${examTimes.id}'">返  回</button>
	      			</p>
	      		</div>
      		</form>
		</div>
		<!-- 右侧内容 column  end-->    
	</div> 
	<!-- content  end-->  
</div><!-- wrapper  end-->  
</body>
</html>