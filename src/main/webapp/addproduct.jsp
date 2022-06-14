<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="./resources/js/validation.js"></script>
<title> 상품등록</title>
</head>
<body>
      <fmt:setLocale value='<%= request.getParameter("language") %>'/>
      <fmt:bundle basename="bundle.message">
      <%@ include file="layout/menu.jspf" %>
       <div class="jumbotron">
          <div class="container">
               <div class="text-right">
                    <a href = "?language=ko" >Korean</a>|<a href="?language=en">English</a>
                    <a href= "logout.jsp" class="btn btn-sm btn-success pull-right">logout</a>
               </div>
               <h1 class='display-3'><fmt:message key='title' /></h1>
          </div>
       </div>
       <div class ="container">
           <form name="newProduct" action="./processAddproduct.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
                <div class="form-group row">
                   <label class="col-sm-2"><fmt:message key="productId"/></label>
                   <div class="col-sm-3">
                   <input type="text" id="productId" name = "productId" class="form-control">
                   </div>
                </div>
                <div class="form-group row">
                   <label class="col-sm-2"><fmt:message key= "pname"/></label>
                   <div class="col-sm-3">
                         <input type="text" id="name" name="name" class="form-control">
                   </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2"><fmt:message key="unitPrice"/></label>
                    <div class="col-sm-3">
                          <input type="Text" id="unitPrice" name="unitPrice" class="form-control">
                    </div>
                </div>
                <div class="form-group row">
                      <label class="col-sm-2"><fmt:message key="description"/></label>
                      <div class="col-sm-5">
                        <textarea name="description" cols="50" rows="2" class="form-control"></textarea>
                      </div>
                </div>
                <div class="form-group row">
                     <label class="col-sm-2"><fmt:message key="manufacturer"/></label>
                     <div class="col-sm-3">
                         <input type="text" name="manufacturer" class="form-control">
                     </div> 
                </div>
                <div class="form-group row">
                    <label class="col-sm-2"><fmt:message key="category"/></label>
                    <div class="col-sm-3">
                           <input type="text" name="category" class="form-control">
                    </div>
                </div>
                
                <div class="form-group row">
                     <label class="col-sm-2"><fmt:message key="unitsInStock"/></label>
                     <div class="col-sm-3">
                          <input type="text" id="unitsInStock" name = "unitsInStock" class="form-control">
                     </div>
                </div>
                <div class="form-group row">
                     <label class="col-sm-2"><fmt:message key="condition"/></label>
                     <div class = "col-sm-5">
                            <input type="radio" name= "condition" value="New">
                            <fmt:message key="condition_New"/>
                            <input type="radio" name= "condition" value="Old"> 
                            <fmt:message key="condition_Old"/>
                            <input type="radio" name= "condition" value="Refurbished"> 
                            <fmt:message key="condition_Refurbished"/>
                     </div>
                </div>
                <div class="form-group row">
                     <label class="col-sm-2"><fmt:message key="productImage"/></label>
                     <div class = "col-sm-5">
                        	<input type="file" name="productImage" class="form-control"/>
                     </div>
                </div>
                <div class="form-group row">
                      <div class="col-sm-offset-2 col-sm-10">
                           <input type="button" class="btn btn-primary" value="<fmt:message key="button"/>"
                           onclick="CheckAddProduct()">
                      </div>
                </div>
          </form>
       </div>
</fmt:bundle>       
</body>
</html>