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



<script src="/resources/include/js/jquery-3.7.0.min.js"></script>
<script>
	// JavaScript 코드 (search.jsp)
	$(document).ready(function() {
		$('#searchInput').on('input', function() {
			// 입력된 검색어를 가져옵니다.
			var searchTerm = $(this).val();

			// 검색어를 실시간으로 업데이트
			$('#searchResults').text(searchTerm);
		});
	});

	// JavaScript 코드 (search.jsp)
	$(document).ready(function() {
		$('#searchInput').on('input', function() {
			// 입력된 검색어를 가져옵니다.
			var searchTerm = $(this).val();

			// 서버에 Ajax 요청을 보냅니다.
			$.ajax({
				url : '/api/search',
				method : 'GET',
				data : {
					query : searchTerm
				},
				success : function(data) {
					// 검색 결과를 화면에 업데이트
					$('#searchResults').html(data);
				},
				error : function() {
					console.log('검색 요청 실패');
				}
			});
		});
	});
</script>

</head>
<body>
	<input type="text" id="searchInput" placeholder="무엇을 찾고 계신가요?">
	<div id="searchResults"></div>

</body>
</html>