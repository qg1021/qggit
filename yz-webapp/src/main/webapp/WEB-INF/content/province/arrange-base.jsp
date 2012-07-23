<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<h2>排考管理</h2>
<p class="ta_r">
	<a href="arrange.action">返回排考管理-考次列表&gt;&gt;</a>
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
   		<dd title="${examTimes.name}"><common:cut len="9" string="${examTimes.name}"/></dd>  
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
<p class="mt10 clearb"></p>
<ul class="switch_tab mb20">
     <li id='tab1' onclick="window.location.href='examrecord.action?timesid=${timesid}'" class="switch_tab_current">报考记录管理</li>
     <li id='tab2' onclick="window.location.href='seat.action?timesid=${timesid}'" >考场资源管理</li>
     <li id='tab3' onclick="window.location.href='examstrategy!input.action?timesid=${timesid}'">排考策略设置</li>
     <s:if test="examTimes.flowStatus04">
     	<li id='tab4' onclick="window.location.href='arrange!area.action?timesid=${timesid}'">排考管理</li>
     </s:if>
     <s:else>
     	<li id='tab4'>排考管理</li>
     </s:else>
     <s:if test="examTimes.flowStatus08">
     	<li id='tab5' onclick="window.location.href='arrange!initGenerate.action?timesid=${timesid}'">生成准考证</li>
     </s:if>
     <s:else>
     	<li id='tab5' >生成准考证</li>
     </s:else>
     <s:if test="examTimes.flowStatus09">
     	<li id='tab6' onclick="window.location.href='arrange!initExport.action?timesid=${timesid}'">排考方案导出</li>
     </s:if>
     <s:else>
     	<li id='tab6' >排考方案导出</li>
     </s:else>
       <li id='tab7' >加考管理</li>    
</ul>