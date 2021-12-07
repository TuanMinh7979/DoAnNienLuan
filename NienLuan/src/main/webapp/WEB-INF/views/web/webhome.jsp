<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
  <c:url var="utilAPI" value="/api/web/util" />
        <!DOCTYPE html>
        <html>


        <head>
            <link rel="stylesheet" href="<c:url value='/style/css/webhome.css'/>" rel="stylesheet" type="text/css" />
        </head>

        <body>
            <div style="border-bottom: 1px solid lightgray" class="row contentrow" id="filter">
                <h3>BỘ LỌC</h3>
            </div>
            <div id="productlist" class="row contentrow">
               
                    <c:forEach items="${model.listResult}" var="phonei">
                    


                        <div class="col-xs-12 col-sm-12 col-md-4 col-lg-2 productlistItem">
                            <img class="productlistItem_Img" src="<c:url value='${phonei.anh}' />" class="card-img-top" alt="">
                            <div class="infoBody">
                             <h5 class="productlistItem__name">${phonei.tensanpham }</h5>
                                <div class="infoFooter">
                                    
                                    <h6 class="productlistItem__price">${phonei.gia}<span>đ</span>
                                    </h6>
                                    <a href="<c:url value='/phone/${phonei.id }'/>" class="btn btn-primary">Chi tiết</a>
                                </div>

                                
                            </div>

                        </div>
                    </c:forEach>
                 <form id="mainForm" action="<c:url value='/' />" method="post"  >    
                    <input type="hidden" id="page" name="page">
                    <input type="hidden" id="limit" name="limit">
                </form>
          </div>
         
            <c:if test="${sessionScope.tentaikhoan !=null }">
             <input type="hidden" id="inpusername" value="${sessionScope.tentaikhoan}">
			</c:if>



           
          <div id="paging" class="row">
            <ul class="pagination" id="pagination"></ul>
            </div>
            
          <div class="row contentrow">
          <div>Gợi ý cho bạn: <p id="recList"></p></div>
        
          </div>

            <content tag="local_script">
            
            <script>
          
               function getUserSim(urli){
            	   $.ajax({
            		   url :urli,
                       type: "Get",
                       async: true,
                     
                      success: function (res) {
                      console.log(res);
                      data={};
                      userarr=res.split(',');
           		      data['user']=userarr[1];
           		     
                      getRecItem(data);
                    },
                       error: function (request, status, error) {
                       console.log("Server chua hoat dong");
                      }
                   });
            	   
               }
               function getRecItem(data){
            	  
        		 
        		   console.log(JSON.stringify(data));
            	   $.ajax({
            		   url :'${utilAPI}',
                       type: "Post",
                       async: true,
                       contentType: 'application/json',
                       
                       data: JSON.stringify(data),
                       success: function (res) {
                    	console.log(res);
                        $("#recList").text(res);
                       
                      },
                       error: function (request, status, error) {
                       console.log(error);
                      }
                   });
            	   
               }
          
            $(document).ready(function() {
            	username=$("#inpusername").val();
            	if(username!=null&&username!="admin"){
            		urli="http://127.0.0.1:5000/"+username;
            		let usersimarr= getUserSim(urli);
            	}
            });
            
            
                    var curPageIdx = ${model.pageIdx};
                    var totalPage = ${model.totalPage};

                    $(function() {
                        window.pagObj = $('#pagination').twbsPagination({
                            totalPages: totalPage,
                            visiblePages: 10,
                            startPage: curPageIdx,
                            onPageClick: function(event, page) {
                                if (curPageIdx != page) {
                                    $('#limit').val(15);
                                    $('#page').val(page);
                                    $('#mainForm').submit();
                                }

                            }
                        });
                    });
                </script>
                
                
                
            </content>



        </body>

        </html>