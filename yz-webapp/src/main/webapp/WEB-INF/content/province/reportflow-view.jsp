<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>预览报名流程</title>
	<link href="${ctx}/css/master.css" type="text/css" rel="stylesheet"/> 
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
	<script type="text/javascript">
	//上传后的文件的下载
	function onDownLoad(){
		var x=document.getElementById("downLoadForm");  
		 x.submit();
	}
</script>
</head>
<body>
<div id="wrapper"> <br />
  <div id="content"> 
    
<!-- 内容 column  start -->
<div class="content_box">
<h2>预览报名流程</h2>
<div class="pagehead01"></div> 
        
	<div class="news_detail_new">
	 <p class="box_solid_bottom"><s:date name="reportFlow.createDate" format="yyyy.MM.dd"/> </p>
	<div style="overflow: auto;">${reportFlow.content}</div>    
		<c:if test="${not empty reportFlow.attachmentPath}">
    <p class="box_hint_blue ta_c">相关附件： <a href=javascript:void(0) onclick=onDownLoad();>${trianNews.attachmentName}</a></p>
    </c:if>
    </div>
 
      
  </div>
  <!-- 右侧内容 column  end--> 
  
</div>
<!-- content  end-->
 
</div>
<!-- wrapper  end-->
 
<form action="../attachdownload.excsec" method="post" id="downLoadForm">
	<input type="hidden" name="name" id="name" value="${attachmentPath}"/>
	<input type="hidden" name="trueName" id="trueName" value="${attachmentName}"/>  
</form>
</body>
</html>