<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<a class="navbar-brand" href="#">IT-QNU</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="#">Trang chủ
					<span class="sr-only">(current)</span>
			</a></li>

			<c:if test="${userobj.role eq 'admin' }">
				<li class="nav-item"><a class="nav-link" href="add_job.jsp"><i
						class="fas fa-plus-circle"></i> Đăng việc làm</a></li>
				<li class="nav-item"><a class="nav-link" href="view_jobs.jsp"><i
						class="fas fa-eye"></i> Danh sách việc làm</a></li>
			</c:if>


		</ul>
		<form class="form-inline my-2 my-lg-0">
			<c:if test="${not empty userobj }">
				<a href="#" class="btn btn-light mr-1"><i
					class="fas fa-user"></i> Admin</a>
				<a href="#" class="btn btn-light"><i
					class="fas fa-sign-in-alt"></i> Đăng xuất</a>
			</c:if>

			<c:if test="${empty userobj }">
				<a href="login.jsp" class="btn btn-light mr-1"><i
					class="fas fa-sign-in-alt"></i> Đăng nhập</a>
				<a href="signup.jsp" class="btn btn-light"><i
					class="fas fa-user"></i> Đăng kí</a>
			</c:if>


		</form>
	</div>
</nav>