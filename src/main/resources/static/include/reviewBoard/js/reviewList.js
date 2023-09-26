	$(function(){
			$('.card.mb-3').each(function() {
		        var review_no = $(this).data('review-no');
		        var cookieName = 'review_' + review_no;
		        
		        // 해당 리뷰의 쿠키가 존재하는지 확인
		        if($.cookie(cookieName)) {
		            
		            $(this).find(".reviewLikeBtn").attr('disabled', true);
		            
		        }
		    });
		
		
      		
      		// 리뷰리스트에서 별점을 별로 치환하기
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
      		
      		
      		
      		// 수정 모달에서 별점 클릭했을 때 색 변환하고 값 넣기
      		
      		$("#star > span").click(function(){
      			$("#star > span").css("color", "gray");
      			
      		    if(this === $("#star1")[0]){
      		        $(this).css("color","red");
      		      	$("#review_rating").val(1);
      		    } else if(this === $("#star2")[0]){
      		    	$("#star1").css("color","red");
      		   		$(this).css("color","red");
      		   		$("#review_rating").val(2);
      		    } else if(this === $("#star3")[0]){
      		    	$("#star1").css("color","red");
      		    	$("#star2").css("color","red");
      		   		$(this).css("color","red");
      		  		$("#review_rating").val(3);
      		    } else if(this === $("#star4")[0]){
      		    	$("#star1").css("color","red");
      		    	$("#star2").css("color","red");
      		    	$("#star3").css("color","red");
      		   		$(this).css("color","red");
      		  		$("#review_rating").val(4);
      		    } else if(this === $("#star5")[0]){
      		    	$("#star1").css("color","red");
      		    	$("#star2").css("color","red");
      		    	$("#star3").css("color","red");
      		    	$("#star4").css("color","red");
      		   		$(this).css("color","red");
      		 	 	$("#review_rating").val(5);
      		    } 
      		    console.log("저장된 별점 값 : "+$("#review_rating").val());
      		    
      		    
      		});

      		


      		
      		
      		
      		// 삭제
      		$(".r_DeleteBtn").click(function(){
      			if(confirm("정말 삭제 하시겠습니까?")){
	      			var userNo = $(this).attr("data-user-no");
	      			var reviewNo = $(this).closest(".card.mb-3").attr("data-review-no");
	      			var productNo = $(this).closest(".card.mb-3").find(".card-title").data("product-no");
	      			
	      		    console.log("User No: " + userNo);
	      		   $("#product_no").val(productNo);
	      		    
	      		    $("#r_ListForm").append('<input type="hidden" name="user_no" value="' + userNo + '">');
	      		    $("#r_ListForm").append('<input type="hidden" name="review_no" value="' + reviewNo + '">');
					$("#r_ListForm").append('<input type="hidden" name="product_no" value="' + productNo + '">');
	      		
	      			$("#r_ListForm").attr({
	      				"method" : "post",
	      				"action" : "/review/myReviewDelete"
	      				
	      			});
	      			
	      			$("#r_ListForm").submit();
      			}
      			
      		});
      		
      		
      		
      		/**************** 리스트에서 수정 버튼 클릭(모달창 띄우면서 폼 불러오기) ****************/
      		$(".r_UpdateFormBtn").click(function(){
      			// 수정 폼으로 리뷰 내용 불러오기 
      			//$("#message-text").val("");
	      		var reviewContentForm = $(this).closest(".card.mb-3").find("#reviewContent").attr("data-review-content");
	      		// 내용 가져올때 <br>태그 제거
	      		reviewContentForm = reviewContentForm.replace(/<br>/gi, "");
	      		
	      		
	      		
	      		// 제품명 가져오기
			    var productName = $(this).closest(".card.mb-3").find("#productNameSpan").attr("data-product-name");
			    console.log(productName);
			
			    // 모달 창 내부에 제목 설정
			    $("#exampleModal .card-title").text(productName);
	   			
	      		
	      		
	      		
	      		
	      		// 이미지 불러와서 모달창에 설정
	      		var imageNo = $(this).closest(".card.mb-3").find(".col-md-4").attr("data-image-no");
    			console.log(imageNo);
    				
    			$("#exampleModal .col-md-4 img").attr("src", "/resources/images/mainpage/product/" + imageNo);
  				console.log($("#exampleModal .col-md-4 img").attr("src"));
	   			
	   			
	   					
    		
	   			
	   			
	   			
	      		// 메세지 박스에 내용 채우기
      			$("#message-text").val(reviewContentForm);
      			console.log("content : " + reviewContentForm);
      			
      			// 메세지 박스에 채워진 내용 글자수 세기
	   			$('#textCount').text($('#message-text').val().length + '/250자');
      			
      			
      			// jsp에서 리뷰번호 가져오기
      			var reviewNo = $(this).closest(".card.mb-3").attr("data-review-no");
      			var productNo = $(this).closest(".card.mb-3").find(".card-title").data("product-no");
      			console.log("Review No: " + reviewNo);
      			console.log("Product No: " + productNo);
      			// 가져온 리뷰 번호를 myReviewData의 value에 대입
      			$("#review_no").val(reviewNo);
      			$("#product_no").val(productNo);
      			
      			/* 리스트에 있는 리뷰 별점 값 가져오기 */
      			$(document).on('click', '.r_UpdateFormBtn', function() {
      			    // 가장 가까운 .card.mb-3 부모 요소를 찾고, 그 안에서 .reviewRating 요소를 찾아 data-review-rating 값을 가져온다.
      			    var ratingValue = $(this).closest('.card.mb-3').find('.reviewRating').data('review-rating');
      			  	
      			    // 모달창에 별점 설정
      			  	$("#review_rating").val(ratingValue);
      			  	
     			    console.log("폼에 입력된 별점 : " + $("#review_rating").val());
     			    
     			    
     			    // 별점 색 변경
     			    if($("#review_rating").val() === "1"){
     			    	$("#star1").css("color","red");
     			    	
     			    } else if($("#review_rating").val() === "2"){
     			    	$("#star1").css("color","red");
     			    	$("#star2").css("color","red");
     			    } else if($("#review_rating").val() === "3"){
     			    	$("#star1").css("color","red");
     			    	$("#star2").css("color","red");
     			    	$("#star3").css("color","red");
     			    } else if($("#review_rating").val() === "4"){
     			    	$("#star1").css("color","red");
     			    	$("#star2").css("color","red");
     			    	$("#star3").css("color","red");
     			    	$("#star4").css("color","red");
     			    } else if($("#review_rating").val() === "5"){
     			    	$("#star1").css("color","red");
     			    	$("#star2").css("color","red");
     			    	$("#star3").css("color","red");
     			    	$("#star4").css("color","red");
     			    	$("#star5").css("color","red");
     			    }; 
     			    
     			    
      			 
      			});


      		});
      		/*******************리스트에서 수정 버튼 클릭(모달창 띄우면서 폼 불러오기) 끝 ************************/
      		
      		
      		
      		
      		
      		

      		/********* 모달창 취소버튼 눌렀을 때 별점 색상 회색으로 초기화 ********/
      		$("#r_CancelBtn").click(function(){
      			$("#star > span").css("color", "gray");
      		});
      		$(".btn-close").click(function(){
      			$("#star > span").css("color", "gray");
      		});
      		/***********************************************************************/
      		
      		
      		
      		
      		
      		
      		
      		
      		
      		// 모달창에서 수정버튼 클릭
      		$(".r_UpdateBtn").click(function(){
					
   				if(!chkData("#message-text", "내용을")) return;
   				else if(!chkData("#review_rating", "별점을")) return;  
				  
				  
      			if(confirm("수정 하시겠습니까?")){
      			
	      			$("#r_UpdateForm").attr({
	      				"method" : "post",
	      				"action" : "/review/reviewUpdate"
	      				
	      			});
	      			$("#r_UpdateForm").submit();
      			}
      		});
      		
      		
      		
      		
      		
      		// 모달창 글자수 보여주기
      		$('#message-text').keyup(function (e) {
      			let content = $(this).val();
      		    
	      		    // 글자수 세기
	      		    if (content.length == 0 || content == '') {
	      		    	$('#textCount').text('0자/250자');
	      		    } else {
	      		    	$('#textCount').text(content.length + '/250자');
	      		    } 
      		    
      		    
	      		  if (content.length > 250) {
	      	        // 200자 넘으면 알림창 뜨도록
	      	        alert('글자수는 250자까지 입력 가능합니다.');
      	  		  };
      		    
      		    
      		});	
      		
      		
      		/********************
      		
      		

      		$(".reviewLikeBtn").click(function(){
      			var $thisBtn = $(this);
      		    var review_no = $thisBtn.closest('.card').data('review-no');
      			  var user_no = $("#user_no").val();  // user_no 값을 가져옵니다.
      		    $.ajax({
      				url : "/review/likePlus",
      				type: "POST",
      				data: { review_no: review_no, user_no: user_no },
      				 success: function(response){
      					$thisBtn.find(".likeCount").text(response);
      					console.log(response);
      		        },
      				error : function(error){
      					console.error('Error',error);
      				}
      				
      				
      			});
      			
      			
      			
      		});
      		
      		/********************/
      		
   			$(document).on('click', '.reviewLikeBtn', function() {
   				var cardElement = $(this).closest('.card');
   				var review_no = $(this).closest('.card').data('review-no');
   				var cookieName = 'review_' + review_no;
   				var likeVal = "";
   				console.log(cookieName);
   				
   				// 해당 리뷰에 대한 쿠키가 있는지 확인
   			    if(!$.cookie(cookieName)) {
   				    // 쿠키에 리뷰 ID 저장 (24시간 동안 유효)
   			        $.cookie(cookieName, true, { expires: 24, path: '/' });
   				    
   				    // 버튼 비활성화 시키기
   			     	$(this).closest(".card.mb-3").find(".reviewLikeBtn").attr('disabled', true);
   			    	
   				    // ajax로 좋아요 +1 DB에 INSERT하기
	   			     $.ajax({
	       				url : "/review/likePlus",
	       				type: "GET",
	       				data: { review_no: review_no },
	       				 success: function(response){
	       					
	       		        },
	       				error : function(error){
	       					console.error('Error',error);
	       				}
	       				
	       				
	       			});
   				    
   				  // 좋아요 카운트 표시 +1 하기
	   			  var likeVal = $(this).closest(".card.mb-3").find(".likeCount").text();
	   			  likeVal = parseInt(likeVal);
	   			  $(this).closest(".card.mb-3").find(".likeCount").text(likeVal+1);
   			    } else {
   			    	// 추천된 쿠기가 이미 있으면
   			        alert("이미 추천하셨습니다.");
   				 	// 버튼 비활성화 시키기
   			     	$(this).closest(".card.mb-3").find(".reviewLikeBtn").attr('disabled', true);
   			    }
   				
   			});
      		
      		

      		
      		
      		
      		
      		
   			/* 정렬 폼 데이터 전송 */
   			$(".orderByBtn").on("click", function(){
			    var selectedValue = $(this).data('order-by'); // `.data()` 메서드를 사용하여 데이터 속성 값을 가져옵니다.
			   
    			$("#reviewOrderBy").val(selectedValue);
			    console.log($("#reviewOrderBy").val()); // 값 잘 들어감
			    
   				$("#detailReviewOrderBy").attr({
   					"method" : "GET",
   					"action" : "/review/detailReviewList"
   				});
   				$("#detailReviewOrderBy").submit();
   			})
      		
      		
      		
      		
      	});
      