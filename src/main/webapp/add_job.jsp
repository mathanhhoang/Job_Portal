<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add job</title>
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
						<h5>Đăng việc làm</h5>
					</div>

					<form action="add_job" method="post">
						<div class="form-group">
							<label>Tên công việc</label> <input type="text" name="title" required
								class="form-control">
						</div>
						<div class="form-row">
							<div class="form-group col-md-4">
								<label>Địa điểm</label> <select name="location"
									class="custom-select" id="inlineFormCustomSelectPref">
									<option selected>Chọn...</option>
									<option value="TP.HCM">TP.HCM</option>
									<option value="Hà Nội">Hà Nội</option>
									<option value="Quy Nhơn">Quy Nhơn</option>
								</select>
							</div>
							<div class="form-group col-md-4">
								<label>Lĩnh vực</label> <select name="category"
									class="custom-select" id="inlineFormCustomSelectPref">
									<option selected>Chọn...</option>
									<option value="IT">IT</option>
									<option value="Devloper">Devloper</option>
									<option value="Ngân hàng">Ngân hàng</option>
									<option value="Bất động sản">Bất động sản</option>
								</select>
							</div>
							<div class="form-group col-md-4">
								<label>Trạng thái</label> <select name="status"
									class="custom-select">
									<option value="Đang tuyển">Đang tuyển</option>
									<option value="Ngừng tuyển">Ngừng tuyển</option>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label>Thông tin chi tiết:</label>
							<textarea required row="6" cols="" name="desc"
								class="form-control"></textarea>
						</div>
						<button class="btn btn-success">Đăng việc</button>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>