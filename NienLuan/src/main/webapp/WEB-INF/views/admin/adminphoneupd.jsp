<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
   
<c:url var="phoneAPI" value="/api/phone" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<c:url value='/style/css/adminphoneadd_upd.css'/>"
	rel="stylesheet" type="text/css" />
</head>

<body>
<nav>
<ul class="nav nav-tabs">
  <li class="nav-item">
    <a class="nav-link active" href="#">CẤU HÌNH</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="<c:url value='/ad/phone/qualityMn/${phonei.id}' />">CHẤT LƯỢNG</a>
  </li>

</ul>
</nav>
<h3 id="title" class="text-center">CẬP NHẬT SẢN PHẨM</h3>
    <div id="wrapper" style="margin:0 auto">
      <form id="mainform" class="col-xs-9 col-sm-9 col-md-9 col-lg-9">
            <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9">
                <div class="form-group">
                    <label>SẢN PHẨM</label>
                   <input type="text" class="form-control" name="tensanpham" value="${phonei.tensanpham}"/>
                </div>

                <div id="cauhinhchitiet" style="display:flex">
                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 ">
                        <div class="form-group">
                            <label>HÃNG</label>
                            <select class="form-control" id="exampleFormControlSelect1" name="idThuonghieu">
                                <option value="1">Motorola</option>
                                <option value="2">Samsung</option>
                                <option value="3">Nokia</option>
                                <option value="4">HUAWEI</option>
                                <option value="5">Apple</option>
                                <option value="6">Sony</option>
                                <option value="7">Google</option>
                                <option value="8">ASUS</option>
                                <option value="9">OnePlus</option>
                                <option value="10">Xiaomi</option>
                            </select>
                        </div>

                        
                            <div class="form-group">
                                <label>MÀU </label>
                                <input type="text" style="width:100px" class="form-control" name="mau" value="${phonei.mau}">
                            </div>
                           
                      

                        <div class="form-group">
                            <label>MÀN HÌNH</label>
                            <input type="text" class="form-control" name="manhinh" value="${phonei.manhinh}">
                        </div>
                        <div class="form-group">
                            <label>CAMERA</label>
                            <input type="text" class="form-control" name="camera" value="${phonei.camera}">
                        </div>
                      

                        <div class="form-group">
                            <label>BỘ NHỚ</label>
                            <input type="text" class="form-control" name="bonho" value="${phonei.bonho}">
                        </div>


                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label>HỆ ĐIỀU HÀNH</label>
                            <input type="text" class="form-control" name="hedieuhanh" value="${phonei.tensanpham}">
                        </div>


                        <div class="form-group">
                            <label>KẾT NỐI</label>
                            <select class="form-control" id="exampleFormControlSelect1" name="ketnoi" value="${phonei.ketnoi}">
                                <option>3G</option>
                                <option>4G</option>
                                <option>5G</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label>SIM</label>
                            <input type="text" class="form-control" name="sim" value="${phonei.sim}">
                        </div>

                        <div class="form-group">
                            <label>PIN</label>
                            <input type="text" class="form-control" name="pin" value="${phonei.pin}">
                        </div>

                     
                    </div>
                </div>

            </div>


            <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">

                <div class="form-group">
                    <label>GIÁ BÁN</label>
                    <input type="text" class="form-control" name="gia" value="${phonei.gia}">
                </div>
              
                <div class="form-group">
                    <label>KHO</label>
                    <input type="text" class="form-control" name="kho" value="${phonei.kho}">
                </div>
            </div>
            <input type="hidden" id="inpphoneId" value="${phonei.id}"/>


        </form>

      <div id="imgSection" class="col-xs-3 col-sm-3 col-md-3 col-lg-3">

            <label>HÌNH ẢNH</label>
            <div id="imgArea">
               
                <!-- <img style="width:45%; height:200px; border:1px solid gray" src="" alt="" /> -->

                
                <img style="width:100%; height:200px; border:1px solid gray" src="<c:url  value='${phonei.anh}'/>"/>
              
               
            </div>

           


            <div>
                <form id="formImg" method="Post" enctype="multipart/form-data">
                    <input class="fileinp" type="file" name="image">
                    <button name="uploadBtn" value="uploadBtn">Upload</button>
                </form>
            </div>

        </div>

    </div>

    <div class="row">
        <button class="controlBtn" id="submitBtn">CẬP NHẬT</button>
        <button class="controlBtn" id="redirectBtn"><a href="<c:url value="/ad/phone?page=1&limit=30" />">TRỞ LẠI</a> </button>
    </div>
</div>

<content tag="local_script"> 
<script>
$('#submitBtn').click(function(e) {
    e.preventDefault();
    var data = {};
    var formData = $('#mainform').serializeArray();
    $.each(formData, function(i, v) {
        data["" + v.name + ""] = v.value;
    });
    data["id"]=$("#inpphoneId").val();
    upPhone(data);

});

function upPhone(data) {

    $.ajax({
    	 url: "${phoneAPI}",
         type: "Put",
         async: true,
         contentType: 'application/json',
         data: JSON.stringify(data),
        success: function(res) {
            alert("Đã cập nhật sản phẩm có id là " + res);
        },
        error: function(request, status, error) {
            alert(request.responseText);
        }
    });
}

</script>


</content>


</body>
</html>