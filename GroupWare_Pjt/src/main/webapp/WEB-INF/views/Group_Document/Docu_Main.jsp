<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	h5 {margin-bottom:0px;}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$('#docu_WriteView').click(function(){
			location.href = "docu_WriteView.dc";
		});
	});
</script>
</head>
<body>
	<div class='alert alert-info' role='alert'>
		<h4 class='alert-heading'>기안 결제</h4>
		<p><small>결제 신청 / 결제 대기 / 결제 승인 / 결제 내역 / 확인가능 합니다.</small>		
	</div>
	<div class='col-xl-12 col-lg-12 col-md-12 col-sm-12'>
		<!-- 검색조건 Card -->
		<div class="card card-outline-warning">
			  <div class="card-header card-warning">
			  	<i class="fa fa-search" aria-hidden="true"></i> 검색 조건
			  </div>
			  <div class="card-block">
			  	<div class='col-xl-12' >
			  		<div class='row'>
			  			<div class='text-danger' style='margin-bottom:5px;'>※ 검색조건을 입력하세요.</div>
			  		</div>
			  	</div>
			  	<div class='col-xl-12 col-lg-12 col-md-12' >
			  		<div class='row' style='padding-top:10px;'>
			  			<div class='col-xl-1 col-lg-2 col-md-12 col-sm-12' style='border-right:1px solid silver;'>
			  				조회일
			  			</div>
			  			<div class='col-xl-2 col-lg-3 col-md-6 col-6'>
			  				<div class="input-group input-group-sm">
							  <input type="text" class="form-control" placeholder="시작일" aria-describedby="basic-addon1">
							  <span class="input-group-addon" id="basic-addon1"><i class="fa fa-calendar" aria-hidden="true"></i></span>
							</div>
			  			</div>
			  			<div class='col-xl-2 col-lg-3 col-md-6 col-6'>
			  				<div class="input-group input-group-sm">
							  <input type="text" class="form-control" placeholder="최종일" aria-describedby="basic-addon1">
							  <span class="input-group-addon" id="basic-addon1"><i class="fa fa-calendar" aria-hidden="true"></i></span>
							</div>
			  			</div>
			  			<div class='col-xl-3 col-lg-4 hidden-md-down'>
			  				<button class='btn btn-warning btn-sm'>일주일</button>
			  				<button class='btn btn-warning btn-sm'>1개월</button>
			  				<button class='btn btn-warning btn-sm'>3개월</button>
			  			</div>
			  		</div>
			  		<div class='row' style='padding-top:10px;'>
			  			<div class='col-xl-1 col-lg-2 col-md-12' style='border-right:1px solid silver'>
			  				검색명
			  			</div>
			  			<div class='col-xl-1 col-lg-3 col-md-4 col-4'>
			  				<div class="input-group input-group-sm">
				  				<select class='form-control'>
				  					<option>선택</option>
				  					<option>제목</option>
				  					<option>부서</option>
				  					<option>작성자</option>
				  					<option>기안형식</option>
				  				</select>
			  				</div>
			  			</div>
			  			<div class='col-xl-5 col-lg-7 col-md-8 col-8'>
			  				<div class="input-group input-group-sm">
			  					<input type="text" class="form-control" placeholder="검색명을 입력하세요." aria-describedby="basic-addon1">
			  					<span class="input-group-addon" id="basic-addon1">검색</span>
			  				</div>
			  			</div>
			  		</div>
			  	</div>
			  </div>
		</div><!-- 검색조건 Card -->
	</div>
	<div class='col-xl-12 col-lg-12 col-md-12'>
		<!-- 결제정보 Card -->
		<div class='card'>
			<div class='card-header'>
				기안문서
			</div>
			<div class='card-block'>
				<div class='col-md-12'>
					<!-- 결제 여부 -->
					<div class='row'>
						<ul class="nav nav-tabs" style='border-bottom:0px;'>
						  <li class="nav-item">
						    <a class="nav-link active" href="#">전체</a>
						  </li>
						  <li class="nav-item">
						    <a class="nav-link" href="#">진행</a>
						  </li>
						  <li class="nav-item">
						    <a class="nav-link" href="#">완료</a>
						  </li>
						  <li class="nav-item">
						    <a class="nav-link" href="#">내역</a>
						  </li>
						  <li class="nav-item">
						    <a class="nav-link" href="#">반려</a>
						  </li>
						</ul>
					</div><!-- 결제 여부 -->
					<!-- 정보 -->
					<div class='row'>
						<table class='table table-sm table-bordered' style='color:black;'>
							<thead>
								<tr class='table-success'>
									<th style='width:6%' class='text-center hidden-md-down'>신청일</th>
									<th style='width:5%' class='text-center'>결제형식</th>
									<th style='width:15%' class='text-center'>제 목</th>
									<th style='width:4%' class='text-center hidden-md-down'>부서</th>
									<th style='width:5%' class='text-center'>작성자</th>
									<th style='width:3%' class='text-center hidden-lg-down'>첨 부</th>
									<th style='width:5%' class='text-center hidden-lg-down'>결제상태</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class='text-center hidden-md-down'>2017-01-01</td>
									<td class='text-center'>기안서</td>
									<td>주간보호 전지현 휴가신청 결제</td>
									<td class='text-center hidden-md-down'>주간보호</td>
									<td class='text-center'>전지현</td>
									<td class='text-center hidden-lg-down' style='color:#5D5D5D'><i class="fa fa-paperclip" aria-hidden="true"></i> 2</td>
									<td class='text-center hidden-lg-down' style='text-valign:center;padding-top:5px;'>
										<h5><span class="badge badge-primary">
												결제완료 <i class="fa fa-check-circle" aria-hidden="true"></i>
											</span>
										</h5>
									</td>
								</tr>
								<tr>
									<td class='text-center hidden-md-down'>2017-01-01</td>
									<td class='text-center'>품의서</td>
									<td >주간보호 전지현 휴가신청 결제</td>
									<td class='text-center hidden-md-down'>주간보호</td>
									<td class='text-center'>전지현</td>
									<td class='text-center hidden-lg-down' style='color:#5D5D5D'><i class="fa fa-paperclip" aria-hidden="true"></i> 2</td>
									<td class='text-center hidden-lg-down'>
										<h5>
											<span class="badge badge-danger">
												결제진행 <i class="fa fa-question-circle" aria-hidden="true"></i>
											</span>
										</h5>
									</td>
								</tr>
								<tr>
									<td class='text-center hidden-md-down'>2017-01-01</td>
									<td class='text-center'>기안서</td>
									<td>주간보호 전지현 휴가신청 결제</td>
									<td class='text-center hidden-md-down'>주간보호</td>
									<td class='text-center'>전지현</td>
									<td class='text-center hidden-lg-down' style='color:#5D5D5D'><i class="fa fa-paperclip" aria-hidden="true"></i> 2</td>
									<td class='text-center hidden-lg-down'>
										<h5>
											<span class="badge badge-default">
												결제반려 <i class="fa fa-times-circle" aria-hidden="true"></i>
											</span>
										</h5>
									</td>
								</tr>
							</tbody>
						</table>
					</div><!-- 정보 -->
					<div class='row' style=''>
						<div class='col-xl-12' style='text-align:right;padding-right:0px;'>
							<button class='btn btn-default btn-sm' id='docu_WriteView'>결제작성</button>
						</div>
					</div>
					<!-- 페이징 -->
					<div class='col-12'>
						<nav aria-label="Page navigation example">
						  <ul class="pagination pagination-sm justify-content-center">
						    <li class="page-item disabled">
						      <a class="page-link" href="#" tabindex="-1"><</a>
						    </li>
						    <li class="page-item"><a class="page-link" href="#">1</a></li>
						    <li class="page-item"><a class="page-link" href="#">2</a></li>
						    <li class="page-item"><a class="page-link" href="#">3</a></li>
						    <li class="page-item">
						      <a class="page-link" href="#">></a>
						    </li>
						  </ul>
						</nav>
					</div>
				</div>
			</div>
		</div><!-- 결제정보 Card -->
	</div>
</body>
</html>