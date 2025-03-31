<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
<!-- best post -->
    #form_bestPost{
        width: 1100px;
        height: 100%;
    }

    #table_bestPost{
        /* background-color: black; */
        width: 1100px;
        height: 330px;
        margin: auto;
        margin-top: 50px;
        box-sizing: border-box;
    }

    #table_bestPost td{
        border: 1px solid white;
        color:black;
    }

    .bestpost1_bestPost, .bestpost2_bestPost, .bestpost3_bestPost{
        cursor: pointer;
    }


</style>
</head>
<body>
<!-- best post -->
    <div>
        <form id="form_bestPost">
            <table id="table_bestPost">
                <tr>
                    <td colspan="7" Style="color: black;" align="center"><h1>Best Post</h1></td>






                </tr>
                <tr>
                    <td colspan="7" Style="color: gray;" align="center">뷰티 고수들의 찐 노하우 공개!</td>






                </tr>
                <tr>
                    <td style="width: 80px;"></td>
                    <td class="bestpost1_bestPost" onclick="location.href='http://yahoo.co.jp'" style="width: 300px; height: 200px;">
                        <img src="<%= contextPath %>/images/bestpost1.png">
                    </td>
                    <td style="width: 20px;"></td>
                    <td class="bestpost2_bestPost" onclick="location.href='http://www.naver.com'" style="width: 300px; height: 200px;">
                        <img src="<%= contextPath %>/images/bestpost2.png">
                    </td>
                    <td style="width: 20px;"></td>
                    <td class="bestpost3_bestPost" onclick="location.href='http://www.daum.net'" style="width: 300px; height: 200px;">
                        <img src="<%= contextPath %>/images/bestpost3.png">
                    </td>
                    <td style="width: 80px;"></td>
                </tr>
                <tr>
                    <td></td>
                    <td style="padding: 10px;">Minsco 민스코</td>
                    <td></td>
                    <td style="padding: 10px;">안다 ANDA</td>
                    <td></td>
                    <td style="padding: 10px;">Jessica Vu</td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td style="padding: 10px;">8천원대❓두겹광택❓ NEW 롬앤 더 쥬시 래스팅 틴트 23컬러 리뷰 (리뉴얼 포인트, 신컬러 5가지)</td>
                    <td></td>
                    <td style="padding: 10px;">인스타 셀럽st 쿨톤 핑크 메이크업🎀🖤 | 데일리 쿨톤템 한가득 추천🛒</td>
                    <td></td>
                    <td style="padding: 10px;">Chic Soft Glam Makeup 🦢 #grwm</td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td style="padding: 10px;">
                        날짜, 좋아요 수
                    </td>
                    <td></td>
                    <td style="padding: 10px;">
                        날짜, 좋아요 수
                    </td>
                    <td></td>
                    <td style="padding: 10px;">
                        날짜, 좋아요 수
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="7" align="center">
                        <button type="button" onclick="location.href='http://www.naver.com/'">더보기</button>
                    </td>






                </tr>

            </table>

        </form>
    </div>
    
</body>
</html>