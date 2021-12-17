
<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
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
<title>Danh sách người dùng</title>
<%@include file="all_component/all_css.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<c:if test="${userobj.role ne 'admin'}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h3 class="text-center text-primary" style="padding-top: 20px;padding-bottom:10px;">Danh sách người dùng</h3>
				<c:if test="${not empty succMsg}">
					<div class="alert alert-success text-center" role="alert">${succMsg}</div>
					<c:remove var="succMsg" />
				</c:if>
					
					<form class="form-search" action="search_user.jsp" method="get" style=" width: 100%; text-align: center;">
						<div class="form-search box" style=" margin-bottom: 20px;">
							<input type="text" name="search" placeholder="Search Name" style="padding: 0;width: 30%;height: 35px;text-align: center;margin-right: 10px; border-radius: 7px;border: 2px solid #3F51B5">
							<button class="btn-search" style="padding: 0;height: 35px;border-radius: 7px;border: 2px solid #3F51B5;color: white; background-color: #28a745;"><i class="fas fa-search"></i>Tìm kiếm</button>
						</div>
					</form>
					<!--<div class="div-search" style="display: flex; margin-bottom: 20px; text-align: center; width: 100%;">
							<input type="text" name="searchname"  placeholder="Search Name" style="padding: 0;width: 30%;text-align: center;margin-right: 10px; border-radius: 7px;border: 2px solid #3F51B5">
							<button class="btn btn-success" style="border-radius: 7px;"><i class="fas fa-search"></i> Tìm kiếm</button>
						</div> -->
					<div class="content" style="text-aglin: center; background-color: white;">
						<div class="tablemain" style="text-aglin: center; width: 100%;">
							<table border= "1" style="margin: auto;width: 100%;border: 2px solid #3F51B5">
								<tr style="text-align: center;">
									<th>ID</th>
									<th>Name</th>
									<th>Email</th>
									<th>Qualification</th>
									<th>Edit</th>
									<th>Delete</th>
								</tr>
								
								<%
								UserDAO dao = new UserDAO(DBConnect.getConn());
								List<User> list = dao.getAllUser();
								for (User j : list) {
								%>
								<tr	style ="width: 100%;">
									<td style="width: 80px;text-align: center;"><%=j.getId()%></td>
									<td	style="width: 180px;"><%=j.getName()%></td>
									<td	style="width: 220px;"><%=j.getEmail()%></td>
									<td	style="width: 150px;text-align: center;"><%=j.getQualification()%></td>
									<td	style="width: 100px;text-align: center;"><a style="width: 80px;" href="edit_user.jsp?id=<%=j.getId()%>"
									class="btn btn-sm bg-success text-white"><i class="fas fa-edit"></i> Sửa</a> </td>
									<td	style="width: 100px;text-align: center;"><a style="width: 80px;" href="deleteuser?id=<%=j.getId()%>"
									class="btn btn-sm bg-danger text-white"><i class="fas fa-trash"></i> Xóa</a></td>
								</tr>
							<%
							}
							%>
							</table>
							
						</div>
							
				<!-- Modal -->

			</div>
		</div>
	</div>

	
</body>
</html>
