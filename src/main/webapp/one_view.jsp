<%@page import="java.util.List"%>
<%@page import="com.entity.Jobs"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.dao.JobDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User : Job</title>
<%@include file="all_component/all_css.jsp"%>
</head>
<body style="background-color: #f1f2f3">

	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"/>
	</c:if>

	<%@include file="all_component/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
			
				<%
				int id = Integer.parseInt(request.getParameter("id"));
				JobDAO dao = new JobDAO(DBConnect.getConn());
				Jobs j = dao.getJobById(id);
				%>
				
				<%-- <c:if test="${not empty succMsg }">
					<h4 class="text-center text-danger">${succMsg}</h4>
					<c:remove var="succMsg"/>
				</c:if> --%>
				
				<div class="card mt-5">
					<div class="card-body">
						<div class="text-center text-primary">
							<i class="far fa-clipboard fa-2x"></i>
						</div>
						
						<h6><%=j.getTitle()%></h6>
						<p><%=j.getDescription() %></p>
						
						<br>
						<div class="form-row">
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
								value="Địa điểm: <%=j.getLocation()%>" readonly>
							</div>
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
								value="Lĩnh vực: <%=j.getCategory()%>" readonly>
							</div>
						</div>
						<h6>
							Ngày đăng tuyển:
							<%=j.getPdate().toString()%>
						</h6>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>