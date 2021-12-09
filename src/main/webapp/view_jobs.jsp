
<%@page import="com.entity.Jobs"%>
<%@page import="java.util.List"%>
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
<title>Danh sách việc làm</title>
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
				<h3 class="text-center text-primary">Danh sách việc làm</h3>
				<c:if test="${not empty succMsg}">
					<div class="alert alert-success text-center" role="alert">${succMsg}</div>
					<c:remove var="succMsg" />
				</c:if>

				<%
				JobDAO dao = new JobDAO(DBConnect.getConn());
				List<Jobs> list = dao.getAllJobs();
				for (Jobs j : list) {
				%>
				<div class="card mt-2">
					<div class="card-body">
						<div class="text-center text-primary">
							<i class="far fa-clipboard fa-2x"></i>
						</div>


						<h4><%=j.getTitle()%></h4>
						<p><%=j.getDescription()%></p>
						<div class="form-row">
							<div class="form-group col-md-4">
								<input type="text" class="form-control form-control-sm"
									value="Địa điểm: <%=j.getLocation()%>" readonly>
							</div>

							<div class="form-group col-md-4">
								<input type="text" class="form-control form-control-sm"
									value="Lĩnh vực: <%=j.getCategory()%>" readonly>
							</div>

							<div class="form-group col-md-4">
								<input type="text" class="form-control form-control-sm"
									value="Trạng thái: <%=j.getStatus()%>" readonly>
							</div>
						</div>
						<h6>
							Ngày đăng tuyển:
							<%=j.getPdate()%></h6>
						<div class="text-center">
							<a style="width: 80px;" href="edit_job.jsp?id=<%=j.getId()%>"
								class="btn btn-sm bg-success text-white"><i class="fas fa-edit"></i> Sửa</a> 
							<a style="width: 80px;" data-toggle="modal" data-target="#exampleModalCenter"
								class="btn btn-sm bg-danger text-white"><i class="fas fa-trash"></i> Xóa</a>
						</div>
					</div>
				</div>
				<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Thông báo</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        Bạn có chắn chắn muốn xoá?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <a type="button" class="btn btn-danger text-white" href="delete?id=<%=j.getId()%>"><i class="fas fa-trash"></i> Xóa</a>
      </div>
    </div>
  </div>
</div>
				<%
				}
				%>


			</div>
		</div>
	</div>

	
</body>
</html>