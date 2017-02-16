<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- BootStrap CSS Ver 4.0.0 beta -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
<!-- FontAwesome CSS -->
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
<!-- BootStrap JS -->
<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js"></script>
<!-- Jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<title>로그인 정보</title>
<style type="text/css">
	body{
		background-image: url('./resources/BgImage/LoginImg.png');
		background-size:100% 100%;
	}
	.container{
		opacity:0.8;
		background-color:black;
		margin-top:15%;
		padding-top:50px;
		padding-bottom:50px;
		padding-left: 350px;
		padding-right:350px;
		hover:5px;
		border-radius:20px;	
	}
}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$('#login_Btn').click(function(){
			$('#login_Form').submit();
		});
	});
</script>
</head>
<body>
	<div class='container'>
		<div class='col-xl-12 col-lg-12 col-md-12'>
			<div class='text-center text-danger'>
				<h2><B>로그인</B></h2>
			</div>
			<form action="member_Login.me" method="post" id='login_Form'>
				<div class='row'>
					<div class='col-xl-12 col-lg-12 col-md-12'>
						<div class="form-group text-danger">
							<label for="formGroupExampleInput"><b><i class="fa fa-user-circle" aria-hidden="true"></i> 아이디</b></label>
							<div class="input-group">
								<input type="text" class="form-control" name='PERSON_ID' placeholder="UserId">
							</div>
						</div>		
					</div>
					<div class='col-xl-12 col-lg-12 col-md-12'>
						<div class="form-group text-danger">
							<label for="formGroupExampleInput"><b><i class="fa fa-lock" aria-hidden="true"></i> 비밀번호</b> </label>
							<div class="input-group">
								<input type="text" class="form-control" name='PERSON_PW' placeholder="UserPassword">
							</div>
						</div>
					</div>
					<div class='col-xl-12 col-lg-12 col-md-12'>
						<a href='#' id='login_Btn' class='btn btn-outline-danger form-control'>로그인</a>
					</div>
				</div>
			</form>
			
				<div class="form-group text-danger">
					<label for="formGroupExampleInput"><b><i class="fa fa-user-circle" aria-hidden="true"></i> 아이디</b></label>
					<div class="input-group">
						<input type="text" class="form-control" name='PERSON_ID' placeholder="UserId">
					</div>
				</div>
				<div class="form-group text-danger">
					<label for="formGroupExampleInput"><b><i class="fa fa-lock" aria-hidden="true"></i> 비밀번호</b> </label>
					<div class="input-group">
						<input type="text" class="form-control" name='PERSON_PW' placeholder="UserPassword">
					</div>
				</div>
				<a href='#' id='login_Btn' class='btn btn-outline-danger form-control'>로그인</a>
			</form>
		</div>
	</div>
</body>
</html>