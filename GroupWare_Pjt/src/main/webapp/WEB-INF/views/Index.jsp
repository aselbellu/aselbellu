<%@page import="javax.tools.DocumentationTool.Location"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	/* Session Null Check */
	request.setCharacterEncoding("UTF-8");
	String pageFile = (String) request.getAttribute("page");
	if (pageFile == null) {
		pageFile = "Index_Sub";
	}
%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- BootStrap CSS Ver 4.0.0 beta -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
<!-- FontAwesome CSS -->
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
<!-- Jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- BootStrap JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js"></script>

<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
.nav-side-menu {
  overflow: auto;
  font-family: verdana;
  font-size: 12px;
  font-weight: 200;
  background-color: #2e353d;
  top: 0px;
  width:100%;
  color: #e1ffff;
}
.nav-side-menu .brand {
  background-color: #23282e;
  line-height: 50px;
  display: block;
  text-align: center;
  font-size: 14px;
}
.nav-side-menu .toggle-btn {
  display: none;
}
.nav-side-menu ul,
.nav-side-menu li {
  list-style: none;
  padding: 0px;
  margin: 0px;
  line-height: 35px;
  cursor: pointer;
  /*    
    .collapsed{
       .arrow:before{
                 font-family: FontAwesome;
                 content: "\f053";
                 display: inline-block;
                 padding-left:10px;
                 padding-right: 10px;
                 vertical-align: middle;
                 float:right;
            }
     }
*/
}
.nav-side-menu ul :not(collapsed) .arrow:before,
.nav-side-menu li :not(collapsed) .arrow:before {
  font-family: FontAwesome;
  content: "\f078";
  display: inline-block;
  padding-right: 10px;
  vertical-align: middle;
  float: right;
}
.nav-side-menu ul .active,
.nav-side-menu li .active {
  border-left: 3px solid #d19b3d;
  background-color: #4f5b69;
}
.nav-side-menu ul .sub-menu li.active,
.nav-side-menu li .sub-menu li.active {
  color: #d19b3d;
}
.nav-side-menu ul .sub-menu li.active a,
.nav-side-menu li .sub-menu li.active a {
  color: #d19b3d;
}
.nav-side-menu ul .sub-menu li,
.nav-side-menu li .sub-menu li {
  background-color: #181c20;
  border: none;
  line-height: 28px;
  border-bottom: 1px solid #23282e;
  margin-left: 0px;
}
.nav-side-menu ul .sub-menu li:hover,
.nav-side-menu li .sub-menu li:hover {
  background-color: #020203;
}
.nav-side-menu ul .sub-menu li:before,
.nav-side-menu li .sub-menu li:before {
  font-family: FontAwesome;
  content: "\f105";
  display: inline-block;
  padding-left: 10px;
  padding-right: 10px;
  vertical-align: middle;
}
.nav-side-menu li {
  padding-left: 0px;
  border-left: 3px solid #2e353d;
  border-bottom: 1px solid #23282e;
}
.nav-side-menu li a {
  text-decoration: none;
  color: #e1ffff;
}
.nav-side-menu li a i {
  padding-left: 10px;
  width: 20px;
  padding-right: 20px;
}
.nav-side-menu li:hover {
  border-left: 3px solid #d19b3d;
  background-color: #4f5b69;
  -webkit-transition: all 1s ease;
  -moz-transition: all 1s ease;
  -o-transition: all 1s ease;
  -ms-transition: all 1s ease;
  transition: all 1s ease;
}
@media (max-width: 767px) {
  .nav-side-menu {
    position: relative;
    width: 100%;
  }
  .nav-side-menu .toggle-btn {
    display: block;
    cursor: pointer;
    position: absolute;
    right: 10px;
    top: 10px;
    z-index: 10 !important;
    padding: 3px;
    background-color: #ffffff;
    color: #000;
    width: 40px;
    text-align: center;
  }
  .brand {
    text-align: left !important;
    font-size: 22px;
    padding-left: 20px;
    line-height: 50px !important;
  }
}
@media (min-width: 767px) {
  .nav-side-menu .menu-list .menu-content {
    display: block;
  }
  .nav-side-menu .menu-list .member-content {
  	display: block;
  }
}
body {
  margin: 0px;
  padding: 0px;
  font-family: 'Noto Sans KR', sans-serif;
}
/* -----------------------------------  */
.main {width:100%;padding-left:0px;padding-right:0px;}
</style>
<title>그룹웨어 메인페이지</title>
<script type="text/javascript">
	<% if (session.getAttribute("name") == null){ %>
		alert('로그인을 해주세요');
		location.href='index.gr';
	<% } %>
</script>
</head>
<body>
<div class='container-fluid' >
		<div class='row' style='min-height:100%;'>
			<div class='menu col-xl-2 col-lg-3 col-md-4' style='padding-left:0px;padding-right:0px;background-color:#2e353d;'>
				<div class="nav-side-menu">
				    <div class="brand">사회복지관</div>
				    <i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse" data-target="#menu-content"></i>
				        <div class="menu-list">
				            <ul id="menu-content" class="menu-content collapse out">
				            	<li style='background-color:white;margin-right:8px;margin-left:8px; border-radius:5px; border:3px solid black;'>
				                 	<div class='col-xl-12'>
				                 		<div class='row' style='padding-top:10px;padding-bottom:5px;'>
				                 			<div class='col-4 text-center' style='height:90px;padding-left:6px;padding-right:4px;'>
				                 				<img src='./resources/Person_Image/<%=session.getAttribute("photo") %>'  style='width:100%; height:90px; border:1px solid silver;'>
				                 			</div>
				                 			<div class='col-8' style='height:90px; padding-right:2px;padding-left:6px;'>
												<div style='height:25px; color:black; font-size:14px;'> 한국사회복지협회(주)</div>
												<div style='height:25px; color:black;'><%=session.getAttribute("department") %> 소속 / <%=session.getAttribute("position") %> </div>
												<div style='height:25px; color:black;'><%=session.getAttribute("name") %> (<%=session.getAttribute("id") %>) </div>
												
				                 			</div>
				                 		</div>
				                 		<div class='row' style='padding-bottom:5px;'>
				                 			<div class='col-6' style='padding-left:4px;padding-right:2px;'>
				                 				<button class='btn btn-warning btn-sm form-control'><i class="fa fa-user-circle fa-lg" aria-hidden="true"></i> 내 정보</button>
				                 			</div>
				                 			<div class='col-6' style='padding-left:2px;padding-right:4px;'>
				                 				<a href='member_Logout.me' class='btn btn-danger btn-sm form-control'>로그아웃</a>
				                 			</div>
				                 		</div>
				                 	</div>
				                </li><!-- 공지사항 -->
				                <!-- 결제 정보 -->
				                <li  data-toggle="collapse" data-target="#docu" class="collapsed"><!-- 인사정보 -->
					                <a href=""><i class="fa fa-user-circle fa-lg" aria-hidden="true"></i> 결제정보 <span class="arrow"></span></a>
					            </li>
					                <ul class="sub-menu collapse" id="docu">
					                	<li class="active"><a href='docu_Main.dc'>결제관리</a></li>
					            	</ul><!-- 결제 정보 -->
								<!-- 인사 정보 -->
								<% if (session.getAttribute("account").equals("ADMIN")){ %>
					                <li  data-toggle="collapse" data-target="#person" class="collapsed"><!-- 인사정보 -->
					                  <a href=""><i class="fa fa-user-circle fa-lg" aria-hidden="true"></i> 인사정보 <span class="arrow"></span></a>
					                </li>
					                <ul class="sub-menu collapse" id="person">
					                    <li class="active"><a href='person_ManagerView.ps'>인사관리</a></li>
					                    <li><a href="docu_Main.dc">인사정보</a></li>
					                </ul>
								<% } %>
								<% if (session.getAttribute("account").equals("ADMIN") || session.getAttribute("access").equals("SILVERADMIN") || session.getAttribute("access").equals("SILVER")) { %>
									<!-- 노인복지 센터 -->
					                <li data-toggle="collapse" data-target="#silver" class="collapsed"><!-- 노인복지센터 -->
					                  <a href="#"><i class="fa fa-folder-o" aria-hidden="true"></i> 노인복지센터 <span class="arrow"></span></a>
					                </li>
					                <ul class="sub-menu collapse" id="silver">
					                  <li>사원 정보</li>
					                  <li>New New 2</li>
					                  <li>New New 3</li>
					                </ul><!-- 노인복지센터 -->
				                <% } %>
				                <% if (session.getAttribute("account").equals("ADMIN") || session.getAttribute("access").equals("CAREADMIN") || session.getAttribute("access").equals("CARE")) { %>
				                <!-- 주간보호 센터 -->
				                <li data-toggle="collapse" data-target="#care" class="collapsed"><!-- 주간보호센터 -->
				                  <a href="#"><i class="fa fa-folder-o" aria-hidden="true"></i> 주간보호센터<span class="arrow"></span></a>
				                </li>
				                <ul class="sub-menu collapse" id="care">
				                  <li>사원 정보</li>
				                  <li>New New 2</li>
				                  <li>New New 3</li>
				                </ul><!-- 주간보호센터 -->
				                <% } %>
				                <% if (session.getAttribute("account").equals("ADMIN") || session.getAttribute("access").equals("SILVERADMIN") || session.getAttribute("access").equals("SILVERADMIN") ) { %>
				                <!-- 푸드뱅크 센터 -->
				                <li data-toggle="collapse" data-target="#food" class="collapsed"><!-- 푸드뱅크 -->
				                  <a href="#"><i class="fa fa-folder-o" aria-hidden="true"></i> 푸드뱅크 <span class="arrow"></span></a>
				                </li>
				                <ul class="sub-menu collapse" id="food">
				                  <li>사원 정보</li>
				                  <li>New New 2</li>
				                  <li>New New 3</li>
				                </ul><!-- 푸드뱅크 -->
								<% } %>
								<!-- 공지사항 -->
				                <li>
				                	<a href="notice_List.no">
				                 	<i class="fa fa-user fa-lg"></i> 공지사항
				                 	</a>
				                </li><!-- 공지사항 -->
				            </ul>
				     </div>
				</div>
			</div>
			<div class='main col-xl-10 col-lg-9 col-md-8'>
				<jsp:include page='<%=pageFile+".jsp"%>'/>
			</div>
		</div>
	</div>
</body>
</html>