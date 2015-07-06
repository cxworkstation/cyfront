function orderfu(type,classifyId){
	var page=$('#div').attr("page");
	$.ajax({
		url:basePath+"category/orderby.html",
		dataType:"json",
		type:"GET",
		data:"type="+type+"&page="+page+"&classifyId="+classifyId,//type firstClassify +"&firstClassify="+firstClassify,
		success:function(data){
		for(var i=0;i<data.length;i++){
			var listgoods=data[i].listGoods;
			var s="<ul>";
			for(var k=0;k<listgoods.length;k++){
				s+="<li class=\"pitem\"  _trackproid=\"111014147\" style=\"position:relative;\" _hasstock=\"True\"><div class=\"divproduct\">";
				s+="<div class=\"divimg\"><a href=\"#\" target=\"_blank\"><img src=\""+listgoods[k].image+"\" alt=\""+listgoods[k].name+listgoods[k].size+"\"></a></div>";
			    s+="<div class=\"pname_div\"><a href=\"#\" title=\""+listgoods[k].name+listgoods[k].size+"\" target=\"_blank\">"+listgoods[k].name+listgoods[k].size+"</a></div>";
			    s+="<div class=\"price_div\"><span class=\"pcprice_sp\">"+listgoods[k].price+"</span> <span class=\"pmprice_sp\">￥<del>99.00</del></span></div>";
			    s+="<div class=\"divbtn\"><div class=\"btn instock\"></div></div><div class=\"tag\" title=\""+listgoods[k].introduction+"\">"+listgoods[k].introduction+"</div>";
				s+="</div></li>";
			}
			 s+="</ul>";
			 $('#region_right'+i).html(s);
		}
		}
	});
}
	function pricefu(type){
		var page=$('#div').attr("page");
		var num=$('#div').attr("num");
		var str="type="+type+"&page="+page;
		for(var j=0;j<num;j++){
			var temp=$('#classifyId'+j).attr("classify2");
			str+="&num"+j+"="+temp;
		}
		str+="&number="+num;
		$.ajax({
		url:basePath+"category/searchPrice.html",
		dataType:"json",
		type:"post",
		data:str,
		success:function(data){
			for(var i=0;i<data.length;i++){
			var listgoods=data[i].listGoods;
			var s="<ul>";
			for(var k=0;k<listgoods.length;k++){
				s+="<li class=\"pitem\"  _trackproid=\"111014147\" style=\"position:relative;\" _hasstock=\"True\"><div class=\"divproduct\" id=\"k\">";
				s+="<div class=\"divimg\"><a href=\"#\" target=\"_blank\"><img src=\""+listgoods[k].image+"\" alt=\""+listgoods[k].name+listgoods[k].size+"\"></a></div>";
			    s+="<div class=\"pname_div\"><a href=\"#\" title=\""+listgoods[k].name+listgoods[k].size+"\" target=\"_blank\">"+listgoods[k].name+listgoods[k].size+"</a></div>";
			    s+="<div class=\"price_div\"><span class=\"pcprice_sp\">"+listgoods[k].price+"</span> <span class=\"pmprice_sp\">￥<del>99.00</del></span></div>";
			    s+="<div class=\"divbtn\"><div class=\"btn instock\"></div></div><div class=\"tag\" title=\""+listgoods[k].introduction+"\">"+listgoods[k].introduction+"</div>";
				s+="</div></li>";
			}
			s+="</ul>";
			 $('#region_right'+i).html(s);
			 if(listgoods.length<10){
					for(var j=listgoods.length;j<10;j++){
					$('#'+j).remove();
					}
				}
		}
		}
		});
}
	
	function changePage(type){
		var page=$('#div').attr("page");
		var s="page="+page;
		var num=$('#div').attr("num");
		if(type=='1'){
			$('#div').attr("page",page+1);
		}else{
			$('div').attr("page",page-1);
		}
		for(var j=0;j<num;j++){
			var temp=$('#classifyId'+j).attr("classify2");
			s+="&num"+j+"="+temp;
		}
		s+="&number="+num;
		$.ajax({
			url:basePath+"category/changePage.html",
			dataType:"json",
			type:"post",
			data:s,
			success:function(data){
			for(var i=0;i<data.length;i++){
			var listgoods=data[i].listGoods;
			var s="<ul>";
			for(var k=0;k<listgoods.length;k++){
				s+="<li class=\"pitem\"  _trackproid=\"111014147\" style=\"position:relative;\" _hasstock=\"True\"><div class=\"divproduct\">";
				s+="<div class=\"divimg\"><a href=\"#\" target=\"_blank\"><img src=\""+listgoods[k].image+"\" alt=\""+listgoods[k].name+listgoods[k].size+"\"></a></div>";
			    s+="<div class=\"pname_div\"><a href=\"#\" title=\""+listgoods[k].name+listgoods[k].size+"\" target=\"_blank\">"+listgoods[k].name+listgoods[k].size+"</a></div>";
			    s+="<div class=\"price_div\"><span class=\"pcprice_sp\">"+listgoods[k].price+"</span> <span class=\"pmprice_sp\">￥<del>99.00</del></span></div>";
			    s+="<div class=\"divbtn\"><div class=\"btn instock\"></div></div><div class=\"tag\" title=\""+listgoods[k].introduction+"\">"+listgoods[k].introduction+"</div>";
				s+="</div></li>";
			}
			 s+="</ul>";
			 $('#region_right'+i).html(s);
		}
		}
		});
	}
	function doit(){
		var heightPrice=$('#hightPrice').val();
		var lowPrice=$('#lowprice').val();
		var page=$('#div').attr("page");
		var num=$('#div').attr("num");
		var str="lowPrice="+lowPrice+"&heightPrice="+heightPrice+"&page="+page;
		for(var j=0;j<num;j++){
			var temp=$('#classifyId'+j).attr("classify2");
			str+="&num"+j+"="+temp;
		}
		str+="&number="+num;
		$.ajax({
		url:basePath+"category/searchPrice1.html",
		dataType:"json",
		type:"post",
		data:str,
		success:function(data){
			for(var i=0;i<data.length;i++){
			var listgoods=data[i].listGoods;
			var s="<ul>";
			for(var k=0;k<listgoods.length;k++){
				s+="<li class=\"pitem\"  _trackproid=\"111014147\" style=\"position:relative;\" _hasstock=\"True\"><div class=\"divproduct\" id=\"k\">";
				s+="<div class=\"divimg\"><a href=\"#\" target=\"_blank\"><img src=\""+listgoods[k].image+"\" alt=\""+listgoods[k].name+listgoods[k].size+"\"></a></div>";
			    s+="<div class=\"pname_div\"><a href=\"#\" title=\""+listgoods[k].name+listgoods[k].size+"\" target=\"_blank\">"+listgoods[k].name+listgoods[k].size+"</a></div>";
			    s+="<div class=\"price_div\"><span class=\"pcprice_sp\">"+listgoods[k].price+"</span> <span class=\"pmprice_sp\">￥<del>99.00</del></span></div>";
			    s+="<div class=\"divbtn\"><div class=\"btn instock\"></div></div><div class=\"tag\" title=\""+listgoods[k].introduction+"\">"+listgoods[k].introduction+"</div>";
				s+="</div></li>";
			}
			s+="</ul>";
			 $('#region_right'+i).html(s);
			 if(listgoods.length<10){
					for(var j=listgoods.length;j<10;j++){
					$('#'+j).remove();
					}
				}
		}
		}
		});
	}