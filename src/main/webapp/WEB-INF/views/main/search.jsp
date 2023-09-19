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
.highlighted {
	background-color: #f0f0f0; /* 옅은 회색 배경 색상 */
}
</style>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.13.1/underscore-min.js"></script>
<script src="/resources/include/common/js/jquery-3.7.0.min.js"></script>

<script>

	$(function() {
		
		 var currentHighlightedIndex = -1; // currentHighlightedIndex 변수를 정의하고 초기값 -1을 설정
		  
		/* 삭제 버튼 클릭 시 검색창 삭제 */
		$("#delete").click(function() {
			$("#searchInput").val("");
		});
		/* 취소 버튼 클릭 시 메인페이지로 이동 */
		$("#cancel").click(function() {
			window.location.href = "/"
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
	                event.preventDefault();
	            } else if (event.keyCode === 40 && currentHighlightedIndex < searchResults.length - 1) {
	                // 아래 화살표 키
	                searchResults.eq(currentHighlightedIndex).removeClass('highlighted');
	                currentHighlightedIndex++;
	                searchResults.eq(currentHighlightedIndex).addClass('highlighted');
	                event.preventDefault();
	            } else if (event.keyCode === 13 && currentHighlightedIndex >= 0) {
	                // 엔터 키
            		var selectedUrl = searchResults.eq(currentHighlightedIndex).find('a').attr('href');
            		if (selectedUrl) {
                		// 선택된 검색 결과의 링크로 이동
                		window.location.href = selectedUrl;
            		 }
                    event.preventDefault();
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
		                           /* var productName = this.product_name;
		                            // 검색어를 공백으로 분리하여 개별 단어로 처리
		                            var searchWords = searchKeyword.split(/\s+/);
		                            for (var i = 0; i < searchWords.length; i++) {
		                                var searchWord = searchWords[i];
		                                // 각 검색어에 대해 하이라이트 처리
		                                productName = productName.replace(new RegExp(searchWord, 'gi'), function(matched) {
		                                    return '<span style="color: orange; font-weight: bold;">' + matched + '</span>';
		                                });
		                            }*/
		                            $('#searchResult').append('<li><a href="main/detail/' + this.product_no + '">' + productName + '</a></li>');
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
		            // 검색어가 비어 있는 경우 alert로 메시지를 표시합니다.
		            $('#searchResult').empty(); // 검색 결과 지우기
		        }
		    }, 500); // 500ms 간격으로 쓰로틀링
	
		    $('#searchInput').on('input', throttledSearch);
		});
		// 스페이스바 허용
	
</script>

</head>
<body>

	<input type="text" id="searchInput" name="keyword"
		placeholder="무엇을 찾고 계신가요?">

	<input type="button" id="delete" value="삭제" />
	<input type="button" id="cancel" value="취소" />

	<div class=wrapper>
		<ul id="searchResult">

		</ul>
	</div>


</body>
</html>