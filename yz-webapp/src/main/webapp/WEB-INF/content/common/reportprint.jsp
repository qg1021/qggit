<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<%@page import="com.drcl.yz.contant.Global"%>

<div id="reportprint" style="display: none;">
<div class="card_form">
      <h1 ><span id="p_itemname">${examRecord.itemname}</span>报名申请表</h1>
      
<table width="100%">
<tr><td><p>报名时间：<span id="p_reportDate"><s:date name="examRecord.reportDate" format="yyyy.MM.dd HH:mm"/></span></p><p>费用：</p><p>用户名：<span id="p_userName">${examRecord.student.username}</span></p></td>
<td align="right"></td></tr>
</table>      

    <table class="tablebox">
        	<tr>
                <th width="90">姓名</th>
                <td width="150" style="text-align: left;" id="p_name">&nbsp;&nbsp;${examRecord.name}</td>
                <th width="70">身份证</th>
                <td style="text-align: left;" id="p_idcard">&nbsp;&nbsp;${examRecord.idcard}</td>
                <td rowspan="5" width="100" id="p_picurl"><c:if test="${not empty examRecord.picurl}"><img width="100" src="<common:prop name="oems.webapp.uploadUrl" propfilename="sysconfig.properties" defaultvalue="${pageContext.request.contextPath}"/><%=Global.STUDENTPIC_PATH%>${examRecord.picurl}" alt=""/></c:if></td>
            </tr>
            <tr>
                <th id="p_name">性别</th>
                <td style="text-align: left;" id="p_sex">&nbsp;&nbsp;${examRecord.student.sex?'男':'女'}</td>
                <th>联系电话</th>
                <td style="text-align: left;" id="p_phone">&nbsp;&nbsp;<s:if test="examRecord.mobile!=null && ''!=examRecord.mobile && examRecord.tel!=null &&''!=examRecord.tel">${examRecord.mobile}&nbsp;&nbsp;${examRecord.tel}</s:if><s:elseif test="examRecord.tel!=null &&''!=examRecord.tel">${examRecord.tel}</s:elseif><s:elseif test="examRecord.mobile!=null && ''!=examRecord.mobile">${examRecord.mobile}</s:elseif></td>
            </tr>
            <tr>
                <th>工作单位</th>
                <td colspan="3" style="text-align: left;" id="p_company">&nbsp;&nbsp;${examRecord.company}</td>
            </tr>
            <tr>
                <th>学历</th>
                <td style="text-align: left;" id="p_education">&nbsp;&nbsp;${examRecord.education}</td>
                <th>专业</th>
                <td style="text-align: left;" id="p_major">&nbsp;&nbsp;${examRecord.major}</td>
            </tr>
            <tr>
                <th>行业工作经历</th>
                <td style="text-align: left;" id="p_experience">&nbsp;&nbsp;${examRecord.experience}年</td>
                <th>职称</th>
                <td style="text-align: left;" id="p_professional">&nbsp;&nbsp;${examRecord.professional}</td>
            </tr>
            <tr>
                <th>报考内容</th>
                <td colspan="4" style="text-align: left;" id="p_subjectName">&nbsp;&nbsp;${examRecord.subject.name}</td>
            </tr>
            <tr>
                <th>报考地点</th>
                <td colspan="4" style="text-align: left;" id="p_examSiteName">&nbsp;&nbsp;${examRecord.examSite.name}</td>
            </tr>
            <tr>
                <th>工作单位意见</th>
                <td colspan="4"><br /><p style="text-align:left; margin-left:60px;font-size: 14px;">该同志在本单位工作已满 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年，特此证明！</p><br /><br />
               <p  style="text-align:right; margin-right:60px;"> 工作单位盖章<br />
                年 &nbsp;&nbsp; 月 &nbsp;&nbsp;  日</p>
                </td>
            </tr>
        </table>
        <table class="tablebox" style="width:100%">
        <tr>
        <td colspan="2" class="ta_l" align="left"><span class="fontbold">审核流程</span>（以下内容为各地以及省主管部门填写）</td>
        </tr>
        	<tr>
                <th style="width:20%">各地主管部门审核意见</th>
                <td style="width:60%"><br /><br /><br /><br />
               <p  style="text-align:right; margin-right:60px;"> 主管部门盖章<br />
                年 &nbsp;&nbsp; 月 &nbsp;&nbsp;  日</p></td>
            </tr>
            <tr>
                <th style="width:20%">省级主管部门复核意见</th>
                <td style="width:60%"><br /><br /><br /><br />
               <p  style="text-align:right; margin-right:60px;"> 主管部门盖章<br />
                年 &nbsp;&nbsp; 月 &nbsp;&nbsp;  日</p></td>
            </tr>
        </table>
        <table class="tablebox" style="width:100%">
        <tr>
        <td colspan="2" class="ta_l"><span class="fontbold">报名者请于以下时间内至以上地点进行现场审核和缴费。</span></td>
        </tr>
        	<tr>
                <th style="width:20%">现场审核时间</th>
                <td style="width:60%" style="text-align: left;">&nbsp;<s:date name="#request.areaExamStat.auditDate" format="yyyy.MM.dd"/></td>
            </tr>
            <tr>
                <th style="width:20%">现场审核地址</th>
                <td style="width:60%" style="text-align: left;">&nbsp;${requestScope.areaExamStat.address }</td>
            </tr>
            <tr>
                <th style="width:20%">联系电话</th>
                <td style="width:60%" style="text-align: left;">&nbsp;${requestScope.areaExamStat.linktel}</td>
            </tr>
            <tr>
                <th style="width:20%">备注</th>
                <td style="width:60%" style="text-align: left;">   </td>
            </tr>            
        </table>
        <p><span style="text-align:left; margin-left:60px;"> 签名：</span>
		<span  style="text-align:left; margin-left:300px;">日期：</span></p>
        
  </div>
  <!--the end of 申请表--> 
  </div>
<script language="javascript" type="text/javascript"> 

	var LODOP; //声明为全局变量
	function createPage(){
		LODOP=getLodop(document.getElementById('LODOP_OB'),document.getElementById('LODOP_EM'));  
		LODOP.PRINT_INIT("报名申请表");
		var strBodyStyle = '<link href="${ctx}/css/printreport.css" type="text/css" rel="stylesheet"/>';
		LODOP.ADD_PRINT_HTM("5%","11%","100%","100%",strBodyStyle+"<body>" + document.getElementById("reportprint").innerHTML + "</body>");
		LODOP.ADD_PRINT_BARCODE(120, 516,172, 55, "Code39", "${examRecord.regNo}");
	}
	function previewTable(){
		createPage();
		LODOP.SET_LICENSES('', '', '','');//置软件产品注册信息 
		LODOP.PREVIEW();
	};
	function printTable(){
		createPage();
		LODOP.SET_LICENSES('', '', '','');//置软件产品注册信息 
		LODOP.PRINTA();	
	};	
</script>