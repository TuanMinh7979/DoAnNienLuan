<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>    

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
        integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="<c:url value='/common/css/adminLayout.css'/>">
    <link rel="stylesheet" href="<c:url value ='/common/font/css/font-awesome.min.css'/> ">
  <!-- MASTER LAYOUT CSS -->
  <dec:head/>
</head>

<body>
    <div class="wrapper">
        <!-- Sidebar  -->
        <nav id="sidebar">
            <div class="sidebar-header">
                <img src="<c:url value='/resource/MobileShop-logoa.png'/>" id="logo" alt="">
            </div>

            <ul id="mainmenu" class="list-unstyled ">

                <li class="item">
                    <a href="<c:url value='/ad/phone?page=1&limit=30'/>">Sản phẩm</a>
                </li>
              
            </ul>
        </nav>
        <div id="content">
            <h3 style="color:blue"> TRANG QUẢN TRỊ</h3>
            <button style="position:absolute; right:20px"><a href="<c:url value='/'/>">Về trang chủ</a></button>
            </br>
            </br>

            <div id="maincontent">
                   </br>
                <dec:body/>

            </div>
        </div>

    </div>
    
    
<!-- MASTER LAYOUT JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
    integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous">
</script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
    integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous">
</script>
<dec:getProperty property="page.local_script"></dec:getProperty>
</body>


</html>