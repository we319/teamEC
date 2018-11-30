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
<title>商品一覧</title>
</head>
<body>
<s:include value="header.jsp" />
<div class="contents">
	<div class="titles">
		<h1>商品一覧画面</h1>
	</div>
<s:if test="!keywordsErrorMessageList.size==0">
	<div class="error-message">
		<s:iterator value="keywordsErrorMessageList">
			<h3><s:property/></h3>
		</s:iterator>
	</div>
</s:if>
<s:elseif test="productInfoDtoList==null">
	<div class="NoResult">
		<h3>検索結果はありません</h3>
	</div>
</s:elseif>
<s:if test="productInfoDtoList!=null">
	<div class="productList">
		<s:iterator value="productInfoDtoList">
			<div class="productBox">
				<a href='<s:url action="ProductDetailsAction">
				<s:param name="productId" value="%{productId}"/></s:url>'>
				<img src='<s:property value="imageFilePath"/>/<s:property value="imageFileName"/>'/></a>
				<p><s:property value="productName"/></p>
				<p><s:property value="productNameKana"/></p>
				<p><s:property value="price"/><span>円</span></p>
			</div>
		</s:iterator>
	</div>
</s:if>
</div>
<s:include value="footer.jsp"/>
</body>
</html>