<%@page import="java.util.Optional"%>
<%@page import="com.app.vo.ProductVO"%>
<%@page import="com.app.dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 정보</title>
</head>
<body>
	<% System.out.println(request.getParameter("id")); 
		ProductDAO productDAO = new ProductDAO();
		ProductVO productVO = new ProductVO();
	
		Optional<ProductVO> foundProduct = productDAO.select(Long.parseLong(request.getParameter("id")));
		if(foundProduct.isPresent()){
			ProductVO product = foundProduct.get();
	%>
		<table border ="1px solid black">
		<tr>
			<th>상품 번호</th>
			<th>상품명</th>
			<th>상품 가격</th>
			<th>상품 재고</th>
		</tr>
		<table border ="1px solid black">
		<tr>
			<th><%=product.getId() %></th>
			<th><%=product.getProductName() %></th>
			<th><%=product.getProductPrice() %></th>
			<th><%=product.getProductStock() %></th>
		</tr>
		
	<%
		}
	%>
	
	<button>상품 삭제</button>
	<%  %>
</body>
</html>