<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*" %>    
<%@ page import="dto.product" %>
<%@ page import="dao.productRepository" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<title>상품등록</title>
</head>
<body>
	<%
	  String filename = "";
	  String realFolder ="c://upload";
	  int maxSize = 5 * 1025 * 1024;
	  String encType = "UTF-8";
	  
	  MultipartRequest multi = new MultipartRequest (request, realFolder,maxSize,encType,new DefaultFileRenamePolicy());
	  
	   String productId = multi.getParameter("productId");
	   String name= multi.getParameter("name");
	   String unitPrice = multi.getParameter("unitPrice");
	   String description =multi.getParameter("description");
	   String manufacture =multi.getParameter("manufacturer");
	   String category = multi.getParameter("category");
	   String unitsInStock =multi.getParameter("unitsInStock");
	   String condition =multi.getParameter("condition");
	   
	   Integer price;
	   
	   if (unitPrice.isEmpty())
			price = 0;
		else
			price = Integer.valueOf(unitPrice);
	   
	   long stock;
	   if(unitsInStock.isEmpty()){
		   stock=0;
	   } else {
		   stock = Integer.valueOf(unitsInStock);
	   }
	   
	   Enumeration<String> files= multi.getFileNames();
	
	   String fname =  files.nextElement();
	   String fileName = multi.getFilesystemName(fname);
	   
	   product newproduct = new product(productId,name,price);
	   newproduct.setDescription(description);
	   newproduct.setManufacture(manufacture);
	   newproduct.setCategory(category);
	   newproduct.setUnitsInStock(stock);
	   newproduct.setCondition(condition);
	   newproduct.setFilename(fileName);
	   
	    productRepository dao = productRepository.getInstance();
	    dao.addproduct(newproduct);
		response.sendRedirect("products.jsp");
	%>
</body>
</html>