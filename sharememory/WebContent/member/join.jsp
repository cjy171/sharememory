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
    var mb_Birth = document.getElementsByName("mb_Birth")

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


    //이름 확인 = 한글과 영어만 가능하도록
    if(mb_Name.value == ""){
        alert("이름을 입력하세요.")
        mb_Name.focus();
        return false;
    }
    
    else if(!checkKorEng(mb_Name.value)){
        alert("한글, 영어만 입력하세요.")
        mb_Name.focus();
        return false;
    }
    
     //관심분야 확인
    if(!checkedGender(mb_Gender)){
        alert("관심분야를 체크하세요.")
        mb_Gender.focus();
        return false;
    }

    //생일 확인
    if(mb_Birth.value == ""){
        alert("년도를 입력하세요.")
        mb_Birth.focus();
        return false;
    }

    else if(!(mb_Birth.value >=1900 && mb_Birth.value <= 2050)){
        alert("년도를 정확하게 입력해주세요.")
        mb_Birth.focus();
        return false;
    }


}

// 문자열이 영어, 숫자인지 확인하는 메서드 
function checkEngNumber(value){
    var count = 0;

    for(var i=0; i<value.length; i++){
        if((value.charCodeAt(i)>=65 && value.charCodeAt(i)<=90) || (value.charCodeAt(i)>=97 && value.charCodeAt(i)<=122) || (value.charCodeAt(i)>=48 && value.charCodeAt(i)<=57)){
            count += 1;
        }
    }

    //카운트 수와 문자의 길이가 같다면 true
    if(count === (value.length)){
        return true;
    } else{
        return false;
    }
}

//영어, 한글인지(가~힣) 확인
function checkKorEng(value){
    var count = 0;

    for(var i=0; i<value.length; i++){
        console.log(value.charCodeAt(i));
        if((value.charCodeAt(i)>=65 && value.charCodeAt(i)<=90) || (value.charCodeAt(i)>=97 && value.charCodeAt(i)<=122) || (value.charCodeAt(i)>=44032 && value.charCodeAt(i)<=55203)){
            count += 1;
        }
    }

    if(count === (value.length)){
        return true;
    } else{
        return false;
    }
}

//관심분야 체크 확인
function checkedGender(mb_Gender){
    for(var i=0; i<arr.length; i++){
        if(arr[i].checked == true){
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
        아이디 <input type="text" name="id" placeholder="4글자 이상 영문 대소문자, 숫자만 입력하세요"><br>
        비밀번호 <input type="text" name="pw" placeholder="4글자 이상 영문 대소문자, 숫자만 입력하세요"><br>
        비밀번호 확인 <input type="text" name="cpw" placeholder="비밀번호를 다시 한 번 입력하세요"><br>
        이름 <input type="text" name="name" placeholder="이름을 입력하세요"><br>
        전화번호 <input type="text" name="tel" placeholder="010"><br>
        성별<input type="checkbox" name="gender" value="computer">남성&nbsp;&nbsp;
                <input type="checkbox" name="gender" value="internet">여성&nbsp;&nbsp;
                <input type="checkbox" name="gender" value="travel">기타&nbsp;&nbsp;
    </div>
    <div align="center">
        <input type="submit" value="화원가입">
        <input type="reset" onclick="alert('초기화 했습니다.')" value="다시 입력">
        </div>
    </form>
</body>
</html>