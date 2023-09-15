<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<link rel="stylesheet" href="/resources/css/common/pay_modal.css">

<script>
/* 결제 모달 창 - 02.14 */
const closebtn = document.querySelector('.closebtn');
const popup = document.querySelector('.popup');
const inputH = document.querySelector('.inputMonthH') //결제 개월 수 입력받는 inputhidden
const amount = document.querySelector('.amount');
const amountV = document.querySelector('.amountValue');

function modal(){ //결제창 on-off
	popup.style.display = 'block';
}
closebtn.addEventListener('click', function(){
	popup.style.display = 'none';
});

//결제 개월 수 view에 hidden으로 출력
function monthSelect(e){
	const paynum = (15000*e.value);
	inputH.value = e.value;
	amount.textContent = "결제 금액 : " + paynum + "원";
	amountV.value = paynum;
}

</script>
</head>
<body>
<!-- ********************************모달 시작****************************** -->
<input class="inputMonthH" type="hidden">
<input class="sessionuserID" type="hidden" value="${sessionScope.user_id}">
<input class="amountValue" type="text">
<div class="popup">  <!-- 팝업처럼 하기 위한 배경 -->
	<div class="pwrap">  <!-- 실제 팝업창 -->
		<a class="closebtn">X</a> <!-- 비밀번호 변경창 닫기 버튼 -->
		<div>
			<h1>결제하기</h1><span>(1개월 결제 금액은 15000원 입니다.)</span>
		</div>
		<table>
			<tr>
				<td><a href="#" onclick="kakaopay()"><img src="/resources/img/user/iconKakao.svg"></a></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
			</tr>
		</table>
		<div>
			<h3 class="amount">결제 금액 : 0원</h3>
			<p>개월 수를 선택 해 주세요</p>
			<select onchange="monthSelect(this)">
				<option value="0">선택하기</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
				<option value="7">7</option>
				<option value="8">8</option>
				<option value="9">9</option>
				<option value="10">10</option>
				<option value="11">11</option>
				<option value="12">12</option>			
			</select>
		</div>		
	</div>
</div>
<!-- ****************************모달 끝 *******************************-->
<script src="/resources/js/common/pay_modal.js"></script>
<script src="/resources/js/api/kakao_payment.js"></script>
</body>
</html>