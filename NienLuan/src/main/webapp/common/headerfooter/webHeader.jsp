<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!--header-->
<nav id="nav1" class="navbar">
	<ul class="nav nav-pills">
		<li id="librand" class="nav-item"><a class="navbar-brand"
			href="#"><img src="<c:url value='/resource/MobileShop-logoa.png'/>" id="logo" alt=""></a>
		</li>
		<li id="lisearchcate" class="nav-item  inp-item">
			<div class="form-group ">
				<select class="form-control" id="exampleFormControlSelect1">
					<option>All</option>
					<option>Điện Thoại</option>
					<option>Laptop</option>
					<option>Phụ kiện</option>

				</select>
			</div>
		</li>
		<li id="lisearchmain" class="nav-item inp-item">
			<form id="searchmain" class="form-inline my-2 my-lg-0">
				<input style="width: 400px" class="form-control mr-sm-2"
					type="search" placeholder="Bạn cần tìm gì" aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Tìm</button>
			</form>
		</li>


		<li id="licart" class="nav-item dropdown hoverdropdown"><c:choose>
				<c:when test="${sessionScope.tentaikhoan !=null }">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> <i id="carticon"
						style="font-size: 50px" class="fa fa-shopping-cart"
						aria-hidden="true"></i>
					</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="<c:url value='/xem-gio'/>">Xem giỏ </a> <a
							class="dropdown-item" href="<c:url value='/lich-su-don-hang'/>">Lịch sử đơn hàng</a>

					</div>

				</c:when>
				<c:otherwise>
					<a class="nav-link" href="/"><i id="carticon"
						style="font-size: 50px"
						onclick="event.preventDefault(); alert('Bạn cần đăng nhập để xem giỏ hàng!')"
						style="font-size: 50px" class="fa fa-shopping-cart"
						aria-hidden="true"></i></a>
				</c:otherwise>
			</c:choose>
		<li id="liperson" class="nav-item dropdown hoverdropdown"><a
			class="nav-link dropdown-toggle" href="" id="navbarDropdown1"
			role="button" data-toggle="dropdown"> <i class="fa fa-user"
				style="font-size: 30px" id="personicon" aria-hidden="true"></i> <c:if
					test="${sessionScope.tentaikhoan !=null }">
					<span> ${sessionScope.tentaikhoan}</span>
				</c:if>

		</a>
			<div class="dropdown-menu" aria-labelledby="navbarDropdown1">
				<c:choose>

					<c:when test="${sessionScope.tentaikhoan ==null }">
						<a class="dropdown-item" href="<c:url value='/dang-nhap'/>" >Đăng nhập</a>
						<a class="dropdown-item" href="<c:url value='/dang-ky'/>">Đăng ký</a>
					</c:when>


					<c:when test="${sessionScope.role ==1}">
						<a class="dropdown-item" href="<c:url value='/ad'/>">Trang quản trị</a>
						<a class="dropdown-item"
							onclick="event.preventDefault();
                        document.getElementById('logout-form').submit();"
							href="/out">Đăng xuất</a>
						<form id="logout-form" action="<c:url value='/dang-xuat'/>" method="POST"
							style="display: none;"></form>
					</c:when>
					<c:otherwise>
						<a class="dropdown-item"
							onclick="event.preventDefault();
                      document.getElementById('logout-form').submit();"
							href="/out">Đăng xuất</a>
						<form id="logout-form" action="<c:url value='/dang-xuat'/>" method="POST"
							style="display: none;"></form>
					</c:otherwise>
				</c:choose>
			</div></li>
	</ul>

</nav>

<nav id="nav2" class="navbar navbar-expand-lg navbar-light bg-light">

	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>


	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul id="mainmenu" class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="<c:url value='/'/>">TRANG
					CHỦ<span class="sr-only">(current)</span>
			</a></li>


			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown2"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> ĐIỆN THOẠI </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown2">
					<a class="dropdown-item" href="#">Tất cả</a> <a
						class="dropdown-item" href="#">Iphone</a> <a class="dropdown-item"
						href="#">Samsung</a> <a class="dropdown-item" href="#">Oppo</a>
				</div></li>

			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown3"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> LAPTOP </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown3">
					<a class="dropdown-item" href="#">Tất cả</a> <a
						class="dropdown-item" href="#">Dell</a> <a class="dropdown-item"
						href="#">HP</a> <a class="dropdown-item" href="#">Asus</a>
				</div></li>

			<li class="nav-item active"><a class="nav-link" href="#">KHUYẾN
					MÃI<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item active"><a class="nav-link" href="#">TIN
					CÔNG NGHỆ<span class="sr-only">(current)</span>
			</a></li>
		</ul>
	</div>


</nav>

