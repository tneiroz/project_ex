<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
<% String id = request.getParameter("id");
   if(id==null|| id.trim().equals("")) {
	   response.sendRedirect("products.jsp");
	   return;
   }
   productRepository dao = productRepository.getInstance();
   
   product product = dao.getProductById(id);
   if(product == null) {
	   response.sendRedirect("exceptionNoProductId.jsp");
   }
   
   ArrayList<product> goodsList = dao.getAllproducts();
   product goods = new product();
   for(int i = 0; i <goodsList.size(); i++) {
	   goods = goodsList.get(i);
	   if (goods.getproductId().equals(id)) {
		   break;
	   }
   }
   
    ArrayList<product> list = (ArrayList<product>)session.getAttribute("cartlist");
   
    if(list == null) {
    	list = new ArrayList<product>();
    	session.setAttribute("cartlist", list);
    }
    int cnt = 0;
    product goodsQnt = new product();
    for (int i = 0; i <list.size(); i++) {
    	goodsQnt = list.get(i);
    	if (goodsQnt.getproductId().equals(id)) {
    		cnt++;
    		int orderQuantity = goodsQnt.getQuantity() + 1 ;
    		goodsQnt.setQuantity(orderQuantity);
    	}
    }

    if(cnt==0) {
    	goods.setQuantity(1);
    	list.add(goods);
    }

   response.sendRedirect("product.jsp?id=" + id);

%>
</body>
</html>