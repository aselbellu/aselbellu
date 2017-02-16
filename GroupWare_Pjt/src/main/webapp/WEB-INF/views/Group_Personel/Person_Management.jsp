<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import = "com.group.person.dto.PersonDto" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.group.util.paging.PageDto" %>
<%
/* 	ArrayList<PersonDto> dtos = (ArrayList<PersonDto>)request.getAttribute("personList");
	PageDto pageNation = (PageDto)request.getAttribute("pagenation"); */
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style type="text/css">
	.content{width:100%;}
	.header{border-bottom:2px solid #23282E;border-radius:3px; font-size:18px;}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		personList();
		// 페이지 이동
		$(document).on("click","#number",function(){
			var movePage = $(this).text();
			$('#hiddenNowPage').val(movePage);
			personList();			
			return false;
		});
		// 이전 버튼
		$(document).on("click","#pre",function(){
			var prePage = parseInt($('#hiddenNowPage').val()) - 1;
			$('#hiddenNowPage').val(prePage);
			personList();
			return false;
		});
		// 다음 버튼
		$(document).on("click","#next",function(){
			var nextPage = parseInt($('#hiddenNowPage').val()) + 1;
			$('#hiddenNowPage').val(nextPage);
			alert($('#hiddenNowPage').val());
			personList();
			return false;
		});
		// 검색 버튼
		$('#search_Btn').click(function(){
			if ($('#searchOption').val() == ""){
				alert('검색 분류를 선택해주세요');
			} else if ($('#searchValue').val() == ""){
				alert('검색명을 입력해주세요');
			} else {
				$('#hiddenOption').val($('#searchOption').val());
				$('#hiddenValue').val($('#searchValue').val());
				personList();
			}
		});
		// 전체 목록
		$('#allPerson_Btn').click(function(){
			$('#hiddenNowPage').val('');
			$('#hiddenOption').val('');
			$('#hiddenValue').val('');
			personList();
		});
		// 상세 보기
		$(document).on("click",".name-Btn",function(){
			var empnum = $(this).children("input[type='hidden']").val();
			location.href="person_Detail.ps?empnum="+empnum+"";
		});
	});
	// Data 받기
	function personList(){
		var hiddenOption = $('#hiddenOption').val();
		var hiddenValue = $('#hiddenValue').val();
		var hiddenNowPage = $('#hiddenNowPage').val();
		$.ajax({
			type : "post",
			url : "person_Manager.ps",
			data: {SEARCHOPTION:hiddenOption,SEARCHVALUE:hiddenValue,nowPage:hiddenNowPage},
			dataType : "json",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			error : function(x,e) {
				alert('접속 에러');
			},
			success : function(data) {
				var person = data.personList;
				var paging = data.pageDto;
				addPage(paging);
				addPerson(person);
			},
		});
	}
	
	// 인사목록
	function addPerson(person) {
		var add = "";
		$('#person_Table tbody tr').remove(); // 기존 리스트 삭제
		for (var i = 0; i <= person.length ; i++){
			if (person.length == 0){
				  add = "<tr class='list-tr'>'" +
						  "	<td class='text-center'>등록된 인사정보가 없습니다.</td>" +
						  "</tr>";
			} else {
				  add = "<tr class='list-tr'>" +
							"	<td style='width:5%' class='text-center'>"+person[i].empnum+"</td>" +
							"	<td style='width:5%' class='text-center'><a href='#' class='name-Btn'>"+person[i].name_KOR+"<input type='hidden' value='"+person[i].empnum+"'</a></td>" +
							"	<td style='width:5%' class='text-center'>"+person[i].position+"</td>" +
							"	<td style='width:5%' class='text-center'>"+person[i].department+"</td>" +
							"	<td style='width:15%' class='hidden-md-down hidden-lg-down'>"+person[i].addr+"</td>" +
							"	<td style='width:5%' class='text-center hidden-md-down'>"+person[i].contact+"</td>" +
							"	<td style='width:10%' class='text-center hidden-md-down hidden-lg-down'>"+person[i].email+"</td>" +
							"</tr>";
				  $('#person_Table tbody').append(add); // 리스트 추가 */
			}
			
		} 
	}
	// 페이네이션 
	function addPage(paging){
		var prev = "<li class='page-item' id = 'pre'>"
				   +"	<a class='page-link' href='#' aria-label='Previous'><</a>"
				   +"</li>";
		var next = "<li class='page-item' id = 'next'>"
				   +"	<a class='page-link' href='#' aria-label='Next'>></a>"
				   +"</li>";
		var number = "";
		
		for (var i = paging.startPage ; i <= paging.endpage ; i++){
			if (i == paging.nowPage){
				number += "<li class='page-item disabled'><a class='page-link' href=''#' id='number'>"+i+"</a></li>"
			} else {
				number += "<li class='page-item'><a class='page-link' href=''#' id='number'>"+i+"</a></li>";
			}
		}
		$('.pagination').html('');
		$('.pagination').append(prev+number+next);
		if (paging.nowPage <= 1){
			$('#pre').attr('class','page-item disabled');
		}
		if (paging.nowPage == paging.maxPage){
			$('#next').attr('class','page-item disabled');
		}
		// 현재 페이지 Hidden Input
		$('#hiddenNowPage').val(paging.nowPage);
	}
</script>
</head>
<body>
	<div class='alert alert-success' role='alert'><!-- Head Title -->
		<h4 class='alert-heading'>인사 관리</h4>
		<p><small>인사 등록 / 정보 수정 / 직위 변경 / 인사 삭제 가능합니다.</small>		
	</div><!-- Head Title -->
	<div class='col-xl-12 col-lg-12 col-md-12'>
		<!-- 검색 CARD -->
		<div class="card card-outline-warning">
		  <div class="card-header card-warning">
		  	<div style='color:white;'>
		  		<i class="fa fa-search" aria-hidden="true"></i> 검색 조건
		  	</div>
		  </div>
		  <div class="card-block">
		  	<div class='text-danger' style='margin-bottom:10px;'>※ 검색조건을 입력하세요.</div>
		  	<div class='row'>
			  	<div class="form-group col-4">
				    <label for="formGroupExampleInput2"><i class="fa fa-check-square-o" aria-hidden="true"></i> 분류 선택</label>
				    <div class="input-group input-group-sm">
					    <select class='form-control' id='searchOption'>
					    	<option value=''>=선택=</option>
					    	<option value='NAME_KOR'>직원명</option>
					    	<option value='POSITION'>직위명</option>
					    </select>
					    <input type='hidden' id='hiddenOption'><!-- 검색조건 Hidden -->
				    </div>
				</div>
			  	<div class="form-group col-8">
				    <label for="formGroupExampleInput"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> 분류 명</label>
				   <div class="input-group input-group-sm">
				      <input type="text" class="form-control" id='searchValue'>
				      <input type='hidden' id='hiddenValue'><!-- 검색어 Hidden -->
				      <input type='hidden' id='hiddenNowPage'><!-- 현재 페이지 번호 Hidden -->
					</div>
				</div>
		  	</div>
		  	<div class='row'>
		  		<div class='col-md-12' style='text-align:right;'>
		  			<button class='text-left btn btn-success btn-sm' id='allPerson_Btn'>전체 목록</button>
		  			<button class='btn btn-warning btn-sm' id='search_Btn'><i class="fa fa-search" aria-hidden="true"></i> 검색</button>
		  		</div>
		  	</div>
		  </div>
		</div><!-- 검색 CARD -->
		<!-- 목록 CARD -->
		<div class="card card-outline-success" style='margin-top:10px;'>
			<div class="card-header card-success" style='color:white;'>
				<i class="fa fa-user-circle-o" aria-hidden="true"></i> 인사 목록
			</div>
			<div class="card-block">
				<div class='row' style='padding-bottom:5px;text-align:right;'>
					<div class='col-xl-12 col-lg-12 col-md-12'>
						<a href='person_InsertView.ps' class='text-light btn btn-success btn-sm'><i class="fa fa-user-plus" aria-hidden="true"></i> 등록</a>
						<button class='btn btn-danger btn-sm text-light'><i class="fa fa-trash-o" aria-hidden="true"></i> 삭제</button>
					</div>
				</div>
				<table class='table table-sm table-striped' style='color:black;' id='person_Table'>
					<thead><!-- 테이블 타이틀 -->
						<tr class='table-success'>
							<th style='width:5%' class='text-center'>사원번호</th>
							<th style='width:5%' class='text-center'>사원명</th>
							<th style='width:5%' class='text-center'>직 위 </th>
							<th style='width:5%' class='text-center'>부 서</th>
							<th style='width:15%' class='text-center hidden-md-down hidden-lg-down'>주소지</th>
							<th style='width:5%' class='text-center hidden-md-down'>연락처</th>
							<th style='width:10%' class='text-center hidden-md-down hidden-lg-down'>이메일</th>
						</tr>
					</thead><!-- 테이블 타이틀 -->
					<!-- 목록 -->
					<tbody>
					
					</tbody><!-- 목록 -->
				</table>
				<!-- Pagination -->
				<div class='row'>
					<div class='col-md-12'>
						<nav aria-label="Page navigation">
						  <ul class="pagination pagination-sm justify-content-center">
						  </ul>
						</nav>
					</div>
				</div><!-- Pagination -->
			</div>
		</div><!-- 목록 CARD -->
	</div>
</body>
</html>