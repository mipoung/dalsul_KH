<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<script type="text/javascript" src="/resources/include/addressAPI/addressAPIinsert.js"></script>
<script type="text/javascript" src="/resources/include/addressAPI/addressAPIdelete.js"></script>
<script type="text/javascript" src="/resources/include/addressAPI/addressAPIupdate.js"></script>
<script type="text/javascript" src="/resources/include/common/js/chkRegex.js"></script>	
<script>
$(function(){
    $(".addrBtn").click(function(){
        /*기능에 필요한 매개변수를 자바 변수로 저장*/
    	const addr_no = $(this).parent().parent().attr("data-num");
        const user_no = ${userLogin.user_no}; 
       	/*수정에 필요한 데이터 스크립트 변수로 정의*/
       

        /*누른 버튼의 이름을 인식해 수정과 삭제를 구분함*/
        const btnType = $(this).attr("name");
        
        if(btnType==="updateAddrBtn"){
            updateAddrProcess(addr_no,user_no);
        } else {
        	deleteAddrProcess(addr_no,user_no);
        }
        
    });
    
});
</script>

</head>
<body>
	<div class="container">
		<%@ include file="/WEB-INF/views/mypage/mypageCommon.jsp"%>
		<h4 class="text-center">내 배송지</h4>
		<form id="detailAddr">
			<input type="hidden" id="user_no" name="user_no" value="${userLogin.user_no}" />
		</form>
	<%--리스트 시작 --%>
		<div id="boardList" class="table-height">
			<table summary="게시판 리스트" class="table table-striped">
				<thead>
					<tr>
						<th data-value="b_num" class="order text-center col-md-1">배송지 이름</th>
						<th class="text-center col-md-2">도로명주소</th>
						<th class="text-center col-md-2">지번주소</th>
						<th data-value="b_date" class="text-center col-md-4">상세주소</th>
						<th class="text-center col-md-1">수령인</th>
						<th class="text-center col-md-1">우편번호</th>
						<th class="text-center col-md-1">수정</th>
						<th class="text-center col-md-1">삭제</th>						
					</tr>
				</thead>
				<tbody id="list" class="table-striped">
					<c:choose>
						<c:when test="${not empty addr}">
							<c:forEach var="addr" items="${addr}">
								<tr class="text-center" data-num="${addr.addr_no}">
									<td>${addr.addr_name}</td>
									<td class="goDetail text-left">${addr.addr_road}</td>
									<td class="name">${addr.addr_jibun}</td>
									<td class="text-center">${addr.addr_detail}</td>
									<td class="text-center">${addr.addr_receiver}</td>
									<td class="text-center">${addr.addr_post}</td>
									<td class="text-center"><input type="button" name="updateAddrBtn" class="addrBtn" value="수정"></td>
									<td class="text-center"><input type="button" name="deleteAddrBtn" class="addrBtn" value="삭제"></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="6" class="tac text-center">등록된 배송지가 존재하지 않습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
		<%-- 리스트 종료 --%>
		<%-- 수정버튼 클릭시 사용자에게 보여줄 api 입력폼 --%>
		<div>
			<%@ include file="/WEB-INF/views/addr/addressAPI.jsp" %>
		</div>
    	<input type="button" name="sendAddrBtn" id="sendAddrBtn" value="주소 추가하기"/><br/>  
    	<!--  <input type="button" name="updateAddrFormBtn" id="updateAddrFormBtn" value="기본배송 주소지 정보수정하러가기(대상 일련번호 입력)">-->
		</div>
</body>
</html>