<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<% 
      String status = request.getParameter("status");
	  Integer sid = new Integer(0);
	  if(status != null && !"".equals(status.trim())){
		sid = java.lang.Integer.parseInt(status);
	    request.setAttribute("status",sid) ;
	  }
%>
	<script type="text/javascript">
	function onLink(itemurl){
		if(itemurl!=null && itemurl!=''){
			window.location.href = itemurl;
		}
	}
	</script>


	    		<div class="top_serach_box_registration">
		        	<ul>
			            <li><label>考试项目名称</label><input id="itemName" name="itemName" value="${param['itemName']}" type="text" size="20" /></li>
			            <li><label>考试项目编号</label><input id="itemCode" name="itemCode" value="${param['itemCode']}"  type="text" size="20" /></li>
			            <li><label>考次编号</label><input id="code" name="code" value="${param['code']}" type="text" size="20" /></li>
		        	</ul>
			        <ul>
			            <li><label>考次名称</label><input id="name" name="name" value="${param['name']}"  type="text" size="20" /></li>
			            <li>
			                <label>考次状态</label>
			                <s:select list="#{'2':'已发布','3':'已排考','4':'待考','5':'考试中','6':'已考'}"  id="status" name="status"  value="#request.status" cssStyle="width:85px;" headerKey="" headerValue="--所有--"/>
			            </li>
			            <li><button type="submit">搜索</button></li>
			       </ul>
	
	    		</div>
    			
	    			<table class="tablebox"  >
	    				<tr>
    						<th width="10%">考试项目编号</th>
    						<th width="25%">考试名称</th>
    						<th width="10%">考次编号</th>
    						<th width="20%">考次名称</th>
    						<security:authorize ifNotGranted="省考务管理员,省考务业务员">
    						<th width="10%">开放科目 </th>
    						<th width="10%">时间单元 </th>
    						</security:authorize>
    						<th width="10%">状态 </th>
    						<th width="25%">操作</th> 
    					</tr>
	    				<s:iterator value="page.result" status="st">
						    <tr>
							    <td>${examItem.code}</td>
							    <td title="${examItem.name}"><common:cut string="${examItem.name}" len="20"/></td>
							    <td>${code}</td>
							    <td >${name}</td>
							    <security:authorize ifNotGranted="省考务管理员,省考务业务员">
							    <td>${subjectSize}</td>
							    <td>${fieldListSize}</td>
							    </security:authorize>
							    <td>${statusName}</td>
							    <td>
								    <a href="examresource!info.action?id=${id}">
								    <security:authorize ifNotGranted="省考务管理员,省考务业务员">
								    管理
								    </security:authorize>
								    <security:authorize ifAnyGranted="省考务管理员,省考务业务员">
								    考务管理
								    </security:authorize>
								    </a>
							    </td>
						    </tr>
					    </s:iterator>
					    <s:if test="page.result.size ==0">
						<tr> 
							<td height="30" align="center" colspan="8"><font color="gray">没有符合条件的记录</font></td>
						</tr>  
					</s:if>      
	    			</table>
	    			<!-- 翻页 start  -->
	    			<%@ include file="/common/page.jsp"%>
					<!-- 翻页 end  -->
