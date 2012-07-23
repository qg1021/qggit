// JavaScript Document 切换标签 JS   By Mad.JonIrenicus
	function tab(n, count,refresh){
		var tabnav = "tab" + n;
		var tabid = "tabid" + n;
		cleardisplay(count);
		document.getElementById(tabnav).className="switch_tab_current";
		document.getElementById(tabid).style.display = "block";
		if(refresh){
			var frame = document.getElementById(tabid).getElementsByTagName("iframe")[0];
			if(frame){
				frame.contentWindow.location.reload();
			}
		}
	}
	function cleardisplay(count) {
		for (i=1;i<=count;i++) {
			var cleartabid = "tabid" + i;
			var tabnav = "tab" + i;
			document.getElementById(cleartabid).style.display = "none";
			document.getElementById(tabnav).className="";
		}
	}
	
