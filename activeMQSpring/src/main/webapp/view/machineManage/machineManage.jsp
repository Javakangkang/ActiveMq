<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div class="row contentHeader">
	<div class="col-xs-12 polling PaddIngMargin">
		<div class="col-xs-3 PaddIngMargin">
			<span class="disBlock">设备品牌: </span><input type="text" class="form-control inputName" id="shebiBBJ" placeholder="设备品牌">
		</div>
		<div class="col-xs-3 PaddIngMargin">
			<span class="disBlock">规格型号: </span><input type="text" class="form-control inputName" id="guiGXH" placeholder="规格型号">
		</div>
		<div class="col-xs-6 PaddIngMargin">
			<button type="button" class="btn btn-primary btn_primary" data-toggle="modal" data-target="" id="chaxun">查询</button>
			<button type="button" class="btn btn-primary btn_primary" data-toggle="modal" data-target="#addInformation">添加</button>
			<!--<button type="button" class="btn btn-primary btn_primary" data-toggle="modal" data-target="#addEditor">编辑</button>-->
			<button type="button" class="btn btn-primary btn_primary" data-toggle="modal" id="delectInfor">删除</button>
			<!--<button type="button" class="btn btn-primary btn_primary" data-toggle="modal" data-target="#addMun">菜单配置</button>-->
		</div>
		</div>
	</div>
	
	<!--添加弹窗-->
	<div class="modal fade" id="addInformation" tabindex="-1" role="dialog" aria-labelledby="addMyModal" aria-hidden="true">
	  <div class="modal-dialog">
		<div class="modal-content addMymodal">
			<div class="row modal-header modalHeaderTop">
				<div class="col-xs-6 text-left modalHeaderTopI">
					<span class="modal-title text-left" id="addMyModal">
											            	添加设备
											            </span>
				</div>
				<div class="col-xs-6 text-right modalHeaderTopI">
					<span type="button" class="glyphicon glyphicon-remove data_hiding" data-dismiss="modal" aria-hidden="true">
											            </span>
				</div>
			</div>
			<div class="modal-body text-center">
				<form class="row" id="addInfor">
					<div class="col-xs-6 polling"><span class="textWidth"><span class="item">*</span>设备品牌:</span><input type="text" class="validate[required]  form-control inputName" id="macBrand" /></div>
					<div class="col-xs-6 polling"><span class="textWidth"><span class="item">*</span>规格型号:</span><input type="text" class="validate[required] form-control inputName" id="macModel" /></div>
					
					<div class="col-xs-12 polling"><span class="col-xs-2 PaddIngMargin">备注:</span><p class="col-xs-10 PaddIngMargin"><textarea type="text" id="remark" class="form-control PaddIngMargin" style="margin-left:-9px;width:506px;height:72px;resize:none;"></textarea></p></div>
				</form>
			</div>
			<div class="modal-footer modalHeaderButtom">
				<button type="button" class="btn btn-primary BtnTop ClearZhiMoRen" data-dismiss="modal">取消
									            </button>
				<button type="button" class="btn btn-primary BtnTop" id="addInforMaTYU">确定 </button>
									              		
									           
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
					<span class="modal-title text-left" id="addMyModal">
											            	编辑设备
											            </span>
				</div>
				<div class="col-xs-6 text-right modalHeaderTopI">
					<span type="button" class="glyphicon glyphicon-remove " data-dismiss="modal" aria-hidden="true">
											            </span>
				</div>
			</div>
			<div class="modal-body text-center">
				<form class="row" id="addInfor1" >
					<div class="col-xs-6 polling"><span class="textWidth"><span class="item">*</span>设备品牌:</span><input type="text" class="validate[required]  form-control inputName"id="macBrand1" /></div>
					<div class="col-xs-6 polling"><span class="textWidth"><span class="item">*</span>规格型号:</span><input type="text" class="validate[required] form-control inputName" id="macModel1" /></div>
					<div class="col-xs-12 polling"><span class="col-xs-2 PaddIngMargin">备注:</span><p class="col-xs-10 PaddIngMargin"><textarea type="text" class="form-control PaddIngMargin" id="remark1" style="margin-left:-9px;width:506px;height:72px;resize:none;"></textarea></p></div>
				</form>
			</div>
			<div class="modal-footer modalHeaderButtom">
				<button type="button" class="btn btn-primary BtnTop" data-dismiss="modal">取消
									            </button>
				<button type="button" class="btn btn-primary BtnTop" id="bianjiInfor">
									              		确定
									            </button>
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
<!--图片管理-->
<div class="modal fade addMun" id="" tabindex="-1" role="dialog" aria-labelledby="addMyModal" aria-hidden="true">
	  <div class="modal-dialog">
		<div class="modal-content delecMymodal">
			<div class="row modal-header modalHeaderTop">
				<div class="col-xs-6 text-left modalHeaderTopI">
					<span class="modal-title text-left" id="addMyModal">
											            	图片管理
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
		 <table id="TableList" style="height:auto; max-height:430px;" data-height="430" data-side-pagination="server" data-method="post" data-query-params="offetFunction" data-unique-id="macId" data-striped="true" data-url="<%=basePath%>mac/queryMacInfo" data-pagination="true" data-click-to-select="true" data-single-select="false">
		 	<thead>
				<tr>
					<th  data-width="5%" data-field="swact" data-checkbox="true" data-align="center"></th>
					<th  data-field="macId" data-visible="false" data-align="center"></th>
					<th data-width="15%" data-field="macBrand" data-align="center">设备品牌</th>
					<th data-width="15%" data-field="macModel" data-align="center">规格型号</th>
					<!-- <th data-field="imgId" data-align="center">图片</th> -->
					<th data-width="30%" data-field="remark" data-align="center">备注</th>
			 		<th data-width="10%" data-field="createDate" data-align="center">录入时间</th>
			 		<th data-width="5%" data-field="creater" data-align="center">创建人</th>
			 		<th data-width="13%" data-field="caozuo" data-align="center" data-formatter="usernameFormatter">操作</th>
				</tr>
			</thead>
         </table>
	</div>
<script type="text/javascript" src="../js/common/select.js" ></script>
<script type="text/javascript" src="../js/commonJsp/SystemsManagement.js" ></script>
<script>
var userId = "";
	 $('#TableList').bootstrapTable();
	 function usernameFormatter(value,row,index){
	 	return '<a class="aMarGIn" onclick="start('+row.macId+')" data-toggle="modal" data-target=".addEditor">编辑</a>';
	 	/* return '<a class="aMarGIn" onclick="start('+row.macId+')" data-toggle="modal" data-target=".addEditor">编辑</a><a class="aMarGIn" data-toggle="modal" data-target=".addMun">图片管理</a>'; */
	 }
	 function start(d){//获取当前选中行数据
	 	var row = $('#TableList').bootstrapTable('getRowByUniqueId', d);
		 $("#macBrand1").val(row.macBrand);
	 	 $("#macModel1").val(row.macModel);
	 	 $("#remark1").val(row.remark); 
	 	userId = row.macId;
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
	 //添加
	 $("#addInforMaTYU").on("click",function(){
		 $("#addInfor").submit();
	 });
	 function addInforMationAce(){
		 var data = {macBrand:$("#macBrand").val(),macModel:$("#macModel").val(),remark:$("#remark").val()};
		 addInfor(data,1,"<%=basePath%>mac/addMacInfo");
	 }
	 //编辑信息
	 $("#bianjiInfor").on("click",function(){

		$("#addInfor1").submit();
	 });
	 function shangchu(){
		 var data = {macBrand:$("#macBrand1").val(),macModel:$("#macModel1").val(),remark:$("#remark1").val(),macId:userId};
		 addInfor(data,2,"<%=basePath%>mac/updateMacInfo");
	 }
	 //删除设备信息
	$("#shebeiDelect").click(function(){
		 var option = $('#TableList').bootstrapTable("getAllSelections");
			var idList = [];
			$.each(option,function(i){
				idList.push(option[i].macId);
			});
			var data = {macId:""+idList};
			console.log(data);
		  addInfor(data,3,"<%=basePath%>mac/deleteMacInfo");
			
			
	});
	 $("#delectInfor").click(function(){
		 $(this).attr("data-target","");
		 var option = $('#TableList').bootstrapTable("getAllSelections");
		/*  data-target="#addDelete" */
		 if(option == ""){
			 publicPopups("ubus","","请选择想您要删除的数据");
		 }else{
			 $(this).attr("data-target","#addDelete");
		 }
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
	$("#macBrand,#macModel,#remark").val("");
	$('form').validationEngine('hideAll');
}
$(".ClearZhiMoRen,.data_hiding").click(function(){
	Clear();
});
	//按条件查询
	 $("#chaxun").click(function(){
		  var data = {macBrand:$("#shebiBBJ").val(),macModel:$("#guiGXH").val()};
		 $('#TableList').bootstrapTable("refresh",{silent:true,query:data});
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
						shangchu();
					}
				}
			});
		}()); 
</script>
