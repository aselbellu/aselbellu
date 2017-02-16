<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript">
	$(document).ready(function(){
		$('#insert-btn').click(function(){ //인사등록 버튼
			$('#insert-form').submit();
			return false;
		});
	});
</script>
<title>Insert title here</title>
</head>
<body>
	<div class='alert alert-warning' role='alert'>
		<h4 class='alert-heading'>인사 등록</h4>
		<p><small>인사정보를 등록해주세요.</small>		
	</div>
	<form action='person_Insert.ps' method="post" id='insert-form' enctype="multipart/form-data">
	<div class='col-xl-12 col-lg-12 col-md-12'>
		<div class='row'>
			<div class='col-xl-8 col-lg-12 col-md-12'><!--  입력정보 -->
				<div class="card">
				  <div class="card-header">
				  	사원정보 입력
				  </div>
				  <div class="card-block">
				  	<div class='row'>
				  		<div class="form-group col-xl-6 col-lg-6 col-md-12">
						    <label for="formGroupExampleInput"><i class="fa fa-user-circle" aria-hidden="true"></i> 사원명 (한글)</label>
						    <div class="input-group">
						      <input type="text" class="form-control" name='NAME_KOR'>
							</div>
						</div>
				  		<div class="form-group col-xl-6 col-lg-6 col-md-12">
						    <label for="formGroupExampleInput"><i class="fa fa-user-circle" aria-hidden="true"></i> 사원명 (영문)</label>
						    <div class="input-group">
						      <input type="text" class="form-control" name='NAME_ENG'>
							</div>
						</div>
				  	</div>
				  	<div class='row'><!-- 주민번호 , 결혼여부 , 자녀 수 -->
				  		<div class='col-xl-6 col-lg-6 col-md-12'>
								<div class='row'>
									<div class="form-group col-6">
									    <label for="formGroupExampleInput"><i class="fa fa-id-card-o" aria-hidden="true"></i> 주민번호</label>
									    <div class="input-group">
									      <input type='text' class='form-control' name='SSN_FRONT'>
										</div>
									</div>
							  		<div class="form-group col-6">
									    <label for="formGroupExampleInput"> &nbsp;</label>
									    <div class="input-group">
									    	<input type='text' class='form-control' name='SSN_BACK'>
										</div>
									</div>
								</div>
						</div>
						<div class='col-xl-6 col-lg-6 col-md-12'>
								<div class='row'>
									<div class="form-group col-6">
									    <label for="formGroupExampleInput"><i class="fa fa-heart" aria-hidden="true"></i> 결혼여부</label>
									    <div class="input-group">
									      <select class='form-control' name='MARRIAGE'>
									      	<option value=''>선택</option>
									      	<option value='기혼'>기혼</option>
									      	<option value='미혼'>미혼</option>
									      </select>
										</div>
									</div>
							  		<div class="form-group col-6">
									    <label for="formGroupExampleInput"><i class="fa fa-users" aria-hidden="true"></i> 자녀수</label>
									    <div class="input-group">
									      <select class='form-control' name='CHILDREN'>
									      	<option value=''>선택</option>
									      	<option value='무'>무</option>
									      	<option value='1명'>1명</option>
									      	<option value='2명'>2명</option>
									      	<option value='3명 이상'>3 명 이상</option>
									      </select>
										</div>
									</div>
								</div>
							</div>
				 	</div>
				  	<div class='row'>
					  	<div class='col-xl-6 col-lg-6 col-md-12'>
								<div class='row'>
									<div class="form-group col-6">
									    <label for="formGroupExampleInput"><i class="fa fa-check-circle" aria-hidden="true"></i> 직위 / 직책</label>
									    <div class="input-group">
									      <select class='form-control' name='POSITION'>
									      	<option value=''>선택</option>
									      	<option value='이사장'>이사장</option>
									      	<option value='센터장'>센터장</option>
									      	<option value='과장'>과장</option>
									      	<option value='사원'>사원</option>
									      </select>
										</div>
									</div>
							  		<div class="form-group col-6">
									    <label for="formGroupExampleInput"><i class="fa fa-check-circle" aria-hidden="true"></i> 부서</label>
									    <div class="input-group">
									      <select class='form-control' name='DEPARTMENT'>
									      	<option value=''>선택</option>
									      	<option value='주간보호'>주간보호</option>
									      	<option value='노인복지'>노인복지</option>
									      	<option value='푸드뱅크'>푸드뱅크</option>
									      </select>
										</div>
									</div>
								</div>
						</div>
					  	<div class='col-xl-6 col-lg-6 col-md-12'>
								<div class='row'>
									<div class="form-group col-6">
									    <label for="formGroupExampleInput"><i class="fa fa-check-circle" aria-hidden="true"></i> 근무형태</label>
									    <div class="input-group">
									      <select class='form-control' name='WORKTYPE'>
									      	<option value=''>선택</option>
									      	<option value='정규직'>정규직</option>
									      	<option value='계약직'>계약직</option>
									      	<option value='파견직'>파견직</option>
									      </select>
										</div>
									</div>
							  		<div class="form-group col-6">
									    <label for="formGroupExampleInput"><i class="fa fa-venus-mars" aria-hidden="true"></i> 성별</label>
									    <div class="input-group">
									      <select class='form-control' name='GENDER'>
									      	<option value=''>선택</option>
									      	<option value='여성'>여성</option>
									      	<option value='남성'>남성</option>
									      </select>
										</div>
									</div>
								</div>
						</div>
				  	</div>
				  	<div class='row'><!-- 사용자 권한 -->
					  	<div class='col-xl-6 col-lg-6 col-md-12'>
								<div class='row'>
									<div class="form-group col-6">
									    <label for="formGroupExampleInput"><i class="fa fa-check-circle" aria-hidden="true"></i> 사용자 권한</label>
									    <div class="input-group">
									      <select class='form-control' name='PERSON_ACCOUNT'>
									      	<option value=''>선 택</option>
									      	<option value='ADMIN'>ADMIN</option>
									      	<option value='NORMAL'>NORMAL</option>
									      </select>
										</div>
									</div>
							  		<div class="form-group col-6">
									    <label for="formGroupExampleInput"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> 접근 권한</label>
									    <div class="input-group">
									      <select class='form-control' name='PERSON_ACCESS'>
									      	<option value=''>선 택</option>
									      	<option value='ALL'>전체관리자</option>
									      	<option value='CAREADMIN'>주간보호관리자</option>
									      	<option value='SILVERADMIN'>노인복지관리자</option>
									      	<option value='FOODADMIN'>푸드뱅크관리자</option>
									      	<option value='CARE'>주간보호사원</option>
									      	<option value='SILVER'>노인복지사원</option>
									      	<option value='FOOD'>푸드뱅크사원</option>
									      </select>
										</div>
									</div>
								</div>
						</div>
				  	</div>
				  	<div class='row'><!-- 연락처 / 이메일 -->
				  		<div class="form-group col-6">
						    <label for="formGroupExampleInput"><i class="fa fa-mobile" aria-hidden="true"></i> 연락처</label>
						    <div class="input-group">
						    	<input type='text' class='form-control' name='CONTACT'>
							</div>
						</div>
				  		<div class="form-group col-6">
						    <label for="formGroupExampleInput"><i class="fa fa-envelope" aria-hidden="true"></i> 이메일</label>
						    <div class="input-group">
						    	<input type='text' class='form-control' name='EMAIL'>
							</div>
						</div>
				  	</div>
				  	<div class='row'><!-- 우편번호 / 상세주소 -->
				  		<div class='form-group col-xl-3 col-lg-4 col-md-6'>
				  			<label for="formGroupExampleInput"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> 우편번호</label>
				  			<div class='input-group'>
				  				 <input type="text" class="form-control"  placeholder="ZipCode" name='ZIPCODE'>
								  <span class="input-group-btn">
								    <button class="btn btn-danger" id='m_Zipcode_Btn' type="button">우편번호</button>
								  </span>
				  			</div>
				  		</div>
				  		<div class='form-group col-xl-9 col-lg-8 col-md-12'>
				  			<label for="formGroupExampleInput"><i class="fa fa-map-marker" aria-hidden="true"></i> 상세주소</label>
				  			<div class='input-group'>
				  				 <input type="text" class="form-control"  placeholder="상세주소" name='ADDR'>
				  			</div>
				  		</div>
				  	</div>
				  </div>
				</div>
			</div><!--  입력정보 -->
			<div class='col-xl-4 col-lg-12 col-md-12'>
				<div class="card">
				  <div class="card-header">
				  	사진 및 자격증
				  </div>
				  <div class="card-block">
				  	<div class='row'>
					  	<div class='col-md-6'><!-- 이력서 사본 -->
					  		<div class='text-danger'><i class="fa fa-picture-o" aria-hidden="true"></i> 사진</div>
					  		 <div class="card">
							    <img class="card-img img-fluid" src="./resources/BgImage/user.png" alt="Card image" style='height:250px'>
							    <button class='btn btn-danger btn-sm'>사진등록</button>
							    <input type='file' name='PHOTO_PERSONFILE'>
							  </div>
					  	</div>
					  	<div class='col-md-6'><!-- 자격증 사본 -->
					  		<div class='text-danger'><i class="fa fa-picture-o" aria-hidden="true"></i> 자격증</div>
					  		<div class="card">
							    <img class="card-img img-fluid" src="./resources/BgImage/license.jpg" alt="Card image" style='height:250px'>
							    <button class='btn btn-danger btn-sm'>자격증 등록</button>
							    <input type='file' name='PHOTO_LICENSEFILE'>
							</div>
					  	</div>
				  	</div>
				  </div>
				</div>
			</div>
		</div>
	</div>
	<div class='col-md-12' style='padding-top:20px; text-align:center;'>
		<a href='#' class='btn btn-warning' id='insert-btn'>등록하기</a>
		<button class='btn btn-success' id='reset-btn'>취소하기</button>
	</div>
	</form>
</body>
</html>