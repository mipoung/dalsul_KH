package com.dalsul.user.addr.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AddrVO { 	//테이블 칼럼과 연동 
	private int addr_no; 					//기본배송지 일련번호 	,number(pirmarykey)
	private int user_no;					//회원일련번호
	private String postcode; 			//	우편번호		, Varchar2(255)
	private String jibunAddress;		//	지번주소		, Varchar2(255)
	private String roadAddress;		//	도로명주소		, Varchar2(255)
	private String detailAddress;		//	상세주소		, Varchar2(255)
	private String receiver;			//	수령인		,Varchar2(255)
	private String addr_name;				//	주소별명		,Varchar2(255)
                    
}
