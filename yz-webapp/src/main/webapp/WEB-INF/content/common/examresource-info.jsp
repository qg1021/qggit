<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>


		<!-- 右侧内容 column  start -->  
		
		<h2>应考科目查看</h2>
		<div class="pagehead01"></div>
		<p class="mb10" ><b class="right3pxborder">当前考次的科目查看</b>  <span class="rr">已开放<span class="colorblue fontbold">${examTimes.subjectSize}</span>个考试科目</span></p>
  			<table class="tablebox"  >
  				<tr>
 						<th width="40%">科目序号</th>
 						<th width="20%">科目名称 </th>
 						<th width="20%">科目考试时长</th>
 					</tr>
  				<s:iterator value="examTimes.subjectList" status="st">
			    <tr>
				    <td>${st.index + 1}</td>
				    <td>${name}</td>
				    <td>${examtime}分钟</td>
			    </tr>
		    </s:iterator>    
  		</table>
	
