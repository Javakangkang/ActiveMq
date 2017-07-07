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
		     
		    </ul>
	 	</div>
	 	<button type="button" class="btn btn-primary" id="videoAccess">视频接入</button>
	</div>
	<!-- 人脸识别内容 -->
	<div class="faceContent row imgPionsition">
		<div class="left col-xs-8">
			<div class="row">
				<div class="col-xs-12" >
					<img id="videoFrameqq" style="width:300px;margin-left: 20%;" class="img-responsive img-rounded text-center sendImgSrc" src="../images/common/defaultImg.jpg">
				</div>
			</div>
		</div>
		<div class="right col-xs-4">
			<p class="text-center">上传历史记录</p>
			<div class="row" id="historyTq">
				
			</div>
		</div>
		<div class="imgMousedownRight text-center" data-toggle="modal" data-target=".revisePasswordASB">添加</div>
	</div>
</div>
<div class="modal fade  revisePasswordASB" id="" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content Mymodal">
			<div class="row modal-header modalHeaderTop">
				<div class="col-xs-6 text-left modalHeaderTopI">
					<span class="modal-title text-left" id="myModalLabel">
											            	添加图片
											            </span>
				</div>
				<div class="col-xs-6 text-right modalHeaderTopI">
					<span type="button" class="glyphicon glyphicon-remove " data-dismiss="modal" aria-hidden="true">
											            </span>
				</div>
			</div>
			<div class="modal-body text-center" style="height:140px;padding-top:8px;position: relative;">
				<form class="row" id="addInfor1" >
					<div class="col-xs-12" style="margin-top: 44px;"><span class="textWidth"><span class="item">*</span>客户标识:</span><input type="text" class="validate[required]  form-control inputName" id="clientMark" /></div>
				</form>
			</div>
			<div class="modal-footer modalHeaderButtom">
				<button type="button" class="btn btn-primary modalBtn" data-dismiss="modal">取消
									            </button>
				<button type="button" class="btn btn-primary modalBtn" id="revisePassword12">
									              		确定
									            </button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal -->
</div>
<script type="text/javascript" src="../js/common/select.js" ></script>
<script type="text/javascript" src="../js/commonJsp/SystemsManagement.js" ></script>
<script>
	var pathJson = {path:""};
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
	$("#videoAccess").click(function(){
		var DeployCode = $("#videoSource").html().split("_");
		var data1 = {deployCode:DeployCode[0]};
		imgPath(data1,1,"<%=basePath%>sys/queryFaceImg");
	});
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
	        	 console.info(data);
	        	 if(data.success == false){
	        			publicPopups("Ase","",data.errmsg);
	        			return;
	        	 }
	        	  if(num==1){
	        		  $("#videoFrameqq").attr("src","data:image/jpeg;base64,"+data.list[0].sendImg+"");
		        	 $("#historyTq").empty();
		        	 for(var i=1;i<data.list.length;i++){
		        		$("#historyTq").append('<div class="col-xs-12 right_img_common text-center videoFrameImg2"><img style="width:200px;height:150px;" class="img-responsive img-rounded sendImgSrc" src=""></div>');
		        	 } 
		        	 for(var j=0;j<$(".videoFrameImg2").length;j++){
		        	   $(".videoFrameImg2").eq(j).find("img").attr("src","data:image/jpeg;base64,"+data.list[j+1].sendImg+"");
		        	 }
	        	 }else if(num == 2){
	        		 $(".imgMousedownRight").hide();
	        		 if(data.success == true){
	        			 publicPopups("ubus","","添加成功");
	        		 }
	        	 }
	        	  //实时刷新
	        	  if(data != ""){
	        		  var DeployCode = $("#videoSource").html().split("_");
	        		  var data1 = {deployCode:DeployCode[0]};
	        		  imgPath(data1,1,"<%=basePath%>sys/queryFaceImg");
	        	  }
	        	  //某元素组织右键点击事件去除鼠标右键
	        	    $(".sendImgSrc,.imgMousedownRight,.videoFrameImg2").bind("contextmenu", function(){
	        	        return false;
	        	    });
	        	  //获取点击图片的base64图片
	        		$(".sendImgSrc").mousedown(function(e){
	        			pathJson.path = $(this).attr("src").split(",")[1];
	        			var offset = $(this).offset();
	        			if(e.which == 3){//1左键 2鼠标滚轮 3鼠标右键
	        				$(".imgMousedownRight").show().css({
	        					"left":e.pageX-214+"px",
	        					"top":e.pageY-143+"px",
	        				});
	        			}else if(e.which == 1){
	        				$(".imgMousedownRight").hide();
	        			}
	        		});
	         },
	         complete:function(){},
	         error:function(){}
	     })
	}
	
	//添加客户
	$("#revisePassword12").click(function(){
		$(".revisePasswordASB").modal("hide");
		$("#addInfor1").submit();
	});
	//隐藏添加
	$(".imgMousedownRight").click(function(){
		$(this).hide();
	});
    /*清空默认值  */
	$(".modalBtn,.glyphicon").click(function(e){
		$("#clientMark").val("");
		 $('form').validationEngine('hideAll');
	});
	//校验添加
	(function valid(){
			$('#addInfor1').validationEngine('attach', {
				relative: true,
				overflownDIV:"#divOverflown",
				promptPosition:"bottomLeft",
				maxErrorsPerField:1,
				onValidationComplete:function(form,status){
					if(status){
						var data1 = {sendImg:pathJson.path,clientMark:$("#clientMark").val()};
						imgPath(data1,2,"<%=basePath%>sys/saveFaceImage"); 
					}
				}
			});
		}());
</script>
