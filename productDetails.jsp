<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta http-equiv="Content-Style-Type" content="text/css"/>
<meta http-equiv="Content-Script-Type" content="text/javascript"/>
<meta http-equiv="imagetoolbar" content="no"/>
<meta name="description" content=""/>
<meta name="keywords" content=""/>
<link rel="stylesheet" href="./css/products.css" >
<title>商品詳細</title>
</head>
<body>
<s:include value="header.jsp"/>
<div class="contents">
<s:form action="AddCartAction">
	<div class="detailBox">
		<div class="left">
			<div class="titles">
				<h1>商品画像</h1>
			</div>
			<img src='<s:property value="productInfoDTO.imageFilePath"/>/<s:property value="productInfoDTO.imageFileName"/>'/>
		</div>
		<div class="right">
			<div class="titles">
				<h1>商品詳細</h1>
			</div>
			<table class="vertical-list-table">
			<tr>
				<th>商品名</th>
				<td><span><s:property value="productInfoDTO.productName"/></span></td>
			</tr>
			<tr>
				<th>商品名<br>ふりがな</th>
				<td><s:property value="productInfoDTO.productNameKana"/></td>
			</tr>
			<tr>
				<th>値段</th>
				<td><s:property value="productInfoDTO.price"/><span>円</span></td>
			</tr>
			<tr>
				<th>購入個数</th>
				<td>
				<select name="productCount">
				<option value="1" selected="selected">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				</select>
				</td>
			</tr>
			<tr>
				<th>発売会社名</th>
				<td><s:property value="productInfoDTO.releaseCompany"/></td>
			</tr>
			<tr>
				<th>発売年月日</th>
				<td><s:property value="productInfoDTO.releaseDate"/></td>
			</tr>
			<tr>
				<th>商品詳細情報</th>
				<td id="detail-info"><s:property value="productInfoDTO.productDescription"/></td>
			</tr>
			</table>
				<s:hidden name="productId" value="%{productInfoDTO.productId}"/>
				<s:hidden name="imageFilePath" value="%{productInfoDTO.imageFilePath}"/>
				<s:hidden name="imageFileName" value="%{productInfoDTO.imageFileName}"/>
				<s:hidden name="productName" value="%{productInfoDTO.productName}"/>
				<s:hidden name="productNameKana" value="%{productInfoDTO.productNameKana}"/>
				<s:hidden name="price" value="%{productInfoDTO.price}"/>
				<s:hidden name="releaseCompany" value="%{productInfoDTO.releaseCompany}"/>
				<s:hidden name="releaseDate" value="%{productInfoDTO.releaseDate}"/>
				<s:hidden name="productDescription" value="%{productInfoDTO.productDescription}"/>
			<div class="submit_btn_box">
			<s:token/>
			<div id=".contents-btn-set">
				<s:submit value="カートに追加" class="btn_blue" />
			</div>
			</div>
		</div>
	</div>
</s:form>
	<div class="recommend">
		<p id="recommend_title">関連商品</p>
		<div class="recommend-list">
			<s:iterator value="productInfoDTOList">
			<div class="recommend-item">
				<a href='<s:url action="ProductDetailsAction">
				<s:param name="productId" value="%{productId}"/></s:url>'>
				<img src='<s:property value="imageFilePath"/>/<s:property value="imageFileName"/>'/></a>
				<p><s:property value="productName"/></p>
			</div>
			</s:iterator>
		</div>
	</div>
</div>
<s:include value="footer.jsp"/>
</html>