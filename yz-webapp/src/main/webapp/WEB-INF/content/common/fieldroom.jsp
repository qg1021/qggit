<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
	<table class="tablebox"  >
	    <tr>
    		<th width="20%">时间单元</th>
    		<th width="20%">考区</th>
    		<th width="10%">考区编号</th>
    		<th width="20%">考点</th>
    		<th width="10%">考点编号</th>
    		<th width="10%">考场</th>
    		<th width="10%">座位数</th>
    	</tr>
	    <s:iterator value="fieldRoomList">
		    <tr>
			    <td><s:date name="fieldRoom.field.startdate" format="MM月dd日 HH:mm"/>-<s:date name="fieldRoom.field.enddate" format="HH:mm"/></td>
			    <td title="${fieldRoom.examRoom.examSite.examArea.name}"><common:cut len="6" string="${fieldRoom.examRoom.examSite.examArea.name}"/></td>
			    <td >${fieldRoom.examRoom.examSite.examArea.code}</td>
			    <td title="${fieldRoom.examRoom.examSite.name}"><common:cut len="6" string="${fieldRoom.examRoom.examSite.name}"/></td>
			     <td>${fieldRoom.examRoom.examSite.code}</td>
			    <td>${fieldRoom.examRoom.code}</td>
			    <td><a href="fieldroom!input.action?id=${fieldRoom.id}&timesid=${examTimes.id}" target="_blank">${resourceNum}</a></td>
		    </tr>
	    </s:iterator>
	  </table> 
	  <!-- 翻页 start  -->
		<%@ include file="/common/page.jsp"%>
	  <!-- 翻页 end  --> 
		
		
	
