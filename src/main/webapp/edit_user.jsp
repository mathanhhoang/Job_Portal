<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chỉnh sửa thông tin</title>
<%@include file="all_component/all_css.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<c:if test="${userobj.role ne 'admin'}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<%@include file="all_component/navbar.jsp"%>

	<div class="container p-2">
		<div class="col-md-10 offset-md-1">
			<div class="card">
				<div class="card-body">
					<div class="text-center text-success">
						<i class="fas fa-user-friends fa-3x"></i>
						<c:if test="${not empty succMsg}">
							<div class="alert alert-success" role="alert">${succMsg}</div>
							<c:remove var="succMsg" />
						</c:if>

						<%
						int id = Integer.parseInt(request.getParameter("id"));
						UserDAO dao = new UserDAO(DBConnect.getConn());
						User j = dao.getUserById(id);
						%>

						<h5>Chỉnh sửa thông tin</h5>
					</div>

					<form action="update_user" method="post">
						<input type="hidden" value="<%=j.getId()%>" name="id">
						<div class="form-group">
							<label>Full Name</label> <input type="text" name="name" required
								class="form-control" value="<%=j.getName()%>">
						</div>
						<div class="form-group">
							<label>Qualification</label> <input type="text" name="qua" required
								class="form-control" value="<%=j.getQualification()%>">
						</div>
						<div class="form-group">
							<label>Email</label> <input type="text" name="email" required
								class="form-control" value="<%=j.getEmail()%>">
						</div>
						<div class="form-group">
							<label>Password</label> <input type="password" name="ps" required
								class="form-control" value="<%=j.getPassword()%>">
						</div>
						
						<button class="btn btn-success">Cập nhật</button>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
