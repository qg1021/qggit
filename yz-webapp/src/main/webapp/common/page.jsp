<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp"%>
<script src="${ctx}/js/jquery.pager.js" type="text/javascript"></script>
<script type="text/javascript">
     $(document).ready(function() {
    	  PageClick = function(pageclickednumber) {
              $("#pager").pager({pageTotalCount:${page.totalCount}, pagenumber: pageclickednumber, pagecount:${page.totalPages}, buttonClickCallback: PageClick });
              jumpPage(pageclickednumber);
          }
          $("#pager").pager({pageTotalCount:${page.totalCount}, pagenumber:${page.pageNo}, pagecount:${page.totalPages}, buttonClickCallback:PageClick });
          $("#mainForm").find("button[type='submit'],input[type='submit']").click(function(){
              $('#pageNo').val(1);
          });
          $('#pageGo').keydown(function(e){
        	  if(e.keyCode==13){
        	     $('#gotobutton').click();
        	     if($.browser.msie){
            	     window.event.cancelBubble = true;
            	     window.event.returnValue = false            	
        	     }
        	  }
          }); 


        	            

        });
     function jumpPage(pageNo) {
    		$("#pageNo").val(pageNo);
    		$("#mainForm").submit();
     }
     function gotoSubmit(obj,pagecount,callBack){
         var pageGo = document.getElementById('pageGo').value;
         if(pageGo==""){
             alert("页码不能为空");
             document.getElementById('pageGo').focus(); 
             return false;
         }else{
        	 var r = /^\+?[1-9][0-9]*$/;　　//正整数 
             if(!r.test(pageGo) || pageGo > pagecount){
            	 alert("页码不合法");
            	 document.getElementById('pageGo').value='';
                 document.getElementById('pageGo').focus();
                 return false;
             }
         }
         jumpPage(pageGo);
         
     }
</script>
<div  class="pagernumber02"><span class="ll">共有 ${page.totalCount} 记录 | &nbsp;</span><span id="pager"></span></div>
<input type="hidden" name="page.pageNo" id="pageNo" value="${page.pageNo}"/>
<input type="hidden" name="page.orderBy" id="orderBy" value="${page.orderBy}"/>
<input type="hidden" name="page.order" id="order" value="${page.order}"/>
