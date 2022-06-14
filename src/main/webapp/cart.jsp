<%@page import="dto.product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.productRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<%
   String cartId = session.getId();
%>
<title>장바구니</title>
</head>
<body>
<%@ include file="layout/menu.jspf" %>
<div class="jumbotron">
   <div class="container">
        <h1 class="display-3">장바구니</h1>   
   </div>
</div>
<div class="container">
   <div class="row">
       <table width="100%">
           <tr>
               <td align ="left"><a href="./deleteCart.jsp?cartid=<%=cartId%>"class = "btn btn-danger">삭제하기</a></td>
               <td align = "right"><a href="./shippingInfo.jsp?cartId=<%=cartId%>" class="btn btn-success">주문하기</a></td>
           </tr>
       </table>
   </div>
<div class="padding-top :50px">
     <table class="table table-hover">
          <tr>
               <th>상품</th>
               <th>가격</th>
               <th>수량</th>
               <th>소계</th>
               <th>비고</th>
         </tr>   
      
        	
         <%
               int sum = 0;
                ArrayList<product> cartList = (ArrayList<product>)session.getAttribute("cartlist");
               if (cartList == null)
            	   cartList = new ArrayList<product>();
            	
               for (int i = 0; i< cartList.size(); i++) {//상품리스트 하나씩 출력하기	   
                    product product = cartList.get(i);
                    int total = product.getUnitPrice() * product.getQuantity();
                    sum = sum + total;
       
         %>
        <tr>
              <td><%=product.getproductId()%>-<%=product.getPname()%></td>
              <td><%=product.getUnitPrice()%></td>
              <td><%=product.getQuantity()%></td>
              <td><%=total%></td>
              <td><a href = "./removeCart.jsp?id=<%=product.getproductId()%>"class="badge badge-danger">삭제</a></td>
              </tr>
              <%
           	   }
              %>
             <tr>
                  <th></th>
                  <th></th>
                  <th>총액</th>
                  <th><%=sum%></th>
                  <th></th>
             </tr>     
     </table>
     <a href = "./product.jsp" class="btn btn-secondary">&laquo; 쇼핑계속하기</a>
</div>
    <hr>    
</div>    
<%@ include file="/layout/footer.jspf" %>
</body>
</html>