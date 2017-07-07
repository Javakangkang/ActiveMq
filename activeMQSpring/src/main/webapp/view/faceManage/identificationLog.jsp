<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div class="row contentHeader">
	<div class="col-xs-12 polling PaddIngMargin">
		<div class="col-xs-3 PaddIngMargin">
			<span class="disBlock">设备编号: </span><input type="text" class="form-control inputName" id="sbbh" placeholder="设备编号">
		</div>
		<!-- <div class="col-xs-3 PaddIngMargin">
			<span class="disBlock">设备名称: </span><input type="text" class="form-control inputName" id="" placeholder="设备名称">
		</div> -->
		<div class="col-xs-3 PaddIngMargin">
			<span class="disBlock">设备型号: </span><input type="text" class="form-control inputName" id="sbxh" placeholder="设备型号">
		</div>
		<div class="col-xs-12 PaddIngMargin marginTopJL">
			<div class="col-xs-3 PaddIngMargin">
				<span class="disBlock">机构名称: </span><input type="text" class="form-control inputName" id="jgmc" placeholder="机构名称">
			</div>
			<div class="col-xs-3 PaddIngMargin">
				<span class="disBlock disBlockVerTop">设备状态:</span>
				<div class="select-box select-city inputName text-left">
					<div class="select-header" id="sbzt" value="-1">请选择 </div>
						<ul class="select-content">
							<li value="-1">请选择</li>
							<li value="0">初始</li>
							<li value="1">启用</li>
							<li value="2">停用</li>
						</ul>
				</div>
				<!--<span class="disBlock">设备状态: </span>-->
			<!--	<input type="text" class="form-control inputName" id="" placeholder="上级机构" />-->
			</div>
			<div class="col-xs-6 PaddIngMargin">
				<button type="button" class="btn btn-primary btn_primary" data-toggle="modal" data-target="" id="chaxun">查询</button>
			</div>
		</div>
	</div>
</div>
<!-- 弹窗 -->
<!--添加弹窗-->
	<div class="modal fade hitDetail" id="hitDetail" tabindex="-1" role="dialog" aria-labelledby="addMyModal" aria-hidden="true">
	  <div class="modal-dialog">
		<div class="modal-content addMymodal">
			<div class="row modal-header modalHeaderTop">
				<div class="col-xs-6 text-left modalHeaderTopI">
					<span class="modal-title text-left">命中详情</span>
				</div>
				<div class="col-xs-6 text-right modalHeaderTopI">
					<span type="button" class="glyphicon glyphicon-remove " data-dismiss="modal" aria-hidden="true"></span>
				</div>
			</div>
			<div class="modal-body text-center">
				<div class="row">
					<div class="col-xs-6">
						<img id="sendImg" style="height:285px" class="img-responsive img-rounded" src="../images/common/defaultImg.jpg">
						<p class="text-center text_common">视频头像</p>
					</div>
					<div class="col-xs-6">
						<img id="result" style="height:285px" class="img-responsive img-rounded" src="../images/common/defaultImg.jpg">
						<p class="text-center text_common">命中头像</p>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-6">
						<div class="form-group">
							<span class="col-xs-6 hitDetail_inpt_common">处理耗时(毫秒)：</span>
							<div class="col-xs-6 hitDetail_inpt_common">
								<input type="text" class="form-control" readonly="readonly" id = "computeTime">
							</div>
						</div>
					</div>
					<div class="col-xs-6">
						<div class="form-group">
							<span class="col-xs-6 hitDetail_inpt_common">相似度：</span>
							<div class="col-xs-6 hitDetail_inpt_common">
								<input type="text" class="form-control" readonly="readonly" id = "sameScore">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
			</div>
		</div>
	</div>
</div>
<!-- 表格数据 -->
<div class="col-xs-12 PaddIngMargin">
	 <table data-height="380" data-side-pagination="server" data-response-handler="filterInfor" id="TableList" data-method="post" data-query-params="offetFunction" data-unique-id="faceLogId" data-striped="true" data-url="<%=basePath%>sys/faceLog" data-pagination="true" data-click-to-select="true" data-single-select="false" >
	 	<thead>
	 		<tr>
		 		<th data-field="faceLogId" data-align="center">流水号</th>
		 		<!-- <td>机器编号</td> -->
	 			<th data-field="deployCode" data-align="center">设备编号</th>
	 			<th data-field="macModel" data-align="center">设备型号</th> 
	 	    	<th data-field="unitName" data-align="center">机构名称</th>
	 	    	<th data-field="macStauts" data-align="center" data-formatter="usernameFormatter3">设备状态</th>
		 		<th data-field="createDate" data-align="center">登记时间</th>
		 		<th data-field="sameScore" data-align="center">相似度</th>
		 		<th data-field="computeTime" data-align="center">耗时(毫秒)</th>
		 		<th data-field="caozuo" data-align="center" data-formatter="usernameFormatter">操作</th>
		 	</tr>
	 	</thead>
  </table>
</div>
<script type="text/javascript" src="../js/common/select.js" ></script>
<script type="text/javascript" src="../js/commonJsp/SystemsManagement.js" ></script>

<script>
 $('#TableList').bootstrapTable();
//  详情按钮
 function usernameFormatter(value,row,index){
 	return '<a class="aMarGIn" onclick="start(\''+row.faceLogId+'\')" data-toggle="modal" data-target=".hitDetail">详情</a>';
 }
//  点击详情，回填数据
 function start(d){//获取当前选中行数据
 	var row = $('#TableList').bootstrapTable('getRowByUniqueId', d);
 	var data = {faceLogId:row.faceLogId};
 	addInfor(data,1,"<%=basePath%>sys/queryImg");
 }
//  翻译设备状态字段
 function usernameFormatter3(value,row,index){
		var start = "";
		if(row.macStauts == "0"){
			start = "初始";
		}else if(row.macStauts == "1"){
			start = "启用";
		}else if(row.macStauts == "2"){
			start = "停用";
		}
		return start;
	}
/*  onClickRow */
 function offetFunction(params){
	 var data = {
				pageSize:this.pageSize,
				pageNumber:this.pageNumber,
				searchText:"",
				sortName:"",
				sortOrder:"",
				macStauts:$("#sbzt").attr("value")
				
		}
		 console.log(params);
	 	return data;
 }
 function filterInfor(res){
	 return res;
 }
//添加/编辑设备公共方法封装
 function addInfor(data,num,path){
	 $.ajax({
         url:path,
         cache:false,
         type:"post",
         datatype:'json',
         data:data,
         beforeSend:function(){},
         success:function(data){ 
        	 console.info(data.list.sendImg);
        	 if(data.success == false){
     			publicPopups("Ase","",data.errmsg);
     			return;
     	 	}
        	 if(data.success == true){
        		 $("#sendImg").attr("src","data:image/jpeg;base64,"+data.list.sendImg+"");
        		 $("#result").attr("src","data:image/jpeg;base64,"+data.list.result+"");
        		 $("#sameScore").val(data.list.sameScore+"%");
        		 $("#computeTime").val(data.list.computeTime);
        	 }
         },
         complete:function(){},
         error:function(){}
     })
 }
</script>