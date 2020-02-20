/**
 * var value = "가나다";
 * value.contains('나');
 * value.length();
 * 
 * "a001".validationID()
 * 정규식 패턴 작성 : http://ryanswanson.com/regexp/#start
 */
	// 아이디 정규식 패턴 : 소문자 숫자포함 3~5자리
	String.prototype.validationID = function(){
		return /^[a-z0-9]{3,5}$/.test(this);
	};
	
	//	패스워드 정규식 패턴 : 소문자 숫자포함 4~8자리
	String.prototype.validationPWD = function(){
		return /^[0-9a-z]{4,8}$/.test(this);
	};
	
	//	이름 정규식 패턴 : 한글로 2~6자리
	String.prototype.validationNM = function(){
		return /^[가-힣]{2,6}$/.test(this);
	};
	
	// 주민등록번호 정규식 패턴 : 아래와 같다.
	String.prototype.validationREGNO = function(){
		// 1 1 1 1 1 1 - 1 1 1 1 1 1               8
		// * * * * * *   * * * * * *
		// 2+3+4+5+6+7 + 8+9+2+3+4+5 = 연산결과    매직넘버
		// (11-(연산결과 % 11)) %10 = 최종값
		// if(최종값 == 매직넘버) 유효한 주민등록번호
		var moto = this.replace('-', '');
		var magicNumber = moto.substr(12, 1);
		var sequenceValue = '234567892345';
		var sum = 0;
		
		for(var i=0; i<12; i++){
			sum += moto.charAt(i) * sequenceValue.charAt(i); 
		}
		
		var finalValue = (11-(sum%11))%10;
		
		if(finalValue == parseInt(magicNumber)){
			return true;
		}else{
			return false;
		}
	};
	
	//	생년월일 정규식 패턴  
	String.prototype.validationBIR = function(){
		return /^(19[0-9][0-9]|20\d{2})-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/.test(this);
	};
	
	// 집 전화번호 정규식 패턴
	String.prototype.validationHOMETEL = function(){
		return /^0\d{1,2}-\d{3,4}-\d{4}$/.test(this);
	};
	
	// 회사 전화번호 정규식 패턴
	String.prototype.validationCOMTEL = function(){
		return /^0\d{1,2}-\d{3,4}-\d{4}$/.test(this);
	};
	
	// 휴대폰 번호 정규식 표현
	String.prototype.validationHP = function(){
		return /^01(0|1|6|7|8|9)-\d{3,4}-\d{4}$/.test(this);
	};
	
	// 이메일 정규식 표현
	String.prototype.validationMAIL = function(){
		return /^\w+@[a-z]+(\.[a-z]+){1,2}$/.test(this);
	};
