<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="timecell" name="activemenu" />
	<title>分配考点</title>
	<link href="${ctx}/css/master.css" type="text/css" rel="stylesheet"/>
	<link href="${ctx}/css/layer.css" type="text/css" rel="stylesheet"/>  
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
	<script src="${ctx}/js/json2.js" type="text/javascript"></script>
	<script src="${ctx}/js/layer.js" type="text/javascript"></script>
	<script src="${ctx}/js/jcommon.js" type="text/javascript"></script>
	<script  type="text/javascript">
		function onSave(){
			var areaid = $("#areaid").val();
			var fieldid = $("#fieldid").val();
			var timesid = $("#id").val();
			var isLock = false;
			if($("#isLock").attr("checked")==true){
				isLock = true;
			}
				
			var obj = new Array();
			var j=0;
			var siteid;
			var isChecked = false; 
			parent.$("#areaid_"+areaid).val("true");
			$("input[id='siteid']:checked").each(function(){
				siteid = $(this).val();
				obj[j] = new Detail(siteid);
				j++;
				isChecked = true;
			});
				
			if(!isChecked){
				parent.$("#areaid_"+areaid).val("false");
			}
			if(isLock){
				parent.$("#lock_"+areaid).show();
			}
			var head = new TableHead(areaid,fieldid,timesid,isLock,obj);
			ajaxSubmit("timecell!saveSite.action",head,callBackSite)
		}
		function callBackSite(data){
			var data = eval(data);
			alert(data.value);
			if(data.value=='设置成功'){
				parent.$.fancybox.close();
			}
		}
		function TableHead(areaid,fieldid,timesid,isLock,detail){
			this.areaid = areaid;
			this.fieldid = fieldid;
			this.timesid = timesid;
			this.isLock = isLock; 
			this.detail = detail;
		}
		function Detail(siteid){
			this.siteid = siteid;
		}
	</script>
</head>
<body>
	<!--浮动层-->
	<!-- JS遮罩层 --> 
	<div id="fullbg"></div> 
	<!-- end JS遮罩层 --> 
	<!-- 对话框 --> 
	<div id="dialog"> 
		<div id="dialog_content"></div> 
	</div>
   <div class="layer_box">
   		<p>以下为 <span class="strong">${examArea.name}(${examArea.code})</span> 考区下辖的所有考点：</p>
   		<input type="hidden" id="areaid" name="areaid" value="${areaid}"/>
   		<input type="hidden" id="fieldid" name="fieldid" value="${fieldid}"/>
   		<input type="hidden" id="id" name="id" value="${examTimes.id}"/>
   		<ul class="checkbox_box">
   			<s:iterator value="examSitesList">
   				<li>
   				<s:if test="isChecked">
					<input type="checkbox" id="siteid" name="siteid" value="${examSite.id}" checked="checked"/>
				</s:if>
				<s:else>
					<input type="checkbox" id="siteid" name="siteid" value="${examSite.id}"/>
				</s:else>
   				${examSite.name}(${examSite.code})</li>
   			</s:iterator>
   		</ul>
   		<p class="del_float"></p>
   		<div class="bottombg">
   			<s:if test="plock">
   				<input id="isLock" name="isLock" type="checkbox" checked="checked"/>
   			</s:if>
   			<s:else>
   				<input id="isLock" name="isLock" type="checkbox"/>
   			</s:else><span class="icon_lock">锁定分配</span>
   			<span class="mlr20">
   				<button type="button" class="mr10" onclick="onSave();">确定</button>
   				<button type="button" onclick="parent.$.fancybox.close();">取消</button>
   			</span>
   		</div>
   </div>
   <!--浮动层 end --> 
</body>
</html>