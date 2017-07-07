<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div class="row contentHeader">
	<div class="col-xs-16 polling PaddIngMargin">
		<div class="col-xs-3 PaddIngMargin">
			<span class="disBlock">设备编号: </span><input type="text" class="form-control inputName" id="deployCode1" placeholder="设备编号">
		</div>
		<div class="col-xs-3 PaddIngMargin">
			<span class="disBlock">设备名称: </span><input type="text" class="form-control inputName" id="macBrand1" placeholder="设备名称">
		</div>
		<div class="col-xs-3 PaddIngMargin">
			<span class="disBlock">设备型号: </span><input type="text" class="form-control inputName" id="macModel1" placeholder="设备型号">
		</div>
		<div class="col-xs-12 PaddIngMargin marginTopJL" style="margin:6px 0;">
			<div class="col-xs-3 PaddIngMargin">
				<span class="disBlock">机构名称: </span><input type="text" class="form-control inputName" id="unitName1" placeholder="机构名称">
			</div>
			<div class="col-xs-3 PaddIngMargin">
				<span class="disBlock disBlockVerTop">设备状态:</span>
				<div class="select-box select-city inputName text-left">
					<div class="select-header" id="macStauts" value="-1">请选择</div>
						<ul class="select-content">
							<li value="-1">请选择</li>
							<li value="0">初始</li>
							<li value="1">投入使用</li>
							<li value="2">停止使用</li>
						</ul>
				</div>
			</div>
		<div class="col-xs-3 PaddIngMargin">
			<span class="disBlock">出厂编号: </span><input type="text" class="form-control inputName" id="factoryCode1" placeholder="出厂编号">
		</div>
		<div class="col-xs-12">
			<button type="button" class="btn btn-primary btn_primary" data-toggle="modal" data-target="" id="query">查询</button>
			<button type="button" class="btn btn-primary btn_primary" data-toggle="modal" data-target="#addInformation">添加</button>
			<button type="button" class="btn btn-primary btn_primary" data-toggle="modal" data-target="#addDelete" id="delectInfor">删除</button>
		</div>
		</div>
	</div>
</div>
	
	
	<!--添加弹窗-->
	<div class="modal fade" id="addInformation" tabindex="-1" role="dialog" aria-labelledby="addMyModal" aria-hidden="true">
	  <div class="modal-dialog">
		<div class="modal-content addMymodal">
			<div class="row modal-header modalHeaderTop">
				<div class="col-xs-6 text-left modalHeaderTopI">
					<span class="modal-title text-left" id="addMyModal"> 添加部署 </span>
				</div>
				<div class="col-xs-6 text-right modalHeaderTopI">
					<span type="button" class="glyphicon glyphicon-remove data_hiding" data-dismiss="modal" aria-hidden="true"> </span>
				</div>
			</div>
			<div class="modal-body text-center">
				<form class="row" id="addInfor">
					<div class="col-xs-6 polling"><span class="textWidth"><span class="item">*</span>设备编号:</span>
						<input type="text" class="validate[required] validate[required]  form-control inputName"  id="deployCode"/>
					</div>
					
						<div class="col-xs-6 polling"><span class="textWidth LineHeightText">
							<span class="item">*</span>设备型号:</span>
							<div class="select-box select-city inputName text-left select_UlLi">
							    <div class="select-header" id="macModel"></div>
								    <ul class="select-content selectRquipment">
								    
								    </ul>
							 </div>
						</div>
						<!-- <input type="text" class="validate[required] form-control inputName"   /> -->
					
					<div class="col-xs-6 polling"><span class="textWidth"><span class="item">*</span>设备品牌:</span>
					<input type="text" class="validate[required] form-control inputName"  id="macBrand" readonly="readonly" /></div>
					<div class="col-xs-6 polling"><span class="textWidth"><span class="item">*</span>出厂编号:</span>
					<input type="text" class="validate[required] form-control inputName"  id="factoryCode" /></div>
					<div class="col-xs-6 polling"><span class="textWidth"><span class="item">*</span>IP地址:</span>
					<input type="text" class="validate[required] form-control inputName"  id="ipAddress" /></div>
					<div class="col-xs-6 polling"><span class="textWidth LineHeightText">
						<span class="item">*</span>所属机构:</span>
						<div class="select-box select-city inputName text-left">
						    <div class="select-header" id="unitName"></div>
							    <ul class="select-content selectRquipmentB">
							      <!-- <li>北京</li>
							      <li>河北省</li>
							      <li>山东省</li> -->
							    </ul>
						 </div>
					</div>

<%--deploy_info添加三个字段 --%>
					<div class="col-xs-6 polling"><span class="textWidth"><span class="item">*</span>端口号:</span>
					<input type="text" class="validate[required] form-control inputName"  id="port" /></div>

					<div class="col-xs-6 polling"><span class="textWidth"><span class="item">*</span>用户名:</span>
					<input type="text" class="validate[required] form-control inputName"  id="userName" /></div>

					<div class="col-xs-6 polling"><span class="textWidth"><span class="item">*</span>密码:</span>
					<input type="text" class="validate[required] form-control inputName"  id="password" /></div>

				</form>
			</div>
			<div class="modal-footer modalHeaderButtom">
				<button type="button" class="btn btn-primary BtnTop ClearZhiMoRen" data-dismiss="modal">取消</button>
				<button type="button" class="btn btn-primary BtnTop" id="addInforMaTYU">确定</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal -->
</div>



<!--编辑弹窗-->
<div class="modal fade addEditor" id="" tabindex="-1" role="dialog" aria-labelledby="addMyModal" aria-hidden="true">
	  <div class="modal-dialog">
		<div class="modal-content addMymodal">
			<div class="row modal-header modalHeaderTop">
				<div class="col-xs-6 text-left modalHeaderTopI">
					<span class="modal-title text-left" id="addMyModal"> 编辑部署 </span>
				</div>
				<div class="col-xs-6 text-right modalHeaderTopI">
					<span type="button" class="glyphicon glyphicon-remove data_hiding" data-dismiss="modal" aria-hidden="true"> </span>
				</div>
			</div>
			<div class="modal-body text-center">
				<form class="row" id="addInfor1">

					<div class="col-xs-6 polling"><span class="textWidth"><span class="item">*</span>设备编号:</span>
					<input type="text" class="validate[required] validate[required]  form-control inputName"  id="deployCode2" readonly="readonly"/></div>
					<div class="col-xs-6 polling"><span class="textWidth LineHeightText">
							<span class="item">*</span>设备型号:</span>
							<div class="select-box select-city inputName text-left select_UlLi">
							    <div class="select-header" id="macModel2"></div>
								    <ul class="select-content selectRquipment">
								    
								    </ul>
							 </div>
					</div>
					<div class="col-xs-6 polling"><span class="textWidth"><span class="item">*</span>设备品牌:</span>
					<input type="text" class="validate[required] form-control inputName"  id="macBrand2" readonly="readonly" /></div>
					
					<div class="col-xs-6 polling"><span class="textWidth"><span class="item">*</span>出厂编号:</span>
					<input type="text" class="validate[required] form-control inputName"  id="factoryCode2" /></div>
					<div class="col-xs-6 polling"><span class="textWidth"><span class="item">*</span>IP地址:</span>
					<input type="text" class="validate[required] form-control inputName"  id="ipAddress2" readonly="readonly"/></div>
					<div class="col-xs-6 polling"><span class="textWidth LineHeightText">
						<span class="item">*</span>所属机构:</span>
						<div class="select-box select-city inputName text-left">
						    <div class="select-header" id="unitName2"></div>
							    <ul class="select-content selectRquipmentB">
							    </ul>
						 </div>
					</div>

<%--deploy_info添加三个字段 --%>
					<div class="col-xs-6 polling"><span class="textWidth"><span class="item">*</span>端口号:</span>
					<input type="text" class="validate[required] form-control inputName"  id="port2" /></div>

					<div class="col-xs-6 polling"><span class="textWidth"><span class="item">*</span>用户名:</span>
					<input type="text" class="validate[required] form-control inputName"  id="userName2" /></div>

					<div class="col-xs-6 polling"><span class="textWidth"><span class="item">*</span>密码:</span>
					<input type="text" class="validate[required] form-control inputName"  id="password2" /></div>
					
				</form>
			</div>
			<div class="modal-footer modalHeaderButtom">
				<button type="button" class="btn btn-primary BtnTop ClearZhiMoRen" data-dismiss="modal">取消</button>
				<button type="button" class="btn btn-primary BtnTop"  id="bianjiInfor">确定</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal -->
</div>
<!--删除-->
<div class="modal fade" id="addDelete" tabindex="-1" role="dialog" aria-labelledby="addMyModal" aria-hidden="true">
	  <div class="modal-dialog">
		<div class="modal-content delecMymodal">
			<div class="row modal-header modalHeaderTop">
				<div class="col-xs-6 text-left modalHeaderTopI">
					<span class="modal-title text-left" id="addMyModal"> 删除部署 </span>
				</div>
				<div class="col-xs-6 text-right modalHeaderTopI">
					<span type="button" class="glyphicon glyphicon-remove " data-dismiss="modal" aria-hidden="true"> </span>
				</div>
			</div>
			<div class="modal-body text-center">
				<p class="pupInfor"><span class="glyphicon glyphicon-question-sign icoIfor"></span>您确定要删除吗？</p>
			</div>
			<div class="modal-footer modalButtom">
				<button type="button" class="btn btn-primary BtnTop" data-dismiss="modal">取消</button>
				<button type="button" class="btn btn-primary BtnTop" id="shebeiDelect">确定</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal -->
</div>
<!--设置权限-->
<div class="modal fade addMun" id="" tabindex="-1" role="dialog" aria-labelledby="addMyModal" aria-hidden="true">
	  <div class="modal-dialog">
		<div class="modal-content delecMymodal">
			<div class="row modal-header modalHeaderTop">
				<div class="col-xs-6 text-left modalHeaderTopI">
					<span class="modal-title text-left" id="addMyModal"> 设置权限 </span>
				</div>
				<div class="col-xs-6 text-right modalHeaderTopI">
					<span type="button" class="glyphicon glyphicon-remove " data-dismiss="modal" aria-hidden="true"> </span>
				</div>
			</div>
			<div class="modal-body text-center">
				<!--<p class="pupInfor"><span class="glyphicon glyphicon-question-sign icoIfor"></span>您确定要删除吗？</p>-->
				<div class="pupInfor" id="munAdd" style="height: 10px;border: 1px solid #CCCCCC;">
					
				</div>
			</div>
			<div class="modal-footer modalButtom">
				<button type="button" class="btn btn-primary BtnTop" data-dismiss="modal">取消</button>
				<button type="button" class="btn btn-primary BtnTop">确定</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal -->
</div>
	<div class="col-xs-12 PaddIngMargin">
		<table id="TableList" data-side-pagination="server" data-method="post" data-query-params="offetFunction" data-unique-id="deployCode" data-striped="true" data-url="<%=basePath%>/deploy/queryMac" style="height:auto; max-height:420px;" data-height="340" data-pagination="true" data-click-to-select="true" data-single-select="false">
			 	<thead>
					<tr>
						<th data-field="swact" data-checkbox="true" data-align="center"></th>
						<th data-field="deployCode" data-align="center">机器编号</th>
						<th data-field="macModel" data-align="center">设备型号</th>
						<th data-field="macBrand" data-align="center">设备品牌</th>
						<th data-field="factoryCode" data-align="center">出厂编号</th>
						<th data-field="unitName" data-align="center">机构名称</th>
				 		<th data-field="macStauts" data-align="center" data-formatter="usernameFormatter3">设备状态</th>
<!-- 				 		<th data-field="" data-align="center">视频信号</th> -->
				 		<th data-field="ipAddress" data-align="center">IP地址</th>
				 		<!-- <th data-field="remark" data-align="center">备注</th> -->
				 		<th data-field="createDate" data-align="center">登记日期</th>
				 		<th  data-field="port" data-visible="false" data-align="center"></th>
				 		<th  data-field="userName" data-visible="false" data-align="center"></th>
				 		<th  data-field="password" data-visible="false" data-align="center"></th>
				 		<th data-field="caozuo" data-align="center" data-formatter="usernameFormatter">操作</th>
					</tr>
				</thead>
         </table>
	</div>
<script>
	var userId = "";
	 $('#TableList').bootstrapTable();
	 //添加下拉框默认值
	 selectInformation(1,"<%=basePath%>deploy/selectMacModal");//设备型号
	 selectInformation(2,"<%=basePath%>deploy/selectUnitName");//所属机构 
	 function selectInformation(num,path){
		 $.ajax({
             url:path,
             cache:false,
             type:"post",
             datatype:'json',
             data:"",
             beforeSend:function(){},
             success:function(data){
            	 if(num == 1){
            		 console.log(data);
            		 $("#macModel").html(data[0].macModel);
                	 for(var i=0;i<data.length;i++){
                		 $(".selectRquipment").append("<li value="+data[i].macBrand+">"+data[i].macModel+"</li>")
                	 }
            	 }else{
            		 console.log(data);
            		 $("#unitName").html(data[0]);
                	 for(var i=0;i<data.length;i++){
                		 $(".selectRquipmentB").append("<li>"+data[i]+"</li>")
                	 }
            	 }
            	 $(".select-content li").click(function(){
            	        $(this).parent().siblings(".select-header").removeClass("select-arrow");
            	        $(this).parent().siblings(".select-header").html($(this).html()).end().slideUp("fast");
            	        $(this).parent().siblings(".select-header").attr("value",$(this).attr("value"));
            	        /* $("#macBrand").val($(this).attr("value"));
            	        $("#macBrand2").val($(this).attr("value")); */
            	 });
            	 $(".select_UlLi ul li").click(function(){//添加、编辑联动
         	        $("#macBrand").val($(this).attr("value"));
         	        $("#macBrand2").val($(this).attr("value"));
         	 	 });
            	 
            	 
             },
             complete:function(){},
             error:function(){}
         })
	 };
	 function usernameFormatter(value,row,index){/* &nbsp;<a onclick="start1(\''+row.deployCode+'\',2)">停止使用</a> */
		 var stop = "";
	 	var satusType = 0;
		 if(row.macStauts == 0){
			 stop = "投入使用";
			 satusType =  1;
		 }else if(row.macStauts == 1){
			 stop = "停止使用";
			 satusType =  2;
		 }else if(row.macStauts == 2){
			 stop = "投入使用";
			 satusType =  1;
		 }
	 	return '<a class="aMarGIn" onclick="start(\''+row.deployCode+'\')" data-toggle="modal" data-target=".addEditor">编辑</a><a onclick="start1(\''+row.deployCode+'\',\''+satusType+'\')">'+stop+'</a>';
	 }
	 function start(d){//获取当前选中行数据，回显操作；
	 	var row = $('#TableList').bootstrapTable('getRowByUniqueId', d);
	 	 $("#deployCode2").val(row.deployCode);
	 	 $("#macModel2").html(row.macModel);
	 	 $("#macBrand2").val(row.macBrand);
	 	 $("#factoryCode2").val(row.factoryCode);
	 	 $("#ipAddress2").val(row.ipAddress);
		$("#unitName2").html(row.unitName);
	 	 $("#port2").val(row.port);
	 	 $("#userName2").val(row.userName);
	 	 $("#password2").val(row.password);
		console.log(row)
	 	userId = d;
		 console.log(d)
	 }
	 function start1(d,satusType){
		 
		var row = $('#TableList').bootstrapTable('getRowByUniqueId', d);
		var macStauts = row.macStauts;
		var data = {deployCode:row.deployCode,macStauts:satusType};
		 addInfor(data,5,"<%=basePath%>deploy/updateDeployStatus")
	 }
	 function offetFunction(params){
		 var data = {
					pageSize:this.pageSize,
					pageNumber:this.pageNumber,
					macStauts:$("#macStauts").attr("value"),
					searchText:"",
					sortName:"",
					sortOrder:"" 
			}
			 console.log(params);
		 	return data;
	 }
	 //添加
	 $("#addInforMaTYU").on("click",function(){
		$("#addInfor").submit();
	 });
	 //编辑信息
	 $("#bianjiInfor").on("click",function(){
		 $("#addInfor1").submit();
	 });
	 //删除设备信息
	 function shebeiDelect(){
		 var option = $('#TableList').bootstrapTable("getAllSelections");
			var idList = [];
			$.each(option,function(i){
				idList.push(option[i].id);
			});
			var data = {macId:idList};
			addInfor(data,3,"<%=basePath%>deploy/deleteMac")
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
            	 console.log(data);
            	 if(data.success == true){
            		 $("#addInformation,.addEditor,#addDelete").modal("hide");
            		 Clear();
            		 if(num ==1){
            			publicPopups("ubus","","添加成功");
            		}else if(num == 2){
            			publicPopups("ubus","","编辑成功");
            		}else if(num == 3){
            			publicPopups("ubus","","删除成功");
            		}else if(num == 5){
            			publicPopups("ubus","","修改成功");
            		}
            	 }else{
            		 $("#addInformation,.addEditor,#addDelete").modal("hide");
            		 publicPopups("ubus","",data.errmsg);
            	 }
            	 $('#TableList').bootstrapTable("refresh",{silent:true});//刷新表格
             },
             complete:function(){},
             error:function(){}
         })
	 }
	 
	 
		//按条件查询
	 $("#query").click(function(){
		  var data = {deployCode:$("#deployCode1").val(),macBrand:$("#macBrand1").val(),
					  macModel:$("#macModel1").val(),unitName:$("#unitName1").val(),
					  factoryCode:$("#factoryCode1").val(),
					  macStauts:$("#macStauts").attr("value")
				     };
		 $('#TableList').bootstrapTable("refresh",{silent:true,query:data});
	 });
// 		翻译字段
	 function usernameFormatter3(value,row,index){
			var start = "";
			if(row.macStauts == "0"){
				start = "初始";
			}else if(row.macStauts == "1"){
				start = "投入使用";
			}else if(row.macStauts == "2"){
				start = "停止使用";
			}
			return start;
		}
		
// 		删除部署列表
	 $("#delectInfor").click(function(){
		 $(this).attr("data-target","");
		 var option = $('#TableList').bootstrapTable("getAllSelections");
		 if(option == ""){
			 publicPopups("ubus","","请选择想您要删除的数据");
		 }else{
			 $(this).attr("data-target","#addDelete");
		 }
	 });
	 
	 //删除设备信息
		$("#shebeiDelect").click(function(){
			 var option = $('#TableList').bootstrapTable("getAllSelections");
				var idList = [];
				$.each(option,function(i){
					idList.push(option[i].deployCode);
				});
				var data = {deployCode:""+idList};
				console.log(data);
				addInfor(data,3,"<%=basePath%>/deploy/deleteMac");
		});
		//清空值默认值
		 function Clear(){
			 $("#deployCode,#macBrand,#factoryCode,#ipAddress,#port,#userName,#password").val("");
			  $('form').validationEngine('hideAll');
		 }
		 $(".ClearZhiMoRen,.data_hiding").click(function(){
			  Clear();
		 });	 
	 
		//校验添加
		 (function valid(){
				$('#addInfor').validationEngine('attach', {
					relative: true,
					overflownDIV:"#divOverflown",
					promptPosition:"bottomLeft",
					maxErrorsPerField:1,
					onValidationComplete:function(form,status){
						if(status){
							 var data = {macBrand:$("#macBrand").val(),macModel:$("#macModel").html(),deployCode:$("#deployCode").val(),factoryCode:$("#factoryCode").val(),ipAddress:$("#ipAddress").val(),unitName:$("#unitName").html(),port:$("#port").val(),userName:$("#userName").val(),password:$("#password").val()};
							 addInfor(data,1,"<%=basePath%>deploy/addDeploy");
						}
					}
				});
				$('#addInfor1').validationEngine('attach', {
					relative: true,
					overflownDIV:"#divOverflown",
					promptPosition:"bottomLeft",
					maxErrorsPerField:1,
					onValidationComplete:function(form,status){
						if(status){
							 var data = {macBrand:$("#macBrand2").val(),macModel:$("#macModel2").html(),deployCode:$("#deployCode2").val(),factoryCode:$("#factoryCode2").val(),ipAddress:$("#ipAddress2").val(),unitName:$("#unitName2").html(),port:$("#port2").val(),userName:$("#userName2").val(),password:$("#password2").val()};
							 addInfor(data,2,"<%=basePath%>deploy/updateDeploy");
						}
					}
				});
			}()); 
</script>
<script type="text/javascript" src="../js/common/select.js" ></script>
<script type="text/javascript" src="../js/commonJsp/SystemsManagement.js" ></script>