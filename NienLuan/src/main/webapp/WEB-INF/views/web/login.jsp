<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>

</head>
<body>

	<div style="margin: 0 auto" class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
		<form:form modelAttribute="user" action="dang-nhap"
			style="font-size:1.2rem;" method="post">
			<h2 class="text-center" style="color: #009DAE; font-weight: bold">ĐĂNG
				NHẬP</h2>

			<div class="form-group">
				<label>Tên tài khoản</label>
				<form:input class="form-control" path="tentaikhoan" />
			</div>

			<c:if test="${tentaikhoanmes != null}">
				<span class="help-block"> <strong style="color: red">${tentaikhoanmes}</strong>
				</span>
			</c:if>
			<div class="form-group">
				<label >Mật khẩu</label>
				<form:input class="form-control" path="matkhau" type="password" />
			</div>
		
			<c:if test="${matkhaumes != null}">
				<span class="help-block"> <strong style="color: red">${matkhaumes}</strong>
				</span>
			</c:if>

			<div style="margin-top: 60px">
				<form:button type="success" class="btn btn-success">Đăng nhập</form:button>

			</div>
		</form:form>

	</div>

</body>
</html>