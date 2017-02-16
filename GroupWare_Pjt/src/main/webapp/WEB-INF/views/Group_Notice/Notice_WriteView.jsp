<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function(){
		today_date();
	});
	$(document).on("click","#file_add",function(){
		if($("input[name=FILE_INFO]").length >= 2){
			alert('파일 업로드는 2개까지 가능합니다');
		} else {
			var str;
			str =   "<div class='col-md-6'>" +
					"	<div class='row'>" +
					"		<input type='file' class='form-control' name='FILE_INFO'>" +
					"   </div>" +
					"</div>";
			$("#file_list").append(str);
		}
	});
	
	function today_date(){
		var d = new Date();
		var yyyy = d.getFullYear();
		var mm = d.getMonth()+1;
		var dd = d.getDate();
		
		if (dd < 10)
			dd = '0'+dd;
		if (mm < 10)
			mm = '0'+mm;
		
		var today = yyyy+"-"+mm+"-"+dd;
		$('#WRITE_DATE').val(today);
	}
</script>
</head>
<body>
	<div class='alert alert-info' role='alert'>
		<h4 class='alert-heading'>작성 하기</h4>
		<p><small>공지 / 행사 공지 내용을 작성해주세요</small>		
	</div>
			<div class='card'>
				<div class='card-header'>
					공지 작성
				</div>
				<div class='card-block'>
					<div class='col-md-12'>
						<div class='row'><!-- 분류 / 제목 -->
							<div class="form-group col-md-3">
								<label for="formGroupExampleInput"><i class="fa fa-th-list" aria-hidden="true"></i> 분류</label>
								<div class="input-group">
									<select class='form-control'>
										<option value=''>선택</option>
										<option value='행사일정'>행사일정</option>
										<option value='공지사항'>공지사항</option>
									</select>
								</div>
							</div>
							<div class="form-group col-md-9">
								<label for="formGroupExampleInput"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> 제 목</label>
								<div class="input-group">
									<input type="text" class="form-control" name='NAME_KOR'>
								</div>
							</div>
						</div><!-- 분류 / 제목 -->
						<div class='row'><!-- 파일 업로드 -->
							<div class="form-group col-md-12">
								<label for="formGroupExampleInput"><i class="fa fa-upload" aria-hidden="true"></i>
									 첨부파일
									 <button class='btn btn-outline-info btn-sm' id='file_add'><i class="fa fa-plus-circle" aria-hidden="true"></i></button>
								 </label>
								<div class="input-group" id='file_list'>
										<input type='file' class='form-control' name='FILE_INFO'>
								</div>
							</div>
						</div>
						<div class='row'><!-- 작성자 / 작성일 -->
							<div class="form-group col-md-6">
								<label for="formGroupExampleInput"><i class="fa fa-user-circle" aria-hidden="true"></i> 작성자</label>
								<div class="input-group">
									<input type="text" class="form-control" name='NAME_KOR'>
								</div>
							</div>
							<div class="form-group col-md-6">
								<label for="formGroupExampleInput"><i class="fa fa-calendar" aria-hidden="true"></i> 작성일</label>
								<div class="input-group">
									<input type="text" class="form-control" name='NAME_KOR' readonly="readonly" id='WRITE_DATE'>
								</div>
							</div>
						</div><!-- 작성자 / 작성일 -->
						<div class='row'>
							<div class='form-group col-md-12'>
								<label for="formGroupExampleInput"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>
									내 용
								</label>
								<div class='input-group'>
									<textarea class='form-control' style='min-height:300px;'>※ 공지내용 및 행사일정을 등록해주세요</textarea>
								</div>
							</div>	
						</div>
						<div class='text-center'>
							<button class='btn btn-danger btn-sm'>등록하기</button>
							<button class='btn btn-success btn-sm'>뒤로가기</button>
						</div>
					</div>
				</div>
			</div>
</body>
</html>