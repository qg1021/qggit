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
		$('input,select,textarea,radio,checkbox').attr('disabled',true);
	});

	</script>
</head>
<body>
<div id="wrapper">
	<%@ include file="/common/header.jsp"%>
	<!--the end of head-->
	<div id="content">  
		<!-- 左侧内容 column  start -->
		<%@ include file="../common/examtop.jsp"%>
		<!-- 左侧内容 column  end -->
		<!-- 右侧内容 column  start -->  
		<div class=" content_box">
			<div class="grey_boder_box">
    		<!-- examtetail_table start --> 
    		<table class="tablebox mb20">
	        	<tr>
	                <th width="120">考区</th>
	                <td>${examRoom.examSite.examArea.name}</td>
	                <th width="120">考区编号</th>
	                <td>${examRoom.examSite.examArea.code}</td>
	            </tr>
	            <tr>
	                <th>考点</th>
	                <td>${examRoom.examSite.name}</td>
	                <th>考点编号</th>
	                <td>${examRoom.examSite.code}</td>
	            </tr>
	            <tr>
	                <th>考场编号</th>
	                <td colspan="3" class="ta_l"><input type="text" value="${examRoom.code}" disabled="disabled" /></td>
	            </tr>
        	 </table>
        	 <p class="examination_info mb10">考场座位表设置</p>
        	 <!-- seat_detail_box star -->
        	 <div class="seat_detail_box">
        	 <!-- seat_detail_top star -->
        	 <ul class="seat_detail_top">
            	
                <li>座位行数：<input value="${examRoom.lineNum}" size="10" disabled="disabled" /></li>
                <li>座位列数：<input value="${examRoom.columnNum}" size="10" disabled="disabled" /></li>
             </ul>
            <!-- seat_detail_top end -->
            				<!-- seat_detail_top end -->
            				<p class="seat_detail_title">监考机位置</p>
            				<p class="clearb"></p>
            				<!-- seat_detail_top star -->
            				<div class="seat_overfolw">
            					<ul class="seat_detail_list m0" style="width:${examRoom.columnNum*110}px">
	            					<s:iterator value="ssvoList" status="st">
	            						<s:if test="rs.status==0">
               							    <s:if test="cardNo!=null && cardNo!=''">
               							    	<li>
               										<span class="seat_border">
                										<span class="seat_detail_number">${rs.code}</span><br />
                    									<a target="_blank" href="examrecord!input.action?id=${recordid}">${s.name}</a><br />
                    									${cardNo}<br/>
                    						    		<span title="${sb.name}"><common:cut len="4" string="${sb.name}"/></span>
                   						    		</span>  
               									</li>
                   							</s:if>
                   							<s:else>
                   								<li class="seat_detail_green seat_border">
              										<span class="seat_detail_number">${rs.code}</span><br />
              										<br />
              										<br />
                  									空位
              										</li>
                   							</s:else>
                						</s:if>
                						<s:elseif test="rs.status==1">
							                <li class="seat_detail_yellow seat_border">
							                	<span class="seat_detail_number">${rs.code}</span><br />
							                	<br />
              									<br />
							                   	备用机
							                </li>
						                </s:elseif>
						                <s:else>
                							<li class="seat_detail_none seat_border">
	                							<span class="seat_detail_number">${rs.code}</span><br />
	                							<br/>
              									<br/>
	                							不可用
                							</li>
                						</s:else>
	            					</s:iterator>
            					</ul>
        					</div>
        				</div>
        				<p class="button_box">
					    	<button class="btn_cancell" type="button" onclick="pageClose();">关闭窗口</button>
					    </p>
					</div>
				</div>
			</div>
			<!-- 右侧内容 column  end-->    
		</div> <!-- content  end-->  
</body>
</html>