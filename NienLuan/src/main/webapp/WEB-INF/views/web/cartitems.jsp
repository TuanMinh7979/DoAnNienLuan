<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<c:url var="cartitemAPI" value="/api/web/cartitem" />
<c:url var="orderAPI" value="/api/order" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<c:url value='/style/css/cartitems.css'/>"
	rel="stylesheet" type="text/css" />
</head>
<body>
	<h2 class="text-center titletext">GIỎ HÀNG</h2>

	<div id="maincontent">

		<div class="table-responsive col-8 cart__content ">
			<table id="maintable" class="table ">

				<thead>
					<tr>
						<th class="text-center"></th>
						<th class="text-center">Sản phẩm</th>
						<th class="text-center">Màu sắc</th>
						<th class="text-center">Số lượng</th>
						<th class="text-center">Đơn giá</th>
						<th class="text-center">Giá</th>
						<th></th>
					</tr>
				</thead>
				<tbody id="maintableBody">
					<c:forEach var="i" begin="0" end="${itemList.size()-1}">
						<tr>
							<td><img class="proImg"
								src="<c:url value='${itemproductList[i].anh}'/>" /></td>
							<td>${itemproductList[i].tensanpham}</td>
							<td class="text-left mausaci">${itemproductList[i].mau}</td>
							<td class="text-left soluongi">${itemList[i].soluong}</td>
							<td class="text-left">${itemproductList[i].gia}<span>đ</span>
							</td>
							<td class="pricei text-left">
							
							${itemproductList[i].gia * itemList[i].soluong}<span>đ</span>
							</td>
							<td class="text-left"><button
									class="btn btn-sm btn-danger delRowBtn">
									<i class="fa fa-trash"></i>
								</button></td>
							<input class="itemId" type="hidden"
								value="${itemList[i].id}">
						</tr>
					</c:forEach>

				</tbody>


				<tfoot>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>


						<td><strong>Tổng: </strong></td>
						<td class="text-right"><strong id="sumprice"></strong><span>Đ</span></td>
						<td></td>

					</tr>
				</tfoot>

			</table>
		</div>

		<div id="forminfo" class="card col4 ">
			<div id="headerinfo" class="card-header">
				<h3>THÔNG TIN KHÁCH HÀNG</h3>
			</div>
			<div class="card-body">
				<p>Anh/chị: ${user.tentaikhoan}</p>
				Địa chỉ:
				<p id="cur_diachi">${user.diachi}</p>
				<p>SDT: ${user.sdt}</p>
			</div>
			<button id="orderBtn">ĐẶT MUA</button>
			<input id="inp_idKh" type="hidden" value="${user.id}">




		</div>
	</div>




	<content tag="local_script"> 
	<script>
	sumprice();


	$("#maintable").on("click", ".delRowBtn", function(e) {
	    e.preventDefault();
        tri = $(this).closest("tr");
	    idx = tri.find(".itemId").val();
	    
	    
	    delEle(idx);
	    $(this).closest("tr").remove();
	    sumprice();

	});

	function sumprice() {
	    sum = 0;
	    $(".pricei").each(function() {
	        sum += parseInt($(this).text());

	    });
	    $("#sumprice").text(sum);
	}


	function delEle(idx) {
	 
	    $.ajax({
	        url: "${cartitemAPI}",
	        type: "Delete",
	        async: true,
	        contentType: 'application/json',
            data: JSON.stringify(idx),
	        success: function(req) {
                     
	        },
	        error: function(request, status, error) {
	            alert(request.responseText);
	        }
	    });

	}

	

	$("#orderBtn").click(function() {
	    data = {};
	    data["tinhtrang"]="Đang mua";
	    data["diachinhanhang"] = $("#cur_diachi").text();
	    data["idKhachhang"] = $("#inp_idKh").val();
	    data["thanhtien"] = $("#sumprice").text();
	    console.log(JSON.stringify(data));
	    
	    

	    $.ajax({
	        url: "${orderAPI}",
	        type: "Post",
	        async: true,
	        contentType: 'application/json',
	        data: JSON.stringify(data),
	        success: function(req) {
	            alert("Đặt mua thành công");
	        },
	        error: function(request, status, error) {
	            alert(request.responseText);
	        }
	    });



	});
	</script>
	
	</content>
</body>
</html>