<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>

<!-- top 统计板块 start-->
<div class="top_info_column"> <a href="examresource.action" class="rr">返回考务管理-考次列表&gt;&gt;</a>
<p class="examination_info">考务管理</p>

<p class="dotline"></p>
	<dl class="info2_box">
    <dt>考试项目名称</dt><dd title="${examTimes.name}"><common:cut len="15" string="${examTimes.examItem.name}"/> </dd>    
    </dl>
	<dl class="info2_box">
    <dt>考试项目编号</dt><dd>${examTimes.examItem.code}</dd>    
    </dl>
	<p class="clearb"></p>

    <dl class="info4_box">
    	<dt>考次名称</dt>
    	<dd title="${examTimes.name}"><common:cut len="9" string="${examTimes.name}"/></dd>   
    </dl>
	<dl class="info4_box">
    	<dt>考次时间</dt>
    	<dd>${examTimes.year}.${examTimes.month}</dd>    
    </dl>    
	<dl class="info4_box">
    	<dt>考次编号</dt>
    	<dd>${examTimes.code}</dd>    
    </dl>
	<dl class="info4_box">
    	<dt>考次状态</dt>
    	<dd>${examTimes.statusName}</dd>    
    </dl>       
</div><!-- top 统计板块 end-->