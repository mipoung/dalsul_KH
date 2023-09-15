<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">
    <meta charset="utf-8">
	<script type="text/javascript">
	$(function(){
	    	// 드롭다운 메뉴 사용하기 위해서 아래의 소스 추가.
	    	$('.dropdown-toggle').dropdown();
	});
	</script>
  </head>

  <body>
    
    <h5>주소 입력API, 데이터베이스 Create , 그이후로 db와 직접적으로 rud </h5>
	<%--주소지 조회 API는 단독으로 실행 가능하지만 주소지를 검색한값을 활용해 주소지값을 저장하는 기능은 js와 js와 연관된 버튼이 있어야 한다. --%>
	<script type="text/javascript" src="/resources/include/js/adressAPI/addressAPIinsert.js"></script>
	<script type="text/javascript" src="/resources/include/js/adressAPI/addressAPIdelete.js"></script>
   
    <form id="useAddr" name="useAddr" id="useAddr">
		<%@include file="addressAPI.jsp" %>
    	<input type="number" name="addr_no" id="addr_no" placeholder="(addr_no)번호입력">
    	<input type="number" name="user_no" id="user_no" placeholder="(user_no)번호입력">
    </form>
		<input type="button" name="sendAddrBtn" id="sendAddrBtn" value="주소 추가하기"/><br/>
    	<input type="button" name="infoAddrBtn" id="infoAddrBtn" value="기본배송 주소지 정보조회가기(대상 일련번호 입력)" /><br/>    
    	<input type="button" name="deleteAddrBtn" id="deleteAddrBtn" value="기본배송 주소지 정보삭제하기(대상 일련번호 입력)"><br/>
    	<input type="button" name="updateAddrFormBtn" id="updateAddrFormBtn" value="기본배송 주소지 정보수정하러가기(대상 일련번호 입력)">
    	
  </body>
</html>