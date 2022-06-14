<%@page import="java.util.ArrayList"%>
<%@page import="dto.product"%>
<%@page import="java.util.List"%>
<%@page import="dao.productRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품목록</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<%@ include file="/layout/menu.jspf" %>
<div class="jumbotron">
     <div class="container">
     <h1 class="display-3">상품목록</h1>
     </div>
</div>
<%
	productRepository dao = productRepository.getInstance();
	ArrayList<product> listOfproducts = dao.getAllproducts();
%>;
<div class="container">
     <div class="row">
     <% for(product product : listOfproducts ) {%>
        <!-- 반복문 시작 -->
        <div class="col-md-4">
            <img src="${pageContext.request.contextPath}/upload/<%=product.getFilename() %>" style="width: 100%">
            <h3><%=product.getPname() %></h3>
            <p><%=product.getDescription() %></p>
            <p><%=product.getUnitPrice() %>원</p>
             <p> <a href="./product.jsp?id=<%=product.getproductId()%>"
            class = "btn btn-secondary" role="button" >상세정보 &raquo;</a>
        </div>
        <%}%>
        <!-- 반복문 끝 -->
        
     </div>
</div>
<%@ include file="/layout/footer.jspf" %>
</body>
</html>