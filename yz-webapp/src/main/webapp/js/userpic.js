 	//Jcrop调用	
	function initJcrop(left,top,width,height){
		$("#xuwanting").Jcrop({
			bgColor:"#EEEEEE", //裁剪时背景颜色设为灰色 
			allowSelect:false,//不允许选择区域
			allowResize:false, //不允许改变选中区域的大小 
			setSelect:[left,top,width,height], //初始化选中区域 
			onChange:showCoords, //当选择区域变化的时候，执行对应的回调函数 
			onSelect:showCoords //当选中区域的时候，执行对应的回调函数
			 
		});	
	};
	
	//简单的事件处理程序，响应自onChange,onSelect事件，按照上面的Jcrop调用	 
	function showCoords(obj){
		$("#x").val(obj.x);
		$("#y").val(obj.y); 
		$("#w").val(obj.w);
		$("#h").val(obj.h);
	}
	
	//初始化剪裁参数
	function initXYWH(x,y,w,h){
		$("#x").val(x);
		$("#y").val(y); 
		$("#w").val(w);
		$("#h").val(h);
	}
	
	//判断上传照片格式
	function onValidate()
	{   
		var picFile = document.getElementById('file').value;
		var picfileObj = picFile.substr(picFile.lastIndexOf(".")).toLowerCase(); 
			if(picfileObj!=".jpg" && picfileObj!=".JPG"){
				alert("上传图片格式不正确，请重新上传.");
				document.getElementById('error_picurl').style.display="block";
				document.getElementById('hid_picName').value="";
				document.getElementById('filespan').innerHTML='<input type="file" name="file" id="file" size="30" onchange="onValidate();"/>';
				return;
			}else
				ajaxFileUpload();
	}
	
	//自定义照片上传
	function ajaxFileUpload(){
		showLayer('dialog','dialog_content',"<span style='text-align:center'><img align='top' alt='正在上传...' src='../image/loading.gif'/></span>");
				$.ajaxFileUpload
				(
					{
						url:'../upload!uploadStudentPic.excsec',//用于文件上传的服务器端请求地址
						secureuri:false,//一般设置为false
						fileElementId:'file',//文件上传空间的id属性  <input type="file" id="file" name="file" />
						dataType: 'json',//返回值类型 一般设置为json
						success: function (data, status)  //服务器成功响应处理函数
						{ 
						closeLayer();//关闭提示层
						if(data!=null){
							if(data.message!=null){
								alert(data.message);//错误提示信息，如附件太大，上传失败
								//上传失败后，清空上传文件框
								document.getElementById('filespan').innerHTML='<input type="file" name="file" id="file" size="30" onchange="onValidate();"/>';
								return;
							}else{
								var fileName = data.fileName; 
								var fullImgPath =$('#ava_url').val()+fileName;
								 
								//保存图片名称用于裁剪图片
								$("#oldhid_picName").val(fileName);
								$("#hid_picName").val(fileName);
								
								//设置高和宽
								var ht = data.height;
								var wt=data.width;
								
								//保存宽和高用于放大或缩小
								$("#oldw").val(wt);
								$("#oldh").val(ht);
								
								//存储真实的宽和高
								var width;
								var height;
								
								//判断，如果高大于567，则将高设为567，宽等比例缩小；如果此时的宽大于390，则宽高设为390，高在576基础上等比例缩小
								//如果高小于567，且宽小于390，则高和宽不变；如果高小于567，宽大于390，则将宽设为390，高在等比例缩小
								if(ht>567){
									height = 567; 
									var rewt =Math.round(wt*(567/ht));
									 
									if(rewt<=390){
										width=rewt;
									}else{
										width=390;
										height=Math.round(567*(390/rewt));
									} 
								}else{
									if(wt<=390){
										height=ht; 
										width=wt; 
									}else{
										width=390;
										height=Math.round(ht*(390/wt));
									}
								}  
								document.getElementById('define_ava_div').innerHTML='<center><img style="" id="xuwanting" width="'+width+'" height="'+height+'" src="'+fullImgPath+'" /></center>';
								document.getElementById('hid_image_div').innerHTML='<center><img style="" id="hidden_img" width="'+wt+'" height="'+ht+'" src="'+fullImgPath+'" /></center>';
								document.getElementById('error_picurl').style.display="none";

								//剪裁成功后,显示放大和缩小
								$("#btnlager").show();
								$("#btnsmall").show();
								$("#btnrever").show();
								
								//初始化剪裁参数
								initXYWH(0,0,width,height);
								
								//重新初始化剪裁 
								initJcrop(0,0,width,height);
							}
						}	
							if(typeof(data.error) != 'undefined')
							{
								if(data.error != '')
								{
									alert(data.error);
								}else
								{
									
									alert(data.message);
								}
							}
						},
						error: function (data, status, e)//服务器响应失败处理函数
						{
							alert(e);
						}
					}
				)
				return false;
	}
	
	//放大照片
	function onLagr(){  
		if(!document.getElementById("xuwanting"))
			return ;
		
		//放大照片前先销毁旧的照片,否则无法去除旧照片
		$.Jcrop("#xuwanting").destroy();
		var fullImgPath =$('#ava_url').val()+$("#oldhid_picName").val();
		var ht=Math.round(parseInt($("#xuwanting").attr("height"))*getRate());
		var wt=Math.round(parseInt($("#xuwanting").attr("width"))*getRate());
		document.getElementById('define_ava_div').innerHTML='<center><img style="" width="'+wt+'" height="'+ht+'" id="xuwanting"  src="'+fullImgPath+'" /></center>';
		
		//保存宽和高便于下次使用
		$("#oldw").val(ht);
		$("#oldh").val(wt);
		
		var width;
		var height;
		
		if(ht>567){
			height = 567; 
			var rewt =Math.round(wt*(567/ht));
			 
			if(rewt<=390){
				width=rewt;
			}else{
				width=390;
				height=Math.round(567*(390/rewt));
			} 
		}else{
			if(wt<=390){
				height=ht; 
				width=wt; 
			}else{
				width=390;
				height=Math.round(ht*(390/wt));
			}
		}  
		initJcrop(0,0,width,height);
 		initXYWH(0,0,width,height);
	}
	
	//缩小照片
	function onSmall(){
		if(!document.getElementById("xuwanting"))
			return ;
		
		//缩小照片前先销毁旧的照片,否则无法去除旧照片
		$.Jcrop("#xuwanting").destroy();
		var fullImgPath =$('#ava_url').val()+$("#oldhid_picName").val();
		var ht=Math.round(parseInt($("#xuwanting").attr("height"))/getRate());
		var wt=Math.round(parseInt($("#xuwanting").attr("width"))/getRate());
		document.getElementById('define_ava_div').innerHTML='<center><img style="" width="'+wt+'" height="'+ht+'" id="xuwanting"  src="'+fullImgPath+'" /></center>';
		
		//保存宽和高便于下次使用
		$("#oldw").val(ht);
		$("#oldh").val(wt);
		
		var width;
		var height;
		
		if(ht>567){
			height = 567; 
			var rewt =Math.round(wt*(567/ht));
			 
			if(rewt<=390){
				width=rewt;
			}else{
				width=390;
				height=Math.round(567*(390/rewt));
			} 
		}else{
			if(wt<=390){
				height=ht; 
				width=wt; 
			}else{
				width=390;
				height=Math.round(ht*(390/wt));
			}
		} 
		initJcrop(0,0,width,height);
 		initXYWH(0,0,width,height);
	} 

	//裁剪照片
	function onCut(){
		if(!document.getElementById("xuwanting"))return;
		else{ 
			var Img = new Image();
			Img.src=$("#hidden_img").attr("src");
			//原始的宽和高
			var hid_width=Img.width;
			var hid_height=Img.height;
			
			//现在的宽和高
			var width=$("#xuwanting").attr("width");
			var height=$("#xuwanting").attr("height");
			
			//剪裁的宽和高
			var w2=$("#w").val();
			var h2=$("#h").val();
			var x2=$("#x").val();
			var y2=$("#y").val();
			 
			//算出等比例的宽和高
			var w1=Math.round((hid_width*w2)/width);
			var h1=Math.round((hid_height*h2)/height);	
			var x1=Math.round((hid_width*x2)/width);
			var y1=Math.round((hid_height*y2)/height);	
			var picName=$("#oldhid_picName").val();

			//alert("hid_width:"+hid_width+" hid_height:"+hid_height+" width:"+width+" height:"+height+" w2:"+w2+" h2:"+h2+" w1:"+w1+" h1:"+h1); 
			showLayer('dialog','dialog_content',"<span style='text-align:center'><img align='top' style='z-index:10000;' alt='正在上传...' src='../image/loading.gif'/></span>");
			$.post("../public/public-user!ajaxCutStuPic.excsec",{"X":x1,"Y":y1,"width":w1,"height":h1,"picName":picName},function(data) {
				var newPicName = data.value;
				if(newPicName=="error"){
			 		alert("系统异常,裁剪失败"); 
				}else{
 					var url=$('#ava_url').val()+newPicName;
 					 
 					//设置高和宽
					var ht = h2;
					var wt=w2;
					var width;
					var height;
					
					if(ht>567){
						height = 567; 
						var rewt =Math.round(wt*(567/ht));
						 
						if(rewt<=390){
							width=rewt;
						}else{
							width=390;
							height=Math.round(567*(390/rewt));
						} 
					}else{
						if(wt<=390){
							height=ht; 
							width=wt; 
						}else{
							width=390;
							height=Math.round(ht*(390/wt));
						}
					} 
 					
			 		document.getElementById('define_ava_div').innerHTML='<center><img id="xuwanting" src="'+url+'"  width="'+width+'" height="'+height+'"/></center>';
			 		//保存图片名称
					$("#hid_picName").val(newPicName); 
					
					//剪裁成功后,隐藏放大和缩小
					$("#btnlager").hide();
					$("#btnsmall").hide();
					$("#btnrever").hide();
					//initJcrop(0,0,width,height);
			 		//initXYWH('','','','');
			 	} 
				closeLayer();//关闭提示层
			});	
		}
	}
	
	//还原照片
	function realsize(){
		if(!document.getElementById("xuwanting"))
			return ;
		
		/**var x=$("#x").val();
		var y=$("#y").val();
		var w=$("#w").val();
		var h=$("#h").val();
		alert("x:"+x+" Y:"+y+" w:"+w+" h:"+h); 
	 
		if(w==null || w=="" || h==null || h=="" || x==null || ""==x  || y==null || ""==y)
			return;**/
		//还原照片前先删除裁剪的照片
		var oldPicName = $("#oldhid_picName").val();
		var picName = $("#hid_picName").val();
	 	
		if(oldPicName==null || ""==oldPicName || picName==null || ""==picName) return;
		if(oldPicName!=picName){
			$.post("../public/public-user!ajaxDelStuPic.excsec",{"picName":picName},function(data) {
				$("#hid_picName").val(oldPicName);			
			});	
		} 
		
		//还原旧照片
		var Img = new Image();
		Img.src=$("#hidden_img").attr("src");
		var wt=Img.width;
		var ht=Img.height; 
		
		//设置高和宽 
		var width;
		var height;
		
		if(ht>567){
			height = 567; 
			var rewt =Math.round(wt*(567/ht));
			 
			if(rewt<=390){
				width=rewt;
			}else{
				width=390;
				height=Math.round(567*(390/rewt));
			} 
		}else{
			if(wt<=390){
				height=ht; 
				width=wt; 
			}else{
				width=390;
				height=Math.round(ht*(390/wt));
			}
		}  
 		document.getElementById('define_ava_div').innerHTML='<center><img id="xuwanting" src="'+Img.src+'"  width="'+width+'" height="'+height+'"/></center>'; 
 		
 		initJcrop(0,0,width,height);
 		initXYWH(0,0,width,height);

		//剪裁成功后,显示放大和缩小
		$("#btnlager").show();
		$("#btnsmall").show();
		$("#btnrever").show();
	}
	
	//获得高和宽的比率
	function getRate(){
		//还原旧照片
		var Img = new Image();
		Img.src=$("#hidden_img").attr("src");
		if(Img.height>Img.width)
			return (Img.height/Img.width);
		else if(Img.height==Img.width)
			return 1.2;
		else
			return (Img.width/Img.height);
	}
	 
