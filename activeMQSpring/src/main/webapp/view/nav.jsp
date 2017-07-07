<div class="list">
	<p class="personalInfor"><i></i><span id="loginInfor"></span></p>
	<ul class="leftMenu" id="LiftMenuContent"></ul>
	
</div>
<script type="text/javascript" src="../js/commonJsp/nav.js" ></script>
<script>
$(function(){

	var a=GetRequest();
	var index_1=a['loginName'];
	$("#loginInfor").html(index_1);
});

/*左侧菜单伸拉效果*/
	/*$(".subNav").click(function(){
			$(this).toggleClass("currentDd").siblings(".subNav").removeClass("currentDd")
			$(this).toggleClass("currentDt").siblings(".subNav").removeClass("currentDt")
			
			// 修改数字控制速度， slideUp(500)控制卷起速度
			$(this).next(".navContent").slideToggle(500).siblings(".navContent").slideUp(500);
	});*/
</script>