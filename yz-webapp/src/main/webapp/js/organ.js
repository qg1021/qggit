$(document).ready(function() {
//工作单位查询组织代码
		$('#company').autocomplete("../relatedorgan.action", {
			minChars: 2,
			autoFill: false,
			max:12,
			scroll:true,
			scrollHeight:500, 
			width:495,
			ajaxParam: getSelectParam, 
			parse:formateData 
		});
		$('#company').result(function(event,name,id){
			//返回值处理
			$('#company').val(name);	
			$('#orgcode').val(id);
		});

		//组织代码查询工作单位
		$('#orgcode').autocomplete("../relatedorgan!organCode.action", {
			minChars: 2,
			autoFill: false,
			max:12,
			scroll:true,
			scrollHeight:500, 
			width:495,
			ajaxParam: getSelectParam2, 
			parse:formateData
		});
		$('#orgcode').result(function(event,name,id){
			//返回值处理
			$('#orgcode').val(name);	
			$('#company').val(id);
		});
});	
//形成下拉div
function formateData(json){
	var parsed = [];
	var data = json.organs;
	if(data!=""){
		data = eval('('+data + ')');
		for(var item in data){	
			var line = data[item];	
			var p = {data: line.value,
					value: line.label,
					result: ""}
			parsed[parsed.length] = p;		
		}		
	}
	return parsed;
}

//获取参数
function getSelectParam(){
	var type = "company";
	var value = $('#company').val();
	var p = { 
			fieldName:type,
			fieldValue:value
		};
	return p;
} 

//获取参数
function getSelectParam2(){
	var type = "orgcode";
	var value = $('#orgcode').val();
	var p = { 
			fieldName:type,
			fieldValue:value
		};
	return p;
} 