<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<head>
<meta charset="UTF-8">
<title>상품 아이디 오류</title>
</head>
<body>
<%@ include file="layout/menu.jspf" %>
<div class ="jumbotron">
    <div class="container">
        <h2 class="alert alert-danger">해당 상품이 존재하지 않습니다.</h2>
    </div>
</div>
<div class = "container">
      <p><%= request.getRequestURL()%>?<%=request.getQueryString()%>
      <p><a href="products.jsp" class="btn btn-secondary">상품목록 &raquo;</a>
</div>
<%@ include file="/layout/footer.jspf" %>
</body>
</html>