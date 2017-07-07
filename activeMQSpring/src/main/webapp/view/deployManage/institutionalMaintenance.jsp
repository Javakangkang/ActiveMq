<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div class="row contentHeader">
	<div class="col-xs-12 polling PaddIngMargin">
		<div class="col-xs-3 PaddIngMargin">
			<span class="disBlock">机构名称: </span><input type="text" class="form-control inputName" id="unitName1" placeholder="机构名称">
		</div>
		<!-- <div class="col-xs-3 PaddIngMargin">
			<span class="disBlock">上级机构: </span><input type="text" class="form-control inputName" id="" placeholder="上级机构">
		</div> -->
		<div class="col-xs-6 PaddIngMargin">
			<button type="button" class="btn btn-primary btn_primary" data-toggle="modal" data-target="" id="query">查询</button>
			<button type="button" class="btn btn-primary btn_primary" data-toggle="modal" data-target="#addInformation">添加</button>
			<button type="button" class="btn btn-primary btn_primary" data-toggle="modal" data-target="#addDelete" id="delectInfor">删除</button>
		</div>
		</div>
	</div>
	
	<!--添加弹窗-->
	<div class="modal fade" id="addInformation" tabindex="-1" role="dialog" aria-labelledby="addMyModal" aria-hidden="true">
	  <div class="modal-dialog">
		<div class="modal-content addMymodal">
			<div class="row modal-header modalHeaderTop">
				<div class="col-xs-6 text-left modalHeaderTopI">
					<span class="modal-title text-left" id="addMyModal"> 添加机构 </span>
				</div>
				<div class="col-xs-6 text-right modalHeaderTopI">
					<span type="button" class="glyphicon glyphicon-remove data_hiding" data-dismiss="modal" aria-hidden="true">  </span>
				</div>
			</div>
			<div class="modal-body text-center">
				<form class="row" id="addInfor">
					<div class="col-xs-6 polling">
						<span class="textWidth"><span class="item">*</span>机构编号:</span>
						<input type="text" class="validate[required]  form-control inputName" id="unitCode"/>
					</div>
					<div class="col-xs-6 polling">
						<span class="textWidth">机构名称:</span>
						<input type="text" class="form-control inputName" id="unitName"/>
					</div>
					<div class="col-xs-6 polling">
						<span class="textWidth"><span class="item">*</span>机构地址:</span>
						<input type="text" class="validate[required] form-control inputName" id="address"/>
					</div>
					
					<div class="col-xs-6 polling">
						<span class="textWidth"><span class="item">*</span>管理人:</span>
						<input type="text" class="validate[required] form-control inputName" id="manager"/>
					</div>
					<div class="col-xs-6 polling">
						<span class="textWidth"><span class="item">*</span>Email:</span>
						<input type="text" class="validate[required] form-control inputName" id="email"/>
					</div>
					
					<div class="col-xs-6 polling">
						<span class="textWidth">
						<span class="item">*</span>机构电话:</span>
						<input type="text" class="validate[required] form-control inputName" id="unitTel"/>
					</div>
					<div class="col-xs-6 polling">
						<span class="textWidth">手机号:</span>
						<input type="text" class="form-control inputName" id="phone"/>
					</div>
					<div class="col-xs-6 polling"><span class="textWidth LineHeightText">
						<span class="item">*</span>机构状态:</span>
						<div class="select-box select-city inputName text-left">
						    <div class="select-header" id="status" value="1">正常</div>
							    <ul class="select-content">
							      <li value="1">正常 </li>
							      <li value="0">废弃</li>
							    </ul>
						 </div>
					</div>
				</form>
			</div>
			<div class="modal-footer modalHeaderButtom">
				<button type="button" class="btn btn-primary BtnTop ClearZhiMoRen" data-dismiss="modal">取消
									            </button>
				<button type="button" class="btn btn-primary BtnTop" id="addInforMaTYU"> 确定 </button>
			</div>
		</div>
	</div>
</div>
<!--编辑弹窗-->
<div class="modal fade addEditor" id="" tabindex="-1" role="dialog" aria-labelledby="addMyModal" aria-hidden="true">
	  <div class="modal-dialog">
		<div class="modal-content addMymodal">
			<div class="row modal-header modalHeaderTop">
				<div class="col-xs-6 text-left modalHeaderTopI">
					<span class="modal-title text-left" id="addMyModal"> 编辑用户 </span>
				</div>
				<div class="col-xs-6 text-right modalHeaderTopI">
					<span type="button" class="glyphicon glyphicon-remove " data-dismiss="modal" aria-hidden="true"> </span>
				</div>
			</div>
		<div class="modal-body text-center">
				<form class="row" id="addInfor">
					<div class="col-xs-6 polling">
						<span class="textWidth"><span class="item">*</span>机构编号:</span>
						<input type="text" class="validate[required]  form-control inputName" id="unitCodeModify" readonly="readonly"/>
					</div>
					<div class="col-xs-6 polling">
						<span class="textWidth">机构名称:</span>
						<input type="text" class="form-control inputName" id="unitNameModify"/>
					</div>
					<div class="col-xs-6 polling">
						<span class="textWidth"><span class="item">*</span>机构地址:</span>
						<input type="text" class="validate[required] form-control inputName" id="addressModify"/>
					</div>
					
					<div class="col-xs-6 polling">
						<span class="textWidth"><span class="item">*</span>管理人:</span>
						<input type="text" class="validate[required] form-control inputName" id="managerModify"/>
					</div>
					<div class="col-xs-6 polling">
						<span class="textWidth"><span class="item">*</span>Email:</span>
						<input type="text" class="validate[required] form-control inputName" id="emailModify"/>
					</div>
					
					<div class="col-xs-6 polling">
						<span class="textWidth">
						<span class="item">*</span>机构电话:</span>
						<input type="text" class="validate[required] form-control inputName" id="unitTelModify"/>
					</div>
					<div class="col-xs-6 polling">
						<span class="textWidth">手机号:</span>
						<input type="text" class="form-control inputName" id="phoneModify"/>
					</div>
					<div class="col-xs-6 polling"><span class="textWidth LineHeightText">
						<span class="item">*</span>机构状态:</span>
						<div class="select-box select-city inputName text-left">
						    <div class="select-header" id="statusModify" value="">正常 </div>
							    <ul class="select-content">
							      <li value="1">正常 </li>
							      <li value="0">废弃</li>
							    </ul>
						 </div>
					</div>
				</form>
			</div>
			<div class="modal-footer modalHeaderButtom">
				<button type="button" class="btn btn-primary BtnTop" data-dismiss="modal">取消
									            </button>
				<button type="button" class="btn btn-primary BtnTop" id="bianjiInfor">确定</button>
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
					<span class="modal-title text-left" id="addMyModal">
											            	删除设备
											            </span>
				</div>
				<div class="col-xs-6 text-right modalHeaderTopI">
					<span type="button" class="glyphicon glyphicon-remove " data-dismiss="modal" aria-hidden="true">
											            </span>
				</div>
			</div>
			<div class="modal-body text-center">
				<p class="pupInfor"><span class="glyphicon glyphicon-question-sign icoIfor"></span>您确定要删除吗？</p>
			</div>
			<div class="modal-footer modalButtom">
				<button type="button" class="btn btn-primary BtnTop" data-dismiss="modal">取消
									            </button>
				<button type="button" class="btn btn-primary BtnTop" id="shebeiDelect">
									              		确定
									            </button>
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
					<span class="modal-title text-left" id="addMyModal">
											            	设置权限
											            </span>
				</div>
				<div class="col-xs-6 text-right modalHeaderTopI">
					<span type="button" class="glyphicon glyphicon-remove " data-dismiss="modal" aria-hidden="true">
											            </span>
				</div>
			</div>
			<div class="modal-body text-center">
				<!--<p class="pupInfor"><span class="glyphicon glyphicon-question-sign icoIfor"></span>您确定要删除吗？</p>-->
				<div class="pupInfor" id="munAdd" style="height: 10px;border: 1px solid #CCCCCC;">
					
				</div>
			</div>
			<div class="modal-footer modalButtom">
				<button type="button" class="btn btn-primary BtnTop" data-dismiss="modal">取消
									            </button>
				<button type="button" class="btn btn-primary BtnTop">
									              		确定
									            </button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal -->
</div>
	<div class="col-xs-12 PaddIngMargin">
			<table id="TableList" data-side-pagination="server" data-method="post" data-query-params="offetFunction" data-unique-id="unitCode" data-striped="true" data-url="<%=basePath%>deploy/queryUnits" style="height:auto; max-height:420px;" data-pagination="true" data-height="430" data-click-to-select="true" data-single-select="false">
		 	<thead>
				<tr>
					<th  data-width="5%" data-field="swact" data-checkbox="true" data-align="center"></th>
					<th data-field="unitCode" data-align="center">机构编号</th>
					<th data-field="unitName" data-align="center">机构名称</th>
					<th data-field="address" data-align="center">机构地址</th>
					<th data-field="unitTel" data-align="center">机构电话</th>
			 		<th data-field="manager" data-align="center">管理人</th>
			 		<th data-field="email" data-align="center">Email地址</th>
			 		<th data-field="phone" data-align="center">手机</th>
			 		<th data-field="status" data-align="center" data-formatter="usernameFormatter1">机构状态</th>
			 		<!-- <th data-field="parentCode" data-align="center">上级机构</th> -->
			 		<th data-field="caozuo" data-align="center" data-formatter="usernameFormatter">操作</th>
				</tr>
			</thead>
         </table>
	</div>
</div>
<script type="text/javascript" src="../js/common/select.js" ></script>
<script type="text/javascript" src="../js/commonJsp/SystemsManagement.js" ></script>

<script>
	 $('#TableList').bootstrapTable();
	 function usernameFormatter(value,row,index){
		 	return '<a class="aMarGIn" onclick="start(\''+row.unitCode+'\')" data-toggle="modal" data-target=".addEditor">编辑</a>';
	 }
	 function start(d){//获取当前选中行数据
		 console.log(d)
		 	var row = $('#TableList').bootstrapTable('getRowByUniqueId', d);
			 $("#unitCodeModify").val(row.unitCode);
		 	 $("#unitNameModify").val(row.unitName);
		 	 $("#addressModify").val(row.address); 
		 	 $("#managerModify").val(row.manager); 
		 	 $("#unitTelModify").val(row.unitTel); 
		 	 $("#emailModify").val(row.email); 
		 	 $("#phoneModify").val(row.phone); 
		 	 $("#statusModify").attr("value",row.status); 
		 	unitCode = row.unitCode;
		 }
	 function offetFunction(params){
		 var data = {
					pageSize:this.pageSize,
					pageNumber:this.pageNumber,
					searchText:"",
					sortName:"",
					sortOrder:"" 
			}
			 console.log(params);
		 	return data;
	 }
	 function usernameFormatter1(value,row,index){
		 var start = "";
		 if(row.status == "1"){
			 start = "正常";
		 }else if(row.status == "0"){
			 start = "废弃";
		 }
		 return start;
	 }
	//添加
	 $("#addInforMaTYU").on("click",function(){
		 $("#addInfor").submit();
	 });
	 function addInforMationAce(){
		 var data = {unitCode:$("#unitCode").val(),
				 	 unitName:$("#unitName").val(),
				     address:$("#address").val(),
				     manager:$("#manager").val(),
				     unitTel:$("#unitTel").val(),
				     email:$("#email").val(),
				     phone:$("#phone").val(),
				     status:$("#status").attr("value")
				    };
		 console.log(data);
		 addInfor(data,1,"<%=basePath%>deploy/addUnit");
	 }
	 
	 //编辑信息
	 $("#bianjiInfor").on("click",function(){
		 var data = {
			         unitCode   : $("#unitCodeModify").val(),
			         unitName   : $("#unitNameModify").val(),
			         address    : $("#addressModify").val(),
			         manager    : $("#managerModify").val(),
			         unitTel    : $("#unitTelModify").val(),
			         email      : $("#emailModify").val(),
			         phone      : $("#phoneModify").val(),
			         status     : $("#statusModify").attr("value")
				    };
		 console.log(data);
		 addInfor(data,2,"<%=basePath%>deploy/updateUnit");
	 });
	
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
	//清空值默认值
	 function Clear(){
		 $("#unitCode,#unitName,#address,#manager,#email,#unitTel,#phone").val("");
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
						addInforMationAce();
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
						modifyParm();
					}
				}
			});
		}()); 
	
	//按条件查询
	 $("#query").click(function(){
		  var data = {unitName:$("#unitName1").val()
				      
				     };
		 $('#TableList').bootstrapTable("refresh",{silent:true,query:data});
	 });
	
	
	 function modifyParm(){
		 var data = {
				     unitCode   : $("#unitCodeModify").val(),
			         unitName   : $("#unitNameModify").val(),
			         address    : $("#addressModify").val(),
			         manager    : $("#managerModify").val(),
			         unitTel    : $("#unitTelModify").val(),
			         email      : $("#emailModify").val(),
			         phone      : $("#phoneModify").val(),
			         status   : $("#statusModify").attr("value"),
				     unitCode   : unitCode
				    };
		 addInfor(data,2,"<%=basePath%>deploy/updateUnit");
	 }
	 
	 
	 //删除设备信息
		$("#shebeiDelect").click(function(){
			 var option = $('#TableList').bootstrapTable("getAllSelections");
				var idList = [];
				$.each(option,function(i){
					idList.push(option[i].unitCode);
				});
				var data = {unitCode:""+idList};
				console.log(data);
			  addInfor(data,3,"<%=basePath%>deploy/deleteUnit");
				
				
		});
		 $("#delectInfor").click(function(){
			 $(this).attr("data-target","");
			 var option = $('#TableList').bootstrapTable("getAllSelections");
			 if(option == ""){
				 publicPopups("ubus","","请选择想您要删除的数据");
			 }else{
				 $(this).attr("data-target","#addDelete");
			 }
		 });
</script>
