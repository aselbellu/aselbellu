<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<head>
<style>
.modal-header {
background-color:#DFF0D8;
}
.modal-footer {
background-color:#DFF0D8;
}
#board_line {
 border-bottom:1px solid gold;
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>공지 사항</title>
</head>
<body>
<!-- Head Page -->
	<div class="container" style='min-height:750px'>
		<div class="page-header">
				<h2>
				<i class="glyphicon glyphicon-list-alt"></i> Notice	<small> 공지 및 소식을 전달 받을 수 있습니다.</small>
	  			</h2>
		</div>
<!-- 게시판 본문내용 -->
	<div class="container" style="padding-left:30px;padding-right:30px">
		<div class="row" style="margin-bottom:10px">
		<div class="col-md-6">
		</div>
		<div class="col-xs-12 col-md-6" style="padding-right: 0px;">
			<div class="input-group">
      			<input type="text" class="form-control" placeholder="검색 내용을 입력해주세요">
     			<span class="input-group-btn input-group">
       				 <input type="submit" class="btn btn-default" value="Search">
      			</span>
   			</div><!-- /input-group -->
		</div>
		</div>
	  	<div class="row" style="background-color:#DFF0D8; border-bottom:1px solid #C0C0C0;">
	  		<div class="col-xs-2 col-md-1">
	  			<h5>번 호</h5>
	  		</div>
	  		<div class="col-xs-10 col-md-6">
	  			<h5>제 목</h5>
	  		</div>
	  		<div class="col-xs-4 col-md-2">
	  			<h5><i class="glyphicon glyphicon-user"></i> 작성자</h5>
	  		</div>
	  		<div class="col-xs-4 col-md-2">
	  			<h5><i class="glyphicon glyphicon-time"></i> 작성일</h5>
	  		</div>
	  		<div class="col-xs-4 col-md-1">
	  			<h5><i class="glyphicon glyphicon-thumbs-up"></i> 조회수</h5>
	  		</div>
	  	</div>
	  	<div class="row" style="background-color:white; border-bottom:1px solid #C0C0C0;">
	  	<c:forEach items="${list}" var="dto">
	  		<div class="col-xs-2 col-md-1">
	  			<h5>${dto.NOTICE_NO}</h5>
	  		</div>
	  		<div class="col-xs-10 col-md-6">
	  			<h5><a href="detail.notice?no=${dto.NOTICE_NO }">${dto.NOTICE_TITLE}</a></h5>
	  		</div>
	  		<div class="col-xs-4 col-md-2">
	  			<h5><i class="glyphicon glyphicon-user"></i> ${dto.NOTICE_WRITER}</h5>
	  		</div>
	  		<div class="col-xs-4 col-md-2">
	  			<h5><i class="glyphicon glyphicon-time"></i> ${dto.NOTICE_WRITEDATE }</</h5>
	  		</div>
	  		<div class="col-xs-4 col-md-1">
	  			<h5><i class="glyphicon glyphicon-thumbs-up"></i> ${dto.NOTICE_HIT }</h5>
	  		</div>
	  	</c:forEach>
	  	</div>
	  
	  	<div class="row" style="background-color:#DFF0D8; border-bottom:1px solid #C0C0C0;">
	  		<br>
	  	</div>
	</div>
	<br>
<div class="container" >
	<div class="row" >
		<div class="col-xs-6 col-md-6">
			 <ul class="pagination text-center" style="margin-top:0px;">
			 <c:if test="${page <= 1 }">
			    <li>
			        <span aria-hidden="true">&laquo;</span>
			    </li>
			 </c:if>
			 <c:if test="${page > 1 }">
			    <li>
			      <a href="list.notice?page=${page - 1 }" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			 </c:if>
		
			 <c:forEach var="pageNum" begin="${startpage + 1}" end="${endpage }" step="1">
			    <c:if test="${pageNum == page }">
			    	<li><a href="">${pageNum }</a></li>
			    </c:if>
			    <c:if test="${pageNum != page }">
			    	<li><a href="list.notice?page=${pageNum }">${pageNum }</a></li>
			    </c:if>
			 </c:forEach>
			 <c:if test="${page >= maxpage}">
			 	<li>
			  	 	<span aria-hidden="true">&raquo;</span>
			  	</li>
			 </c:if>
			 <c:if test="${page < maxpage}">
			  <li>
			      <a href="list.notice?page=${page + 1 }" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			  </li>
			 </c:if>
			  </ul>
		</div>
		<c:if test="${camper_grade == 'master' }">
		<div class="col-xs-6 col-md-6">
			 <div class="form-group text-right">
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal2">
			 		<i class="glyphicon glyphicon-pencil"></i> 글쓰기
				</button>
			</div>
		</div>
		</c:if>
     </div>
</div><!-- List -->
</div>

<!--  Modal  -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	      <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
		<h4 class="modal-title" id="myModalLabel">글쓰기 <small> 공지사항 </small></h4>
	      </div>
	      <div class="modal-body">
				 <form action="./insert.notice" method="post">
					<div class="form-group">
						<label for="name" class="cols-sm-2 control-label">제 목</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon"></span>
											<input type="text" class="form-control" name="Notice_Title" placeholder="제목을 입력해주세요"/>
										</div>
									</div>
					</div>
					<div class="form-group">
						<label for="name" class="cols-sm-2 control-label">작성자</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"></span>
									<input type="text" class="form-control" name="Notice_Writer" placeholder="작성자를 입력해주세요" value='관리자'>
								</div>
							</div>
					</div>
					
					<div class="form-group">
						<label for="name" class="cols-sm-2 control-label">내 용</label>
						<div class="cols-sm-10">
							<textarea id="summernote" class="form-contol summernote" name="Notice_Main"></textarea>
						</div>
					</div>
					<br>
					<div class="form-group text-right">
			     			<button type="submit" class="btn btn-info" onclick="loginCheck()">작성</button>
			     			<button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal2">닫기</button>
			     	</div>
				</form>
	      </div>
	      <div class="modal-footer">
	      </div>
	    </div>
	  </div>
	</div>

<script>
  $(function() {
    $('#summernote').summernote({height: 300});
  });
</script>
</body>
</html>