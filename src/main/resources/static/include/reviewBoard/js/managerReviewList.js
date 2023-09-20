$(function(){
		// 별점 값을 별 모양으로 변환
		$(".reviewRating").each(function(){
  			let rating = $(this).text();
  			$(this).css("color","red");
  		    if(rating === "5") $(this).text("★★★★★");
  		    else if(rating === "4") $(this).text("★★★★");
  			else if(rating === "3") $(this).text("★★★");
  			else if(rating === "2") $(this).text("★★");
  			else if(rating === "1") $(this).text("★");
  			else if(rating === "0") $(this).text("별점없음");
  		});
	      
  		
  		
  		// 삭제 처리
  		$(".r_DeleteBtn").click(function(){
  			if(confirm("삭제하시겠습니까?")){
	  			var userNo = $(this).attr("data-user-no");
	  			var reviewNo = $(this).closest('tr').attr("data-review-no");
	  			
	  			console.log("User No: " + userNo);
	  			console.log("Review No: " + reviewNo);
	  		
  			    $("#r_ListForm").append('<input type="hidden" name="user_no" value="' + userNo + '">');
	  		    $("#r_ListForm").append('<input type="hidden" name="review_no" value="' + reviewNo + '">');
	  		
	  			$("#r_ListForm").attr({
	  				"method" : "post",
	  				"action" : "/manager/review/managerReviewDelete"
	  			})
	  			
	  			$("#r_ListForm").submit();
  			}
  			
  		});
  		
  		
  		
  		
  		
  		/* 검색 대상이 별경될 때마다 처리 이벤트 */
		$('#search').change(function() {
			
	        if ($(this).val() == "review_rating") {
	        	$("#keyword").attr("placeholder","1~5 사이 숫자만 입력가능").removeAttr("readonly");
	            $("#keyword").on("input", function(){
	            	if(parseFloat($(this).val()) > 5){
	            		alert("별점 값은 1~5 사이로 입력해주세요");
	            		$(this).val('');
	    				$("#keyword").focus();
	            	};
	            	
	            });
	        } else if($(this).val() == "review_no"){
	        	$("#keyword").attr("placeholder","숫자만 입력가능").removeAttr("readonly");
	        	$("#keyword").val("");
				$("#keyword").focus();
	        } else if($(this).val() == "user_no"){
	        	$("#keyword").attr("placeholder","숫자만 입력가능").removeAttr("readonly");
	        	$("#keyword").val("");
				$("#keyword").focus();
	        } else if($(this).val() == "all"){
	        	$("#keyword").attr("placeholder","전체 목록을 조회합니다").attr("readonly","readonly");
	        	$("#keyword").val("");
				$("#keyword").focus();
	        } else if($(this).val() == "review_content"){
	        	$("#keyword").attr("placeholder","검색어를 입력하세요").removeAttr("readonly");
	        	$("#keyword").val("");
				$("#keyword").focus();
	        } else {
	            $("#keyword").attr("type", "text").removeAttr("placeholder").off("input");
	        }
	    });
  		
  		
		/* 검색 버튼 클릭 시 처리 이벤트 */
		$("#searchData").click(function(){
			if($("#search").val()=="review_content"){ 
				if(!chkData("#keyword","검색어를")) return;
			} else if ($("#search").val() == "review_no"){
				if(!chkDataNum("#keyword", "검색어를")) return;
			} else if ($("#search").val() == "user_no"){
				if(!chkDataNum("#keyword", "검색어를")) return;
			} 
			
			$("#pageNum").val(1);
			
			goPage();
			
							
		});
  		
  		/* 페이지네이션 */
		$(".paginate_button a").click(function(e){
			e.preventDefault();
			$("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
			goPage();
		})
		
		
  		
		/* 검색을 위한 실질적인 처리 함수 */
		function goPage(){
			if($("#search").val()=="all"){
				$("#keyword").val("");
			}
			
			$("#f_search").attr({
				"method" : "GET",
				"action" : "/manager/review/managerReviewList"
			});
			$("#f_search").submit();
			
		}
		  
		
		
	
		/* 정렬 폼 데이터 전송 */
		$(".orderbyBtn").on("click", function(){
			var selectedValue = $(this).val();
			$("#reviewOrderBy").val(selectedValue);
			
			console.log(selectedValue);
			$("#f_search").attr({
				"method" : "GET",
				"action" : "/manager/review/managerReviewList"
			});
			$("#f_search").submit();
		})
	
		
		
		
  		
  		
  		/* 날짜 범위 검색 input에 오늘 날짜 넣어주기 */
  		var today = new Date();
  	    var yyyy = today.getFullYear();
  	    var mm = today.getMonth() + 1; 
  	    var dd = today.getDate();

  	    mm = (mm < 10) ? '0' + mm : mm;
  	    dd = (dd < 10) ? '0' + dd : dd;

  	    var formattedDate = yyyy + '-' + mm + '-' + (dd+1);
  		$("#searchDate2").val(formattedDate);
  		
  	});