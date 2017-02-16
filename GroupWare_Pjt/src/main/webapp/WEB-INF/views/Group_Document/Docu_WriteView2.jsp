<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	/* 결제자 테이블 */
	.pay-table {
		border: 1px solid black;
	}
	.pay-table td, .table th {
		border: 1px solid black;
	}
	.pay-table th {
		text-align: center;
		width: 200px;
		vertical-align: middle;
		font-size: 18px
	}
	.pay-Name th {
		vertical-align: middle;
	}
	.pay-Name td {
		text-align: center;
		width: 200px;
		font-size: 17px;
	}
	.pay-Sign td {
		text-align: center;
		width: 200px;
		height: 130px;
	}
	/* Pay-Modal CSS */
	.paymodal-table {
		text-align:center;
	}
	.paymodal-table thead th {
		border-top : 1px solid #8C8C8C;
		border-right : 1px solid #8C8C8C;
		border-left : 1px solid #8C8C8C;
		border-bottom : 1px solid #8C8C8C;
		text-align:center;
	}
	.paymodal-table tbody td {
		border:1px solid #8C8C8C;
		text-align:center;
	}
</style>
<script>
    $(document).ready(function(){
        
        /* 결제선택시 세부선택 종류별 표시 */
        $(document).on("change","#mainDocu-Select",function(){
            var tempMainDocu = $("#mainDocu-Select").val();
            var tempSubDocu = "";
            
            if (tempMainDocu == 'draft-docu'){
                // 기안서 선택
                tempSubDocu += "<option value=''>선택</option>"
                              +"<option value='vacation-draft'>휴가 기안서</option>";
                
                $("#subDocu-Select").parent().parent().css("display","block");
                $("#subDocu-Select").html(tempSubDocu);
                
            } else if (tempMainDocu == 'consult-docu') {
                // 품의서 선택
                tempSubDocu += "<option value=''>선택</option>"
                              +"<option value='spending-consult'>지출품의서</option>";
                
                $("#subDocu-Select").parent().parent().css("display","block");
                $("#subDocu-Select").html(tempSubDocu);
            } else if (tempMainDocu == ''){
                // 공백을 선택
                alert('서류종류를 선택해주세요.');
                $("#subDocu-Select").parent().parent().css("display","none");
            }
       });/* 결제선택시 세부선택 종류별 표시 */
        
        /* 세부선택 해당 문서 HTML 로드 */
        $(document).on("change","#subDocu-Select",function(){
            var tempSubDocu = $("#subDocu-Select").val();
            var tempLocation = "";  // 로드 HTML 경로
            if (tempSubDocu == "vacation-draft") {
                // 휴가 기안서 선택
                tempLocation = "./resources/docu_html/Vacation-Draft.html";
            
            } else if (tempSubDocu == "spending-consult") {
                // 지출 결의서 선택
                tempLocation = "./resources/docu_html/Spending-Consult.html";
            }
                        
            // tempLocation 경로의 Html 로드
            $('#mainDocu-Contents').load(tempLocation,function(){
               /* 르드 완료 후 실행 할 공통 메서드 */
               var tempValue = "";
               // 작성일 오늘 날짜 추가
               var tempDate = new Date();
               tempValue = tempDate.getFullYear()+"-"+(tempDate.getMonth()+1)+"-"+tempDate.getDate();
               $('#pay-WriteDate').val(tempValue);
               // 작성 부서  추가
               tempValue = '<%=session.getAttribute("department")%>';
               $('#pay-WriteDepart').val(tempValue)
               // 부서의 등록된 문서 max + 1
               var tempDocuNum = department_DocuNum(tempValue);
               // 부서 + 년도 + - + (부서문서번호+1) 형식
               tempValue += (tempDate.getFullYear() + "-" + tempDocuNum);
               $('#pay-WriteDocuNum').val(tempValue);
            });
        });
       
        /* 결제선 등록 버튼 */
		$(document).on("click", "#pay-Btn", function() {
			var tempList = part_List();
			var tempAppend = "";
			
			for (var i = 0; i < tempList.length ; i++){
				tempAppend += "<li class='paymentGroup'>"
							 +"	<a href=''><i class='fa fa-folder-o' aria-hidden='true'></i> "+tempList[i].department+"</a>"
							 +"</li>"
			}
			$('#payment-content li').remove();	//기존정보삭제
			$('#payment-content').append(tempAppend);	//기존정보삭제
			$('#pay-Modal').modal();
		});/* 결제선 등록 버튼 */
		
		/* 부서의 포함된 사원 결제Modal Table List */
		$(document).on("click",".paymentGroup",function(){
			var tempMembers = member_List($(this).text());
			var tempHeadAppend = "<tr>"
								+"	<th width='5%'>소속부서</th>"
								+"	<th width='3%'>직위</th>"
								+"	<th width='3%'>성명</th>"
								+"	<th width='1%'>선택</th>"
								+"</tr>";
			var tempBodyAppend = "";;
			for( var i = 0 ; i < tempMembers.length ; i++){
				tempBodyAppend += "<tr>"
								+"	<td>"+tempMembers[i].department+"</td>"
							 	+"	<td>"+tempMembers[i].position+"</td>"
							 	+"	<td>"+tempMembers[i].name_KOR+"</td>"
							 	+"	<td><button value='"+tempMembers[i].empnum+"' class='member-addbtn form-control btn-warning btn-sm'>"
							 	+"	<i class='fa fa-plus-square' aria-hidden='true'></i>"
							 	+"	</button></td>"
							 	+"</tr>";
			}
			$('.paymodal-table thead').html(tempHeadAppend);
			$('.paymodal-table tbody').html(tempBodyAppend);
			return false;
		});
		
		/* 소속된 인사 선택 목록으로 추가 */
		$(document).on("click", ".member-addbtn", function(){
			var tempEmpnum = $(this).val();
			var tempAppend = "";
			
			var tempMemberInfo = member_Info(tempEmpnum);
			var tempPosition = tempMemberInfo.position;
			var tempDepartment = tempMemberInfo.department;
			var tempNameKor = tempMemberInfo.name_KOR;
			
			var tempValueCount = $('#paymodal-select option').size();	//선택 목록의 사원 수
			var tempResult = false;	// 중복체크
			
			if (tempValueCount >= 4){
				alert('선택 가능한 인원은 4 명 입니다.');
			} else if (tempValueCount != 0) {
				// 선택 목록 중복방지 Check
				for (var i = 0 ; i < tempValueCount ; i++){
					if($("#paymodal-select option:eq("+i+")").val() == tempEmpnum) {
						tempResult = true;
						break;
					}
				}
				if (tempResult == true){
					// 해당 목록이 존재할 경우 추가 없이 중복 존재 경고창
					alert('중복된 인사 정보 입니다.');
				} else {
					// 해당 목록이 존재하지 않을 경우 추가
					$("#paymodal-select").append("<option value='"+tempEmpnum+"'>"+tempNameKor+"</option>");
				}
			} else {
				$("#paymodal-select").append("<option value='"+tempEmpnum+"'>"+tempNameKor+"</option>");
			}
		});/* 소속된 인사 선택 목록으로 추가 */
		
		/* 선택 목록 인사정보 삭제 */
		$(document).on("click", ".member-delbtn", function(){
			$("#paymodal-select option:selected").remove();
		});/* 선택 목록 인사정보 삭제 */
		
		/* 선택 목록 본문 결제자 등록 */
		$(document).on("click", "", function(){
			
		});/* 선택 목록 본문 결제자 등록 */
		
    });
    
    /* 공통 메서드 */
	    function part_List() {
	    	// 결제선 , 대상등록 부서 리스트
	    	var tempList = "";
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
					tempList = data.departList;
				},
			});
	    	
	    	return tempList;
	    }
		function member_List(department) {
			// 부서 선택 시 멤버 정보
			var tempMembers = "";
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
						tempMembers = data.members;
					},
				});
			return tempMembers;
		}
		function member_Info(empnum) {
			// 사원 선택 선택 상세정보
			var tempMemberInfo = "";
				$.ajax({
					type : "post",
					url : "person_MemberInfo.ps",
					data: {empnum:empnum},
					async: false, // ture: 비동기, false: 동기
					dataType : "json",
					contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					error : function(x,e) {
						alert('접속 에러');
					},
					success : function(data) {
						tempMemberInfo = data.info;
					},
				});
			return tempMemberInfo;
		}
		function department_DocuNum(department){
			// 부서의 등록된 서류 Max + 1
			var tempDocuNum = "";
			$.ajax({
				type : "post",
				url : "docu_WriteCount.dc",
				data: {department:department},
				async: false, // ture: 비동기, false: 동기
				dataType : "json",
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				error : function(x,e) {
					alert('접속 에러');
				},
				success : function(data) {
					tempDocuNum = data.departNum;
				},
			});
		return tempDocuNum;
		}
	/* 공통 메서드 */

</script>
</head>
<body>
    <div class='alert alert-success' role='alert'>
		<h4 class='alert-heading'>결제 작성</h4>
		<p><small>기안서 / 품의서 / 작성 가능합니다.</small>		
	</div><!-- Head Title -->
    <div class='col-xl-12 col-lg-12 col-md-12'>
        <!-- 서류선택 카드 -->
        <div class="card card-outline-warning">
           <!-- 카드 타이틀 -->
            <div class="card-header card-warning">
                <div style='color:white;'>
                    <i class="fa fa-search" aria-hidden="true"></i> 서류선택
                </div>
            </div><!-- End 카드 타이틀 -->
            <!-- 카드 Main -->
            <div class='card-block'>
                <div class='text-danger' style='margin-bottom:10px;'>※ 결제 대분류 / 소분류를 선택하세요.</div>
                <div class='row'>
                    <!--결제선택-->
                    <div class='form-group col-4'>
                        <label><i class="fa fa-check-square-o" aria-hidden="true"></i> 결제선택</label>
                        <div class="input-group input-group-sm">
                            <select class='form-control' id='mainDocu-Select'>
                                <option value=''>선택</option>
                                <option value='draft-docu'>기안서</option>
                                <option value='consult-docu'>품위서</option>
                            </select>
				        </div>
                    </div><!-- End 결제선택-->
                    <!--세부선택-->
                    <div class='form-group col-8' style='display:none'>
                        <label><i class="fa fa-pencil-square-o" aria-hidden="true"></i> 세부선택</label>
                        <div class="input-group input-group-sm">
                            <select class='form-control' id='subDocu-Select'>
                                
                            </select>
                        </div>
                    </div><!-- End 세부선택-->
                </div><!-- End Row -->
            </div><!-- End 카드 Main -->
        </div><!-- End 서류선택 카드 -->
        <!-- 본문작성 카드 -->
        <div class="card card-outline-success" style='margin-top:10px;'>
            <div class="card-header card-success" style='color:white;'>
				<i class="fa fa-user-circle-o" aria-hidden="true"></i> 작성 화면
			</div>
            <div class="card-block" id='mainDocu-Contents' style='padding-left:0px;padding-right:0px;'>
		    </div>
        </div><!-- End 본문작성 카드 -->
    </div>
     <!-- 결제자 등록 Modal -->
    <div class="modal fade" id="pay-Modal" >
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-body">
					<div class='container-fluid'>
						<div class='row'>
							<!-- 부서정보 -->
							<div class='col-xl-2 col-lg-3 col-md-4'	style='padding-right:0px; padding-left:0px; background-color:#2e353d;'>
								<div class="nav-side-menu">
									<div class="brand">사원선택</div>
									<i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse" data-target="#payment-content"></i>
									<div class="menu-list">
										<ul id="payment-content" class="menu-content collapse out">
										</ul>
									</div>
								</div>
							</div><!-- 부서정보 -->
							<!-- 결제정보 -->
							<div class='col-xl-10 col-lg-9 col-md-8' style="min-height: 400px; padding-left: 0px; padding-right: 0px;">
								<div class='alert alert-success' role='alert'><!-- Head Title -->
									<h4 class='alert-heading'> 결제자 등록</h4>
									<p><small>원하시는 담당자 , 해당직원을 선택해주세요.</small>		
								</div><!-- Head Title -->
								<div class='col-12 text-danger' style='font-size:15px;'><i class='fa fa-user fa-lg'></i> 소속 인사</div>
								<div class='col-12' style='padding-top:5px;overflow-y: auto;height:150px;'>
									<table class='paymodal-table table table-sm'>
										<thead>
											<tr>
												<th>부서를 선택해주세요.</th>
											</tr>
										</thead>
										<tbody>
										</tbody>
									</table>
								</div>
								<div class='col-12 text-danger' style='font-size:15px;'><i class='fa fa-user fa-lg'></i> 선택 목록</div>
								<div class='col-12' style='padding-top:5px;'>
									<select class='form-control' multiple="multiple" id='paymodal-select'>
									
									</select>
								</div>
								<div class='col-xl-12 col-lg-12 col-md-12'>
									<div class='text-danger'><small>● Ctrl + 선택 다중 선택이 가능합니다.</small></div>
								</div>
								<div class='col-xl-12 col-lg-12 col-md-12' style='padding-bottom:20px;'>
									<div class='row'>
										<div class='col-12 text-right'>
											<button class="member-delbtn btn btn-danger btn-sm">선택목록 삭제</button>
											<button class="btn btn-warning btn-sm" id= 'payment-add'>결제자 등록</button>
										</div>
									</div>
								</div>
							</div><!-- 결제정보 -->
						</div>
					</div>
                </div>
            </div>
        </div>
    </div><!-- 결제자 등록 Modal End-->
</body>
</html>