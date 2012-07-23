<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@page import="com.drcl.yz.contant.Global"%>
<p class="site">个人报名照上传</p> 
	    <ul>
	    <li><b>报名照图像要求：</b></li>
	    <li>·是彩色个人标准大头照，能反映出您当前的面貌。</li>
	    <li>·拍摄背景为单色调浅色背景（白色/米色/浅蓝色）。</li>
	    <li>·脸部正对照相机拍摄的，面部表情平和，双眼睁开。</li>
	    <li>·不能佩戴掩盖头发或发线的帽子，整张脸必须是可见。</li>
	    <li>·如果你平时戴眼镜（有色隐形眼镜除外），拍摄时无需摘除。但眼镜上的反光不能出现在照片中。</li>
	    </ul>
	    <ul>
	    <li><b>照片上传格式要求：</b></li>
<!--	    <li>·尺寸：可接受的最低尺寸为600×600像素；可接受的最大尺寸为1200×1200像素。</li>-->
	    <li>·文件格式：图像必须是JPEG文件格式</li>
	    <li>·文件大小：图像必须小于或等于240 KB（千字节）</li>
	    </ul>
	    <ul>
	    <li><b>照片上传步骤：</b></li>
	    <li>1.点击"浏览"添加符合照片上传格式要求的报名照并上传所添加的照片；若照片符合报名照图像要求，则会显示在图片编辑框中。</li>
	    <li>2.拖动或等比缩放相框至合适的位置，建议以虚框尺寸裁剪。</li>
	    <li>3.点击"裁剪照片"按钮。</li>
	    <li>4.保存照片。</li>
	    </ul> 
	    <em id="error_picurl" style="margin-left: 5px;"></em>
	    <input type="hidden" name="oldPicUrl" id="oldPicUrl" value="${student.picurl}" />
	    <input type="hidden" name="oldpicurl" id="oldhid_picName" <s:if test="student.picurl!=null && ''!=student.picurl">value='${student.picurl}'</s:if>/>
	    <input type="hidden" name="picurl" id="hid_picName" />
	 	<input id="ava_url" name="ava_url" type="hidden" value="<common:prop name="oems.webapp.uploadUrl" propfilename="sysconfig.properties" defaultvalue="${pageContext.request.contextPath}"/><%=Global.STUDENTPIC_PATH%>"/>    
	    <p class="mb10">
        <span id="filespan">
	    <input type="file" name="file" id="file" <s:if test="student.picurl!=null && ''!=student.picurl">value='${student.picurl}'</s:if> size="30" onchange="onValidate();"/>
	    </span>
	    <a href="javascript:void(0);" class="cut_out" id="btnrever" onclick="onCut()" style="outline:none;blr:expression(this.onFocus=this.blur())">裁剪照片</a>
	    <a href="javascript:void(0);" class="reduction" onclick="realsize()" style="outline:none;blr:expression(this.onFocus=this.blur())">还原照片</a>
	    <a href="javascript:void(0);" class="zoomin" id="btnlager" onclick="onLagr();" style="outline:none;blr:expression(this.onFocus=this.blur())">放大照片</a>
	    <a href="javascript:void(0);" class="zoomout" id="btnsmall" onclick="onSmall();" style="outline:none;blr:expression(this.onFocus=this.blur())">缩小照片</a>
	    </p>
	    <div  id="hid_image_div" style="display: none;position:absolute; left:0px; top:0px; width:0px; height:0px; z-index:1; visibility: hidden;">
	    <center><img id="hidden_img" src="<s:if test="student.picurl!=null && ''!=student.picurl"><common:prop name="oems.webapp.uploadUrl" propfilename="sysconfig.properties" defaultvalue="${pageContext.request.contextPath}"/><%=Global.STUDENTPIC_PATH%>${student.picurl}</s:if>" alt=""/></center>
	    </div>
	    <div class="photo_box" id="define_ava_div" style="overflow: auto">
	    <center><img src="<s:if test="student.picurl!=null && ''!=student.picurl"><common:prop name="oems.webapp.uploadUrl" propfilename="sysconfig.properties" defaultvalue="${pageContext.request.contextPath}"/><%=Global.STUDENTPIC_PATH%>${student.picurl}</s:if><s:else>${ctx}/public-demo/photo.jpg</s:else>" alt=""/></center>
	    </div>
	    <input type="hidden" name="oldw" id="oldw" />
       	<input type="hidden" name="oldh" id="oldh"/> 
	    <input type="hidden" name="x" id="x"/>
       	<input type="hidden" name="y" id="y"/> 
        <input type="hidden" name="w" id="w" />
        <input type="hidden" name="h" id="h" /> 