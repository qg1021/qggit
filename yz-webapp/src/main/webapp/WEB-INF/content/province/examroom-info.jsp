<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="room" name="activemenu" />
	<title>考场</title>
	<link href="${ctx}/css/master.css" type="text/css" rel="stylesheet"/> 
	<link href="${ctx}/js/validate/jquery.validate.css" type="text/css" rel="stylesheet"/>
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
	<script src="${ctx}/js/validate/jquery.validate.js" type="text/javascript"></script>
	<script src="${ctx}/js/validate/messages_cn.js" type="text/javascript"></script>
	<script src="${ctx}/js/jcommon.js" type="text/javascript"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		setRealSeatSize();
		$('input,select,textarea,radio,checkbox').attr('disabled',true);
	});

	</script>
</head>
<body>
<div id="wrapper">

	<!--the end of head-->
	<div id="content">  
		<!-- 左侧内容 column  start -->
	
		<!-- 左侧内容 column  end -->
		<!-- 右侧内容 column  start -->  
		<div class="right_content">
				<div class="top_serach_box">
					
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
    						<dt>所属考区</dt><dd>${examSite.examArea.name}(${examSite.examArea.code})</dd>    
    					</dl> 
    					<dl class="slowtest_info_02">
    						<dt>考场编号</dt><dd>${code}</dd>    
    					</dl>  
    					
			    		 
					  	<p class="clearb"></p>
        				<!-- seat_detail_box star -->
       					 <div class="seat_detail_box" style="">
        					<!-- seat_detail_top star -->
        					<ul class="seat_detail_top">
                				<li>座位行数：<input type="text" id="lineNum" name="lineNum" value="${lineNum}" value="3" size="10" maxlength="3"  /></li>
                				<li>座位列数：<input  type="text" id="columnNum" name="columnNum" value="${columnNum}"  value="5" size="10" maxlength="3"/></li>             
            				</ul>
            				<!-- seat_detail_top end -->
            				<p class="seat_detail_title">监考机位置</p>
            				<!-- seat_detail_top star -->
            				<div class="seat_overfolw">
            					<ul class="seat_overfolw_sub" style="width:${columnNum*80}px">
	            					<s:iterator value="seatsList" status="st">
	           							<s:if test="status==2">
	            							<li class="seat_detail_none seat_border">
							                    	<s:select list="#{'0':'考位机','1':'备用机','2':'不可用'}"  id="seatstatus" name="seatstatus"   value="@java.lang.Integer@parseInt(status)" theme="simple" />
						                	</li>
	           							</s:if>
	           							<s:else>
		            						<li class="seat_border">
							                    	<s:select list="#{'0':'考位机','1':'备用机','2':'不可用'}"  id="seatstatus" name="seatstatus"  value="@java.lang.Integer@parseInt(status)" theme="simple" />
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
					 		<button class="btn_cancell" type="button" onclick="parent.onFancyboxCancel();">关闭</button>
					 	</p>
				</div>
				</div>
			</div>
			<!-- 右侧内容 column  end-->    
		</div> <!-- content  end-->   
</body>
</html>