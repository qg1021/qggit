<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<%@page import="com.drcl.yz.contant.Global"%>
<div id="examprint" style="display: none;">
<div class="card_form">
      <h1 >${examRecord.itemname}准考证</h1>
      
      <table  cellspacing="10" style="margin:20px auto; padding:10px; ">
      <tr>
      <td width="300">
		<p>准考证号：${requestScope.examCard.cardNo}</p>
		<p>姓   名：${examRecord.student.name}</p>
		<p>身份证号：${examRecord.student.idcard}</p>
		</td>
        <td width="200">
        <p style="margin-left:10px;"><c:if test="${not empty examRecord.student.picurl}"><img width="100" src="<common:prop name="oems.webapp.uploadUrl" propfilename="sysconfig.properties" defaultvalue="${pageContext.request.contextPath}"/><%=Global.STUDENTPIC_PATH%>${examRecord.student.picurl}" alt=""/></c:if></p>
        </td>
        </tr>
      
      </table>

<p class="dash_line"></p>

      <h1>考&nbsp;试&nbsp;安&nbsp;排</h1>
        <s:iterator value="#request.examRecords" status="st">
        <table class="tablebox">
        <tr>
        <th rowspan="3">${st.count}</th> 
          <th width="70" rowspan="0">考试科目</th>
          <td>${sname}</td>
          <th width="">考试时间</th>
          <td ><s:date name="field.startdate" format="yyyy.MM.dd HH:mm"/>-<s:date name="field.enddate" format="HH:mm"/></td>
        </tr>
        <tr>
          <th width="70">考点</th>
          <td >${examSite.name}</td>
          <th width="">座位号</th>
          <td >${examRoom.name}  &nbsp;&nbsp;&nbsp;&nbsp; <span class="fontbold">${seat}</span></td>
        </tr>
        <tr>
          <th  width="70">地址 / 电话 </th>
          <td colspan="3">${examSite.address} &nbsp;&nbsp;   / &nbsp;&nbsp;  ${examSite.phoneNo}</td>
        </tr>
		</table>    
      	</s:iterator>

		<p class="dash_line"></p>
      <h1 style=" letter-spacing:10px;" >考试须知</h1>
      <ul class="testnotice">
      <li>1. &nbsp;本考次为机考。在考试前20分钟，考生凭本准考证和本人身份证进入考场，对号入座后将准考证放在桌面右上角，以备查对。</li>
      <li>2. &nbsp;迟到30分钟不得入场，开考后30分钟内不能交卷出场。</li>
      <li>3. &nbsp;只准带钢笔、圆珠笔、铅笔、橡皮和计算器（免套），开考后不得互相借用。不得携带书籍、笔记和纸张等其他物品入场。</li>
      <li>4. &nbsp;不得要求监考人员解释试题，如遇考试机故障，可以举手询问。</li>
      <li>5. &nbsp;要保持考场安静，不许交头接耳、左顾右盼，严禁偷看他人考试机，考场内禁止吸烟，考生进入考场应关闭手机、呼机。</li>
      <li>6. &nbsp;尊重考场工作人员，接受监考人员的监督和检查，不得无理取闹，不得辱骂、威胁报复考场工作人员。</li>
      <li>7. &nbsp;考试结束铃响，应立即停止答卷，离开考场，不得将草稿纸带出考场。</li>
      </ul>
    </div>
</div>
<script language="javascript" type="text/javascript"> 
	var LODOP_EXAM; //声明为全局变量
	function createPageExam(){
		LODOP_EXAM=getLodop(document.getElementById('LODOP_OB'),document.getElementById('LODOP_EM'));  
		LODOP_EXAM.PRINT_INIT("准考证");
		var strBodyStyle = '<link href="${ctx}/css/printexam.css" type="text/css" rel="stylesheet"/>';
		LODOP_EXAM.ADD_PRINT_HTM("5%","12%","100%","100%",strBodyStyle + "<body>" + document.getElementById("examprint").innerHTML + "</body>");

	}
	function previewExam(){
		createPageExam();
		LODOP_EXAM.SET_LICENSES ('', '', '','');//置软件产品注册信息 
		LODOP_EXAM.PREVIEW();	
	};
	function printExam(){
		createPageExam();
		LODOP_EXAM.SET_LICENSES ('', '', '','');//置软件产品注册信息 
		LODOP_EXAM.PRINTA();	
	};	
</script>