<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>    
<!DOCTYPE html>
<html lang="ko">
   </head>
   <body>
      <h5>기본 배송지 표출 화면</h5>
      <p>검색조건에 입력받은 유저 일련번호 : ${addr.user_no}</p>
      <p>검색조건에 입력받은 기본배송지 일련번호 : ${addr.addr_no}</p>
      <p>도로명주소 : ${addr.postcode}</p>
      <p>지번주소 : ${addr.jibunAddress}</p>
      <p>도로명주소 : ${addr.roadAddress}</p>
      <p>상세주소 : ${addr.detailAddress}</p>
      <p>수령인 : ${addr.receiver}</p>
      <p>주소별명 : ${addr.addr_name}</p>
   </body>
   </html>