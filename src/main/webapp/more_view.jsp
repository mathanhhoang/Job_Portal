<%@page import="java.util.ArrayList"%>
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
<title>User : View Jobs</title>
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
				
				<%
				String loc = request.getParameter("loc");
				String cat = request.getParameter("cat");
				String msg = "";
				
				JobDAO dao = new JobDAO(DBConnect.getConn());
				List<Jobs> list = null;
				if("lo".equals(loc) && "ca".equals(cat)) {
					list = new ArrayList<Jobs>();
					msg = "Không có công việc phù hợp";
				} else if ("lo".equals(loc) || "ca".equals(cat)) {
					list = dao.getJobsORLocationAndCate(cat, loc);
				} else {
					list = dao.getJobsAndLocationAndCate(cat, loc);
				}
				
				if (list.isEmpty()) {
				%>
				<h4 class="text-center text-danger">Không hợp lệ</h4>
				<%
				}
				
				if (list != null) {
					for (Jobs j : list) { 
				
				%>			
				
				<div class="card mt-2">
					<div class="card-body">
						<div class="text-center text-primary">
							<i class="far fa-clipboard fa-2x"></i>
						</div>
						
						<h6><%=j.getTitle()%></h6>
						<p><%=j.getDescription() %></p>
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
						<div class="text-center">
							<a style="width: 80px" href="one_view.jsp?id=<%=j.getId() %>"
							class="btn btn-sm bg-success text-white">Chi tiết</a>
						</div>
					</div>
				</div>
				<% 
				}
				} else {
				%>
					<h4 class="text-center text-danger"><%=msg%></h4>
				<% 
				}
				%>
			</div>
		</div>
	</div>
</body>
</html>