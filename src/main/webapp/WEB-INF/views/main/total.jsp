<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />

<title>메인페이지</title>

<link rel="shortcut icon" href="/resources/images/icon.png" />
<link rel="apple-touch-icon" href="/resources/images/icon.png" />


<link rel="stylesheet" type="text/css"
	href="/resources/include/common/bootstrap/css/bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/include/mainpage/css/slick.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/include/mainpage/css/slick-theme.css" />

<style>
.mainwrapper {
	width: 100%;
}
.product {
	display: grid;
	grid-template-columns: repeat(4, 1fr); /* 4개의 열을 생성합니다. */
	grid-gap: 20px; /* 각 열과 행 사이의 간격 설정 */
}

.wrapperin1 {
	border: 1px solid #ccc; /* 각 항목의 테두리 설정 */
	padding: 10px; /* 각 항목의 내부 여백 설정 */
	text-align: left; /* 텍스트 가운데 정렬 */
	width: 300px;
}

.product-slide, .product-title, .product-price, .product-reputation {
	width: 200px;
	margin-left:50px;
	margin-right:5px;
}
</style>

<script src="/resources/include/common/js/jquery-3.7.0.min.js"></script>



</head>
<body>
	<div class="totalwrapper">
		<%@ include file="header.jsp"%>
		<div class="mainwrapper">
			<div class="contentwrapper">
				<div class="selectbar">셀렉트바 공간</div>
				<div class="content">
					<div class="selectbar2">작은셀렉트바</div>
					<div class="product">
						<c:forEach var="total" items="${total}">
							<div class="wrapperin1">
								<a href="/detail?product_no=${total.product_no}"> <img
									src="resources/images/mainpage/product/${total.product_main_image}"
									alt="" class="product-slide" />
									<div class="product-title">${total.product_name}</div>
									<div class="product-price">${total.product_price}원</div>
									<div class="product-reputation">
										별점 :
										<c:choose>
											<c:when test="${not empty total.review_rating}">
                               			 ${total.review_rating}
                            		</c:when>
											<c:otherwise>
                                		0
                            			</c:otherwise>
										</c:choose>
										| 리뷰 :
										<c:choose>
											<c:when test="${not empty total.review_num}">
                                		${total.review_num}개
                           			 </c:when>
											<c:otherwise>
                               			 0개
                          				 </c:otherwise>
										</c:choose>
									</div>
								</a>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			
		</div>
		<%@ include file="footer.jsp"%>
	</div>
</body>
</html>