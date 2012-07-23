<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="outsidesite" name="activemenu" />
	<title>考点</title>
	<link href="${ctx}/css/master.css" type="text/css" rel="stylesheet"/> 
	<link href="${ctx}/js/validate/jquery.validate.css" type="text/css" rel="stylesheet"/>
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
	<script src="${ctx}/js/validate/jquery.validate.js" type="text/javascript"></script>
	<script src="${ctx}/js/validate/messages_cn.js" type="text/javascript"></script>
	<script src="${ctx}/js/jcommon.js" type="text/javascript"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		$('input,select,textarea,radio,checkbox').attr('disabled',true);
	});

	</script>
</head>
<body>
<div id="wrapper">
	<%@ include file="/common/header.jsp"%>
	<!--the end of head-->
	<div id="content">  
		<!-- 左侧内容 column  start -->
		<s:if test="returnType=='view'">
		<%@ include file="/common/left.jsp"%>
		</s:if>
		<!-- 左侧内容 column  end -->
		<!-- 右侧内容 column  start -->  
		<div class="right_content">
			<h2>考点新增审核</h2>
			<div class="pagehead01"></div>
				<div class="top_serach_box">
					<div class="district_edit_form">
			    		<dl class="slowtest_info">
			    			<dt>提交时间</dt>
			    			<dd><s:date name="createDate" format="yyyy.MM.dd HH:mm"/></dd>
			    		</dl>
			    		<s:if test="returnType!='view'">
			    			<dl class="slowtest_info">
			    			<dt>省考务审核情况</dt>
			    			<dd>${statusName}(<s:date name="auditDate" format="yyyy.MM.dd HH:mm"/>)</dd>
			    		</dl>
			    		</s:if>
			    		<p class="clearb"></p>
						<p class="examination_info">考点信息</p>
						<ul class="form">
							<li>
								<label>所属考区</label><s:select list="examAreaList"  listKey="value" listValue="label" id="areaid" name="areaid"  value="examArea.id"  theme="simple" cssStyle="width:310px;" headerKey="" headerValue="--选择--"/>
							</li>	
					  		<li><label>考点名称</label><input id="name" name="name" value="${name}" type="text" maxlength="100" style="width:300px;" /></li>
					  		<li><label>考点编号</label><input type="text" id="code" name="code" value="${code}"  style="width:300px;"  readonly="readonly"/>(系统生成)</li>
					  		
					  		<li  class="dotline"></li>
					  		
					  		<li >以下信息为考点地址以及联系方式，信息对公众公开并显示在考生准考证上，请认真填写</li>
						    <li>
						    	<label>地址<span class="colorred">*</span></label>
						    	<input name="address" value="${address}"  class="required" maxlength="200" type="text" style="width:300px;" />
						    </li>
						    <li>
						    	<label>联系电话<span class="colorred">*</span></label>
						    	<input name="phoneNo" value="${phoneNo}" class="required" maxlength="30"  type="text" style="width:300px;" />
						    </li>
						    <li>
						    	<label>联系人<span class="colorred">*</span></label>
						    	<input name="chargeMan" value="${chargeMan}" class="required" maxlength="30" type="text" style="width:300px;" />
						    </li>
						    <li  class="dotline"></li>
					  	</ul> 
					  	<div> 
						 	<p class="dotline"></p>  
						 	<ul class="form district_edit_form">
							  <li>	
							  	<p class="examination_info">考点主管理员帐号</p>
							  </li>
							  <li>
							  	<label>用户名 <span class="colorred">*</span></label>
							  	<input id="loginName" name="loginName" value="${user.loginName}" type="text" style="width:300px;" class="required" maxlength="30"/>
							  </li>
							  <li>
							  	<label>密码 <span class="colorred">*</span></label>
							  	<input id="password" name="password" value="${user.password}" type="text" style="width:300px;" class="required" maxlength="30"/>
							  </li>
							  <li>
							  	<label>密码确认 <span class="colorred">*</span></label>
							  	<input id="qpassword" name="qpassword" value="${user.password}" type="text" style="width:300px;" class="required" maxlength="30"/>
							  </li>
							 </ul>
						 </div>	
						 <s:if test="returnType=='view'">
							<p class="button_box">
								<button class="btn_confirm" type="button" onclick="window.location.href='examsite!audit.action?id=${id}'">审核通过</button> 
								<button class="btn_cancell" type="button" onclick="window.location.href='examsite!unaudit.action?id=${id}'">审核不通过</button>
							</p>
						 </s:if> 
						 <s:else>
						 	<p class="button_box">
						 		<button class="btn_cancell" type="button" onclick="pageClose();">关闭窗口</button>
						 	</p>
						 </s:else>   
					</div>
				</div>
			</div>
			<!-- 右侧内容 column  end-->    
		</div> <!-- content  end-->  
	</div><!-- wrapper  end-->  
</body>
</html>