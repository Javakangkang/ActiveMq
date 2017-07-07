<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div class="faceRecognition">
	<!-- 视频源选择 -->
	<div class="title">
		<span>请选择摄像头：</span>
		<div class="select-box select-city inputName text-left">
	    <div class="select-header" id="videoSource"> 视频源 </div>
		    <ul class="select-content" id="videoSource1">
		      <!-- <li>视频源1</li>
		      <li>视频源2</li>
		      <li>视频源3</li> -->
		    </ul>
	 	</div>
	 	<button type="button" class="btn btn-primary" id="videoAccess">摄像机接入</button>
	</div>
	<!-- 人脸识别内容 -->
	<div class="faceContent row">
		<div class="left col-xs-8">
			<div class="row facePosition">
				<div class="col-xs-5 PaddIngMargin">
					<img id="videoFrame" class="img-responsive img-rounded" src="../images/common/defaultImg.jpg">
					<p class="text-center text_common">摄像机头像</p>
				</div>
				<div class="col-xs-2 faceSemblance PaddIngMargin text-center" style="font-size:14px;">相似度:<span id="faceSemblanceX"></span></div>
				<div class="col-xs-5 PaddIngMargin">
					<img id="hitImage" class="img-responsive img-rounded" src="../images/common/defaultImg.jpg">
					<p class="text-center text_common">命中头像</p>
				</div>	
				
			</div>
		</div>
		<div class="right col-xs-4">
			<p class="text-center">命中头像历史记录</p>
			<div class="row" id="historyT">
				
			</div>
		</div>
	</div>
</div>
<script type="text/javascript" src="../js/common/select.js" ></script>
<script type="text/javascript" src="../js/commonJsp/SystemsManagement.js" ></script>
<script>

	(function(){
		 
		$.ajax({
	         url:"<%=basePath%>camera/selectUseCameraList",
	         cache:false,
	         type:"post",
	         datatype:'json',
	         data:"",
	         beforeSend:function(){},
	         success:function(data){ 
	        	$("#videoSource").html(data.rows[0]);
	        	for(var i=0;i<data.rows.length;i++){
	        		$("#videoSource1").append("<li>"+data.rows[i]+"</li>")
	        	}
	        	$(".select-content li").click(function(){
        	        $(this).parent().siblings(".select-header").removeClass("select-arrow");
        	        $(this).parent().siblings(".select-header").html($(this).html()).end().slideUp("fast");
        	 	});
	         },
	         complete:function(){},
	         error:function(){}
	     })
	}());
	$("#videoAccess").on("click",function(){
		// inTimer = setTimeout(function(){  //定時器
			var DeployCode = $("#videoSource").html().split("_");
			var data1 = {deployCode:DeployCode[0]};
			imgPath(data1,2,"<%=basePath%>sys/queryFaceResultImg");
		 //}, 1000);
		
	});
	<%-- 	imgPath(data,1,"<%=basePath%>camera/selectSendImgByDeployCode"); --%>
	function imgPath(data,num,path){//图片动态地址
		console.log(data);
		$.ajax({
	         url:path,
	         cache:false,
	         type:"post",
	         datatype:'json',
	         data:data,
	         beforeSend:function(){},
	         success:function(data){ 
	        	 if(data.success == false){
	        			publicPopups("Ase","",data.errmsg);
	        			return;
	        	 }
	        	 if(num==1){
		        	 //$("#hitImage").attr("src","../images/TestFaceImg/"+data+"")//视频头像
	        	 }else{
	        		 console.info(data);
	        		 if(data.list[0].sendImg == ""){
	        			 $("#videoFrame").attr("src","../images/common/defaultImg.jpg");//摄像机头像
	        		 }else{
	        			 $("#videoFrame").attr("src","data:image/jpeg;base64,"+data.list[0].sendImg+"");//摄像机头像
	        		 } if(data.list[0].result == ""){
	        			 $("#hitImage").attr("src","../images/common/defaultImg.jpg");//命中头像
	        		 }else{
	        			 $("#hitImage").attr("src","data:image/jpeg;base64,"+data.list[0].result+"");//命中头像
	        		 }
		        	 $("#faceSemblanceX").html(data.list[0].sameScore+"%");//相似度
		        	 $("#historyT").empty();
		        	 for(var i=1;i<data.list.length;i++){
		        		$("#historyT").append('<div class="col-xs-5 right_img_common videoFrameImg1"><img class="img-responsive img-rounded" src=""></div><div class="col-xs-2 PaddIngMargin text-center faceSemblance"><p>相似度</p><span class="resembleBach"></span></div>');
		        		$("#historyT").append('<div class="col-xs-5 right_img_common videoFrameImg"><img class="img-responsive img-rounded" src=""></div>');
		        	 } 
		        	 for(var j=0;j<$(".videoFrameImg").length;j++){
		        		 if(data.list[j+1].sendImg == ""){
		        			 $(".videoFrameImg").eq(j).find("img").attr("src","../images/common/defaultImg.jpg");
		        		 }else{
		        			 $(".videoFrameImg1").eq(j).find("img").attr("src","data:image/jpeg;base64,"+data.list[j+1].sendImg+"");
		        		 } if(data.list[j+1].result == ""){
		        			 $(".videoFrameImg").eq(j).find("img").attr("src","../images/common/defaultImg.jpg");
		        		 }else{
		        			 $(".videoFrameImg").eq(j).find("img").attr("src","data:image/jpeg;base64,"+data.list[j+1].result+"");
		        		 }
		        		 $(".resembleBach").eq(j).html(data.list[j+1].sameScore+"%");
		        		 
		        	 }
		        	 if(data != ""){
		        		 var DeployCode = $("#videoSource").html().split("_");
		     			 var data1 = {deployCode:DeployCode[0]};
		     			 imgPath(data1,2,"<%=basePath%>sys/queryFaceResultImg");
		        	 }
	        	 }
	         },
	         complete:function(){},
	         error:function(){}
	     })
	}
</script>
