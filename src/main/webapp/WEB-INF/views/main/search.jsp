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

<style>

/* 전체 너비 */
body {
	width: 100%;
}

/* 전체 적용 */
.input-container {
	display: flex; /* Flexbox 레이아웃 사용 */
	align-items: center; /* 수직 중앙 정렬 */
	width: 60%;
	margin-left: 300px;
}

/* 버튼태그 전체 적용 */
#button-container {
	margin-left: 10px; /* Adjust the margin as needed */
	display: flex; /* 내부 버튼을 가로로 배치하기 위해 필요 */
	gap: 10px; /* 버튼 사이의 간격 조정 */
}

/* 검색창 적용 */
#searchInput {
	background-color: rgb(242, 242, 242);
	outline: none;
	display: block;
	margin: 20px auto;
	text-align: left;
	height: 36px;
	font-size: 15px;
	border: 1px none;
	border-radius: 5px;
	flex: 1; /* 자동으로 남은 공간을 차지하도록 설정 */
	margin-right: 10px; /* 버튼과의 간격 조정 */
}

/* 검색목록 적용 */
#searchResult li {
	list-style: none;
	margin: 0px 0px 15px 290px;
	font-weight: bold;
}

/* 검색목록 적용2*/
#searchResult li a {
	text-decoration: none;
	font-size: 18px;
	color: rgb(128, 128, 128);
}

/* 검색결과 선택시 하이라이트 */
.highlighted {
	background-color: #f0f0f0; /* 옅은 회색 배경 색상 */
	width: 50%;
	height: 30px;
	padding-top: 7px;
	padding-left: 5px;
	border-radius: 5px;
}

/* 버튼 적용 */
#delete, #cancel {
	background-color: white;
	border: none;
	cursor: pointer;
}

/* 취소버튼 적용 */
#cancel {
	color: rgb(0, 150, 243);
	font-weight: bold;
}
</style>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.13.1/underscore-min.js"></script>
<script src="/resources/include/common/js/jquery-3.7.0.min.js"></script>

<script>

	$(function() {
		
		/* 페이지 접속 시 커서활성화 */
		$("#searchInput").focus();

		 var currentHighlightedIndex = -1; // currentHighlightedIndex 변수를 정의하고 초기값 -1을 설정
		  
		/* 삭제 버튼 클릭 시 검색창 삭제 */
		$("#delete").click(function() {
			$("#searchInput").val("");
		});
		/* 취소 버튼 클릭 시 메인페이지로 이동 */
		$("#cancel").click(function() {
			window.location.href = "/"
		});
		
		/* 검색어 추가할때마다 초기화*/
		$('#searchInput').on('input', function(event) {
			 currentHighlightedIndex = -1;		
		});
		
		
		/* 키보드 위아래키로 검색결과 하이라이트 이동 */
		 $('#searchInput').keydown(function(event) {
				// 스페이스바 입력에 대한 조건 추가
			    if (event.keyCode === 32) {
			        return;
			    }
			    				  
	            var searchResults = $('#searchResult li');

	            if (event.keyCode === 38 && currentHighlightedIndex > 0) {
	                // 위 화살표 키
	                searchResults.eq(currentHighlightedIndex).removeClass('highlighted');
	                currentHighlightedIndex--;
	                searchResults.eq(currentHighlightedIndex).addClass('highlighted');
	                console.log(currentHighlightedIndex);
	                event.preventDefault();
	                var highlightedText = searchResults.eq(currentHighlightedIndex).text();
	                $('#searchInput').val(highlightedText);
	            } else if (event.keyCode === 40 && currentHighlightedIndex < searchResults.length -1) {
	                // 아래 화살표 	           
	                searchResults.eq(currentHighlightedIndex).removeClass('highlighted');
	                currentHighlightedIndex++;	              
	                searchResults.eq(currentHighlightedIndex).addClass('highlighted');
	                console.log(currentHighlightedIndex);
	                event.preventDefault();
	                var highlightedText = searchResults.eq(currentHighlightedIndex).text();
	                $('#searchInput').val(highlightedText);
	            } else if (event.keyCode === 13 && currentHighlightedIndex >= 0) {
	                // 엔터 키
            		var selectedUrl = searchResults.eq(currentHighlightedIndex).find('a').attr('href');
            		if (selectedUrl) {
                		// 선택된 검색 결과의 링크로 이동
                		 console.log("간다")
                		window.location.href = selectedUrl;
            		 }
                    event.preventDefault();
	            } else if (event.keyCode === 8) {
	                // 백스페이스 키
	        	    currentHighlightedIndex = -1;
	            }
	        });		
		});
			
		/* 검색어 입력 시 검색결과 즉시 표시 */
		$(document).ready(function() {
		    var throttledSearch = _.throttle(function() {
		        var searchKeyword = $('#searchInput').val();
				
		        // 모든 공백 제거 함수
		        function removeAllSpaces(input) {
		            return input.replace(/\s+/g, '');
		        }
		        
		     	// 모든 공백을 제거하여 유효성 체크하는 함수
		        function isNotEmpty(input) {
		            var sanitizedInput = removeAllSpaces(input);
		            return sanitizedInput !== '';
		        }
		   
		        if (isNotEmpty(searchKeyword)) {	        	
		            // 검색어가 유효한 경우, AJAX 요청을 보냅니다.
		      	            
		            $.ajax({
		                url: '/searching',
		                type: 'get',
		                data: { keyword: searchKeyword },
		                dataType: "json",
		                success: function(data) {
		                    if (data !== undefined) {
		                        $('#searchResult').empty();
		                        $.each(data, function() {
		                        	 var productName = this.product_name.replace(new RegExp(searchKeyword.replace(/\s+/g, ''), 'gi'), function(matched) {
    									return '<span style="color: orange; font-weight: bold;">' + matched + '</span>';
										});
		                            $('#searchResult').append('<li><a href="/detail?product_no=' + this.product_no + '">' + productName + '</a></li>');
		                        });
		                    } else {
		                        console.log('데이터가 정의되지 않았습니다.');
		                    }
		                },
		                error: function(err) {
		                    console.log(err);
		                }
		            });
		        } else {
		            $('#searchResult').empty(); // 검색 결과 지우기
		        }
		    }, 500); // 500ms 간격으로 쓰로틀링
	
		    $('#searchInput').on('input', throttledSearch);
		});
	
</script>

</head>
<body>
	<div class="input-container">
		<input type="text" id="searchInput" name="keyword"
			placeholder="무엇을 찾고 계신가요?">
		<div id="button-container">
			<input type="button" id="delete" value="지우기" /> <input type="button"
				id="cancel" value="나가기" />
		</div>
	</div>
	<div class=wrapper>
		<ul id="searchResult">

		</ul>
	</div>


</body>
</html>