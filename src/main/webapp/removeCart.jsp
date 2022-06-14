<%@page import="java.util.ArrayList"%>
<%@page import="dto.product"%>
<%@page import="dao.productRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String id = request.getParameter("id");
if (id ==null || id.trim().equals("")) {
	response.sendRedirect("products.jsp");
	return;
}
productRepository dao = productRepository.getInstance();

product product = dao.getProductById(id);
if (product ==null) {
	response.sendRedirect("exceptionNoProductId.jsp");
}

 ArrayList <product> cartList = (ArrayList<product>) session.getAttribute("cartlist");
 product goodsQnt = new product();
 for (int i =0; i < cartList.size(); i++) {
	 goodsQnt = cartList.get(i);
	 if ( goodsQnt.getproductId().equals(id)) {
		  cartList.remove(goodsQnt);
	 }
 }

 response.sendRedirect("cart.jsp");

%>
</body>
</html>