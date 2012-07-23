<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<h2>成绩管理</h2>
<p class="h2info">考次管理相关信息</p>
<p class="ta_r">
	<a href="examtimes!scorelist.action">返回成绩管理-考次列表&gt;&gt;</a>
</p>
<div class="pagehead01"></div>
<div class="top_info_column">
	<dl class="info2_box">
	    <dt>考试项目名称</dt>
	    <dd title="${examTimes.examItem.name}"><common:cut len="25" string="${examTimes.examItem.name}"/></dd>    
    </dl>
	<dl class="info2_box">
    	<dt>考试项目编号</dt>
    	<dd>${examTimes.examItem.code}</dd>    
    </dl>
	<p class="clearb"></p>
   	<dl class="info4_box">
   		<dt>考次名称</dt>
   		<dd>${examTimes.name}</dd>    
   	</dl>
	<dl class="info4_box">
   		<dt>考次时间</dt>
   		<dd>${examTimes.year}.${examTimes.month}</dd>    
   	</dl>    
	<dl class="info4_box">
   		<dt>考次编号</dt><dd>${examTimes.code}</dd>    
   	</dl>
	<dl class="info4_box">
   		<dt>考次状态</dt><dd>${examTimes.statusName}</dd>    
   	</dl>       
</div>
