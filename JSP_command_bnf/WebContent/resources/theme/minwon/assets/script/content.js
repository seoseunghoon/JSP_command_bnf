"use strict";

$(function(){
	var tabNum = getParameter("tabNum");
	
	if(tabNum != ""){
		$('.minwon_tabmenu > ul > li').removeClass("active");
		$('.minwon_subcont').hide();
		$('.minwon_tabmenu > ul > li > a[href="#'+Number(tabNum)+'"]').parent().addClass("active");
		$('.minwon_subcont#tab'+Number(tabNum)).show();
	}
	
	$('.minwon_tabmenu > ul > li > a').click(function(){
		var num = $(this).parent().index();
		$('.minwon_tabmenu > ul > li').removeClass("active");
		$('.minwon_subcont').hide();
		$(this).parent().addClass('active');
		$('.minwon_subcont:eq('+num+')').show();
		return false;
	});
	$('.minwon_tabmenu5 > ul > li > a').click(function(){
		var num = $(this).parent().index();
		$('.minwon_tabmenu5 > ul > li > a').removeClass("active");
		$('.minwon_subcont').hide();
		$(this).addClass('active');
		$('.minwon_subcont:eq('+num+')').show();
		return false;
	});
	$('.minwon_tabmenu2.sub1 a').click(function(){
		var num = Number($(this).attr('href').substring(1));
		$('.minwon_tabmenu2.sub1').find('a').removeClass("active");
		$('.minwon_subsubcont1').hide();
		$(this).addClass('active');
		$('.minwon_subsubcont1:eq('+(num-1)+')').show();
		return false;
	});
	$('.minwon_tabmenu2.sub2 a').click(function(){
		var num = Number($(this).attr('href').substring(1));
		$('.minwon_tabmenu2.sub2').find('a').removeClass("active");
		$('.minwon_subsubcont2').hide();
		$(this).addClass('active');
		$('.minwon_subsubcont2:eq('+(num-1)+')').show();
		return false;
	});
});