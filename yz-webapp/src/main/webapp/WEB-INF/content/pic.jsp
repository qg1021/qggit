<%@ page contentType="text/html;charset=UTF-8" %>
<link href="${ctx}/css/pic.css" rel="stylesheet" type="text/css" />
<script src="${ctx}/js/jquery.cycle.js" type="text/javascript"></script>
<script type="text/javascript">
		$(document).ready(function(){
			$('#banner').cycle({ 
					fx:'fade',
					timeout: 3000,
					pager:'#btn'
			});
		});

</script>
 
<div id="banner" class="picture_sliding">
	
</div>
<div id="btn"></div>