<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.text-default {font-size:18px;padding-left:15px;background-color:#F7F7F9;}
</style>
</head>
<body>
	<div class='alert alert-info' role='alert'>
		<h4 class='alert-heading'>상세 보기</h4>
		<p><small>내용을 확인하세요</small>		
	</div>
		<div class='card'>
			<div class='card-header'>
				공지 보기
			</div>
			<div class='card-block'>
				<div class='col-md-12'>
					<div class='row'><!-- 분류 / 제목 -->
						<div class="form-group col-md-3">
							<label for="formGroupExampleInput"><i class="fa fa-th-list" aria-hidden="true"></i> 분류</label>
							<div class="input-group">
								<div class='text-default form-control'>행사일정</div>
							</div>
						</div>
						<div class="form-group col-md-9">
							<label for="formGroupExampleInput"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> 제 목</label>
							<div class="input-group">
								<div class='text-default form-control'>2017년 그룹웨어가 시작됩니다.</div>
							</div>
						</div>
					</div><!-- 분류 / 제목 -->
					<div class='row'><!-- 파일 업로드 -->
						<div class="form-group col-md-12">
							<label for="formGroupExampleInput"><i class="fa fa-upload" aria-hidden="true"></i>
								 첨부파일
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
								<div class='text-default form-control'>전화윤</div>
							</div>
						</div>
						<div class="form-group col-md-6">
							<label for="formGroupExampleInput"><i class="fa fa-calendar" aria-hidden="true"></i> 작성일</label>
							<div class="input-group">
								<div class='text-default form-control'>2017-01-01</div>
							</div>
						</div>
					</div><!-- 작성자 / 작성일 -->
					<div class='row'>
						<div class='form-group col-md-12'>
							<label for="formGroupExampleInput"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>
								내 용
							</label>
							<div class='input-group'>
								<textarea class='form-control form-control' style='min-height:300px;' readonly="readonly">공지내용이 등록되었습니다.</textarea>
						</div>
					</div>	
				</div>
				<div class='text-left'>
					<button class='btn btn-success btn-sm'>목록으로</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>