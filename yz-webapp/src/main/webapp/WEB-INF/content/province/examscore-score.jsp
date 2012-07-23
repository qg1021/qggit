<%@ page contentType="text/html;charset=UTF-8" %>
<%@page import="com.drcl.yz.contant.Global"%>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="examscore" name="activemenu" />
	<title>成绩明细</title>
	<link href="${ctx}/css/master.css" type="text/css" rel="stylesheet"/> 
	<link href="${ctx}/css/fancybox/jquery.fancybox-1.3.4.css" rel="stylesheet" type="text/css" media="screen" />
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
	<script type="text/javascript" src="${ctx}/js/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
	<script type="text/javascript" src="${ctx}/js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
	<script src="${ctx}/js/jcommon.js" type="text/javascript"></script>
	<script type="text/javascript">
	function onClose(){
		parent.location.reload();
		parent.$.fancybox.close();
	}
	function changeScore(vv){
		
		if(vv=='缺考'){
			alert(vv);
			$("#tscore").val('0');
			$("#tscore").attr("readonly","true");
		}
		else if(vv=='违纪收卷'){
			$("#tscore").val('0');
			$("#tscore").attr("readonly","true");
		}
		else{
			$("#tscore").attr("readonly","true");
		}
	}
	</script>
</head>
<body>
<div class="layer_box">
	<div id="message" style="line-height: 35px;">
			<s:actionmessage theme="custom" cssClass="tipbox"/>
		</div>
	<form id="mainForm" action="examscore!save.action" method="post">
      <p class="right3pxborder mb10">成绩修改</p>
      <input type="hidden" size="10" id="id" name="id" value="${id}"/>
      <p class="mb20">成绩 <s:select onchange="changeScore(this.value);" list="#{'正常':'正常','缺考':'缺考','违纪收卷':'违纪收卷'}"  id="scoreStatus" name="scoreStatus"  value="scoreStatus" cssStyle="width:100px;" headerKey="" headerValue="--所有--"/>
       <input type="text" size="10" id="tscore" name="tscore"  value="${tscore}" onkeypress="gNumeric(true,false,event);" /></p>
      <p class="right3pxborder mb10">填写原因</p>
      <ul class="form">
        <li>
          <textarea id="remark" name="remark" rows="3" cols="80">${remark}</textarea>
        </li>
        <li>操作时间：<s:date name="updateDate" format="yyyy.MM.dd HH:mm"/></li>
        <li>操作者：${updateBy}</li>
      </ul>
      <p class="button_box">
        <button type="submit">确定</button>
        <button type="button" onclick="onClose();">取消</button>
      </p>
      </form>
    </div> 
</body>
</html>