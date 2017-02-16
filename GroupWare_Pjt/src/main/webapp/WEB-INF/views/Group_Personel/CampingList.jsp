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
<title>전체캠핑목록</title>
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
															  		+"<th>캠핑번호</th>"
															  		+"<th>지 &nbsp; 역</th>"
															  		+"<th>캠&nbsp; 핑 장</th>"
															  		+"<th>사&nbsp; 업 주</th>"
															  		+"<th>전화번호</th>"
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
																		+ "<td colspan='5' style='text-align:center'> <b>검색 결과가 없습니다</b> </td>";
																	+"</tr>"
			}
		},
	});
}
</script>
<div class='container' style='min-height:720px'>
	<div class='row'>
		<div class='page-header'>
			<h4>캠핑정보관리</h4>
		</div>
	</div>
	<div class='row'>
		<div class="btn-group btn-group-justified" role="group" aria-label="...">
		  <div class="btn-group" role="group">
		    <button type="button" class="btn btn-info" onclick="camping_list('서울')">서울</button>
		  </div>
		  <div class="btn-group" role="group">
		    <button type="button" class="btn btn-success" onclick="camping_list('부산')">부산</button>
		  </div>
		  <div class="btn-group" role="group">
		    <button type="button" class="btn btn-warning" onclick="camping_list('대구')">대구</button>
		  </div>
		   <div class="btn-group" role="group">
		    <button type="button" class="btn btn-primary" onclick="camping_list('인천')">인천</button>
		  </div>
		  <div class="btn-group" role="group">
		    <button type="button" class="btn btn-danger" onclick="camping_list('광주')">광주</button>
		  </div>
		</div>
	</div>
	<div class='row'>
		<div class="btn-group btn-group-justified" role="group" aria-label="...">
		  <div class="btn-group" role="group">
		    <button type="button" class="btn btn-info" onclick="camping_list('대전')">대전</button>
		  </div>
		  <div class="btn-group" role="group">
		    <button type="button" class="btn btn-success" onclick="camping_list('경기')">경기</button>
		  </div>
		  <div class="btn-group" role="group">
		    <button type="button" class="btn btn-warning" onclick="camping_list('강원')">강원</button>
		  </div>
		  <div class="btn-group" role="group">
		    <button type="button" class="btn btn-primary" onclick="camping_list('충북')">충북</button>
		  </div>
		   <div class="btn-group" role="group">
		    <button type="button" class="btn btn-danger" onclick="camping_list('충남')">충남</button>
		  </div>
		</div>
	</div>
	<div class='row'>
		<div class="btn-group btn-group-justified" role="group" aria-label="...">
		 <div class="btn-group" role="group">
		    <button type="button" class="btn btn-info" onclick="camping_list('전북')">전북</button>
		  </div>
		   <div class="btn-group" role="group">
		    <button type="button" class="btn btn-success" onclick="camping_list('전남')">전남</button>
		  </div>
		  <div class="btn-group" role="group">
		    <button type="button" class="btn btn-warning" onclick="camping_list('경북')">경북</button>
		  </div>
		  <div class="btn-group" role="group">
		    <button type="button" class="btn btn-primary" onclick="camping_list('경남')">경남</button>
		  </div>
		  <div class="btn-group" role="group">
		    <button type="button" class="btn btn-danger" onclick="camping_list('제주')">제주</button>
		  </div>
		</div>
	</div>
	<div class="row" style='margin-top:5px;'>
	  <div class="col-xs-12 col-md-4 col-md-offset-8">
	    <div class="input-group">
	      <input type="text" class="form-control" placeholder="캠핑장을 입력해주세요" id='camping_value'>
	      <span class="input-group-btn">
	        <button class="btn btn-default" type="button" id='id_search' onclick='search_list()'>검 색</button>
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