<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.group.person.dto.PersonDto" %>
<%
	PersonDto dto = (PersonDto)request.getAttribute("info");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.text-default {font-size:20px;padding-left:20px;color:#5D5D5D;}
	.input-group {border:1px solid #F7F7F9; border-radius:5px; background-color:#F7F7F9;}
</style>
<script type="text/javascript">
	$(document).ready(function(){
	});
</script>
</head>
<body>
<div class='alert alert-warning' role='alert'>
		<h4 class='alert-heading'>상세보기</h4>
		<p><small>상세정보를 확인합니다. 수정 / 삭제 가능합니다.</small>		
	</div>
	<div class='col-xl-12 col-lg-12 col-md-12'>
		<div class='row'>
			<div class='col-xl-8 col-lg-12 col-md-12'><!--  입력정보 -->
				<div class="card">
				  <div class="card-header">
				  	사원정보
				  </div>
				  <div class="card-block">
				  	<div class='row'>
				  		<div class="form-group col-xl-6 col-lg-6 col-md-12">
						    <label for="formGroupExampleInput"><i class="fa fa-user-circle" aria-hidden="true"></i> 사원명 (한글)</label>
						    <div class="input-group">
						  		<div class='text-default'><%=dto.getNAME_KOR() %></div>
							</div>
						</div>
				  		<div class="form-group col-xl-6 col-lg-6 col-md-12">
						    <label for="formGroupExampleInput"><i class="fa fa-user-circle" aria-hidden="true"></i> 사원명 (영문)</label>
						    <div class="input-group">
						      	<div class='text-default'><%=dto.getNAME_ENG() %></div>
							</div>
						</div>
				  	</div>
				  	<div class='row'><!-- 주민번호 , 결혼여부 , 자녀 수 -->
				  		<div class='col-xl-6'>
								<div class='row'>
									<div class="form-group col-xl-6 col-lg-6 col-md-12">
									    <label for="formGroupExampleInput"><i class="fa fa-id-card-o" aria-hidden="true"></i> 주민번호</label>
									    <div class="input-group">
									     <div class='text-default'><%=dto.getSSN_FRONT() %> - <%=dto.getSSN_BACK() %></div>
										</div>
									</div>
								</div>
						</div>
						<div class='col-xl-6'>
								<div class='row'>
									<div class="form-group col-6">
									    <label for="formGroupExampleInput"><i class="fa fa-heart" aria-hidden="true"></i> 결혼여부</label>
									    <div class="input-group">
									      <div class='text-default'><%=dto.getMARRIAGE() %></div>
										</div>
									</div>
							  		<div class="form-group col-6">
									    <label for="formGroupExampleInput"><i class="fa fa-users" aria-hidden="true"></i> 자녀수</label>
									    <div class="input-group">
									      <div class='text-default'><%=dto.getCHILDREN() %></div>
										</div>
									</div>
								</div>
							</div>
				 	</div>
				  	<div class='row'>
					  	<div class='col-xl-6'>
								<div class='row'>
									<div class="form-group col-6">
									    <label for="formGroupExampleInput"><i class="fa fa-check-circle" aria-hidden="true"></i> 직위 / 직책</label>
									    <div class="input-group">
									      <div class='text-default'><%=dto.getPOSITION() %></div>
										</div>
									</div>
							  		<div class="form-group col-6">
									    <label for="formGroupExampleInput"><i class="fa fa-check-circle" aria-hidden="true"></i> 부서</label>
									    <div class="input-group">
									      <div class='text-default'><%=dto.getDEPARTMENT() %></div>
										</div>
									</div>
								</div>
						</div>
					  	<div class='col-xl-6'>
								<div class='row'>
									<div class="form-group col-6">
									    <label for="formGroupExampleInput"><i class="fa fa-check-circle" aria-hidden="true"></i> 근무형태</label>
									    <div class="input-group">
									      <div class='text-default'><%=dto.getWORKTYPE() %></div>
										</div>
									</div>
							  		<div class="form-group col-6">
									    <label for="formGroupExampleInput"><i class="fa fa-venus-mars" aria-hidden="true"></i> 성별</label>
									    <div class="input-group">
									     <div class='text-default'><%=dto.getGENDER() %></div>
										</div>
									</div>
								</div>
						</div>
				  	</div>
				  	<div class='row'><!-- 사용자 권한 -->
					  	<div class='col-xl-6'>
								<div class='row'>
									<div class="form-group col-6">
									    <label for="formGroupExampleInput"><i class="fa fa-check-circle" aria-hidden="true"></i> 사용자 권한</label>
									    <div class="input-group">
									      <div class='text-default'><%=dto.getPERSON_ACCOUNT() %></div>
										</div>
									</div>
							  		<div class="form-group col-6">
									    <label for="formGroupExampleInput"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> 접근 권한</label>
									    <div class="input-group">
									      <div class='text-default'><%=dto.getPERSON_ACCESS() %></div>
										</div>
									</div>
								</div>
						</div>
					  	<div class='col-xl-6'>
								<div class='row'>
									<div class="form-group col-6">
									    <label for="formGroupExampleInput"><i class="fa fa-check-circle" aria-hidden="true"></i> 사원 아이디</label>
									    <div class="input-group">
									      <div class='text-default'><%=dto.getPERSON_ID() %></div>
										</div>
									</div>
							  		<div class="form-group col-6">
									    <label for="formGroupExampleInput"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> 사원 비밀번호</label>
									    <div class="input-group">
									      <div class='text-default'><%=dto.getPERSON_PW() %></div>
										</div>
									</div>
								</div>
						</div>
				  	</div>
				  	<div class='row'><!-- 연락처 / 이메일 -->
				  		<div class="form-group col-xl-6 col-lg-6 col-md-12">
						    <label for="formGroupExampleInput"><i class="fa fa-mobile" aria-hidden="true"></i> 연락처</label>
						    <div class="input-group">
						    	<div class='text-default'><%=dto.getCONTACT() %></div>
							</div>
						</div>
				  		<div class="form-group col-xl-6 col-lg-6 col-md-12">
						    <label for="formGroupExampleInput"><i class="fa fa-envelope" aria-hidden="true"></i> 이메일</label>
						    <div class="input-group">
						    	<div class='text-default'><%=dto.getEMAIL() %></div>
							</div>
						</div>
				  	</div>
				  	<div class='row'><!-- 우편번호 / 상세주소 -->
				  		<div class='form-group col-xl-3 col-lg-3 col-md-6'>
				  			<label for="formGroupExampleInput"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> 우편번호</label>
				  			<div class='input-group'>
				  				 <div class='text-default'>( <%=dto.getZIPCODE() %> )</div>
				  			</div>
				  		</div>
				  		<div class='form-group col-xl-9 col-lg-9 col-md-12'>
				  			<label for="formGroupExampleInput"><i class="fa fa-map-marker" aria-hidden="true"></i> 상세주소</label>
				  			<div class='input-group'>
				  				 <div class='text-default'><%=dto.getADDR() %></div>
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
					  	<div class='col-6'><!-- 이력서 사본 -->
					  		<div class='text-danger'><i class="fa fa-picture-o" aria-hidden="true"></i> 사진</div>
					  		 <div class="card">
							    <img class="card-img img-fluid" src="./resources/Person_Image/<%=dto.getPHOTO_PERSON() %>" alt="Card image" style='height:250px'>
							    <input type='hidden' value='<%=dto.getPHOTO_PERSON()%>' id='person_img'>
							    <button class='btn btn-danger btn-sm' id='person_btn'>사진 보기</button>
							  </div>
					  	</div>
					  	<div class='col-6'><!-- 자격증 사본 -->
					  		<div class='text-danger'><i class="fa fa-picture-o" aria-hidden="true"></i> 자격증</div>
					  		<div class="card">
							    <img class="card-img img-fluid" src="./resources/Person_Image/<%=dto.getPHOTO_LICENSE() %>" alt="Card image" style='height:250px'>
							    <input type='hidden' value='<%=dto.getPHOTO_LICENSE() %>' id='license_img'>
							    <button class='btn btn-danger btn-sm' id='license_btn'>자격증 보기</button>
							</div>
					  	</div>
				  	</div>
				  </div>
				</div>
				<div class='text-right' style='margin-top:15px;'>
					<a href='person_UpdateView.ps?empnum=<%=dto.getEMPNUM() %>' class='btn btn-warning'>수정</a>
					<a href='person_Delete.ps?empnum=<%=dto.getEMPNUM() %>' class='btn btn-success'>삭제</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>