<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<c:url var="phoneAPI" value="/api/phone"/>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<c:url value='/style/css/adminphone.css'/>"
	rel="stylesheet" type="text/css" />
</head>
<body>

	<div style="margin: 0 auto">
		<button id="addBtn" class="controlBtn">
			<a href="<c:url value='/ad/phone/add'/>" id="addLink">THÊM MỚI
		</button>
		</br> </br>
		<div class="row">
			<table id="maintable" class="table table-striped ">
				<thead>
					<tr>
						<th>Id</th>
						<th>Ảnh</th>
						<th>Sản phẩm</th>
						<th>Giá</th>
						<th>Sẵn có</th>
						<th>Tùy chỉnh</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach items="${model.listResult}" var="phonei">
						<tr>
							<td class="productId">${phonei.id}</td>
							<td><img style="width: 60px; height: 60px"
								src="<c:url value='${phonei.anh}' />" alt=""></td>
							<td>${phonei.tensanpham}</td>
							<td>${phonei.gia}</td>
							<td>${phonei.kho}</td>
							<td><a class="itemi__modify" href="<c:url value='/ad/phone/upd/${phonei.id}' />"><i
									style="font-size: 40px" class="fa fa-pencil-square-o"
									aria-hidden="true"></i></a> <a class="itemi__modify delLink"
								href=""><i style="font-size: 40px" class="fa fa-trash"></i></a>
							</td>
						</tr>

					</c:forEach>
				</tbody>
			</table>
			<form id="mainForm" action="<c:url value='/ad/phone' />">
				<input type="hidden" id="page" name="page"> <input
					type="hidden" id="limit" name="limit">
			</form>
		</div>

		<div id="paging" class="row">
			<ul class="pagination" id="pagination"></ul>
		</div>

		<content tag="local_script"> <script
			src="/NienLuan/common/paging/jquery.twbsPagination.js"></script> <script>
				var curPageIdx = ${model.pageIdx};
				var totalPage = ${model.totalPage};

				$(function() {
					window.pagObj = $('#pagination').twbsPagination({
						totalPages : totalPage,
						visiblePages : 10,
						startPage : curPageIdx,
						onPageClick : function(event, page) {
							if (curPageIdx != page) {
								$('#limit').val(30);
								$('#page').val(page);
								$('#mainForm').submit();
							}

						}
					});
				});
			</script> 
			<script type="text/javascript">
			
    $(document).ready(function() {

        $("#maintable").on("click", ".delLink", function(e) {
            e.preventDefault();
           
            tri = $(this).closest("tr");
            idToDel = tri.find(".productId").text();
            delPhone(idToDel);
            $(this).closest("tr").remove();

        });
       

        function delPhone(data) {
            $.ajax({
                url: "${phoneAPI}",
                type: "Delete",
    	        async: true,
    	        contentType: 'application/json',
                data: JSON.stringify(data),
                success: function(res) {
                alert("Xóa thành công");
                   
                },
                error: function(request, status, error) {
                    console.log(request.responseText);
                }
            });
        }
    });
    </script>
			
			
			
			
			
			</content>
</body>
</html>