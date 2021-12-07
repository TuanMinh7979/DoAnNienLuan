<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<c:url value='/style/css/orderhistory.css'/>"
	rel="stylesheet" type="text/css" />
</head>
<body>
<div class="table-responsive col-10" style="margin: auto">
  <table  class="table" id="maintable">
    <h3 class="text-center titletext" > LỊCH SỬ ĐƠN HÀNG</h3>
    <thead>
      <tr>

        <th style="width:10%" >Mã đơn </th>
        <th style="width:10%" >Tình trạng</th>
        <th   >Sản phẩm</th>
        <th style="width:10%" >Thành tiền</th>
        <th style="width:15%" >Thời điểm đặt hàng</th>
        <th style="width:15%" >Địa chỉ nhận hàng</th>
        <th style="width:10%"></th>
        


      </tr>
    </thead>
    <tbody id="" >
     <c:forEach var="i" begin="0" end="${itemList.size()-1}">
      <tr >
        <td class="ids" id="${itemList[i].id}" style="width:10%">### ${itemList[i].id}</td>
        <td style="width:10%" class="tinhtrang">${itemList[i].tinhtrang}</td>
        <td>
      
          <c:forEach var="j" begin="0" end="${manyitemDetailList[i].size()-1}">
            <span> <c:out value="${manyitemDetailList[i][j].tensanphamcur}"/> <span>(x</span>${manyitemDetailList[i][j].soluong}<span>), </span></span>
         </c:forEach>
        </td>
        <td  style="width:10%">${itemList[i].thanhtien}</td>
        <td style="width:15%">askjnfkjsafd</td>
        <td style="width:15%">${itemList[i].diachinhanhang}</td>
        <td style="width:10%"><button class="orderSuccessBtn">HOÀN TẤT</button></td>

      </tr>
     </c:forEach>
    </tbody>
  </table>
</div>


<content tag="local_script">
<script>
$( document ).ready(function() {
  $(".tinhtrang").each(function(){
    tri = $(this).closest("tr");
    successBtn=tri.find(".orderSuccessBtn");

    if($(this).text()==="Đang mua"){
    $(this).css({"color": "#49FF00", "font-weight":"bold"});
     }else{
      $(this).css({"color": "#FF9300","font-weight":"bold"});
       successBtn.css("background-color"," #dddddd");
       successBtn.click(function(){
         alert("Đơn hàng đã hoàn tất");
       })
    }

  });
});


$("#maintable").on("click", ".orderSuccessBtn", function(e) {
  e.preventDefault();
  data1={};
  tri = $(this).closest("tr");
  id=tri.find(".ids").attr('id');
  data1["id"]=id;
  data1["tinhtrang"]="Hoàn tất";

  console.log(data1);
  $.ajax({
           url: "/ad/getOrder/setStatus",
           type: "Post",
           async: true,
           data: JSON.stringify(data1),
           success: function (res) {
            window.location.href =  "/lich-su-don-hang";
        },
           error: function (request, status, error) {
           window.location.href =  "/lich-su-don-hang";
          }
       });

});
</script>
 </content>
</body>
</html>