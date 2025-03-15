<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String Token = (String) session.getAttribute("naverId");
String userName = (String) session.getAttribute("name");
String email = (String) session.getAttribute("email");
String gender = (String) session.getAttribute("gender");
String birthday = (String) session.getAttribute("birthday");
String birthyear = (String) session.getAttribute("birthyear");
String phone = (String) session.getAttribute("mobile");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
    .outer {
        width: 100%;
        height: 100%;
        margin: auto;
        background-color: #fff;
        border-radius: 10px;
        display: block;
    }

    h2 {
        margin: auto;
    }

    input[type="text"], input[type="password"] {
        width: 100%;
        padding: 12px;
        margin: 0;
        border: 1px solid #ddd;
        border-radius: 7px;
        font-size: 13px;
        box-sizing: border-box;
    }

    .btn {
        width: 100%;
        padding: 12px;
        margin: 8px 0;
        border: none;
        border-radius: 30px;
        font-size: 16px;
        cursor: pointer;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .btn-login {
        background-color: #000;
        color: white;
    }

    .btn-kakao-insert {
        background-color: #FEE500;
        color: black;
    }

    .btn-insta-insert {
        background-color: #e8618c;
        color: white;
        width: 500px;
        height: 40px;
        border-radius: 7px;
        margin-top: 40px;
    }

    .btn img {
        width: 18px;
        height: 18px;
        margin-right: 10px;
    }

    .error-message {
        color: red;
        font-size: 12px;
        display: none;
    }
    


    .member{
        height: 2000px;
        width: 500px;
        margin: auto;
        margin-top: 50px;
    }


    #mainTitle{
        margin-bottom: 5px;
        color: #e8618c;
        font-weight: 800;
        font-size: 250%;
    }
    pre{
        text-decoration: underline;
        color: #e8618c;
        text-decoration-thickness: 3px;
    }

    #insert-form :nth-child(4){
        margin-top: 20px;
    }

    #insert-form :nth-child(7){
        margin-top: 20px;
    }

    #agree1{
        margin-top: 10px;
    }

    #agree2{
        border: 1px solid #c6c6c6;
        border-radius: 7px;
    }

    #agree3{
        padding: 9px 5px 9px 5px;
        position: relative;
    }
    div{
        display: block;
    }

    #agreeAll{
    appearance: none;
    width: 18px;
    height: 18px;
    border: 2px solid #333;
    border-radius: 50%; /* 동그랗게 만듦 */
    display: inline-block;
    position: relative;
    }

    #agreeAll:checked{
        background-color: #e8618c
    }

    .hidden {
        display: none;
    }
    #toggleTerms{
    background-color: #e8618c; /* 초록색 버튼 */
    color: white;
    border: none;
    margin-left: 220px;
    font-size: 16px;
    font-weight: bold;
    cursor: pointer;
    border-radius: 8px;
    box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
    transition: all 0.3s ease-in-out;
    }

    #gender{
        width: 100%;
        height: 20px;
        margin-top: 10px;
    }
    
    
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

</head>
<body>

	<%@ include file="../common/header.jsp" %>
	
		<br><br><br><br><br>
		

        <div class="outer">
            <div class="member">

            <h1 align="left" id="mainTitle">Beauty Talk</h1>      
            <div id="line">
                <pre align="left">                                                                              </pre>
            </div>


            
            
            <form action="<%= contextPath %>/insert.me" id="insert-form" method="post">
            		<input type="hidden" name="Token" value="<%= Token %>">
            		<input type="text" name="userId" id="userId" minlength="6" maxlength="15" placeholder="아이디를 입력하세요. (6자 이상 15자 이내)" required>
                

                <input type="password" name="userPwd" id="userPwd" minlength="8" maxlength="16" placeholder="비밀번호를 입력하세요. (8~16자, 영문+숫자+특수문자)" required>
            <% if(Token == null){ %>

                <input type="text" name="userName" id="userName" maxlength="16" placeholder="이름을 입력하세요." required >


                <input type="text" name="email" id="email" minlength="8" maxlength="20" placeholder="이메일을 입력하세요." required>


                <input type="text" name="nickName" id="nickName" minlength="2" maxlength="10" placeholder="닉네임을 입력하세요" required>


                <input type="text" name="birthDate" id="birthDate" minlength="8" maxlength="8" placeholder="생년월일 ex) 19990812" required>


                <input type="text" name="phone" id="phone" minlength="8" maxlength="11" placeholder="휴대전화번호 ex) 01011112222" required>
            <% } else {%>
            		
                
        

                <input type="text" name="userName" id="userName" maxlength="16" placeholder="이름을 입력하세요." required value="<%= userName %>">


                <input type="text" name="email" id="email" minlength="8" maxlength="20" placeholder="이메일을 입력하세요." required value="<%= email %>">


                <input type="text" name="nickName" id="nickName" minlength="2" maxlength="10" placeholder="닉네임을 입력하세요" required>


                <input type="text" name="birthDate" id="birthDate" minlength="8" maxlength="8" placeholder="생년월일 ex) 19990812" required value="<%= birthyear + birthday %>">


                <input type="text" name="phone" id="phone" minlength="8" maxlength="11" placeholder="휴대전화번호 ex) 01011112222" required value="<%= phone %>">
						<% } %>
                <div id="gender">
                    
                        <input type="checkbox" name="gender" value="M"> 남자

                        <input type="checkbox" name="gender" value="F"> 여자

                </div>
                

                <div id="agree1">
                    <div id="agree2">
                        <div id="agree3">
                            <div>
                                <!-- 전체 동의 체크박스 -->
                                <input type="checkbox" id="agreeAll" name="agree" style="vertical-align: bottom" value="Y" required>
                                <label for="agreeAll">
                                    <b style="color: #e8618c; vertical-align: 4px">[필수]</b>
                                    <span style="font-weight: 800; vertical-align: 3px">이용 약관 전체동의</span>
                                </label>
                                
                                <!-- 펼치기 버튼 -->
                                <button type="button" id="toggleTerms">∨</button>
                
                                <!-- 약관 세부 내용 -->
                                <div id="termsContainer" class="hidden">
                                    <label><input type="checkbox" class="term-checkbox required"> [필수] 서비스 이용약관 동의</label><br>
                                    <label><input type="checkbox" class="term-checkbox required"> [필수] 개인정보 처리방침 동의</label><br>
                                    <label><input type="checkbox" class="term-checkbox"> [선택] 마케팅 정보 수신 동의</label><br>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <button type="submit" class="btn-insta-insert" style="font-size: large; font-weight: 600;">회원가입</button>
            
						
					</form>
        </div>
    </div>




    <script>
        $(document).ready(function () {
            // 약관 펼치기/숨기기
            $("#toggleTerms").click(function () {
            $("#termsContainer").toggleClass("hidden");
            });

            // 전체 동의 체크 시 모든 체크박스 체크
            $("#agreeAll").change(function () {
            $(".term-checkbox").prop("checked", $(this).prop("checked"));
            checkRequired();
            });

            // 개별 체크박스 상태 변경 시 전체 동의 체크박스 상태 업데이트
            $(".term-checkbox").change(function () {
            $("#agreeAll").prop(
                "checked",
                $(".term-checkbox").length === $(".term-checkbox:checked").length
            );
            checkRequired();
            });

            // 필수 항목 체크 여부 확인 후 가입 버튼 활성화
            function checkRequired() {
            const allRequiredChecked =
                $(".required").length === $(".required:checked").length;
            $("#submitButton").prop("disabled", !allRequiredChecked);
            }
        });

    </script>

<script>
    $(document).ready(function() {
        // 체크박스 하나만 선택 가능하도록 설정
        $('input[name="gender"]').on('change', function() {
            $('input[name="gender"]').not(this).prop('checked', false);
        });
    
        // 폼 제출 시 필수 체크 검증
        $('#signupForm').on('submit', function(event) {
            if (!$('input[name="gender"]:checked').length) {
                alert("성별을 선택해주세요.");
                event.preventDefault(); // 폼 제출 방지
            }
        });
    });
    </script>
    
    <script>
    // URL에서 이메일과 닉네임을 가져와서 자동 입력
    $(document).ready(function() {
        const urlParams = new URLSearchParams(window.location.search);
        const email = urlParams.get('email'); // 이메일 가져오기
        const nickname = urlParams.get('nickname'); // 닉네임 가져오기

        if (email) {
            $("#email").val(email).attr("readonly", true); // 이메일 입력란에 자동 입력
            
        }
        if (nickname) {
            $("#userName").val(nickname); // 닉네임 입력란에 자동 입력
        }
    });
	</script>

</body>
</html>
