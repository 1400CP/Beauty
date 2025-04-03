<%@page import="com.kh.product.model.vo.Product" %>
    <%@page import="java.util.ArrayList" %>
        <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
            <!DOCTYPE html>
            <html lang="ko">

            <% ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
                    %>
                    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

                    <head>
                        <meta charset="UTF-8">
                        <title>Beauty Talks</title>
                        <style>
                            body {
                                font-family: Arial, sans-serif;
                                margin: 0;
                                padding: 20px;
                                font-size: 14px;
                            }

                            .filter-container {
                                border: 1px solid #e0e0e0;
                                width: 1200px;
                                margin: 0 auto;
                            }

                            .title {
                                width: 1200px;
                                margin: 0 auto;
                                margin-bottom: 30px;
                                margin-top: 30px;
                            }

                            .product {
                                width: 1200px;
                                margin: 0 auto;
                                margin-bottom: 30px;
                                margin-top: 30px;
                            }

                            .product {
                                height: auto;
                            }

                            .filter-header {
                                display: flex;
                                justify-content: space-between;
                                align-items: center;
                                background-color: #fff;
                                padding: 10px;
                                border-bottom: 1px solid #e0e0e0;
                            }

                            .header-left {
                                display: flex;
                                align-items: center;
                                gap: 10px;
                            }

                            .brand-title {
                                font-weight: bold;
                                color: #FF69B4;
                            }

                            .brand-count {
                                color: #888;
                            }

                            .header-right select {
                                border: 1px solid #e0e0e0;
                                padding: 5px;
                            }

                            .filter-body {
                                display: grid;
                                grid-template-columns: repeat(3, 1fr);
                                gap: 10px;
                                padding: 15px;
                            }

                            .brand-checkbox {
                                display: flex;
                                align-items: center;
                                gap: 5px;
                            }

                            .brand-checkbox input[type="checkbox"] {
                                accent-color: #FF69B4;
                            }

                            .filter-footer {
                                display: flex;
                                justify-content: center;
                                padding: 10px;
                                border-top: 1px solid #e0e0e0;
                                background-color: #f8f8f8;
                            }

                            .footer-text {
                                color: #888;
                                font-size: 13px;
                            }

                            .product tr>td {
                                padding: 20px;
                                margin: 0 auto;
                                text-align: center;
                            }

                            .material-icons {
                                font-size: 24px;
                                color: #FF69B4;
                                /* 기본 색을 검은색으로 설정해두었을 경우, 색상이 오버라이드되도록 */
                            }

                            .filled {
                                color: #FF69B4 !important;
                                /* 채워진 별 색상 (핑크) */
                            }

                            .empty {
                                color: #ddd !important;
                                /* 비어있는 별 색상 (회색) */
                            }

                            .half {
                                color: #FF69B4 !important;
                                /* 반쪽짜리 별 색상 (핑크) */
                            }

                            .material-icons.star_outline {
                                color: #ddd !important;
                                /* 빈 별은 회색 */
                            }

                            .material-icons.grade,
                            .material-icons.star_half {
                                color: #FF69B4 !important;
                                /* 채워진 별과 반쪽짜리 별 색상 */
                            }

                            .star_outline {
                                color: #ddd !important;
                                /* 회색 */
                            }

                            .star_half {
                                color: #FF69B4 !important;
                                /* 반쪽 별 핑크 */
                            }

                            .star_filled {
                                color: #FF69B4 !important;
                                /* 채워진 별 핑크 */
                            }
                        </style>
                    </head>
                    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

                    <body>
                        <%@ include file="../common/headerNav.jsp" %>

                            <div class="title">
                                <h1 style="margin: 0 auto;">메이크업</h1>
                            </div>

                            <div class="filter-container">
                                <div class="filter-header">
                                    <div class="header-left">
                                        <span class="brand-title">브랜드</span>
                                        <span class="brand-count">Total 32</span>
                                    </div>
                                    <div class="header-right">
                                        <select>
                                            <option>전체</option>
                                            <option>가나다순</option>
                                            <option>인기순</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="filter-body">
                                    <div class="brand-checkbox">
                                        <input type="checkbox" id="brand5">
                                        <label for="brand5">클리오</label>
                                    </div>
                                </div>
                                <div class="filter-footer">
                                    <span class="footer-text" style="color: #FF69B4;">메이크업 카테고리 내 <%= list.size() %>개의 사용이 가능합니다.</span>
                                </div>
                            </div>

                            <table class="product">
                                <% for(Product p : list) { %>
                                    <tr>
                                        <!-- 상품 코드 -->
                                        <td
                                            style="border-bottom: 1px solid #e0e0e0; border-top: 1px solid #e0e0e0; height: 200px;">
                                            <%= p.getPcode() %>
                                        </td>

                                        <!-- 상품 이미지 -->
                                        <td
                                            style="border-bottom: 1px solid #e0e0e0; border-left: 1px solid #e0e0e0; border-top: 1px solid #e0e0e0;">
                                            <img src="<%= request.getContextPath() + p.getImagePath() %>" alt="상품 이미지"
                                                height="190">
                                        </td>

                                        <!-- 상품 이름 -->
                                        <td
                                            style="border-bottom: 1px solid #e0e0e0; border-left: 1px solid #e0e0e0; border-top: 1px solid #e0e0e0; font-size: 20px; width: 300px;">
                                            <%= p.getpName() %>
                                        </td>

                                        <!-- 브랜드 이름 -->
                                        <td
                                            style="border-bottom: 1px solid #e0e0e0; border-left: 1px solid #e0e0e0; border-top: 1px solid #e0e0e0; font-size: 20px;">
                                            <%= p.getbName() %>
                                        </td>

                                        <!-- 좋아요 수 -->
                                        <td
                                            style="border-bottom: 1px solid #e0e0e0; border-left: 1px solid #e0e0e0; border-top: 1px solid #e0e0e0; font-size: 20px;">
                                            <%= p.getLikeProduct() %>
                                                <span  class="material-icons" style="vertical-align: -4px;">favorite_border</span>
                                        </td>

                                        <!-- 평점 -->
                                        <td
                                            style="border-bottom: 1px solid #e0e0e0; border-left: 1px solid #e0e0e0; border-top: 1px solid #e0e0e0; font-size: 20px;">
                                            <%= p.getRate() %> <!-- 평점 값 -->
                                                <div class="stars" data-rate="<%= p.getRate() %>">
                                                    <!-- 평점에 따른 별 표시 -->
                                                    <span class="material-icons" style="color: #FF69B4;"
                                                        id="star1_<%= p.getPcode() %>">
                                                        <%= p.getRate()>= 1 ? "grade" : (p.getRate() >= 0.5 ?
                                                            "star_half" : "star_outline") %>
                                                    </span>
                                                    <span class="material-icons" style="color: #FF69B4;"
                                                        id="star2_<%= p.getPcode() %>">
                                                        <%= p.getRate()>= 2 ? "grade" : (p.getRate() >= 1.5 ?
                                                            "star_half" : "star_outline") %>
                                                    </span>
                                                    <span class="material-icons" style="color: #FF69B4;"
                                                        id="star3_<%= p.getPcode() %>">
                                                        <%= p.getRate()>= 3 ? "grade" : (p.getRate() >= 2.5 ?
                                                            "star_half" : "star_outline") %>
                                                    </span>
                                                    <span class="material-icons" style="color: #FF69B4;"
                                                        id="star4_<%= p.getPcode() %>">
                                                        <%= p.getRate()>= 4 ? "grade" : (p.getRate() >= 3.5 ?
                                                            "star_half" : "star_outline") %>
                                                    </span>
                                                    <span class="material-icons" style="color: #FF69B4;"
                                                        id="star5_<%= p.getPcode() %>">
                                                        <%= p.getRate()>= 5 ? "grade" : (p.getRate() >= 4.5 ?
                                                            "star_half" : "star_outline") %>
                                                    </span>
                                                </div>
                                        </td>
                                    </tr>
                                    <% } %>
                            </table>

                            <script>
                                $(document).ready(function () {
                                    $(".brand-checkbox input[type='checkbox']").change(function () {
                                        let selectedBrands = $(".brand-checkbox input[type='checkbox']:checked")
                                            .map(function () {
                                                return $(this).next("label").text(); // 선택된 브랜드의 텍스트를 가져옴
                                            })
                                            .get();  // 배열로 반환

                                        console.log("선택된 브랜드:", selectedBrands);

                                        // 브랜드 선택이 없으면 스킨케어 서블릿 호출
                                        if (selectedBrands.length === 0) {
                                            window.location.href = '/beautyTalk/makeuplist.pr';  // 전체 스킨케어 조회 서블릿 호출
                                            return; // 더 이상 진행하지 않음
                                        }

                                        // 서버에 브랜드 목록을 보내기
                                        fetchFilteredProducts(selectedBrands);
                                    });

                                    function fetchFilteredProducts(selectedBrands) {
                                        console.log("AJAX 요청 전", selectedBrands);

                                        $.ajax({
                                            url: "selectbrand.pr",  // 서버의 URL
                                            method: "GET",
                                            data: { brands: selectedBrands.join(',') },  // 배열을 쉼표로 구분된 문자열로 전송
                                            success: function (data) {
                                                console.log("서버 응답:", data);

                                                // 응답이 배열인지 확인
                                                if (Array.isArray(data)) {
                                                    updateProductTable(data);  // 상품 테이블 업데이트
                                                } else {
                                                    console.error("응답 데이터가 배열이 아닙니다.", data);
                                                }
                                            },
                                            error: function (xhr, status, error) {
                                                console.error("AJAX 요청 오류:", error);
                                            }
                                        });
                                    }

                                    function updateProductTable(products) {
                                        if (!Array.isArray(products)) {
                                            console.error("products는 배열이어야 합니다.");
                                            return;  // 배열이 아니면 종료
                                        }

                                        // 테이블 내용 변수 초기화
                                        let tableContent = '';

                                        if (products.length === 0) {
                                            $(".footer-text").text("스킨케어 카테고리 내 0개의 사용이 가능합니다.");  // 결과가 없을 경우 텍스트 업데이트
                                            return;  // 비어 있는 배열일 경우 "조회된 상품이 없습니다." 메시지 출력
                                        }
                                        $(".footer-text").text("스킨케어 카테고리 내 " + products.length + "개의 사용이 가능합니다.");
                                        var contextPath = "<%= request.getContextPath() %>";

                                        products.forEach(p => {
                                            // contextPath와 imagePath 결합
                                            let imagePath = contextPath + p.imagePath;
                                            console.log(imagePath);
                                            console.log(p);

                                            tableContent +=
                                                "<tr>" +
                                                "<td style='border-bottom: 1px solid #e0e0e0; border-top: 1px solid #e0e0e0; height: 200px;'>" +
                                                p.pcode +
                                                "</td>" +
                                                "<td style='border-bottom: 1px solid #e0e0e0; border-left: 1px solid #e0e0e0; border-top: 1px solid #e0e0e0;'>" +
                                                "<img src='" + imagePath + "' alt='상품 이미지' height='190'>" +
                                                "</td>" +
                                                "<td style='border-bottom: 1px solid #e0e0e0; border-left: 1px solid #e0e0e0; border-top: 1px solid #e0e0e0; font-size: 20px; width: 300px;'>" +
                                                p.pName +
                                                "</td>" +
                                                "<td style='border-bottom: 1px solid #e0e0e0; border-left: 1px solid #e0e0e0; border-top: 1px solid #e0e0e0; font-size: 20px;'>" +
                                                p.bName +
                                                "</td>" +
                                                "<td style='border-bottom: 1px solid #e0e0e0; border-left: 1px solid #e0e0e0; border-top: 1px solid #e0e0e0; font-size: 20px;'>" +
                                                p.likeProduct + " <span class='material-icons' style='vertical-align: -4px;';>favorite_border</span>" +
                                                "</td>" +
                                                "<td style='border-bottom: 1px solid #e0e0e0; border-left: 1px solid #e0e0e0; border-top: 1px solid #e0e0e0; font-size: 20px;'>" +
                                                p.rate +
                                                "<div class='stars' data-rate='" + p.rate + "'>" +
                                                "<span class='material-icons' style='color: #FF69B4;'>" +
                                                (p.rate >= 1 ? "grade" : (p.rate >= 0.5 ? "star_half" : "star_outline")) +
                                                "</span>" +
                                                "<span class='material-icons' style='color: #FF69B4;'>" +
                                                (p.rate >= 2 ? "grade" : (p.rate >= 1.5 ? "star_half" : "star_outline")) +
                                                "</span>" +
                                                "<span class='material-icons' style='color: #FF69B4;'>" +
                                                (p.rate >= 3 ? "grade" : (p.rate >= 2.5 ? "star_half" : "star_outline")) +
                                                "</span>" +
                                                "<span class='material-icons' style='color: #FF69B4;'>" +
                                                (p.rate >= 4 ? "grade" : (p.rate >= 3.5 ? "star_half" : "star_outline")) +
                                                "</span>" +
                                                "<span class='material-icons' style='color: #FF69B4;'>" +
                                                (p.rate >= 5 ? "grade" : (p.rate >= 4.5 ? "star_half" : "star_outline")) +
                                                "</span>" +
                                                "</div>" +
                                                "</td>" +
                                                "</tr>";
                                        });

                                        // 테이블 내용 업데이트
                                        $(".product").html(tableContent);
                                        console.log(tableContent);
                                    }
                                });

                            </script>
                    </body>

            </html>