<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="footer">

<div class="pro">
            <ul>
                <li>
                    <img src="imgs/baoyou.gif" alt="" /></li>
                <li>
                    <img src="imgs/baozhang.gif" alt="" /></li>
                <li>
                    <img src="imgs/baozhuang.gif" alt="" /></li>
                <li>
                    <img src="imgs/fukuan.gif" alt="" /></li>
                <li>
                    <img src="imgs/kefu.gif" alt="" /></li>
             </ul>
        </div>
        <div class="explain">
            <ul>
                <li>
                    <div class="content">
                        <span>购物流程</span>
                        <ul class="title">
                            <li><a target="_blank" href="#">网站购物流程</a></li>
                            <li><a target="_blank" href="#">会员积分计划</a> </li>
                            <li><a target="_blank" href="#">优惠券说明</a></li>
                            <li><a target="_blank" href="#">常见问题</a></li>
                        </ul>
                    </div>
                </li>
                <li>
                    <div class="content">
                        <span>如何付款</span>
                        <ul class="title">
                            <li><a target="_blank" href="#">支付方式</a></li>
                            <li><a target="_blank" href="#">发票制度说明</a></li>
                            <li><a target="_blank" href="#">礼品卡使用说明</a></li>
                        </ul>
                    </div>
                </li>
                <li>
                    <div class="content">
                        <span>售后服务</span>
                        <ul class="title">
                            <li><a target="_blank" href="#">退换货规则</a></li>
                            <li><a target="_blank" href="#">退换货流程</a></li>
                            <li><a target="_blank" href="#">如何退款</a></li>
                        </ul>
                    </div>
                </li>
                <li>
                    <div class="content">
                        <span>配送方式</span>
                        <ul class="title">
                            <li><a target="_blank" href="#">配送范围及时间</a> </li>
                            <li><a target="_blank" href="#"> 配送收费标准</a></li>
                        </ul>
                    </div>
                </li>
                <li>
                    <div class="content">
                        <span>帮助信息</span>
                        <ul class="title">
                            <li><a target="_blank" href="#">关于我们</a> </li>
                            <li><a target="_blank" href="#">联系我们</a></li>
                            <li><a target="_blank" href="#">企业采购</a></li>
                            <li><a target="_blank" href="#">友情链接</a> </li>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>
        <div class="copy">
             <a href="#" target="_blank" rel="nofollow">沪ICP备13008612号</a> | <a
                href="#" target="_blank">营业执照</a><br>
            Copyright 2011-2013 www.cynmsx.com 版权所有</div>
        <div class="pic">
            <a href="#" target="_blank" alt="上海网警网络110"><img src="imgs/police.jpg" /></a>
            <a href="#" target="_blank"><img src="imgs/zx110.jpg"  alt="网络社会征信网" /></a>
            <a href="#" target="_blank"><img src="imgs/shgs.jpg" alt="上海工商"/></a>
        </div>
    </div>
 <script type=text/javascript>
    var obj11 = document.getElementById("winner");
    var top11 = getTop(obj11);
    var isIE6 = /msie 6/i.test(navigator.userAgent);
    window.onscroll = function(){
	  var bodyScrollTop = document.documentElement.scrollTop || document.body.scrollTop;
	  if (bodyScrollTop > top11){
		obj11.style.position = (isIE6) ? "absolute" : "fixed";
		obj11.style.top = (isIE6) ? bodyScrollTop + "px" : "0px";
	   } else {
		obj11.style.position = "static";
	  }
   };
   
   function getTop(e){
	 var offset = e.offsetTop;
	 if(e.offsetParent != null) offset += getTop(e.offsetParent);
	 return offset;
   }
</script>