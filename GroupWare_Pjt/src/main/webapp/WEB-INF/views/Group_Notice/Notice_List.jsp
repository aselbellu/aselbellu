<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.group.person.dto.PersonDto" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class='alert alert-info' role='alert'>
		<h4 class='alert-heading'>공지 사항</h4>
		<p><small>일정 / 행사 / 공지 내용을 확인하세요.</small>		
	</div>
	<div class="card card-outline-warning">
	  <div class="card-header card-warning">
		<div style='color:white;'>
			<i class='fa fa-search' aria-hidden='true'></i> 검색 조건
		</div>
	  </div>
	  <div class='card-block'>
	  	<div class='text-danger' style='margin-bottom:10px;'>※ 검색조건을 입력하세요.</div>
	  	<div class='row'>
	  		<div class="form-group col-4">
			    <label for="formGroupExampleInput2"><i class="fa fa-check-square-o" aria-hidden="true"></i> 분류 선택</label>
			    <div class="input-group input-group-sm">
				    <select class='form-control'>
				    	<option>=선택=</option>
				    	<option>공지사항</option>
				    	<option>행사일정</option>
				    </select>
				</div>
			</div>
			<div class="form-group col-8">
			    <label for="formGroupExampleInput"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> 분류 명</label>
			    <div class="input-group input-group-sm">
			      <input type="text" class="form-control">
				</div>
			</div>
	  	</div>
	  	<div class='row'>
	  		<div class='col-md-12' style='text-align:right;'>
	  			<button class='btn btn-warning btn-sm'><i class="fa fa-search" aria-hidden="true"></i> 검색</button>
	  		</div>
	  	</div>
	  </div>
	</div>
	<div class="card card-outline-info" style='margin-top:10px;'>
		<div class="card-header card-info" style='color:white;'>
			<i class="fa fa-user-circle-o" aria-hidden="true"></i> 공지 내용
		</div>
		<div class="card-block">
			<div class='row' style='padding-bottom:5px;text-align:right;'>
				<% if (session.getAttribute("account").equals("ADMIN")) {%>	
				<div class='col-md-12'>
					<a href='notice_WriteView.no' class='btn btn-info btn-sm'><i class="fa fa-plus-circle" aria-hidden="true"></i> 글쓰기</a>
					<button class='btn btn-danger btn-sm'><i class="fa fa-trash-o" aria-hidden="true"></i> 삭제</button>
				</div>
				<% } %>
			</div>
			<table class='table table-sm table-striped' style='color:black;'>
				<tr class='table-info'>
					<th style='width:3%' class='hidden-md-down'>No</th>
					<th style='width:5%'>공지 유형</th>
					<th style='width:15%'>제목</th>
					<th style='width:5%' class='hidden-md-down'><i class="fa fa-user-circle" aria-hidden="true"></i> 작성자</th>
					<th style='width:5%' class='hidden-md-down'><i class="fa fa-clock-o" aria-hidden="true"></i> 작성일</th>
					<th style='width:5%' class='hidden-md-down'><i class="fa fa-thumbs-up" aria-hidden="true"></i> 조회수</th>
				</tr>
				<tr>
					<td class='hidden-md-down'>1</td>
					<td>행사 일정</td>
					<td><a href='notice_DetailView.no'>2017년 02월 01일 2월이 시작됩니다.!</a></td>
					<td class='hidden-md-down'>전화윤</td>
					<td class='hidden-md-down'>2017-02-01</td>
					<td class='hidden-md-down'>0</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>