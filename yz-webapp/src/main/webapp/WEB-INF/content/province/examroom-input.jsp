<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="outsideroom" name="activemenu" />
	<title>考场</title>
	<link href="${ctx}/css/master.css" type="text/css" rel="stylesheet"/> 
	<link href="${ctx}/js/validate/jquery.validate.css" type="text/css" rel="stylesheet"/>
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
	<script src="${ctx}/js/validate/jquery.validate.js" type="text/javascript"></script>
	<script src="${ctx}/js/validate/messages_cn.js" type="text/javascript"></script>
	<script src="${ctx}/js/jcommon.js" type="text/javascript"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		//聚焦第一个输入框
		setRealSeatSize();
		$("#name").focus();
		jQuery.validator.addMethod("positiveinteger", function(value, element) {
			var re = /^[1-9]\d*$/;
			if(re.test(value)){   
		        return true;   
		    }else{    
		        return false;   
		    }      
		}, "输入正整数");
		$("#inputForm").validate({
			rules: {
				areaid:"required",
				siteid:"required",
				usbkey:"required",
				name:"required",
				lineNum:{required:true,positiveinteger: true},
				columnNum:{required:true,positiveinteger: true}

			},
			messages: {
				areaid: "选择所属考区",
				siteid: "选择所属考点",
				usbkey: "输入userkey",
				name: "输入考场名称",
				lineNum: {
					required: "必填"
				},
				columnNum: {
					required: "必填"
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
	});

	</script>
</head>
<body>
<div id="wrapper">
	<%@ include file="/common/header.jsp"%>
	<!--the end of head-->
	<div id="content">  
		<!-- 左侧内容 column  start -->
		<%@ include file="/common/left.jsp"%>
		<!-- 左侧内容 column  end -->
		<!-- 右侧内容 column  start -->  
		<div class="right_content">
			<h2>考场<s:if test="id!=null && id!=''">编辑</s:if><s:else>新增</s:else></h2>
			<div class="pagehead01"></div>
				<div class="top_serach_box">
					<form id="inputForm" name="inputForm" action="examroom!save.action" method="post">
						<input type="hidden" id="id" name="id" value="${id}"/>
						<input type="hidden" id="lnum" name="lnum" value="${lineNum}"/>
						<input type="hidden" id="cnum" name="cnum" value="${columnNum}"/>
						<input type="hidden" id="returnType" name="returnType" value="${returnType}"/>
						<input type="hidden" id="iscreateSeat" name="iscreateSeat" value="<s:if test="id!=null">1</s:if><s:else>0</s:else>"/>
						<ul class="form district_edit_form" style="<s:if test="returnType=='seat'">display:none</s:if>">
							<li>
								<label>所属考区</label><s:select onchange="getSiteByAreaID();" list="examAreaList" listKey="value" listValue="label" id="areaid" name="areaid"  value="examSite.examArea.id"  theme="simple" cssStyle="width:310px;" headerKey="" headerValue="--选择--"/>
							</li>
							<li>
								<label>所属考点</label><s:select list="examSiteList" listKey="value" listValue="label" id="siteid" name="siteid"  value="examSite.id"  theme="simple" cssStyle="width:310px;" headerKey="" headerValue="--选择--"/>
							</li>
							<li>
								<label>考场名称</label>
								<input id="name" name="name" value="${name}" type="text" maxlength="100" style="width:300px;" />
							</li>	
					  		<li>
					  			<label>usbkey</label>
					  			<input id="ukey" name="usbkey" value="${usbkey}" type="text" maxlength="100"   style="width:300px;" />
					  		</li>
					  		<li>
					  			<label>考场编号</label>
					  			<input type="text" id="code" name="code" value="${code}"  style="width:300px;"  readonly="readonly"/>(系统生成)
					  		</li>
					  	</ul> 
					  	<p class="mb10"></p>
					  	<s:if test="returnType=='seat'">
					  		<dl class="slowtest_info_02">
							    <dt>考场名称</dt><dd>${name}</dd>    
							    </dl>
								<dl class="slowtest_info_02">
							    <dt>考场编号</dt><dd>${code}</dd>    
							    </dl>  
							    <dl class="slowtest_info_02">
							    <dt>所属考点</dt><dd>${examSite.name}(${examSite.code}) </dd>    
							    </dl>
								<dl class="slowtest_info_02">
							    <dt>所属考区</dt><dd>${examSite.examArea.name}(${examSite.examArea.code})）</dd>    
							    </dl>  
							 <p class="clearb"></p>
					  	</s:if>
        				<!-- seat_detail_box star -->
       					 <div class="seat_detail_box" style="<s:if test="returnType=='info'">display:none</s:if>">
        					<!-- seat_detail_top star -->
        					<ul class="seat_detail_top">
                				<li>座位行数：<input type="text" id="lineNum" onkeypress="checkPositiveInteger(this);" name="lineNum" value="${lineNum}" value="3" size="10" maxlength="3"  /></li>
                				<li>座位列数：<input  type="text" id="columnNum" onkeypress="checkPositiveInteger(this);" name="columnNum" value="${columnNum}"  value="5" size="10" maxlength="3"/></li>
                				<li><button type="button" onclick="onCreateSeat();">生成座位列表</button></li>              
            				</ul>
            				<!-- seat_detail_top end -->
            				<p class="seat_detail_title">监考机位置</p>
            				<!-- seat_detail_top star -->
            				<div id="seatdiv" class="seat_overfolw">
            					<ul id="seatlist" class="seat_overfolw_sub" style="width:${columnNum*80}px">
	            					<s:iterator value="basicSeatsList" status="st">
	           							<s:if test="status==2">
	            							<li class="seat_detail_none seat_border">
							                    	<s:select list="#{'0':'考位机','2':'不可用'}"  id="seatstatus" name="seatstatus" onchange="onSeatSave('%{id}',this.value);"  value="@java.lang.Integer@parseInt(status)" theme="simple" />
						                	</li>
	           							</s:if>
	           							<s:else>
		            						<li class="seat_border">
							                    	<s:select list="#{'0':'考位机','2':'不可用'}"  id="seatstatus" name="seatstatus" onchange="onSeatSave('%{id}',this.value);"  value="@java.lang.Integer@parseInt(status)" theme="simple" /> 
						                	</li>
					                	</s:else>
	            					</s:iterator>
            					</ul>
	            				<!-- seat_detail_top end -->
					        	<ul class="seat_detail_top">
					                <li>可用座位： <b id="realSeatSize">0</b></li>
					            </ul>
        					</div> 
        				</div>
					 	<p class="dotline"></p>  
						<p class="button_box">
							<button class="btn_confirm" type="button" onclick="onSeatSubmit();">确定</button> 
							<button class="btn_cancell" type="button" onclick="window.location.href='examroom.action'">取消</button>
						</p>
					</form>
					</div>
				
			</div>
			<!-- 右侧内容 column  end-->    
		</div> <!-- content  end-->  
	</div><!-- wrapper  end-->  
</body>
</html>