<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%><html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="certcodeinput" name="activemenu" />
	<title>生成证书编号</title>
	<link href="${ctx}/css/master.css" type="text/css" rel="stylesheet"/> 
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
	<script src="${ctx}/js/jcommon.js" type="text/javascript"></script>
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
          <form action="${ctx}/province/certcode!save.action" method="post" id="form1" name="form1">
          <input type="hidden" name="certProId" value="${requestScope.certProId}" /> 
          <input type="hidden" name="certTempId" value="${requestScope.certTempId}" /> 
          <input type="hidden" name="itemId" value="${requestScope.itemId}" /> 
          <input type="hidden" name="timesId" value="${requestScope.timesId}" /> 
          <input type="hidden" name="subjectId" value="${requestScope.subjectId}" /> 
          <input type="hidden" name="scorelimit" value="${requestScope.scorelimit}" />
           <input type="hidden" name="qualiScoreLimit" value="${requestScope.qualiScoreLimit}" />
          <input type="hidden" name="opertScore" value="${requestScope.opertScore}" /> 
          <input type="hidden" name="score" value="${requestScope.score}" /> 
          <input type="hidden" name="agelimit" value="${requestScope.agelimit}" /> 
          <input type="hidden" name="opertage" value="${requestScope.opertage}" /> 
          <input type="hidden" name="startAge" value="${requestScope.startAge}" /> 
          <input type="hidden" name="endAge" value="${requestScope.endAge}" /> 
          <input type="hidden" name="codeRule" value="${requestScope.codeRule}" /> 
          <input type="hidden" name="newCode" value="${requestScope.newCode}" />
          <input type="hidden" name="signet" value="${requestScope.signet}" />       
          <!--确定生成证书编号--> 
          <div class="certi_manage" id="certi_manage">
            <p class="mb10"><span class="examination_info">目标证书</span>（选择所需生成证书编号的证书项目）</p>
            <table class="tablebox">
              <tr>
                <th width="120">证书项目名称</th>
                <td>${requestScope.certProName}&nbsp;(${requestScope.certProCode})</td>
              </tr>
            </table>
          </div>
            <div class="certi_manage" id="certi_manage">
            <p class="mb10"><span class="examination_info">证书模板</span>（选择所需生成证书用于打印的证书模板）</p>
            <table class="tablebox">
              <tr>
                <th width="120">证书模板名称</th>
                <td>${requestScope.certTempName}&nbsp;</td>
              </tr>
            </table>
          </div>
          <div class="certi_manage">
            <p class="mb10"><span class="examination_info">成绩库来源</span></p>
            <table class="tablebox">
              <tr>
                <th width="120">考试项目名称</th>
                <td>${requestScope.itemName}&nbsp;(${requestScope.itemCode})</td>
              </tr>
              <tr>
                <th>考次名称</th>
                <td>${requestScope.timesName}&nbsp;(${requestScope.timesCode})</td>
              </tr>
              <tr>
                <th>科目</th>
                <td>${requestScope.subjectName}</td>
              </tr>
            </table>
          </div>
          <div class="certi_manage">
            <p class="mb10"><span class="examination_info">获证条件</span></p>
            <table class="tablebox">
              <tr>
                <th width="120">成绩/合格情况</th>
                <td><s:if test="#request.scorelimit">
                		<s:if test="#request.qualiScoreLimit==1">
                			<s:if test="#request.opertScore==1">大于${requestScope.score}分</s:if>
	                		<s:if test="#request.opertScore==2">大于或等于${requestScope.score}分</s:if>
                		</s:if>
                		<s:else>取成绩合格的记录</s:else>
                	</s:if>
                </td>
              </tr>
              <tr>
                <th width="120">报考年龄</th>
                <td><s:if test="#request.agelimit">
                		<s:if test="#request.opertage==1">大于${requestScope.startAge}岁</s:if>
                		<s:if test="#request.opertage==2">大于或等于${requestScope.startAge}岁</s:if>
                		<s:if test="#request.opertage==3">介于${requestScope.startAge}-${requestScope.endAge}岁</s:if>
                		<s:if test="#request.opertage==4">小于${requestScope.startAge}岁</s:if>
                		<s:if test="#request.opertage==5">小于或等于${requestScope.startAge}岁</s:if>
                	</s:if>
                </td>
              </tr>
            </table>
          </div>
          <div class="certi_manage">
            <p class="mb10"><span class="examination_info">印章号</span></p>
            <table class="tablebox">
              <tr>
                <th width="120">是否生成印章号</th>
                <td> ${requestScope.signet?'是':'否' }
                </td>
              </tr>
            </table>
          </div>
<!--          <div class="certi_manage">-->
<!--            <p class="mb10"><span class="examination_info">证书编号规则</span></p>-->
<!--            <table class="tablebox">-->
<!--              <tr>-->
<!--                <th width="120">规则</th>-->
<!--                <td id="esrule"><s:if test="#request.codeRule">继续之前的编号</s:if><s:else>开始新的编号</s:else></td>-->
<!--              </tr>-->
<!--            </table>-->
<!--          </div>-->
          <div class="certi_manage">
            <p class="mb10"><span class="examination_info">结果预览</span></p>
            <table class="tablebox">
              <tr>
                <th width="120">成绩记录总数</th>
                <td>${requestScope.allCount}</td>
              </tr>
              <tr>
                <th>可获证人数</th>
                <td>${requestScope.canCount}</td>
              </tr>
            </table>
          </div>
      
          <p class="button_box">
            <input type="submit" value="确定生成证书编号"/>
          </p> 
          </form>
          <!--证书编号已生成-->
           
        </div>
        <!--右边结束--> 
        
      </div>
      <!-- content  end--> 
      
    </div>
    <!-- wrapper  end-->
</body>
</html>