function jumpPage(pageNo) {
	$("#pageNo").val(pageNo);
	$("#mainForm").submit();
}
function mustjumpPage(pageNo) {
	$("#mustpageNo").val(pageNo);
	$("#tabtype").val(1);
	$("#mainForm").submit();
}
function selectjumpPage(pageNo) {
	$("#selectpageNo").val(pageNo);
	$("#tabtype").val(2);
	$("#mainForm").submit();
}
function finishedjumpPage(pageNo) {
	$("#finishedpageNo").val(pageNo);
	$("#tabtype").val(3);
	$("#mainForm").submit();
}

function sort(orderBy, defaultOrder) {
	if ($("#orderBy").val() == orderBy) {
		if ($("#order").val() == "") {
			$("#order").val(defaultOrder);
		}
		else if ($("#order").val() == "desc") {
			$("#order").val("asc");
		}
		else if ($("#order").val() == "asc") {
			$("#order").val("desc");
		}
	}
	else {
		$("#orderBy").val(orderBy);
		$("#order").val(defaultOrder);
	}

	$("#mainForm").submit();
}

function search() {
	$("#order").val("");
	$("#orderBy").val("");
	$("#pageNo").val("1");

	$("#mainForm").submit();
}

/**
 * 删除记录
 * @param url
 * @return
 */
function delRecord(url){
	if(confirm("你确认删除？")){
		window.location.href = url;
	}
}

/**
 * 取消
 * @param url
 * @return
 */
function canRecord(url){
	if(confirm("你确认取消？")){
		window.location.href = url;
	}
}
/**
 * 编辑记录
 * @param url
 * @return
 */
function editRecord(url){
	window.location.href = url;
}	