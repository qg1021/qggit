var List=new Array();
var List_Status=false;
var List_Open=false;
var List_Type="";
var column;
var hiddenIndex;
var count;
//打开关闭隐藏字段
function gOpen(tr, flag){
	var td = tr.children();
	for(var i=hiddenIndex;i<column+1;i++){
		var tdl = td.eq(i);
		if(flag){
			var tdtext = tdl.html();
			tdl.html($(List[i]).val(tdtext));
		}else{
			var input = tdl.find('input').eq(0).val();
			tdl.html(input);
		}
	}
}

//添加td事件
function tdClick(){   
	//找到当前节的tr位置
	var place = $(this).prevAll().size();
	var list;
	if(place==1){
		list = List[0] + $(this).parent().parent().parent().attr("id") +"grid[" + place + ",1]" + List[1];
	}else{
		list = List[place];
	}
	//找到当前节（TD）   
	var td = $(this);   
	//找到当前节父节对应的最后节点
	var tdl = td.nextAll().slice(-1);
	//获得节点文本信息   
	var text = $(this).text();
	//检验列是否只读或可用
	if(List[place].indexOf("readonly")>0 || List[place].indexOf("disabled")>0 || List_Status==true){
		return false;
	}
	//td.empty()清空   
	td.html("");               
	//打开父节点所隐藏的TD节点
	gOpen(td.parent(),true);
	//创建input或select   
	var input = $(list);   
	List_Status = true;
	//给当前input加入事件    
	input.keydown(function(event){   
		//判断浏览器   
		var myEvent = event || window.event;   
		//获得按键的值   
		var kcode = myEvent.keyCode;   
		if(kcode == 13){   
			//获得文本的值   
			var inputText;
			if(list.indexOf("</option>")>0){
				inputText = $(this).find('option:selected').text();
			}else{
				inputText = $(this).val();   
			}
			//获得父TD   
			var tdNode = $(this).parent();   
			//比较值是否有变化，如果有，修改标识为修改
			if( (text!=inputText) && (tdl.html()!='N') ){
				tdl.html("E");
				//tdNode.addClass('btd');
				//tdNode.attr('style', 'border-left: thin dotted #FF0000');
			}
			//赋值   
			tdNode.html(inputText);   
			//重新添加事件   
			tdNode.click(tdClick);   
			List_Status = false;
			//打开父节点所隐藏的TD节点
			gOpen(td.parent(),false);
		}
	});
	/*input.blur(function(event){   
		//判断浏览器   
		var myEvent = event || window.event;   
		//获得按键的值   
		var kcode = myEvent.keyCode;   
		//获得文本的值   
		var inputText;
		if(list.indexOf("</option>")>0){
			inputText = $(this).find('option:selected').text();
		}else{
			inputText = $(this).val();   
		}
		//获得父TD   
		var tdNode = $(this).parent();
		//比较值是否有变化，如果有，修改标识为修改
		if( (text!=inputText) && (tdl.html()!='N') ){
			tdl.html("E");
			tdNode.addClass('btd');
			//tdNode.attr('style', 'border-left: thin dotted #FF0000');
		}
		//赋值   
		tdNode.html(inputText);   
		//重新添加事件   
		tdNode.click(tdClick);   
		List_Open = false;
	});*/
	//设属性   
	if(List[place].indexOf("</option>")>0){
		//也可以用input.appendTo(td);   
		td.append(input);   
		//设置所选项
		input.children().each(function(){
			if($(this).text() == text)
				this.selected = true;
		});
	}else{
		input.attr("value",text);      
		//也可以用input.appendTo(td);   
		td.append(input);   
		//文字全部选中   
		//input.get(0).select();   
		//设置当前焦点
		input.focus();
	}
	//取消点击事件   
	td.unbind("click");   
}  
/*新增明细 begin*/
function jQgRowNew(tblDataList){
	if(!TableValidation()){
		return false;
	}else{
		 List_Status=false;
	}
	if (!List_Status){
		//当前行数
		var lngNewRowID = $('#'+tblDataList+' tbody tr').size();
		//添加TR
		var oTR = $("<tr id='tr_"+ lngNewRowID +"'>");   
		$('#'+tblDataList).append(oTR);
		//添加第一列TD
		var oTD1 = $("<td >");
		oTD1.attr('id','td_'+lngNewRowID+'-0');
		var oInp1 = $("<input type='checkbox' id='Grid" + lngNewRowID + "' value='1' >");
		oTR.append(oTD1);
		oTD1.append(oInp1);
		//添加第二列TD
		var oTD2 = $('<td>');
		oTD2.attr('id','td_'+lngNewRowID+'-1');
		var oInp2 = $(List[0] + tblDataList+"grid[" + lngNewRowID + ",1]" + List[1]);
		oTR.append(oTD2);
		oTD2.append(oInp2);
		//放置焦点
		oInp2.focus();
		//添加按下键事件
		oInp2.keydown(function (event){
			//判断浏览器   
			var myEvent = event || window.event;   
			//获得按键的值   
			var kcode = myEvent.keyCode;  
			//回车
			if(kcode == 13){
				//获得下一父节点
				var nextTD = $(this).parent().next();
				//下一父节点的子节点
				var nextINP = nextTD.children();
				var id = "td_"+lngNewRowID+"-"+hiddenIndex;
				while(nextINP.attr("readOnly")==true){
					var nextTDD = nextINP.parent().next();
					if(nextTDD.attr("id")==id){
						break;
					}
					nextINP = nextTDD.children();
				}
				nextINP.focus();
			}else if(kcode == 27){
				jQgRowDeleteLast(tblDataList);
			}
		});

		for(var i=2;i<=column;i++){		
			var oTD = $("<td id='td_"+lngNewRowID+"-"+i+"'>");
			oTR.append(oTD);
			var oInp = $(List[i]);
			oTD.append(oInp);
			//加隐藏属性
			if(i>hiddenIndex-1){	
				oTD.attr('style','display:none');
				oInp.attr('style','display:none');
			}
			
			oInp.keydown(function (event){
				//判断浏览器   
				var myEvent = event || window.event;   
				//获得按键的值   
				var kcode = myEvent.keyCode;  
				if(kcode == 13){
					var nextTD = $(this).parent().next();
					//如果下一列为隐藏值，那么执行gRowSave方法
					if(nextTD.prevAll().size()>hiddenIndex-1){
						jQgRowSave(tblDataList);
	 					//jQgRowNew(tblDataList);
					}else{
						var nextINP = nextTD.children();
						nextINP.focus();
					}						
				}else if(kcode == 27){
					jQgRowDeleteLast(tblDataList);
				}
			});
		}
		//oTR.append($("<td id='td_"+lngNewRowID+"-"+(column+1)+"' style='display:none'><input type='hidden' id='table_flag' name='table_flag' value='N'/></td>"));
		oTR.append($("<td id='td_"+lngNewRowID+"-"+(column+1)+"' style='display:none'>N</td>"));
		
		List_Status=true;
		List_Type="New";
	}
}

/*新增明细 end*/
/*保存明细 begin*/
function jQgRowSave(tblDataList){
	if (List_Status){
		
		if(!TableValidation()){
			return false;
		}
		//获取最后一行
		var oTR = $('#'+tblDataList+' tr:last');
		//列赋值
		/*$('#'+tblDataList+' tr:last td').each(function (i){
			if(i>0){
				if($(this).find('input').size()>0){
					$(this).html($(this).find('input').eq(0).val());
				}else if($(this).find('select').size()>0){
					$(this).html($(this).find('select').eq(0).find('option:selected').html());
				}
				$(this).click(tdClick);
			}
		});*/
		//如为新建添加标识列
		/*if (List_Type=="New"){
			var oTD = $("<td style='display:none'>");
			oTR.append(oTD);
			oTD.html("N");
		}
		*/
		
	    List_Status=false;
	    List_Type="";
	    return true; 
	}
}

/*保存明细 end*/
/*删除明细 begin*/	
function jQgRowDelete(tblDataList){
	//获取选中记录集
	var con = $("#"+tblDataList+" tr td input:checked");
	if(con.size() == 0){
		alert("请选择您要删除的记录！");
		return false;
	}
	//if (!confirm("您确信删除选中的记录吗？")){
	//	return false;   
	//}
	//删除或隐藏记录
	con.each(function (i){
		var tdNode = $(this).parent();   
		if(tdNode.nextAll().slice(-1).html()=="N"){
			tdNode.parent().remove();
		}else{
			tdNode.parent().hide();
			tdNode.nextAll().slice(-1).html("D");
		}
	});
	var bl=true;
	
	/*$('#tblDataList tr').each(function (i){
		var chk = $(this).find('td input:checked');
		if(chk.size()>0){
			if(chk.parent().nextAll().slice(-1).html()=='N'){
				$(this).remove();
			}else{
				$(this).hide();
			}
		}
	});
	*/
	//重新计数
	$('#'+tblDataList+' tr').each(function (i){
		var inp = $(this).find('td').find('input:checkbox');
		inp.attr('id',tblDataList+"grid["+i+"][1]");
	});
	
	List_Status=false;
	List_Type="";
}
/*删除明细 end*/
/*删除尚未保存的最后一条明细，页面一般不直接调用. begin*/
function jQgRowDeleteLast(tblDataList){
  $('#'+tblDataList+' tr:last').remove();
  List_Status=false;
  List_Type="";
}
/*end*/
/*全选 begin*/
function fSelectAll(tblDataList, chkAll){
	if(document.all(chkAll).checked){
		$("#"+tblDataList+" tr input[type=checkbox]:gt(0)").attr("checked",true);
	}else{
		$("#"+tblDataList+" tr input[type=checkbox]:gt(0)").attr("checked",false);
	}	
}
/*end*/
