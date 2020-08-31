<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="styles.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<!--CSS시작 -->
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	outline: none;
	font-family: 'Jua', sans-serif;
}

body {
	/* background: url('../image/bg2.jpg') no-repeat top center; */
	background: rgba(27, 27, 29, 0.97);
	background-size: cover;
	height: 100vh;
	font-family: 'Jua', sans-serif;
}

.wrapper {
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
	width: 100%;
	padding: 0 20px;
}

.contact-form {
	/* 가로 */
	max-width: 400px;
	/* 세로 */
	min-height: 300px;
	margin: 0 auto;
	/* 색상 */
	background: rgba(0, 0, 0, 0.8);
	padding: 30px;
	border-radius: 5px;
	display: flex;
	flex-direction: column;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0);
}

.input-fields {
	display: flex;
	flex-direction: column;
	margin-right: 4%;
}

.input-fields, .msg {
	width: 48%;
	padding: 5;
}

.input-fields>input {
	margin: 10px 0;
	background: transparent;
	border: 0;
	border-bottom: 2px solid #c5dbfd;
	padding: 10px;
	color: #c5d4fd;
	width: 208.5%;
}

.msg {
	margin: 10px 0;
	background: transparent;
	border: 0;
	padding: 10px;
	color: #c5ecfd;
	width: 100%
}

::-webkit-input-placeholder {
	color: #c5d4fd;
}

::-moz-input-placeholder {
	color: #c5d4fd;
}

::-ms-input-placeholder {
	color: #c5d4fd;
}

.btn {
	background: #39b7dd;
	text-align: center;
	padding: 15px;
	border-radius: 5px;
	color: #fff;
	cursor: pointer;
	text-transform: uppercase;
}

@media screen and (max-width: 600px) {
	.contact-form {
		flex-direction: column;
	}
	.input-fields, .msg {
		width: 100%;
	}
}
</style>
</head>
<body>
	<div class="wrapper">
		<form action="../MemberJoinProc.do" method="post">
			<div class="contact-form">
				<div class="input-fields">
					<input name="id" type="text" class="input" placeholder="아이디">
					<input name="pass1" type="password" class="input"
						placeholder="비밀번호"> <input name="pass2" type="password"
						class="input" placeholder="비밀번호 확인"> <input name="name"
						type="text" class="input" placeholder="이름"> <input
						name="birth" type="text" class="input" placeholder="생년월일">

					<div class="input" placeholder="성별" style="color: #c5d4fd">
						<input class="input" type="radio" name="gender" value="남자">MAN
						&nbsp;<input type="radio" name="gender" value="여자">WOMAN<br />
					</div>
					<input name="tel" type="text" class="input" placeholder="전화번호">
					<input name="email" class="input" placeholder="이메일"> 
					<input type="text" class="input" placeholder="주소" readonly> 
					<div class="form-gruop">
					<label>ADDRESS</label>
					<!-- <input type="text" name="address" class="form-control" placeholder="ADDRESS"required> -->
					<input type="text" id="sample4_postcode" class="form-control"placeholder="우편번호"required readonly>
				    <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"style="float: right;"><br><br>
				    <input type="text" id="sample4_roadAddress" class="form-control" name="address" placeholder="도로명주소"required readonly><br>
				    <input type="text" id="sample4_jibunAddress" class="form-control"placeholder="지번주소"required readonly><br>
				    <span id="guide" style="color:#999;display:none"></span>
				    <input type="text" id="sample4_detailAddress" class="form-control" placeholder="상세주소"required><br>
				    <input type="text" id="sample4_extraAddress" class="form-control"placeholder="참고항목"required readonly>
				
				    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
				    <script>
				        //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
				        function sample4_execDaumPostcode() {
				            new daum.Postcode({
				                oncomplete: function(data) {
				                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				
				                    // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
				                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				                    var roadAddr = data.roadAddress; // 도로명 주소 변수
				                    var extraRoadAddr = ''; // 참고 항목 변수
				
				                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
				                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
				                        extraRoadAddr += data.bname;
				                    }
				                    // 건물명이 있고, 공동주택일 경우 추가한다.
				                    if (data.buildingName !== '' && data.apartment === 'Y') {
				                        extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				                    }
				                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				                    if (extraRoadAddr !== '') {
				                        extraRoadAddr = ' (' + extraRoadAddr + ')';
				                    }
				
				                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
				                    document.getElementById('sample4_postcode').value = data.zonecode;
				                    document.getElementById("sample4_roadAddress").value = roadAddr;
				                    document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
				
				                    // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
				                    if (roadAddr !== '') {
				                        document.getElementById("sample4_extraAddress").value = extraRoadAddr;
				                    } else {
				                        document.getElementById("sample4_extraAddress").value = '';
				                    }
				
				                    var guideTextBox = document.getElementById("guide");
				                    // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
				                    if (data.autoRoadAddress) {
				                        var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
				                        guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
				                        guideTextBox.style.display = 'block';
				
				                    } else if (data.autoJibunAddress) {
				                        var expJibunAddr = data.autoJibunAddress;
				                        guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
				                        guideTextBox.style.display = 'block';
				                    } else {
				                        guideTextBox.innerHTML = '';
				                        guideTextBox.style.display = 'none';
				                    }
				                }
				            }).open();
				        }
				    </script>
				</div>
				</div>
				<div class="msg">
					<input type="submit" class="btn" value="JOIN" /> <a
						href="../index2.jsp" class="log_a"><button type="button"
							class="btn btn-warning btn-block m-t-md" id="button01"
							value="HOME">HOME</button></a>

				</div>
			</div>
		</form>

	</div>
</body>
</html>