;Modernizr.load({//按需加载
	test: Modernizr.mq('only all'),//想要支持Modernizr.mq需选择带mq的modernizr
	nope: 'js/respond.js'
});
$(function() {
	/*slider初始化*/
	/*$('.slider li').eq(0).css({
		'opacity': '1',
		'filter':'alpha(opacity=100)'
	})*/
	var slider_index = 1;
	var slitimer = setInterval(slifun, 3000);
	/*手动*/
	$('.control li').hover(function() {
		$(this).find('img').addClass('control-hover');
	}, function() {
		$(this).find('img').removeClass('control-hover');
	}).click(function(event) {
		if (!$(this).find('img').hasClass('control-selected')) {
			clearInterval(slitimer);
			var this_index = $('.control li').index(this);
			$('.control li').find('img').removeClass('control-selected');
			$(this).find('img').addClass('control-selected');
			Change(this_index, preSliderIndex(slider_index));
			slider_index = nextSliderIndex(this_index);
			slitimer = setInterval(slifun, 3000);
		}
	});
	/*自动*/

	function slifun() {
		$('.control li').find('img').removeClass('control-selected').end().eq(slider_index).find('img').addClass('control-selected');
		Change(slider_index, preSliderIndex(slider_index))
		slider_index = nextSliderIndex(slider_index);
	}

	function Change(index, prv) {
		$('.slider li').eq(index).fadeIn(600);
		$('.slider li').eq(prv).fadeOut(600);
	}

	function nextSliderIndex(index) {
		return index + 1 >= $('.slider li').size() ? 0 : index + 1;
	};

	function preSliderIndex(index) {
		return index - 1 <= -1 ? $('.slider li').size() - 1 : index - 1;
	}

	/*years-ago*/
	var today = new Date();
	$('#years-ago .date').html(today.getMonth() + 1 + ' 月 ' + today.getDate() + ' 日 ' + '星期' + '日一二三四五六'.charAt(today.getDay()));
	/*年份*/
	var first = $('.random-color').map(function(index, elem) {
		var num = /(\d)年/.exec($(elem).html())
		return num[1];
	}).get();
	$('.random-color').each(function(index, el) {
		$(el).addClass('rc' + first[index]);
	});

	$('span.learn-more').hover(function() {
		$(this).css('background', '#222')
	}, function() {
		$(this).css('background', '#009175')
	});
	/*展开收起*/
	(function(){
	var $years_ago_ps=$('.years-ago-content p');
	var toggle=1;
	var h1=0;
	var h2=0;
	function togg() {
		if(toggle==1){
		$('.years-ago-content').animate({
			height:h2
		}, 400);
		toggle=2;
		$(this).html('收起更多内容')
		}else if(toggle==2){
		$('.years-ago-content').animate({
			height:h1
		}, 400);
		toggle=1;
		$(this).html('了解更多')
		}
	}

	if($years_ago_ps.length<2){
	h1=$('.years-ago-content').height();
	$('.years-ago-content').height(h1);
	$('.years-ago-content').append('<p style="text-align:center">已经是全部内容</p>');
	$('.years-ago-content p').each(function(index, el) {
		h2+=$(el).outerHeight();
	});
	$('.learn-more .learn-more').click(togg);
	}else{
		$years_ago_ps.each(function(index, el) {
			if(index<=1){
				h1+=$(el).outerHeight();
			}
			h2+=$(el).outerHeight();
		});
		$('.years-ago-content').height(h1);
		$('.learn-more .learn-more').click(togg);
	}
	})()
/*vadio hover*/
	$('.vadios a').hover(function(){
		$(this).parent().find('p').addClass('hover');
	},function(){
		$(this).parent().find('p').removeClass('hover');
	})

})