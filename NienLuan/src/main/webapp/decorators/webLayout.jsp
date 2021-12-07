<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>mobileshop</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
        integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous" type="text/css">
    <link rel="stylesheet" href="<c:url value='/common/css/webLayout.css'/>" type="text/css" />
    <link rel="stylesheet" href="<c:url value='/common/font/css/font-awesome.min.css'/>"  type="text/css" >
   
      <dec:head/>
   
</head>

<body>

<%@ include file="/common/headerfooter/webHeader.jsp" %>

 <div class="container" id="content">
        </br>
       <dec:body/>
 </div>

	

	<!-- Footer -->
<%@ include file="/common/headerfooter/webFooter.jsp" %>

 <!-- JS OF MASTERLAYOUT -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
    $("#liperson>a, #licart>a").click(function() {
        $(this).css({
            "background-color": "transparent",
            "color": "blue"
        });
  })
    </script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
        integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous">
</script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
        integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous">
</script>
<script src="<c:url value='/common/paging/jquery.twbsPagination.js' />"></script>
<dec:getProperty property="page.local_script"></dec:getProperty>
</body>
</html>