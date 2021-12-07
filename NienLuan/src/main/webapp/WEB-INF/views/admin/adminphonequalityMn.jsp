<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
   
<c:url var="commentAPI" value="/api/web/comment" />
<c:url var="wordandindexpath" value="/resource/wordandindex/widex.json" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<c:url value='/style/css/adminphone.css'/>"
	rel="stylesheet" type="text/css" />
</head>
<body>
	<div style="margin: 0 auto">
	<table id="maintable" class="table table-striped ">
				<thead>
					<tr>
						<th style="width:5%">Id</th>
						<th style="width:10%">Tên KH </th>
						<th style="width:50%">Nội dung</th>
						
						<th style="width:25%">Dự đoán</th>
						<th style="width:10%">Tùy chỉnh</th>
						
					</tr>
				</thead>
				
				<tbody>
				<c:choose>
                     <c:when test = "${commentList==null}">
                      <h5>Chưa có bình luận nào</h5>      
                      
                     </c:when>
                     <c:otherwise>

					<c:forEach items="${commentList}" var="commenti">
					<tr>
					<td style="width:5%" class="commentId">${commenti.id}</td>
							<td style="width:10%">${commenti.tenkhachhang}</td>
							<td class="inputtext" style="width:60%">${commenti.noidung}</td>
						
							<td class="ketqua" style="width:25%"></td>
							<td style="width:10%" class="text-left"><button
									class="btn btn-sm btn-danger delRowBtn">
									<i class="fa fa-trash"></i>
								</button></td>
							<input class="itemId" type="hidden"
								value="${commenti.id}">
					</tr>
					</c:forEach>
					</c:otherwise>
					</c:choose>
					
					</tbody>
					</table>
					<button id="dudoanBtn">DỰ ĐOÁN</button>
	</div>


<content tag="local_script"> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/tensorflow/3.9.0/tf.min.js" integrity="sha512-UoV7ETlrrOybH7VFmm3JBGngKEAp38nLlKcEGXxI71Dt/qdN4NNRz0Us74ka1j5wuHuemzgvgZHCpZNQk4PjKg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script>
        arr = [];
        dic = {};

        let model;
        async function loadModel() {
            model = undefined;
            model = await tf.loadLayersModel("https://raw.githubusercontent.com/TuanMinh7979/NienLuanAPI/main/model.json");
           

        }
        $(document).ready(function() {
            $.getJSON("${wordandindexpath}", function(result) {
                $.each(result, function(i, field) {
                    dic[field] = i;
                });
            });
            loadModel();
            console.log("load model thành công");

        });
        $('#dudoanBtn').click(function() {
        	 $(".inputtext").each(function() {
             tri = $(this).closest("tr");
             ketquatd = tri.find(".ketqua");
             rs = handle($(this).text());
            if(rs==2){
            	ketquatd.text("tích cực");
            	}else if(rs==1){
            		ketquatd.text("trung tính");
            	}else{
            		ketquatd.text("tiêu cực");
            		
            	}
            
            });
            
         });

            function handle(str) {
            str = str.trim();
            mystrarr = str.split(" ");
            len = mystrarr.length;
            if (len > 100) {
                mystrarr = mystrarr.slice(len - 100, len);
                len = mystrarr.length;
            }
            //console.log(mystrarr);
            warr = new Array(100).fill(0);
            for (let i = 0; i < len; i++) {
                widx = dic[mystrarr[i]];
                if (typeof widx === 'undefined') {
                    widx = 0;
                    warr[100 - len + i] = 1;
                } else {
                    warr[100 - len + i] = parseInt(widx) + 1;
                }

            }
            //console.log(warr);
            input_xs = tf.tensor2d(
                [warr]
            );
            oput = model.predict(input_xs);
            ketqua = oput.dataSync(oput);
            var rsarr = [ketqua[0], ketqua[1], ketqua[2]];
            console.log(typeof ketqua[0]);
            console.log(ketqua);
            max = Math.max(...rsarr);
            rsidx = rsarr.indexOf(max);
            return rsidx;
        };
        
        
        
        $("#maintable").on("click", ".delRowBtn", function(e) {
    	    e.preventDefault();
            tri = $(this).closest("tr");
    	    idx = tri.find(".itemId").val();
    	    delCmt(idx);
    	    $(this).closest("tr").remove();
    	   

    	});
        
        
    	function delCmt(idx) {
    		 
    	    $.ajax({
    	        url: "${commentAPI}",
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
    </script>

</content>
</body>
</html>