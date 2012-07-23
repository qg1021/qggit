<%@ page contentType="text/html;charset=UTF-8" %>
<%@page import="com.drcl.yz.contant.Global"%>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="createitem" name="activemenu" />
	<title>考试项目</title>
	<link href="${ctx}/css/master.css" type="text/css" rel="stylesheet"/> 
	<link href="${ctx}/css/layer.css" rel="stylesheet" type="text/css"/>
	<link href="${ctx}/js/validate/jquery.validate.css" type="text/css" rel="stylesheet"/>
	<link href="${ctx}/css/fancybox/jquery.fancybox-1.3.4.css" rel="stylesheet" type="text/css" media="screen" />
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
	<script type="text/javascript" src="${ctx}/js/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
	<script type="text/javascript" src="${ctx}/js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
	<script src="${ctx}/js/validate/jquery.validate.js" type="text/javascript"></script>
	<script src="${ctx}/js/validate/messages_cn.js" type="text/javascript"></script>
	<script src="${ctx}/js/ajaxfileupload.js" type="text/javascript"></script>
	<script src="${ctx}/js/layer.js" type="text/javascript"></script>
	<script src="${ctx}/js/jcommon.js" type="text/javascript"></script>
	<script src="${ctx}/js/jquery.table.js" type="text/javascript"></script>
	<script src="${ctx}/js/json2.js" type="text/javascript"></script>
	
	<script type="text/javascript">
	column = 6;
	hiddenIndex = 6;
	var z = 0;
	var copyArray = new Array(); 
    //resume_id,startdate,enddate,corpname,workcity,position,last_update_date
	List[0]="<input " ;
	List[1]=" id='subjectcode' name='subjectcode' size='8'  type='text'  value='系统生成' readonly='readonly'>";
	List[2]="<input name='subjectname' id='subjectname' style='width=100%' type='text'  value=''>";
	List[3]="<input name='examtime' id='examtime' size='6'  type='text' value='' onkeypress='gNumeric(true,false,event);'> ";
	List[4]="<select id='itemlist' name='itemlist'  style='width=200px;' onchange='setProperty(this);'><option value=''>--选择--</option></select>";
	List[5]="<input name='examtimes' id='examtimes' size='6' readonly='readonly'  value='0'>";
	List[6]="<input name='subjectid' id='subjectid' value='' type='hidden'>";
	List[7]="<input name='subjectid' id='subjectid' value='' type='hidden'>";
	$(document).ready(function() {
		//聚焦第一个输入框
		changeSelect();
		$("#name").focus();
		$("#inputForm").validate({
			rules: {
				name:"required",
				msingleleastnum:{required:true,digits: true},
				passseatnum:{required:true,digits: true},
				addsparenum:{required:true,digits: true},
				sparenum:{required:true,digits: true},
				starthandtime:{required:true,digits: true},
				endhandtime:{required:true,digits: true}
			},
			messages: {
				name: "必填",
				msingleleastnum: {
					required: "必填",
					digits:"输入数字"
				},
				passseatnum: {
					required: "必填",
					digits:"输入数字"
				},
				addsparenum: {
					required: "必填",
					digits:"输入数字"
				},
				sparenum:{
					required: "必填",
					digits:"输入数字"
				},
				starthandtime:{
					required: "必填",
					digits:"输入数字"
				},
				endhandtime:{
					required: "必填",
					digits:"输入数字"
				}
			},
	        errorPlacement: function(error, element) {   
		        if (document.getElementById("error_"+element.attr("name")))  {
		            error.appendTo("#error_"+element.attr("name"));  
		        }
		        else       
		            error.insertAfter(element);   
		        }
		});
		$("a.subjectclass").fancybox({
 			'titlePosition'		: 'inside',
			'transitionIn'		: 'elastic',
			'transitionOut'		: 'elastic',
			'type':'iframe',
			'width': 605,
			'height': 300,
			'scrolling': 'no', 
			'showCloseButton':true,
			'hideOnOverlayClick':false,
			'padding': 0, //边框距离
			'margin':0, //边框距离 
			'onClosed': function() { //关闭时是否刷新弹出框d
            	//location.reload(true);
       		},
       		'onComplete':function() { //加载完成后,让第一个表单元素获得焦点
       			
       		}
		}
		); 
	});
	function showSubjectFanBox(subjectid){
		
		$("a.subjectclass").attr("href","subjectdirection.action?subjectid="+subjectid);	
	}


	function onSearch(){
		var warecode = $("#warecode").val();
		if(warecode) {
			$.post("examitem!getSubsByProSerialNo.excsec",{"proSerialNo":warecode},function(data) {
				if(data!=null){
					var subjects = eval(data.subjects);
					if(subjects==null || subjects=='' || subjects.length == 0) return;
					var itemList ="<select id='itemlist' name='itemlist'  style='width=200px' onchange='setProperty(this);'><option value=''>--选择--</option>";
					for(var i = 0 ;i < subjects.length ; i++) {
						itemList+="<option value='"+subjects[i].value+"'>"+subjects[i].label+"</option>";
					}
					itemList+="</select>";
					List[4]=itemList;
					var items = document.getElementsByName('itemlist');
					
					for(var t=0;t<items.length;t++){
						$(items[t]).find("option[value!='']").remove();
						for(var i = 0 ;i < subjects.length ; i++) {
							$(items[t]).append("<option value='"+subjects[i].value+"'>"+subjects[i].label+"</option>");
						}
					}
				}
				
			});
		}
	}
	function changeSelect(){
		var warecode = $("#warecode").val();
		if(warecode) {
			$.post("examitem!getSubsByProSerialNo.excsec",{"proSerialNo":warecode},function(data) {
				if(data!=null){
					var subjects = eval(data.subjects);
					if(subjects==null || subjects=='' || subjects.length == 0) return;
					var itemList ="<select id='itemlist' name='itemlist'  style='width=200px' onchange='setProperty(this);'><option value=''>--选择--</option>";
					for(var i = 0 ;i < subjects.length ; i++) {
						itemList+="<option value='"+subjects[i].value+"'>"+subjects[i].label+"</option>";
					}
					itemList+="</select>";
					List[4]=itemList;
				}
			});
		}
	}
	function setProperty(qq){
		var items = document.getElementsByName('itemlist');
		var i=0;
		for(var t=0;t<items.length;t++){
			if(items[t].value == qq.value) i++;
		}
		if(i>1) {
			alert("此科目信息已关联");
			qq.value="";
			return;
		}
		$(qq).parent().parent().find('td').eq(1).find('input').val(qq.value);
		//$(qq).parent().parent().find('td').eq(2).find('input').val($(qq).find('option:selected').text())
	}
	//激活明细修改属性	
	function subEdit(){
		var bl = false;
		//编辑table td
		//找到所有的TD节点   
		//var tds =$("#tblDataList td:not('.tdchb')");
		$("#tblDataList td").each(function (i){
			if($(this).find('input').size()==0){
				$(this).click(tdClick);
			}
		});
		//注册事件   
		//tds.click(tdClick); 
	}
	// 添加明细
	function setRowNew() {
		jQgRowNew("tblDataList",2);
	}
	function TableValidation(){
		var subjectname = document.getElementsByName('subjectname');
		var examtime = document.getElementsByName('examtime');
		var itemlist = document.getElementsByName('itemlist');
		var listflag = true;
		for(var i=0;i<subjectname.length;i++){
				if(subjectname[i].value==null ||subjectname[i].value=='' ){
					listflag = false;
					break;
				}
		}
		for(var j=0;j<examtime.length;j++){
			if(examtime[j].value==null ||examtime[j].value=='' ){
				listflag = false;
				break;
			}
		}
		for(var t=0;t<itemlist.length;t++){
			if(itemlist[t].value==null ||itemlist[t].value=='' ){
				listflag = false;
				break;
			}
		}
		if(!listflag){
			alert("科目信息不完整！");
			 return false;
		}
			
		return true;
	}
	function onSave(tblDataList){
			if(!$("#inputForm").valid()){ return false;}
			
			if(!TableValidation()){
				return false;
			}
			//列赋值
			$('#'+tblDataList+' tr:gt(1) td').each(function (i){
				if(i>0){
					if($(this).find('input').size()>0){
						$(this).html($(this).find('input').eq(0).val());
					}else if($(this).find('select').size()>0){
						$(this).html($(this).find('select').eq(0).find('option:selected').html());
					}
					//$(this).click(tdClick);
				}
			});
			var obj = new Array();
		 	
		 	var j = 0;
		 	$('#tblDataList tr:gt(1)').each(function(i){
		 	//取值
		 		subjectcode = $(this).find('td').eq(1).html();
		 		subjectname = $(this).find('td').eq(2).html();
		 		examtime = $(this).find('td').eq(3).html();
		 		subjectid = $(this).find('td').eq(6).html();
		 		row_status = $(this).find('td').eq(8).html();
		 		if(row_status!=""){
		 			obj[j] = new getTableDetail(subjectcode,subjectname,examtime,subjectid,row_status);
					j++;
				}
			}) 
			if(document.getElementById("id").value!=''){
				if(obj.length==0){
					alert("请关联科目信息");
					return false;
				}
			}
			var head = new tableHead(obj);
			//alert(JSON.stringify(head));
			document.getElementById("tabledetail").value = JSON.stringify(head);
			$("#inputForm").submit();
		
	}
	function getTableDetail(subjectcode,subjectname,examtime,subjectid,row_status){
		this.subjectcode = subjectcode;
		this.subjectname = subjectname;
		this.examtime = examtime;
		this.subjectid = subjectid;
		this.status = row_status;
	}
	function tableHead(detail){
		this.detail = detail;
	}
	document.onkeydown = function(e){    
		e = e || window.event;   
		if(e.keyCode === 13){        
			onSave('tblDataList')   
		}
	};
	</script>
</head>
<body>
<!-- JS遮罩层 --> 
<div id="fullbg"></div> 
<!-- end JS遮罩层 --> 
<!-- 对话框 --> 
<div id="dialog"> 
	<div id="dialog_content"></div> 
</div>
<div id="wrapper">
	<%@ include file="/common/header.jsp"%>
	<!--the end of head-->
	<div id="content">  
		<!-- 左侧内容 column  start -->
		<%@ include file="/common/left.jsp"%>
		<!-- 左侧内容 column  end -->
		<!-- 右侧内容 column  start -->  
		<div class="right_content">
			<h2><s:if test="id!=null && id!=''">编辑</s:if><s:else>新增</s:else>考试项目</h2>
			<div class="pagehead01"></div>
   			<p class="examination_info">考试项目基本信息</p>
   			<form id="inputForm" name="inputForm" action="examitem!save.action" method="post">
				<input type="hidden" id="id" name="id" value="${id}"/>
				<input type="hidden" id="tabledetail" name="tabledetail" value=""/>
				<input type="hidden" id="indexID" name="indexID" value="${qualityIndex.id}"/>
				<input type="hidden" id="baseurl" name="baseurl" value="<common:prop name="oems.webapp.uploadUrl" propfilename="sysconfig.properties" defaultvalue="${pageContext.request.contextPath}"/><%=Global.STYLE_PATH%>"/>
   			<div class="top_serach_box" >
    			<ul class="form">
    				<li><label>考试项目名称</label><input type="text" id="name" name="name" value="${name}" maxlength="50" style="width:450px;"/></li>
    				<li><label>考试项目编号</label><input type="text" id="code" name="code" value="${code}" readonly="readonly" style="width:450px;"/><span class="color999">(系统生成)</span></li>
    				<li><label>主办单位</label><input type="text" id="hostunit1" name="hostunit1" value="${hostunit1}" maxlength="100"  style="width:220px;"/> 
    					<input type="text" id="hostunit2" name="hostunit2" value="${hostunit2}" maxlength="100"  style="width:220px;"/>
    				</li>
    				<li class="ml_100">
    					<input type="text" id="hostunit3" name="hostunit3" value="${hostunit3}" maxlength="100"  style="width:220px;"/>
    					<input type="text" id="hostunit4" name="hostunit4" value="${hostunit4}" maxlength="100"  style="width:220px;"/>
    				</li>
    				<li class="ml_100">
    					<input type="text" id="hostunit5" name="hostunit5" value="${hostunit5}" maxlength="100"  style="width:220px;"/>
    					<input type="text" id="hostunit6" name="hostunit6" value="${hostunit6}" maxlength="100"  style="width:220px;"/>
    				</li>
    				<li><label>项目风格样式</label>
    					<input type="file" id="file" name="file" style="width:300px;" onchange="uploadStyle('../upload.excsec');"/>
    					<span id="stylespan">
    						<s:if test="style!=mull && style!=''">
    							<a href="<common:prop name="oems.webapp.uploadUrl" propfilename="sysconfig.properties" defaultvalue="${pageContext.request.contextPath}"/><%=Global.STYLE_PATH%>${style}" class="ml10">下载现有样式包</a>
    						</s:if>
    					</span>
    					<input type="hidden" id="style" name="style" value="${style}"/>
    				</li>
    				<li class="ml_100 color999">根据考试项目的不同设置不同的考试机风格样式包（zip文件）</li>
    			</ul>
   			</div>
    		<div class="mb10">
    			<p class="rr">已有科目:<span class="strong">${subjectSize}</span></p>
    			<p class="examination_info">科目模板管理</p>
    		</div>
    		<table id="tblDataList" width="100%" border="0" cellspacing="0" cellpadding="0" class="tablebox">
    				<tr><td colspan="8" style="text-align:left;"><label>本项目关联的题库</label> &nbsp;
    				<s:select list="projectList" listKey="label" listValue="value" id="warecode" name="warecode"  value="warecode" onchange='onSearch();'  theme="simple" cssStyle="width:300px;" headerKey="" headerValue="--选择--"/>
    				<!--  <button id="btnApply" type="button" onclick="onSearch();">应用</button>--></td></tr>
	    			<tr>
	    				<th width="5%"></th>
	    				<th width="10%">科目代码</th>
	    				<th width="20%">科目名称 </th>
	    				<th width="15%">考试时长(分钟)</th>
	    				<th width="30%">对应题库科目</th>
	    				<th width="10%">已考次数</th>
	    				<th style="display:none"></th>
	    				<th width="10%">操作</th>
	    				<th style="display:none"></th>
	    			</tr>
	    			<s:iterator value="subjectList" status="st">
	    				<tr id="tr_${st.count}">
							<td id="td_${st.count}-0">
								<input id="Grid${st.count}" type="checkbox" value="1"/>
							</td>
							<td id="td_${st.count}-1">
								<input type="text" id="subjectcode" name="subjectcode" readonly="readonly" size='8' value="${code}"/>
							</td>
							<td id="td_${st.count}-2">
								<input type="text" id="subjectname" name="subjectname"  value="${name}"/>
							</td>
							<td id="td_${st.count}-3">
								<input type="text" id="examtime" name="examtime" size='6' value="${examtime}" maxlength="4" onkeypress="gNumeric(true,false,event);"/>
							</td>
							<td id="td_${st.count}-4">
								<s:select list="subjectsList" listKey="value" listValue="label" id="itemlist" name="itemlist"  value="code" onchange='setProperty(this);'  theme="simple" cssStyle="width:46%;" headerKey="" headerValue="--选择--"/>
							</td>
							<td id="td_${st.count}-5">
								${knumber}
							</td>
							<td id="td_${st.count}-6" style="display:none">
								${id}
							</td>
							<td id="td_${st.count}-7">
								<a class="subjectclass" onclick="javaScript:showSubjectFanBox('${id}');" >方向管理</a>
							</td>
							<td id="td_${st.count}-8" style="display: none;">E</td>
						</tr>	
	    			</s:iterator>      
    		</table>
    		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tablebox">
    			<tr><td colspan="8" style="text-align:left;">
    				<button type="button" onclick="setRowNew();">新增科目</button>
    				<button type="button" onclick="jQgRowDelete('tblDataList')">删除科目</button></td>
    			</tr>  
    		</table>
    		<!--<p class="rr">已有科目:</p> -->
    		<p class="examination_info">考试质量模板管理</p>
				<ul class="form">
    			<li><label>排考备用机要求:</label>单考场单场次考生人数小等于
    				<input id="msingleleastnum" name="msingleleastnum" maxlength="3" value="${qualityIndex.msingleleastnum}" type="text" style="width:50px;"/> <span id="error_msingleleastnum"></span>人至少备用机数<input id="passseatnum" maxlength="3"  name="passseatnum" value="${qualityIndex.passseatnum}" type="text" style="width:50px;"/> <span id="error_passseatnum"></span>台</li>
    			<li class="box_dotline_bottom"><label></label>
    				备用机与考试机的比率要满足大于或者等1/<input id="addsparenum" maxlength="3"  name="addsparenum" value="${qualityIndex.addsparenum}" style="width:50px;"/> <span id="error_addsparenum"></span>
    			</li>    
    			<li><label>单科目组卷要求:</label>同时间单元内不同考场 
    				<s:select list="#{'true':'使用同一试卷','false':'区分不同试卷'}"  id="issameunit" name="issameunit"  value="qualityIndex.issameunit" cssStyle="width:120px;"/>
    			</li>
    			<li><label>&nbsp;</label>同考场内 
    				<s:select list="#{'true':'使用同一试卷','false':'区分不同试卷'}"  id="issameroom" name="issameroom"  value="qualityIndex.issameroom" cssStyle="width:120px;"/>
    			</li> 
    			<li class="box_dotline_bottom"><label></label>备用卷卷数 
    				<input id="sparenum" name="sparenum" value="${qualityIndex.sparenum}" maxlength="3"  style="width:50px;"/><span id="error_sparenum"></span>
    			</li>   
    			<li><label>考试纪律要求：</label>考试开始后 
    				<input id="starthandtime" name="starthandtime" maxlength="3"  value="${qualityIndex.starthandtime}" style="width:50px;"/> 分钟内不得交卷（同最晚入场考试时间）<span id="error_starthandtime"></span>
    			</li>
    			<li class="box_dotline_bottom"><label></label>考试结束前  
    				<input id="endhandtime" name="endhandtime" maxlength="3"  value="${qualityIndex.endhandtime}" style="width:50px;"/> 分钟内不得交卷<span id="error_endhandtime"></span>
    			</li>    
    			<li><label>考试机成绩判分:</label> 
    				<s:if test="qualityIndex!=null && qualityIndex.iswayA">
    					<input type="checkbox" id="iswayA" name="iswayA" value="true"  checked='checked'/>
    				</s:if>
    				<s:else>
    					<input type="checkbox" id="iswayA" name="iswayA" value="true"  />
    				</s:else>
    				显示考试成绩总得分
				</li>
    			<li><label>&nbsp;</label>
    				<s:if test="qualityIndex!=null && qualityIndex.iswayB">
    					<input type="checkbox" id="iswayB" name="iswayB" value="true"  checked='checked'/>
    				</s:if>
    				<s:else>
    					<input type="checkbox" id="iswayB" name="iswayB" value="true" />
    				</s:else>
    				显示卷面各大题的得分
				</li>
    			<li><label>&nbsp;</label>
    				<s:if test="qualityIndex!=null && qualityIndex.iswayC">
    					<input type="checkbox" id="iswayC" name="iswayC" value="true"  checked='checked'/>
    				</s:if>
    				<s:else>
    					<input type="checkbox" id="iswayC" name="iswayC" value="true"  />
    				</s:else>
    				显示通过与否情况  <span class="colorred">若选择该项，则成绩汇总后“调分”功能失效</span>
				</li>
				<li><label>&nbsp;</label>
    				<s:if test="qualityIndex!=null && qualityIndex.iswayD">
    					<input type="checkbox" id="iswayD" name="iswayD" value="true"  checked='checked'/>
    				</s:if>
    				<s:else>
    					<input type="checkbox" id="iswayD" name="iswayD" value="true"  />
    				</s:else>
    				显示判卷情况
				</li>
    		</ul>
    
		   <!--<div class="examination_skin">
		   <ul class="form">
		   <li><label>LOGO图</label><input type="text" style="width:400px;"/> <button>添加</button></li>
		   <li class="ml_100"><img src="../demo/campus.jpg" alt=""/></li>
		   <li><label>CSS样式</label><input type="text" style="width:400px;"/> <button>添加</button></li>
		   </ul>
		   </div> -->
   		  <p class="button_box">
			<button class="btn_confirm" type="button" onclick="onSave('tblDataList');">确定</button> 
			<button class="btn_cancell" type="button" onclick="window.location.href='examitem.action'">取消</button>
		 </p>
		 </form>
	</div>
	<!-- 右侧内容 column  end-->  
	</div> <!-- content  end-->  
	</div><!-- wrapper  end-->  
</body>
</html>