<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>    
<!DOCTYPE html>
<html lang="ko">
<script type="text/javascript" src="/resources/include/js/adressAPI/addressAPIupdate.js"></script>

   </head>
   <body>
      <h5>주소지 정보 업데이트</h5>
      <p>수정할 주소지 정보를 입력해주세요<p>
      <p data-user-no="${addr.user_no}" id="user_no">검색조건에 입력받은 유저 일련번호 : ${addr.user_no}</p>
      <p data-addr-no="${addr.addr_no}" id="addr_no">검색조건에 입력받은 기본배송지 일련번호 : ${addr.addr_no}</p>
      
      <form id="useAddr" name="useAddr" id="useAddr">
         <%@include file="addressAPI.jsp" %>
       </form>   
         <input type="button" name="updateAddrBtn" id="updateAddrBtn" value="기본배송 주소지 정보수정하기">
      <h5>원래 배송지 저장값 확인 </h5>
      <p>도로명주소 : ${addr.postcode}</p>
      <p>지번주소 : ${addr.jibunAddress}</p>
      <p>도로명주소 : ${addr.roadAddress}</p>
      <p>상세주소 : ${addr.detailAddress}</p>
      <p>수령인 : ${addr.receiver}</p>
      <p>주소별명 : ${addr.addr_name}</p>
   </body>
   </html>