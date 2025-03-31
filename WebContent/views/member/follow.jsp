<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="ko">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>팔로우 목록 (검색 + 무한 스크롤)</title>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <!-- jQuery 추가 -->
        <style>
            .follow-container {
                width: 1200px;
                margin: auto;
                display: flex;
                justify-content: space-between;
                /* 팔로우 목록과 팔로워 목록을 양옆에 배치 */
            }

            #searchfollow,
            #searchfollower {
                width: 100%;
                max-width: 600px;
                height: 50px;
                padding: 10px;
                margin-bottom: 35px;
                border: 1px solid #ddd;
                border-radius: 5px;
            }

            .follow-list {
                display: flex;
                flex-direction: column;
                gap: 10px;
            }

            .follow-item {
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 15px;
                border: 1px solid #ddd;
                border-radius: 10px;
                background-color: #f9f9f9;
                gap: 50px;
                width: 100%;
                max-width: 600px;
            }

            .follow-item img {
                width: 50px;
                height: 50px;
                margin-right: 20px;
            }

            .follow-item span {
                font-size: 16px;
                margin-right: 20px;
            }

            .follow-item button {
                background-color: #e8618c;
                color: white;
                width: 80px;
                height: 40px;
                border-radius: 7px;
                border: none;
                cursor: pointer;
                font-size: 13px;
                font-weight: 600;
                transition: background-color 0.3s;
            }

            img.default-image {
                width: 50px;
                height: 50px;
                object-fit: cover;
                /* 이미지 비율을 유지하면서 잘라서 보여줍니다 */
            }

            .follow-item button:hover {
                background-color: #c04e6f;
            }

            .loading {
                text-align: center;
                font-size: 18px;
                color: #888;
                display: none;
            }

            /* 팔로우 목록과 팔로워 목록을 가로로 배치 */
            .follow-list-container {
                width: 48%;
                /* 각각 48%로 크기 설정 */
                margin-top: 100px;
            }

            .follow-list-container h2 {
                margin-bottom: 20px;
                text-align: center;
                max-width: 600px;
            }

            img {
                width: 50px;
                height: 50px;
                object-fit: cover;
                /* 이미지 비율에 맞춰 크기 조정 */
            }


            /* 버튼 호버 시 효과 */
            .follow-btn:hover {
                opacity: 0.6;
                transition: opacity 0.2s;
            }
        </style>

    <body>
        <%@ include file="../common/header.jsp" %>
            <div class="follow-container">
                <!-- 팔로우 목록 -->
                <div class="follow-list-container">
                    <h2>팔로워</h2>
                    <input type="text" id="searchfollow" placeholder="닉네임 검색" oninput="searchfollow()">
                    <div id="followerList" class="follow-list"></div>
                    <div id="loading" class="loading">🔄 로딩 중...</div>
                </div>

                <!-- 팔로워 목록 -->
                <div class="follow-list-container">
                    <h2>팔로잉</h2>
                    <input type="text" id="searchfollower" placeholder="닉네임 검색" oninput="searchfollower()">
                    <div id="followList" class="follow-list"></div>
                    <div id="loading" class="loading">🔄 로딩 중...</div>
                </div>
            </div>
    </body>


    <script>
        function loadFollowList() {
            let followListDiv = document.getElementById("followList");
            let followerListDiv = document.getElementById("followerList");
            let loadingDiv = document.getElementById("loading");
            let userNo = <%= loginUser.getUserNo() %>;

            // 로딩 표시 활성화
            loadingDiv.style.display = "block";
            followListDiv.innerHTML = "";
            followerListDiv.innerHTML = "";

            $.ajax({
                url: "<%= contextPath %>/followselectlist.me",
                type: "GET",
                data: { userNo: <%= loginUser.getUserNo() %> },
                success: function (result) {
                    console.log(result);
                    // 로딩 표시 숨기기
                    loadingDiv.style.display = "none";

                    if (result.length === 0) {
                        followListDiv.innerHTML = "<p>팔로우 목록이 없습니다.</p>";
                        followerListDiv.innerHTML = "<p>팔로워 목록이 없습니다.</p>";
                        return;
                    }

                    let htmlContentFollow = "";
                    let htmlContentFollower = "";

                    // 팔로우 목록 처리
                    let followingUserNos = result.followList.map(follow => follow.userNo); // 팔로잉 중인 유저들
                    for (let i = 0; i < result.followList.length; i++) {
                        let followBtnText = "✔ 팔로잉";
                        let followBtnClass = "following";

                        htmlContentFollow += `
                    <div class="follow-item" style="margin-bottom: 20px; display: flex; align-items: center; gap: 20px;">
                        <table style="border-collapse: collapse; width: 100%;">
                            <tr>
                                <td style="width: 30px; text-align: center; padding: 0;">
                                    \${result.followList[i].userNo}
                                </td>
                                <td style="width: 30px; text-align: center; padding: 0;">
                                    <img src="<%= contextPath %>/\${result.followList[i].userName ? result.followList[i].userName : '/resources/images/account_circle_500dp_000000.png'}" alt="프로필 이미지" style="width: 50px; height: 50px; margin-left: 35px;">
                                </td>
                                <td style="width: 130px; text-align: center; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
                                    \${result.followList[i].userId}
                                </td>
                                <td style="width: 100px; text-align: center;">
                                    <button class="follow-btn \${followBtnClass}" data-userno="\${result.followList[i].userNo}" style="background-color: #e8618c; color: white; width: 80px; height: 40px; border-radius: 7px; border: none; cursor: pointer; font-size: 13px; font-weight: 600;">
                                        \${followBtnText}
                                    </button>
                                </td>
                            </tr>
                        </table>
                    </div>
                `;
                    }

                    // 팔로워 목록 처리 (팔로잉 상태인 유저의 버튼만 숨기기)
                    for (let i = 0; i < result.followerList.length; i++) {
                        let followBtnText = "+ 팔로우";
                        let followBtnClass = "follow";

                        // 팔로잉 상태인 유저는 버튼을 숨깁니다.
                        let isFollowing = followingUserNos.includes(result.followerList[i].userNo);

                        htmlContentFollower += `
                    <div class="follow-item" style="margin-bottom: 20px; display: flex; align-items: center; gap: 20px;">
                        <table style="border-collapse: collapse; width: 100%;">
                            <tr>
                                <td style="width: 30px; text-align: center; padding: 0;">
                                    \${result.followerList[i].userNo}
                                </td>
                                <td style="width: 30px; text-align: center; padding: 0;">
                                    <img src="<%= contextPath %>/\${result.followerList[i].userName ? result.followerList[i].userName : '/resources/images/account_circle_500dp_000000.png'}" alt="프로필 이미지" style="width: 50px; height: 50px; margin-left: 35px;">
                                </td>
                                <td style="width: 130px; text-align: center; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
                                    \${result.followerList[i].userId}
                                </td>
                                <td style="width: 100px; text-align: center;">
                                    <!-- 팔로잉 상태인 유저는 버튼을 숨깁니다. -->
                                    <button class="follow-btn \${followBtnClass}" data-userno="\${result.followerList[i].userNo}" style="background-color: \${isFollowing ? 'transparent' : '#e8618c'}; color: \${isFollowing ? 'transparent' : 'white'}; width: 80px; height: 40px; border-radius: 7px; border: none; cursor: \${isFollowing ? 'default' : 'pointer'}; font-size: 13px; font-weight: 600; display: \${isFollowing ? 'none' : 'inline-block'};">
                                        \${followBtnText}
                                    </button>
                                </td>
                            </tr>
                        </table>
                    </div>
                `;
                    }

                    // 팔로우 목록을 div에 추가
                    followListDiv.innerHTML = htmlContentFollow;

                    // 팔로워 목록을 div에 추가
                    followerListDiv.innerHTML = htmlContentFollower;

                    // 팔로우 버튼 클릭 이벤트 추가
                    const followBtns = document.querySelectorAll('.follow-btn');
                    followBtns.forEach(btn => {
                        btn.addEventListener('click', function () {
                            const targetUserNo = this.dataset.userno;
                            const isFollowing = this.classList.contains('following');
                            const actionUrl = isFollowing
                                ? '<%= request.getContextPath() %>/unfollow.pe'
                                : '<%= request.getContextPath() %>/follow.pe';

                            fetch(actionUrl, {
                                method: 'POST',
                                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                                body: 'loginUserNo=' + <%= loginUser.getUserNo() %> + '&targetUserNo=' + targetUserNo
                            })
                                .then(response => response.text())
                                .then(result => {
                                    if (result.trim() === 'success') {
                                        if (isFollowing) {
                                            // 언팔로우 성공 시 UI 업데이트
                                            this.classList.remove('following');
                                            this.classList.add('follow');
                                            this.textContent = "+ 팔로우";
                                        } else {
                                            // 팔로우 성공 시 UI 업데이트
                                            this.classList.remove('follow');
                                            this.classList.add('following');
                                            this.textContent = "✔ 팔로잉";
                                        }
                                        loadFollowList(); // 목록 새로고침
                                    } else {
                                        alert(isFollowing ? '언팔로우 실패' : '팔로우 실패');
                                    }
                                })
                                .catch(error => console.error('오류 발생:', error));
                        });
                    });
                }
            });
        }

        window.onload = function () {
            loadFollowList();  // 페이지 로드 시 팔로우 목록을 불러옵니다.
        };






    </script>


    </body>

    </html>