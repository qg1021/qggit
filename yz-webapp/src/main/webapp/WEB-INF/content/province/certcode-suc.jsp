<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="certcodeinput" name="activemenu" />
	<title>证书编号库</title>
	<link href="${ctx}/css/master.css" type="text/css" rel="stylesheet"/> 
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
</head>
<body>
 <div id="wrapper"> 

	<%@ include file="/common/header.jsp"%>
      
      <div id="content"> 
        
        <!--左边tab-->
        <%@ include file="/common/left.jsp"%>
        <!--左边tab结束--> 
        
        <!--右边-->
        <div class="right_content">
          <h2>生成证书编号</h2>
          <div class="pagehead01"></div>
          <!--<div class="pagehead02"></div>-->
          
          <!--证书编号已生成-->
          <p class="box_solid_green"><span class="icon_success">&nbsp;</span>证书编号已生成！已生成证书编号的记录可在证书编号库内查询到！</p>
           <table class="tablebox">
              <tr>
                <th width="120">编号范围</th>
                <td>${msgVO.codeRange}</td>
              </tr>
              <tr>
                <th>应生成证书数</th>
                <td>${msgVO.allCount}</td>
              </tr>
              <tr>
                <th>成功</th>
                <td><strong class="colorgreen">${msgVO.sucCount}</strong></td>
              </tr>
              <tr>
                <th>失败</th>
                <td><strong class="colorred">${msgVO.failCount}</strong></td>
              </tr>
              <tr>
                <th>失败详细</th>
                <td>
              	<c:forEach items="${msgVO.idCards}" var="card">
              	<c:if test="${card!='[]'}">${card}（已生成过证书编号，不再重复生成。）</c:if>
              	</c:forEach>
            
                </td>
              </tr>
            </table>
            <p class="button_box">
            <button type="button" style="width:120px;" onclick="location.href='${ctx}/province/certcode.action';">返回证书编号库</button>
          </p>
        </div>
        <!--右边结束--> 
        
      </div>
      <!-- content  end--> 
      
    </div>
    <!-- wrapper  end-->
</body>
</html>