<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/main/header.jsp"%>
<%@ include file="/WEB-INF/views/mypage/mypageCommon.jsp"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
      
      <title>Insert title here</title>
      
      <link rel="shortcut icon" href="../image/icon.png" />
      <link rel="apple-touch-icon" href="../image/icon.png" />
    
	  <script  src="/resources/include/js/jquery-3.7.0.min.js"></script>
	  <script src="/resources/include/dist/js/bootstrap.min.js"></script>
	  <script  src="/resources/include/js/common.js"></script> 
      <script src="https://cdn.iamport.kr/v1/iamport.js"></script> 
          <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
      <script>
      
      var IMP = window.IMP; 
      IMP.init("imp57485457"); 
      
      $(function(){
    	  $("#button").click(function(){
    		  requestPay();
    	  })
      });
      
		function requestPay() {
		  IMP.init('imp57485457'); //iamport 대신 자신의 "가맹점 식별코드"를 사용
		  IMP.request_pay({
		    pg: "html5_inicis.INIBillTst",
		    pay_method: "card",
		    merchant_uid : 'merchant_'+new Date().getTime(),
		    name : '아메리카노',
		    amount : 1000,
		    buyer_email : 'iamport@siot.do',
		    buyer_name : '구매자',
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울특별시 강남구 삼성동',
		    buyer_postcode : '123-456'
		  }, function (rsp) { // callback
		      if (rsp.success) {
		    	  console.log(rsp);
		      } else {
		        console.log(rsp);
		      }
		  });
		};
		
		function msg(rsp) {
		    console.log(rsp);
		    if (rsp.success) {
		      var msg = '결제가 완료되었습니다.';
		      alert(msg);
		      location.href = "결제 완료 후 이동할 페이지 url"
		    } else {
		      var msg = '결제에 실패하였습니다.';
		      msg += '에러내용 : ' + rsp.error_msg;
		      alert(msg);
		    }
		 }
		
		
</script> 
   </head>
   <body>
    	<button type="button" id="button">테스트</button>
   </body>
</html>