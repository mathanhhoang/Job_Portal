<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chỉnh sửa thông tin</title>
<%@include file="all_component/all_css.jsp"%>
</head>
<body style="background-color: #f7f7f7;">
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"/>
	</c:if>
	<%@include file="all_component/navbar.jsp"%>

	<div class="container-fluid">
		<div class="row p-4">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<div class="text-center">
							<i class="fa fa-user-plus fa-2x" aria-hidden="true"></i>
							<h5>Chỉnh sửa thông tin</h5>
						</div>
				
						
						<form action="update_profile" method="post">
							<input type="hidden" name="id" value="${userobj.id }">
							
							<div class="form-group">
								<label>Full Name</label> <input type="text" required="required"
									class="form-control" id="exampleInputEmail1"
									aria-descruibedby="emailHelp" name="name" value="${userobj.name }">
							</div>

							<div class="form-group">
								<label>Qualification</label> <input type="text"
									required="required" class="form-control"
									id="exampleInputEmail1" aria-descruibedby="emailHelp"
									name="qua" value="${userobj.qualification }">
							</div>

							<div class="form-group">
								<label>Email</label> <input type="email" required="required"
									class="form-control" id="exampleInputEmail1"
									aria-descruibedby="emailHelp" name="email" value="${userobj.email }">
							</div>

							<div class="form-group">
								<label>Password</label> <input type="password"
									required="required" class="form-control"
									id="exampleInputPassword1" name="ps" value="${userobj.password }">
							</div>
							<button type="submit"
								class="btn btn-primary badge-pill btn-block">Cập nhật</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>