<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta content="arrange" name="activemenu" />
	<title>报考方案导出</title>
	<link href="${ctx}/css/master.css" type="text/css" rel="stylesheet"/> 
	<link href="${ctx}/js/validate/jquery.validate.css" type="text/css" rel="stylesheet"/>
	<link href="${ctx}/css/fancybox/jquery.fancybox-1.3.4.css" rel="stylesheet" type="text/css" media="screen" />
	<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
	<script src="${ctx}/js/validate/jquery.validate.js" type="text/javascript"></script>
	<script type="text/javascript" src="${ctx}/js/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
	<script type="text/javascript" src="${ctx}/js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
	<script src="${ctx}/js/jcommon.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			setTabClass(6);
		});
		function onCreate(){
			window.location.href='arrange!generateCode.action?timesid=${timesid}';
		}
		function onExport(url){
			window.open(url);
			parent.location.reload();
		}

	</script>

</head>
<body>
<div id="wrapper">
	<%@ include file="/common/header.jsp"%>
	<!--the end of head-->
	<div id="content">  
		<!-- top 统计板块 start-->
		<%@ include file="arrange-base.jsp"%>
		<!-- top 统计板块 end-->
		<!-- tab06 start -->
		<div id="tabid6">
    		<!-- <p class="right3pxborder mb10">将排考数据发布至中心服务器和题库组卷系统</p>
    		<div class="box_solid_grey exam_list_min">
		    	<ul class="exam_list_float">
		            <li>中心服务器</li>
		            <li><select><option>江苏住建厅考试服务</option><option>江苏财税厅考试服务</option></select></li>
		            <li><span class="registration_h2_span ll font_s12 p0"><span class="registration_h2_span_first">地址：XXX.XXX.X.XXX</span>访问端口：8001</span></li>
		            <li class="rr"><span class="registration_h2_span ll font_s12 p0"><span class="registration_h2_span_first"><a href="#">配置选中的服务器</a></span><a href="#">新增服务器</a></span></li>        
		        </ul>
		    	<ul class="exam_list_float">
		    	    <li>中心服务器</li>
		    	    <li>
		    	        <select name="select">
		    	            <option>江苏住建厅考试服务</option>
		    	            <option>江苏财税厅考试服务</option>
			            </select>
			        </li>
		    	    <li><span class="registration_h2_span ll font_s12 p0"><span class="registration_h2_span_first">地址：XXX.XXX.X.XXX</span>访问端口：8001</span></li>
		    	    <li class="rr"><span class="registration_h2_span ll font_s12 p0"><span class="registration_h2_span_first"><a href="#">配置选中的服务器</a></span><a href="#">新增服务器</a></span></li>
			    </ul>
    			<p class="ta_c"><button onclick="window.open('arrangedownload.excsec?name=${examTimes.code}.txt');">发布数据</button></p>
    		</div>
    		<p class="right3pxborder mb10">将排考方案数据发布至外考务系统</p>
    		<div class="box_solid_grey exam_list_min">
        		<p class="ta_c"><button onclick="window.open('arrangedownload.excsec?name=${examTimes.code}.txt');">发布数据</button></p>
    		</div>
    		 -->
    		<p class="right3pxborder mb10">将排考方案数据打包成文件导出</p>
    		<div class="box_solid_grey exam_list_min">
        		<p class="ta_c"><button id="btnExport" onclick="onExport('arrangedownload.excsec?timesid=${examTimes.id}&contentType=application/zip&name=${examTimes.code}.zip');">导出数据</button></p>
        		<p align="center">
        			<s:if test="examTimes.arrangeExportDate!=null">
        				最后导出时间：<s:date format="yyyy.MM.dd HH:mm" name="examTimes.arrangeExportDate"/>
        			</s:if>
        		</p>
    		</div>
    		<p class="right3pxborder mb10">将组卷需求数据打包成文件导出</p>
    		<div class="box_solid_grey exam_list_min">
        		<p class="ta_c"><button id="btnExport" onclick="onExport('arrangedownload.excsec?timesid=${examTimes.id}&contentType=application/txt&name=group-${examTimes.code}.txt');">导出数据</button></p>
    			<p align="center">
        			<s:if test="examTimes.groupExportDate!=null">
        				最后导出时间：<s:date format="yyyy.MM.dd HH:mm" name="examTimes.groupExportDate"/>
        			</s:if>
        		</p>
    		</div>
    	</div>
		<!-- tab06 end -->
	</div> <!-- content  end-->  
</div><!-- wrapper  end-->  
</body>
</html>