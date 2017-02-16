<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function(){
		// 결제 종류 선택 (기안서 / 품의서)
		$('#payment-kinds').change(function(){
			var tempKinds = $('#payment-kinds').val();
			var tempSubKinds = "";
			
			if (tempKinds == 'draft-docu'){		// 기안서 선택시 추가
				tempSubKinds = "<option value=''>선택</option>"
							  +"<option value='휴가기안서'>휴가 기안서</option>"
				$('#sub-payment').css('display','block');
				$('#sub-kinds').html(tempSubKinds);
			} else if (tempKinds == 'consult-docu') {	// 품위서 선택시 추가
				tempSubKinds = "<option value=''>선택</option>"
							  +"<option value='지출품의서'>지출품의서</option>";
				$('#sub-payment').css('display','block');
				$('#sub-kinds').html(tempSubKinds);
			} else if (tempKinds == '') {
				$('#sub-payment').css('display','none');
			}
		});
		
		// 세부 결제 선택 (기안 - 휴가 / 품의서 - 지출)
		$('#sub-kinds').change(function(){
			var tempKinds = $('#sub-kinds').val();
			var tempLocation = "";
			if (tempKinds == '휴가기안서'){
				tempLocation = "./resources/docu_html/Docu_Vacation.html";
			} else if (tempKinds == '지출결의서') {
				tempLocation = "";
			}
			$('#main-docu').load(tempLocation,function(){
				writePerson();	//작성자 자동 입력
				writeDate();	//작성일 자동 입력
				var list = department_list(); // 전체 부서 목록
			});
			
		});
		
		////////////////////////////////////////////////////////////
		
		
		
		// 결제대상자 선택 버튼 (Modal)
		$(document).on("click","#paymember-btn",function(){
			var list = department_list();
			modalDepartMent_List(list);	// 사이드 배너 부서 목록 추가 
			$('#paymembers').modal('show');
		});
		// 부서의 소속 되어있는 인사
		$(document).on("click",'#member-list',function(){
			var department = $(this).text();
			// 해당 부서 TEXT 전달 Ajax
			var members = group_list(department);
			payment_personmenu(members);
			return false;
		});
		
		// 인사 결제대상 추가
		$(document).on("click","#member-add",function(){
			var tempTd = $(this).parent().parent();
			var empnum = $(this).val();	// 선택된 인사 empnum
			var department = tempTd.find("td:eq(1)").text(); // 선택된 인사 소속
			var position = tempTd.find("td:eq(2)").text();	// 선택된 인사 직급
			var name = tempTd.find("td:eq(3)").text();	// 선택된 인사 사원명
			var result = false;	// 중복 체크
			var addContent = $('#add-content option').size();	// 추가 사항 select option 총 갯수 구하기
			
			if (addContent >= 4){
				//추가 목록이 4개 이상일 경우 경고창
				alert('선택 가능한 인원은 4 명 입니다.');
			
			} else if (addContent != 0){
				//선택 목록에 추가 사항이 존재할경우 중복 추가 방지
				for (var i = 0 ; i < addContent ; i++){
				  var tempValue = $("#add-content option:eq("+i+")").val()
				  if (tempValue == empnum){
					  // 추가 목록에 같은 empnum 이 존재 할경우 반복문 종료 result = true ; for문 종료		  
					  result = true;
					  break;
				  }
				}
				if (result == true){
					// 해당 목록이 존재 할경우 추가 없이 중복 존재 경고창
					alert('이미 추가 되었습니다.');
				} else {
					// 해당 목록이 존재하지 않을 경우 추가하기
					$('#add-content').append("<option value="+empnum+">"+name+"</option>");
				}
			} else {
				// 목록 비어있을경우
				$('#add-content').append("<option value="+empnum+">"+name+"</option>");
			}
		});
		
		// 멤버 제거
		$(document).on("click","#member-delete",function(){
			// 다중 선택된 직원 삭제가능
			$('#add-content option:selected').remove();
		});
		
		// Modal -> 결제자 본문에 등록
		$(document).on("click","#payment-add",function(){
			var tempCount = $('#add-content option').size();	//결제 대상자 count
			var tempPosition = "";
			var tempEmpnum = "";
			var tempName = "";
			paymentList_Delete();
			for (var i = 0 ; i < tempCount ; i++){
				tempPosition = $("#add-content option:eq("+i+")").text();
				//Select 추가된 사원 번호
				tempEmpnum = $("#add-content option:eq("+i+")").val();
				//Select 추가된 사원 이름
				tempName = $("#add-content option:eq("+i+")").text();
				tempHiddenValue = "<input type='hidden' name='EMPNUM' value='"+tempEmpnum+"'>";
				// 본문 table td Name 결제자 이름 넣기
				$("#payname td:eq("+(i+1)+")").text(tempName);
				// 본문 table td Name 결제자 Empnum Hidden 값 
				$("#payname td:eq("+(i+1)+")").append(tempHiddenValue);
			}
		});
		
		
		// 문서 등록 Btn
		$(document).on("click","#writing-btn",function(){
			alert($('#payname td:eq(0)').children().val());
			return false;
		});
	});
	
	/* Start 본문 Load시 자동 입력 */
	function writeDepartMent_List(list){// 본문 작성 부서 Append
		var tempAdd = "";
		for (var i = 0 ; i < list.length ; i++){
			// 작성부서의 SelectBox에 Option (부서) 추가
			tempAdd += "<option value='"+list[i].department+"'>"+list[i].department+"</option>";
		}
		$('#write_department option').remove();	// 작성부서 리스트 초기화
		$('#write_department').append(tempAdd);	// 새로 추가된 리스트 추가
	}
	
	function writePerson(){// 본문 작성자 Append
		var tempName = '<%=session.getAttribute("name")%>';
		var tempHiddenEmpnum = "<input type='hidden' name='EMPNUM' value='"+<%=session.getAttribute("empnum")%>+"'>";
		// Session Name 값 작성자 란 추가
		$('#write_writer').val(tempName);  // 작성자 Input Value
		$('#payname td:eq(0)').append(tempHiddenEmpnum);	// 작성자 결재
		
	}
	function writeDate(){// 본문 작성일 Append
		var d = new Date();
		var year = d.getFullYear();
		var month = (d.getMonth() + 1);
		var day = d.getDate();
		// 작성일자 현재 날자 입력
		$('#write_date').val(year + "-" + month + "-" + day);
	}
	/* End 본문 Load시 자동 입력 */
	
	// 결제란 초기화
	function paymentList_Delete(){
		// 결제 table td Name 초기화
		for (var i = 1 ; i <= 4 ; i++){
			// i = 1 첫번째 칸은 담당자 정보 2번째 테이블부터 초기화
			$("#payname td:eq("+i+")").text('');
		}
	}
	// 비동기 off
	function department_list(){
				var departList = "";
				$.ajax({
					type : "post",
					url : "person_DepartmentList.ps",
					data: {},
					dataType : "json",
					async: false, // ture: 비동기, false: 동기
					contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					error : function(x,e) {
						alert('접속 에러');
					},
					success : function(data) {
						departList = data.departList;
					},
				});
				return departList;
	}
	// 결재대상자 모달창 사이드 배너에 부서목록 추가
	function modalDepartMent_List(list){
		debugger;
			var tempAdd = "";
			for(var i = 0 ; i < list.length ; i++){
				tempAdd +=  "<li>"
				           +"  	<a href='#' id='member-list'>"
			               +"  	<i class='fa fa-user fa-lg'></i> "+list[i].department+""
			               +"  	</a>"
			               +"</li>";
			}
			$('#member-content li').remove();		//기존 추가된 부서 삭제
			$('#member-content').append(tempAdd);	//새로 추가된 부서 추가
	}
	// example personList();
	function group_list(department){
		var result = "";
		$.ajax({
			type : "post",
			url : "person_GroupList.ps",
			data: {department:department},
			async: false, // ture: 비동기, false: 동기
			dataType : "json",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			error : function(x,e) {
				alert('접속 에러');
			},
			success : function(data) {
				result = data.members;
			},
		});
		return result;
	}
	
	//결제Modal SideMenu 해당 부서의 인사리스트
	function payment_personmenu(members){
		var tempList = "";
		if (members.length == 0){
			alert('해당부서의 등록된 인사정보가 없습니다.')	
		} else {
			for (var i = 0; i < members.length ; i++){
				tempList +=  "<tr>"
							+"	<td class='text-center'><button id='member-add' class='btn btn-warning btn-sm' value="+members[i].empnum+"><i class='fa fa-plus-circle' aria-hidden='true'></i></button></td>"
							+"	<td>"+members[i].department+"</td>"
							+"	<td>"+members[i].position+"</td>"
							+"	<td>"+members[i].name_KOR+"</td>"
							+"</tr>";	
			}
			$('#group-list tbody tr').remove();		// 기존 추가된 정보 삭제
			$('#group-list tbody').append(tempList);// 새로 추가된 정보 추가
		}
	}
	
</script>
<style type="text/css">
	/* 결제 타이틀 */
	.paytable-title {width:100%;}
	.paytable-title tr{border:1px solid black;}
	.paytable-title th{border-right:1px solid black;width:200px;text-align:center;}
	.paytable-title td{border-right:1px solid black;}
	.paytable-title .payname {width:200px; text-align:center;}
	.paytable-title .paycheck {height:130px;}
	.paytable-title .form-control {border:0px;}
	/* 결제 본문 */
	.paytable {width:100%;border:1px black;}
	.paytable tr {border:1px solid black;}
	.paytable th {width: 200px;text-align:center;border:1px solid black;}
	.paytable td {border-right: 1px solid #8C8C8C;}
	.paytable .payposi {text-align:center;}
	.paytable .payname {width:200px;text-align:center;}
	.paytable .paycheck {height:130px;}
	.paytable .form-control{border:0px;}
	<!--============================ -->
	.member_name {font-weight:bold;font-size:15px;}
</style>
</head>
<body>
	<div class='alert alert-success' role='alert'><!-- Head Title -->
		<h4 class='alert-heading'>결제 작성</h4>
		<p><small>기안서 / 품의서 / 작성 가능합니다.</small>		
	</div><!-- Head Title -->
	
	<div class='col-xl-12 col-lg-12 col-md-12'>
		<!-- 검색 CARD -->
		<div class="card card-outline-warning">
		  <div class="card-header card-warning">
		  	<div style='color:white;'>
		  		<i class="fa fa-search" aria-hidden="true"></i> 결제 선택
		  	</div>
		  </div>
		  <div class="card-block">
		  	<div class='text-danger' style='margin-bottom:10px;'>※ 결제 대분류 / 소분류를 선택하세요.</div>
		  	<div class='row'>
		  		<!-- 결제 종류 선택 -->
			  	<div class="form-group col-4" id='main-payment'>
				    <label for="formGroupExampleInput2"><i class="fa fa-check-square-o" aria-hidden="true"></i> 결제선택</label>
				    <div class="input-group input-group-sm">
					    <select class='form-control' id='payment-kinds'>
					    	<option value=''>=선택=</option>
					    	<option value='draft-docu'>기안서</option>
					    	<option value='consult-docu'>품위서</option>
					    </select>
				    </div>
				</div><!-- 결제 종류 선택 -->
				<!-- 세부 종류 선택 -->
			  	<div class="form-group col-8" style='display:none' id='sub-payment'>
				    <label for="formGroupExampleInput"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> 세부선택</label>
				   <div class="input-group input-group-sm">
				      <select class='form-control' id='sub-kinds'>
				      
				      </select>
					</div>
				</div><!-- 세부 종류 선택 -->
		  	</div>
		  </div>
		</div><!-- 검색 CARD -->
		<!-- 목록 CARD -->
		<div class="card card-outline-success" style='margin-top:10px;'>
			<div class="card-header card-success" style='color:white;'>
				<i class="fa fa-user-circle-o" aria-hidden="true"></i> 작성 화면
			</div>
			<!-- 문서 작성 -->
			<div class="card-block" id='main-docu'>
			</div>
		</div>
	</div>
<!-- Modal 인사정보 등록 -->
<div class="modal fade" id='paymembers' tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" >
    <div class="modal-content">
    	<div class='row' style='padding-left:15px;padding-right:15px;'>
	    	<div class='col-xl-2 col-lg-3 col-md-4' style='padding-left:0px;padding-right:0px;background-color:#2e353d;'>
				<div class="nav-side-menu">
					    <div class="brand">사원정보</div>
					    <i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse" data-target="#member-list"></i>
					    <div class="menu-list">
						    <ul id="member-content" class="member-content collapse out">
						    	 <li>
				                	<a href="notice_List.no">
				                 	<i class="fa fa-user fa-lg"></i> 공지사항
				                 	</a>
				                </li><!-- 공지사항 -->
						    </ul>
						</div>
				</div>
			</div>
			<!-- 인사 내용 시작 -->
			<div class='main col-xl-10 col-lg-9 col-md-8' id='member-select' style='height:600px;'>
				<div class='alert alert-success' role='alert'><!-- Head Title -->
					<h4 class='alert-heading'> 인사 목록</h4>
					<p><small>원하시는 담당자 , 해당직원을 선택해주세요.</small>		
				</div><!-- Head Title -->
				<div class='col-12 text-danger'><i class='fa fa-user fa-lg'></i> 소속 인사</div>
				<div class='col-xl-12' id='' style='height:200px;overflow-y:scroll;border:1px solid black;'>
					<table class='table table-striped table-sm' id='group-list'>
						<thead>
							<tr>
								<th style='width:3%'></th>
								<th style='width:6%'>소속부서</th>
								<th style='width:6%'>직급</th>
								<th style='width:5%'>사원명</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div><!-- 결재라인 / 결재등록 -->
				<div class='col-xl-12 text-success'style='padding-top:10px;'><i class='fa fa-user fa-lg'></i> 선택 목록</div>
					<!-- 추가된 인사 목록 -->
				<div class='col-xl-12' id='' style='padding-left:0px;padding-right:0px;height:150px;border:1px solid silver;'>
					<select multiple class='form-control' id='add-content' style='height:100%;'>
					</select>
				</div>
				<div class='col-xl-12 col-lg-12 col-md-12'>
					<div class='text-danger'><small>Ctrl + 선택 다중 선택이 가능합니다.</small></div>
				</div>
				<div class='col-xl-12 col-lg-12 col-md-12'>
					<div class='row'>
						<div class='col-6'>
							<button class="btn btn-danger btn-sm" id= 'member-delete'>선택목록 삭제</button>
						</div>
						<div class='col-6 text-right'>
							<button class="btn btn-warning btn-sm" id= 'payment-add'>결제자 등록</button>
						</div>
					</div>
				</div>
			</div>
			<!-- 인사목록 -->
		</div>
    </div>
  </div>
</div>
</body>
</html>