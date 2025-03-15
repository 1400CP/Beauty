<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	Member loginUser = (Member)session.getAttribute("loginUser");
	String alertMsg = (String)session.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

    /* * {
        border: 1px solid gray;
    } */

    .outer{
        width: 1300px;
        height: auto;
        margin: auto;
        margin-top: 50px;
    }

    .outer h2{
        color: palevioletred;
        font-size: 30px;
        font-weight: 900;
    }

    .outer th{
        color: palevioletred;
        font-size: 15px;
        font-weight: 700;
    }

    #reviewPost_table1{
        width: 1000px;
        height: 500px;
        min-width: 500px;
        min-height: 500px;
        margin: 0% auto;
    }

    #reviewPost_table1 input, #reviewPost_table1 textarea{
        width: 100%;
        height: 100%;
        box-sizing: border-box;
    }

    #reviewPost_textarea1{
        font-size: medium;
        font-weight: bold;
    }

    .review_upfile1{
        

    }


</style>
</head>
<body>

    <div class="outer">
        <h2 align="center">리뷰 작성</h2>
        <p align="center" style="color: lightgray;">
            ———————————————————————————————————————————————————————————————<br>
            ———————————————————————————————————————————————————————————————
        </p>
        <form action="" id="">
            <table id="reviewPost_table1" align="center">
                <tr>
                    <th width="75" height="50" align="left">제목</th>
                    <td width="350">
                        <input type="text">
                    </td>
                    <th width="75" >카테고리</th>
                    <td width="100">
                        <select class="reviewPost_category1">
                            <option>
                                옵션1
                            </option>
                            <option>
                                옵션2
                            </option>
                            <option>
                                옵션3
                            </option>
                            <option>
                                옵션4
                            </option>
                            <option>
                                옵션5
                            </option>
                    <!--
                                Category 테이블로부터 조회해올 것
                            for(Category c : list) { %>
                            <option value=" c.getCategoryNo() %>"> c.getCategoryName() %></option>
                            } %>
                    -->
                    </td>
                </tr>

                <tr>
                    <th align="left">내용</th>
                    <td colspan="3" style="height: 200px;">
                        <textarea id="reviewPost_textarea1" style="resize: none;"></textarea>
                        <!-- 높낮이를 고정시키기 위해서 style 부여 -->
                    </td>
                </tr>
                <tr>
                    <th style="height: 50px;" align="left">첨부파일</th>
                    <td colspan="3" align="center">
                        <input type="file" class="review_upfile1">
                    </td>
                </tr>
            </table>
        
            <br>

            <div align="center">
                <button>
                    <a href="<%= contextPath %>/review.li" style="text-decoration-line: none;">
                        목록
                    </a>
                </button>
            
                <button type="submit">
                    작성
                </button>

                <button type="reset" class="">
                    삭제
                </button>
            </div>
        </form>
    </div>	
    
</body>
</html>