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
<title>User : Home</title>
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
				<h3 class="text-center text-primary">Tất cả công việc</h3>
				
				<c:if test="${not empty succMsg }">
					<h4 class="text-center text-danger">${succMsg}</h4>
					<c:remove var="succMsg"/>
				</c:if>
				
				<div class="card">
					<div class="card-body">
					
						<form class="form-inline" action="more_view.jsp" method="get">
							<div class="form-group col-md-4 mt-1">
								<h5>Tên công việc</h5>
							</div>
							<div class="form-group col-md-3 mt-1">
								<h5>Địa điểm</h5>
							</div>
							
							<div class="form-group col-md-3 mt-1">
								<h5>Lĩnh vực</h5>
							</div>
							<div  class="form-group col-md-4">
								<input type="text" class="form-control"
									id="search" name="search" style="width: 90%;" placeholder="Nhập tên công việc....">
							</div>
							<div class="form-group col-md-3">
								<select name="loc" class="custom-select" id="inlineFormCustomSelectPref">
									<option selected value="lo">Chọn...</option>
									<option value="TP.HCM">TP.HCM</option>
									<option value="Hà Nội">Hà Nội</option>
									<option value="Quy Nhơn">Quy Nhơn</option>
								</select>
							</div>
							
							<div class="form-group col-md-3">
								<select name="cat" class="custom-select" id="inlineFormCustomSelectPref">
									<option selected value="ca">Chọn...</option>
									<option value="IT">IT</option>
									<option value="Devloper">Devloper</option>
									<option value="Ngân hàng">Ngân hàng</option>
									<option value="Bất động sản">Bất động sản</option>
								</select>
							</div>
							
							<button class="btn btn-success"><i class="fas fa-search"></i> Tìm kiếm</button>
						
						</form>
					
					</div>
				</div>
				<%
				JobDAO dao = new JobDAO(DBConnect.getConn());
				List<Jobs> list = dao.getAllJobsForUser();
				for (Jobs j : list) {
				%>
				<div class="card mt-2">
					<div class="card-body">
						<div class="text-center text-primary">
							<i class="far fa-clipboard fa-2x"></i>
						</div>
						
						<h4><%=j.getTitle()%></h4>
						
						<%
						if (j.getDescription().length() > 0 && j.getDescription().length() < 120) {
						%>
						<p><%=j.getDescription() %></p>
						<%
						} else {
						%>
						<p><%=j.getDescription().substring(0,120) %>...</p>
						<% 
						}
						%>

						<div class="form-row">
							<div class="form-group col">
								<input type="text" class="form-control form-control-sm"
								value="Địa điểm: <%=j.getLocation()%>" readonly>
							</div>
							<div class="form-group col">
								<input type="text" class="form-control form-control-sm"
								value="Lĩnh vực: <%=j.getCategory()%>" readonly>
							</div>
							
						</div>
						<h6>
							Ngày đăng tuyển:
							<%=j.getPdate().toString()%>
						</h6>
						<div class="text-center">
							<a href="one_view.jsp?id=<%=j.getId() %>"
							class="btn btn-outline-success"><i class="fas fa-info-circle"></i> Xem chi tiết</a>
						</div>
					</div>
				</div>
				<% } %>
			</div>
		</div>
	</div>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>
