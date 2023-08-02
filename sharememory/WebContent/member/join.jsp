<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<title>회원가입</title>
<script type="text/javascript">
// 유효성 검사 메서드
function Validation() {
    // 변수에 저장
    var mb_No = document.getElementById("mb_No")
    var mb_ID = document.getElementById("mb_ID")
    var mb_PW = document.getElementById("mb_PW")
    var mb_CPW = document.getElementById("mb_CPW")
    var mb_Name = document.getElementById("mb_Name")
    var mb_Tel = document.getElementById("mb_Tel")
    var mb_Gender = document.getElementById("mb_Gender")

    //아이디 확인
    if(mb_ID.value.length <4){
        alert("아이디를 4글자 이상 입력하세요.")
        mb_ID.focus();
        return false;
    }
    //아이디 영어 대소문자 확인
    else if(!checkEngNumber(mb_ID.value)){
        alert("영문 대소문자, 숫자만 입력하세요.")
        mb_ID.focus();
        return false;
    }

    //비밀번호 확인
    if(mb_PW.value.length <4){
        alert("비밀번호를 4글자 이상 입력하세요.")
        mb_PW.focus();
        return false;
    }
    //비밀번호 영어 대소문자 확인
    else if(!checkEngNumber(mb_PW.value)){
        alert("영문 대소문자, 숫자만 입력하세요.")
        mb_PW.focus();
        return false;
    }
    //비밀번호와 아이디 비교
    else if(mb_PW.value == mb_PW.value){
        alert("아이디와 동일한 비밀번호를 사용할 수 없습니다.")
        mb_PW.focus();
        return false;
    }
    
    //비밀번호 확인
    if(mb_CPW.value !== mb_PW.value){
        alert("비밀번호와 동일하지 않습니다.")
        mb_CPW.focus();
        return false;
    }


    //이름 확인 = 한글만 가능하도록
    if(mb_Name.value == ""){
        alert("이름을 입력하세요.")
        mb_Name.focus();
        return false;
    }
    
    else if(!checkKor(mb_Name.value)){
        alert("한글만 입력하세요.")
        mb_Name.focus();
        return false;
    }
    
     //성별 체크
    if(!checkedGender(mb_Gender)){
        alert("성별을 체크하세요.")
        mb_Gender.focus();
        return false;
    }


}

//전화번호 자동 하이픈
const hypenTel = (target) => {
 target.value = target.value
   .replace(/[^0-9]/g, '').replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/, `$1-$2-$3`).replace(/(\-{1,2})$/g, "");
}

// 문자열이 영어, 숫자인지 확인하는 메서드 
function checkEngNumber(value){
    return /^[a-zA-Z0-9]*$/.test(value);
}

//영어, 한글인지(가~힣) 확인
function checkKor(value){
	return /^[가-힣]*$/.test(value);
}

//성별 체크 확인
function checkedGender(){
	var genders = document.getElementsByName("mb_Gender");
    for(var i=0; i<genders.length; i++){
        if(genders[i].checked){
            return true;
        }
    }
    return false;
}
</script>
</head>
<body>
<br>
<div align="center">

</div>
<br><br>

<form id="userinfoForm" action="joinAction.jsp" method="post" onsubmit="return Validation();">
<div align="center">
        아이디 <input type="text" name="mb_ID" placeholder="4글자 이상 영문 대소문자, 숫자만 입력하세요"><br>
        비밀번호 <input type="password" name="mb_PW" placeholder="4글자 이상 영문 대소문자, 숫자만 입력하세요"><br>
        비밀번호 확인 <input type="password" name="mb_CPW" placeholder="비밀번호를 다시 한 번 입력하세요"><br>
        이름 <input type="text" name="mb_Name" placeholder="이름을 입력하세요"><br>
        전화번호 <input type="text" name="mb_Tel" oninput="hypenTel(this)"><br>
        성별<input type="radio" name="mb_Gender" value="남자">남자&nbsp;&nbsp;
                <input type="radio" name="mb_Gender" value="여자">여자&nbsp;&nbsp;
                <input type="radio" name="mb_Gender" value="기타">기타&nbsp;&nbsp;
    </div>
    <div align="center">
        <input type="submit" value="회원가입">
        <input type="reset" onclick="alert('초기화 했습니다.')" value="다시 입력">
        </div>
    </form>
</body>
</html>