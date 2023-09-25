<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<%@ include file="/WEB-INF/views/main/header.jsp"%>
<style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
            margin-top: 70px;
        }
        #thead_table { width:80%;  text-align:center; margin: 0 auto;}
		#detaliReview {margin-right: 40px;}

        h1 {
            color: #583e6f;
            padding: 20px;
            text-align: center;
        }

        .whole-table {
            background-color: #fff;
            padding: 20px;
            margin: 20px;
            border-radius: 5px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #007bff;
            color: #fff;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .btn {
            display: inline-block;
            padding: 5px 10px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn-primary {
            background-color: #007bff;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .btn-danger {
            background-color: #dc3545;
        }

        .btn-danger:hover {
            background-color: #c82333;
        }

        .btn-sm {
            font-size: 12px;
        }

        .text-center {
            text-align: center;
        }

        #list {
            text-align: center;
            margin-top: 20px;
        }

        #totalSum {
            font-size: 40px;
        }

        #btn {
            margin-top: 10px;
        }

        #payBtn {
            font-size: 16px;
            padding: 10px 20px;
        }
    </style>
<script>
    function updateTotalForAllItems() {
        let totalSum = 0;
        $(".cart-item").each(function () {
            updateTotal($(this));
        });
        $(".cart-item").each(function () {
            let total = parseInt($(this).find(".total").text().replace(/,/g, ''));
            totalSum += total;
        });
        $("#list > h1").text("총 합 " + numberWithCommas(totalSum) + "원");
        $(".product_price").each(function () {
            let product_price = parseInt($(this).text().replace(/,/g, ''));
            $(this).text(numberWithCommas(product_price));
        });
        $(".total").each(function () {
            let total = parseInt($(this).text().replace(/,/g, ''));
            $(this).text(numberWithCommas(total));
        });
    }

    function updateTotal(item) {
        let product_price = parseInt(item.find(".product_price").text().replace(/,/g, ''));
        let quantity = parseInt(item.find(".quantity").text());
        let total = product_price * quantity;
        item.find(".total").text(total);
    }

    function numberWithCommas(number) {
        return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }

    function deleteConfirm(product_no) {
        if (deleteCheck === 1) {
            $.ajax({
                url: "/cart/cartDelete",
                type: "GET",
                data: {"product_no": product_no},
                dataType: "text",
                error: function () {
                    alert("시스템 오류입니다. 관리자에게 문의하세요.");
                },
                success: function (data) {
                    $("#cartItem-" + product_no).remove();
                    updateTotalForAllItems();
                }
            });
        }
    }

    $(function () {
        updateTotalForAllItems();
        $("#payBtn").click(function () {
            window.location.href = "/cart/cartListDetail";
        });
        $(".deleteBtn").click(function () {
            if (confirm("정말 삭제하시겠습니까?")) {
                deleteCheck = 1;
                const product_no = $(this).data("product-id");
                deleteConfirm(product_no);
            } else {
                deleteCheck = 0;
            }
        });
        $(".plusBtn").click(function () {
            const product_no = $(this).attr("data-product-id");
            const quantityElement = $("#cartItem-" + product_no).find(".quantity");
            let product_quantity = parseInt(quantityElement.text().replace(/,/g, ''));

            $.ajax({
                "url": "/cart/cartPlus",
                "method": "get",
                "data": {"product_no": product_no},
                "dataType": "text",
                success: function (data) {
                    if (data == 1) {
                        product_quantity += 1;
                        quantityElement.text(product_quantity); // Update the quantity on the page
                        updateTotal($("#cartItem-" + product_no));
                        updateTotalForAllItems();
                    } else {
                        alert("시스템 오류입니다. 잠시 후 다시 시도해주세요.");
                    }
                },
                error: function () {
                    alert("시스템 오류입니다. 잠시 후 다시 시도해주세요.");
                }
            });
        });

        $(".minusBtn").click(function () {
            const product_no = $(this).attr("data-product-id");
            const quantityElement = $("#cartItem-" + product_no).find(".quantity");
            let product_quantity = parseInt(quantityElement.text().replace(/,/g, ''));
            
            if (product_quantity <= 1) {
                alert("수량이 1개 이상이여야 합니다.");
                return;
            }
            
            $.ajax({
                "url": "/cart/cartMinus",
                "method": "get",
                "data": {"product_no": product_no},
                "dataType": "text",
                success: function (data) {
                    if (data == 1) {
                        product_quantity -= 1; // Decrease the product quantity by 1
                        quantityElement.text(product_quantity); // Update the quantity on the page
                        updateTotal($("#cartItem-" + product_no)); // Recalculate total for the item
                        updateTotalForAllItems(); // Recalculate total for all items
                    } else {
                        alert("시스템 오류입니다. 잠시 후 다시 시도해주세요.");
                    }
                },
                error: function () {
                    alert("시스템 오류입니다. 잠시 후 다시 시도해주세요.");
                }
            });
        });


    });
</script>

</head>
<body>
	<h1>장바구니</h1>
	<div class="border border-success p-2 mb-2 whole-table">
		<table class="table table-bordered">
			<thead>
				<tr>
					<th scope="col">선택</th>
					<th scope="col">상품번호</th>
			 		<th scope="col">상품명</th>
					<th scope="col">가격</th>
					<th scope="col">수량</th>
					<th scope="col">총 합</th>
					<th scope="col">삭제</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${cartList}" var="cartList">
					<tr id="cartItem-${cartList.product_no}" class="cart-item">
						<td class="product_no">
       				       <input type="checkbox" class="product-checkbox" data-product-id="${cartList.product_no}"/></td>
       				     <td class="product_no" >${cartList.product_no}</td> <!-- 상품번호 -->
       				       
						<td class="product_name" >${cartList.product_name}</td> <!-- 상품명 -->
						<td class="product_price">${cartList.product_price}</td>
							
						
						
						
						<td class="product_price-quantity"> 
						<button type="button" class="btn btn-primary btn-sm minusBtn" data-product-id="${cartList.product_no}">-</button> 
						<span class="quantity">${cartList.quantity}</span>
						<button type="button" class="btn btn-primary btn-sm plusBtn" data-product-id="${cartList.product_no}">+</button>
						</td>
						
						
						<td class="total"></td>
						<td>
							<button type="button" class="btn btn-danger btn-sm deleteBtn"
								data-product-id="${cartList.product_no}">x</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
<%--
   <form id="cartForm" class="cartForm">
   <input type="hidden" name="orderData" id="orderData"/>
      <div id="list">
         <h1 id="totalSum"></h1>
         <div id="btn">
            <button type="button" id="payBtn">결제하기</button>
         </div>
      </div>
   </form>
 --%>	
 
 
 <form id="cartForm" class="cartForm">
    <input type="hidden" name="orderData" id="orderData"/>
    <div id="list">
        <h1 id="totalSum"></h1>
        <div id="btn">
            <c:choose>
                <c:when test="${empty cartList}">
                    <button type="button" id="payBtn" disabled>결제하기</button>
                </c:when>
                <c:otherwise>
                    <button type="button" id="payBtn">결제하기</button>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</form>
 

 
</body>
</html>