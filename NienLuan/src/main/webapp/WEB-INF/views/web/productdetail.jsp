<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
        <c:url var="cartitemAPI" value="/api/web/cartitem" />
        <c:url var="commentAPI" value="/api/web/comment" />
        <c:url var="reviewAPI" value="/api/web/review" />
        <c:url var="curlink" value="/phone/${phonei.id}" />
       

        <!DOCTYPE html>
        <html>

        <head>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css" integrity="sha512-yHknP1/AwR+yx26cB1y0cjvQUMvEa2PFzt1c9LlS4pRQ5NOTZFWbhBig+X9G9eYW/8m0/4OXNx8pxJ6z57x0dw==" crossorigin="anonymous" referrerpolicy="no-referrer"
            />
            <link rel="stylesheet" href="<c:url value='/style/css/productdetail.css'/>" rel="stylesheet" type="text/css" />
           
            
        </head>

        <body>
            <div id="phonecontent" class="row">
                <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5 phonecontent__div">
                    <div id="slider">
                        <div>
                            <img class="slidei" src="<c:url value='${phonei.anh}'/>" alt="">
                        </div>
                        <div>
                            <img class="slidei" src="<c:url value='${phonei.anh}'/>" alt="">
                        </div>
                    </div>


                </div>

                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 phonecontent__div">
                    <div id="buyinfo">
                        <p id="pricespan">Giá:${phonei.gia} đ</p>
                        <div class="card">
                            <!-- khuyen mai -->
                            <div class="card-header">Khuyến mãi</div>
                            <div class="card-body">
                                <p class="card-text">
                                    <i style="color: blue" class="fa fa-circle" aria-hidden="true"></i> Giảm ngay 300.000 đ
                                </p>
                                <p class="card-text">
                                    <i style="color: blue" class="fa fa-circle" aria-hidden="true"></i> Hỗ trợ trả góp 0% lãi suất
                                </p>
                                <p class="card-text">
                                    <i style="color: blue" class="fa fa-circle" aria-hidden="true"></i> Thu cũ đổi mới
                                </p>
                            </div>
                            <!-- uu dai -->
                            <div class="card">
                                <div class="card-header">Ưu đãi</div>



                                <div class="card-body">
                                    <p class="card-text">
                                        <i style="color: green" class="fa fa-check" aria-hidden="true"></i> Giao hàng từ 1 đến 2 ngày
                                    </p>
                                    <p class="card-text">
                                        <i style="color: green" class="fa fa-check" aria-hidden="true"></i> Bảo hành 12 tháng
                                    </p>
                                </div>
                            </div>
                        </div>
                        <button id="buybtn">MUA NGAY</button>

                    </div>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 phonecontent__div">
                    <h3>Thông số kỹ thuật</h3>
                    </br>
                    <table class="table table-striped table-bordered table-light ">
                        <tr>
                            <td>Kích thước màn hình</td>
                            <td>${phonei.manhinh}</td>
                        </tr>
                        <tr>
                            <td>Hệ điều hành</td>
                            <td>${phonei.hedieuhanh}</td>
                        </tr>
                        <tr>
                            <td>Camera</td>
                            <td>${phonei.camera}</td>
                        </tr>


                        <tr>
                            <td>Bộ nhớ</td>
                            <td>${phonei.bonho}</td>
                        </tr>
                        <tr>
                            <td>Sim</td>
                            <td>${phonei.sim}</td>
                        </tr>
                        <tr>
                            <td>Pin</td>
                            <td>${phonei.pin}</td>
                        </tr>

                        <tr>
                            <td>Màu sắc</td>
                            <td>${phonei.mau}</td>
                        </tr>
                    </table>
                </div>
            </div>
            <!-- _____________________________________ -->
         
<div class="row" id="reviewarea">
         
     <div class="rating-wrapper">
      <div class="panel-heading"> ĐÁNH GIÁ</div>
       <c:choose>
       <c:when test = "${rate==null}">
    <div class="rating-css ">
    <div class="star-icon">
      <input type="radio" name="rating1" class="ratiostar" id="rating1">
      <label for="rating1" class="fa fa-star"></label>
      <input type="radio" name="rating1" class="ratiostar" id="rating2">
      <label for="rating2" class="fa fa-star"></label>
      <input type="radio" name="rating1"class="ratiostar" id="rating3">
      <label for="rating3" class="fa fa-star"></label>
      <input type="radio" name="rating1" class="ratiostar" id="rating4">
      <label for="rating4" class="fa fa-star"></label>
      <input type="radio" name="rating1" class="ratiostar" id="rating5">
      <label for="rating5" class="fa fa-star"></label>
      
    </div>
   <button class="btn btn-primary" id="ratingBtn">Gửi</button>

  </div>
  </c:when>
  <c:otherwise>
  <div class="rating-css ">
  <h5>Bạn đã đánh giá ${rate} sao</h5>
  </div>
  </c:otherwise>
  </c:choose>
  

  
  
  
  </div>
         
         

        <div class="comment-wrapper">
            <div class="panel panel-info">
                <div class="panel-heading">
                   BÌNH LUẬN SẢN PHẨM
                </div>
                <div class="panel-body">
                    <textarea id="inpnoidung" class="form-control" placeholder="write a comment..." rows="3"></textarea>
                    <br>
                    <button id="postCommentBtn"type="button" class="btn btn-info pull-right">Post</button>
                    <div class="clearfix"></div>
                    <hr>
                    <ul class="media-list">
                    <c:choose>
                     <c:when test = "${commentList==null}">
                      <h5>Chưa có bình luận nào</h5>      
                      
                     </c:when>
                     <c:otherwise>
                   
                     <c:forEach items="${commentList}" var="commenti">
                        <li class="media">
                        
                            <a href="#" class="pull-left">
                                <img src="<c:url value='/resource/person.png'/>" alt="" class="img-circle">
                            </a>
                            <div class="media-body">
                            
                                <span class="text-muted pull-right">
                                    <small class="text-muted">30 min ago</small>
                                </span>
                                <strong class="text-success">${commenti.tenkhachhang}</strong>
                                <p class="comment-text">${commenti.noidung}
                                    
                                </p>
                                
                            </div>
                        </li>
                        </c:forEach>
                        </c:otherwise>
                        </c:choose>
                       
                    </ul>
                </div>
            </div>
        </div>
         </div>



            


            <!-- _____________________________________ -->
            <!-- _____________________________________ -->
            <!-- HIDDEN ELEMENT -->
           <button id="showCheckLoginModalBtn" style="display: none" type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">checkaccountBtn</button>
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">THÔNG TIN TÀI KHOẢN
                            </h5>

                        </div>
                        <div class="modal-body">
                            <p>Bạn cần đăng nhập hoặc tạo tài khoản mới!</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                            <button type="button" class="btn btn-primary">
						<a href="<c:url value='/dang-ky'/>">Đăng ký mới tại đây</a>
					</button>
                            <button type="button" class="btn btn-primary">
						<a href="<c:url value='/dang-nhap'/>">Đăng nhập tại đây</a>
					</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ______________________________________ -->
            <button id="showBuyModalBtn" type="button" class="btn btn-primary" style="display: none" data-toggle="modal" data-target="#exampleModalCenter">Launch demo modal</button>

            <!-- Modal -->
            <div class="modal fade centered" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h3 class="modal-title" id="exampleModalLongTitle">ĐẶT HÀNG</h3>
                        </div>
                        <h5>Điện thoại ${phonei.tensanpham}</h5>
                        <form id="buyForm">
                            <div id="buyformBody" class="modal-body">

                                <span>Giá: </span><span id="pricei" value="${phonei.gia}">
							${phonei.gia} </span></br> <label>Số lượng: </label><input id="countinp" name="soluong" type="text" value="1">
                                <div class="modalbody__item" id="countarea">
                                    <button id="upbtn">+</button>
                                    <button id="downbtn">-</button>
                                </div>
                            </div>

                            <div class="modal-footer">
                                <p>Thêm sản phẩm vào giỏ hàng ?</p>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">HỦY</button>
                                <button id="buyFormBtn" type="submit" class="btn btn-primary">OK</button>
                            </div>

                            <input type="hidden" id="inpid" name="idSanpham" value="${phonei.id}">

                        </form>
                    </div>
                </div>
            </div>

            <c:choose>
                <c:when test="${sessionScope.tentaikhoan !=null }">
                    <input id="isLoggedMark" style="display: none" type="checkbox" checked="true">
                    <input type="hidden" id="inpidKhachhang" value="${sessionScope.userid}">
                </c:when>
                <c:otherwise>
                    <input id="isLoggedMark" style="display: none" type="checkbox">
                </c:otherwise>
            </c:choose>


            <content tag="local_script">
                <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js" integrity="sha512-HGOnQO9+SP1V92SrtZfjqxxtLmVzqZpjFFekvzZVWoiASSQgSr4cw9Kqd2+l8Llp4Gm0G8GIFJ4ddwZilcdb8A==" crossorigin="anonymous" referrerpolicy="no-referrer">
                </script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.js" integrity="sha512-eP8DK17a+MOcKHXC5Yrqzd8WI5WKh6F1TIk5QZ/8Lbv+8ssblcz7oGC8ZmQ/ZSAPa7ZmsCU4e/hcovqR8jfJqA==" crossorigin="anonymous" referrerpolicy="no-referrer">
                </script>
                
                
                <script>
               
                    $('#slider').slick({
                        autoplay: true
                    });
                    $("#buybtn").click(function() {

                        if ($('#isLoggedMark').is(':checked')) {
                            $('#showBuyModalBtn').click();
                        } else {

                            $('#showCheckLoginModalBtn').click();
                        }
                    });

                    let count = 0;
                    let pricei = $("#pricei").text();
                    $("#upbtn").click(function(e) {
                        e.preventDefault();
                        count++;
                        $("#countinp").val(count);
                        $("#pricei").text(pricei * count);

                    });
                    $("#downbtn").click(function(e) {
                        e.preventDefault();
                        count--;
                        if (count < 1) {
                            count = 1;
                        }
                        $("#countinp").val(count);
                        $("#pricei").text(pricei * count);
                    });

                    $('#buyFormBtn').click(function(e) {
                        e.preventDefault();
                        var data = {};
                        var formData = $('#buyForm').serializeArray();
                        $.each(formData, function(i, v) {
                            data["" + v.name + ""] = v.value;
                        });
                        data["idKhachhang"] = $('#inpidKhachhang').val();
                        console.log(JSON.stringify(data));
                        addPhone(data);
                        $("#exampleModalCenter").modal('hide');

                    });

                    function addPhone(data) {
                        $.ajax({
                            url: '${cartitemAPI}',
                            type: 'POST',
                            contentType: 'application/json',
                            data: JSON.stringify(data),

                            success: function(res) {

                                setTimeout(function() {
                                    alert("Cập nhật giỏ hàng thành công");
                                }, 1000);

                            },
                            error: function(request, status, error) {
                                alert(request.responseText);
                            }
                        });
                    }
                        
                        $("#postCommentBtn").click(function(e) {
                        	 e.preventDefault();

                            if ($('#isLoggedMark').is(':checked')) {
                            	 data={};
                                 data["noidung"]=$('#inpnoidung').val();
                                 data["idSanpham"]=$("#inpid").val();
                                 data["idKhachhang"] = $('#inpidKhachhang').val();
                                 console.log(JSON.stringify(data));
                                 addComment(data);
                               
                            }  else {

                                $('#showCheckLoginModalBtn').click();
                            }
                           
                        });
                    
                        
                    function addComment(data) {
                       $.ajax({
                            url: '${commentAPI}',
                            type: 'POST',
                            contentType: 'application/json',
                            data: JSON.stringify(data),
                           
                            success: function(res) {
                            	window.location.href = "${curlink}";
                            },
                            error: function(request, status, error) {
                                alert(request.responseText);
                            }
                        });

                    }
                        $("#ratingBtn").click(function(e) {
                       	 e.preventDefault();

                           if ($('#isLoggedMark').is(':checked')) {
                           	 data={};
                                
                                data["idSanpham"]=$("#inpid").val();
                                data["idKhachhang"] = $('#inpidKhachhang').val();
                                
                                $('.ratiostar').each(function(i, obj) {
                                	if($(this).is(':checked') === true){
                                		data["rate"]=$(this).attr('id').slice(-1);
                                	}
                                });
                                //console.log(JSON.stringify(data));
                                addReview(data);
                              
                           }  else {

                               $('#showCheckLoginModalBtn').click();
                           }
                          
                       });
                    
                    function addReview(data){
                    	$.ajax({
                            url: '${reviewAPI}',
                            type: 'POST',
                            contentType: 'application/json',
                            data: JSON.stringify(data),
                           
                            success: function(res) {
                            	window.location.href = "${curlink}";
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