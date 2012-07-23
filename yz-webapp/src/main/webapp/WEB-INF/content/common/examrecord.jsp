<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
	<table class="tablebox"  >
	    <tr>
		    <th width="15%">准考证号</th>
		    <th width="15%">考区</th>
		    <th width="15%">考点</th>
		    <th width="10%">考场</th>
		    <th width="10%">座位号</th>
		    <th width="20%">时间单元</th>
		    <th width="15%">报名科目</th>
	    </tr>
	    <s:iterator value="page.result">
		    <tr>
			    <td>${cardNo}</td>
			    <td title="${examSite.examArea.name}"><common:cut len="6" string="${examSite.examArea.name}"/></td>
			    <td title="${examSite.name}"><common:cut len="6" string="${examSite.name}"/></td>
			    <td>${examRoom.code}</td>
			    <td>${seat}</td>
			    <td><s:date name="field.startdate" format="MM月dd日 HH:mm"/>-<s:date name="field.enddate" format="HH:mm"/></td>
			    <td title="${subject.name}"><common:cut len="4" string="${subject.name}"/></td>
		    </tr>
	    </s:iterator>
	  </table> 
	  <!-- 翻页 start  -->
		<%@ include file="/common/page.jsp"%>
	  <!-- 翻页 end  --> 
		
		
	
