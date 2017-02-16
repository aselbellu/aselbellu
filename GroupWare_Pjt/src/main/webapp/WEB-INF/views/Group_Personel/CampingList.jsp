<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<style>
	.row div {
		padding-left:0px;
		padding-right: 0px;
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��üķ�θ��</title>
</head>
<body>
<script type="text/javascript">
function camping_list(si){
	$.ajax({
		type : "post",
		url : "masterList.camping",
		data: {si:si},
		dataType : "json",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		error : function(x,e) {
			
		},
		success : function(data) {
			document.getElementById("camping_list").innerHTML = "<tr>"
															  		+"<th>ķ�ι�ȣ</th>"
															  		+"<th>�� &nbsp; ��</th>"
															  		+"<th>ķ&nbsp; �� ��</th>"
															  		+"<th>��&nbsp; �� ��</th>"
															  		+"<th>��ȭ��ȣ</th>"
															  +	"</tr>";
			if(data != ''){
				for(var i = 0 ; i < data.length ; i++){
				var list_view = "<tr>"
							  	+	"<td>"+ data[i].CAMPING_NO +"</td>"
							  	+	"<td>"+ data[i].CAMPING_AREA +"</td>"
							  	+	"<td>"+ data[i].CAMPING_CAMPINGSITE +"</td>"
							  	+	"<td>"+ data[i].CAMPING_BUISNESSMAN +"</td>"
							  	+	"<td>"+ data[i].CAMPING_PHONE +"</td>"
							  	+"</tr>";
				document.getElementById("camping_list").innerHTML += list_view;
				}
			} else {
				document.getElementById("camping_list").innerHTML += "<tr>"
																		+ "<td colspan='5' style='text-align:center'> <b>�˻� ����� �����ϴ�</b> </td>";
																	+"</tr>"
			}
		},
	});
}
</script>
<div class='container' style='min-height:720px'>
	<div class='row'>
		<div class='page-header'>
			<h4>ķ����������</h4>
		</div>
	</div>
	<div class='row'>
		<div class="btn-group btn-group-justified" role="group" aria-label="...">
		  <div class="btn-group" role="group">
		    <button type="button" class="btn btn-info" onclick="camping_list('����')">����</button>
		  </div>
		  <div class="btn-group" role="group">
		    <button type="button" class="btn btn-success" onclick="camping_list('�λ�')">�λ�</button>
		  </div>
		  <div class="btn-group" role="group">
		    <button type="button" class="btn btn-warning" onclick="camping_list('�뱸')">�뱸</button>
		  </div>
		   <div class="btn-group" role="group">
		    <button type="button" class="btn btn-primary" onclick="camping_list('��õ')">��õ</button>
		  </div>
		  <div class="btn-group" role="group">
		    <button type="button" class="btn btn-danger" onclick="camping_list('����')">����</button>
		  </div>
		</div>
	</div>
	<div class='row'>
		<div class="btn-group btn-group-justified" role="group" aria-label="...">
		  <div class="btn-group" role="group">
		    <button type="button" class="btn btn-info" onclick="camping_list('����')">����</button>
		  </div>
		  <div class="btn-group" role="group">
		    <button type="button" class="btn btn-success" onclick="camping_list('���')">���</button>
		  </div>
		  <div class="btn-group" role="group">
		    <button type="button" class="btn btn-warning" onclick="camping_list('����')">����</button>
		  </div>
		  <div class="btn-group" role="group">
		    <button type="button" class="btn btn-primary" onclick="camping_list('���')">���</button>
		  </div>
		   <div class="btn-group" role="group">
		    <button type="button" class="btn btn-danger" onclick="camping_list('�泲')">�泲</button>
		  </div>
		</div>
	</div>
	<div class='row'>
		<div class="btn-group btn-group-justified" role="group" aria-label="...">
		 <div class="btn-group" role="group">
		    <button type="button" class="btn btn-info" onclick="camping_list('����')">����</button>
		  </div>
		   <div class="btn-group" role="group">
		    <button type="button" class="btn btn-success" onclick="camping_list('����')">����</button>
		  </div>
		  <div class="btn-group" role="group">
		    <button type="button" class="btn btn-warning" onclick="camping_list('���')">���</button>
		  </div>
		  <div class="btn-group" role="group">
		    <button type="button" class="btn btn-primary" onclick="camping_list('�泲')">�泲</button>
		  </div>
		  <div class="btn-group" role="group">
		    <button type="button" class="btn btn-danger" onclick="camping_list('����')">����</button>
		  </div>
		</div>
	</div>
	<div class="row" style='margin-top:5px;'>
	  <div class="col-xs-12 col-md-4 col-md-offset-8">
	    <div class="input-group">
	      <input type="text" class="form-control" placeholder="ķ������ �Է����ּ���" id='camping_value'>
	      <span class="input-group-btn">
	        <button class="btn btn-default" type="button" id='id_search' onclick='search_list()'>�� ��</button>
	      </span>
	    </div><!-- /input-group -->
	  </div><!-- /.col-lg-6 -->
	</div><!-- /.row -->
	<div class="table-responsive">
		 <table class="table table-bordered" style='margin-top:10px' id="camping_list">
		 </table>
	</div>
</div>

</body>
</html>