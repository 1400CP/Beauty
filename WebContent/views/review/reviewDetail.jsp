<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	    <div class="outer">
        <br>
        <h2 align="center">일반게시판 상세보기</h2>
        <br>

        <table id="detail-area" border="1" align="center">
            <tr>
                <th width="70">카테고리</th>
                <td width="70"><%= b.getCategory() %></td>
                <th width="70">제목</th>
                <td width="350"><%= b.getBoardTitle() %></td>
            </tr>
            <tr>
                <th>작성자</th>
                <td><%= b.getBoardWriter() %></td>
                <th>작성일</th>
                <td><%= b.getCreateDate() %></td>
            </tr>
            <tr>
                <th>내용</th>
                <td colspan="3">
                    <p style="height: 200px;"><%= b.getBoardContent() %></p> <!-- 높낮이를 고정시키기 위해서 style 부여 -->
                </td>
            </tr>
            <tr>
                <th>첨부파일</th>
                <td colspan="3">
                	<% if(at == null) { %>
                    <!-- case1. 첨부파일이 없을 경우 -->
                        첨부파일이 없습니다
					<% }else { %>
                    <!-- case2. 첨부파일이 있는 경우 -->
                        <a download="<%= at.getOriginName() %>" href="<%= contextPath %>/<%= at.getFilePath() + at.getChangeName() %>"><%= at.getOriginName() %></a> <!-- 사용자가 다운로드 시 놀래지 않게 하기 위함 -->
                	<% } %>
                </td>
            </tr>
        </table>
        <br>

        <div align="center">
            <a href="<%= contextPath %>/list.bo?cpage=1" class="btn btn-sm btn-secondary">목록가기</a>
            
            <% if(loginUser != null && loginUser.getUserId().equals(b.getBoardWriter())) { %>
            <!-- 로그인한 사용자가 게시글의 작성자일 경우 -->
	            <a href="<%= contextPath %>/updateForm.bo?bno=<%= b.getBoardNo() %>" class="btn btn-sm btn-warning">수정하기</a>
	            <button onclick=test() class="btn btn-sm btn-danger">삭제하기</button>
            <% } %>
        </div>
       
		<script>
		    function test() {
		        if (!confirm("확인(삭제) 또는 취소(삭제 안함).")) {
		            alert("삭제 안함.");
		        } else {
		            alert("삭제.");
		            location.href="<%= contextPath %>/delete.bo?bno=<%= b.getBoardNo() %>" 
		        }
		    }
		</script>
		
		<br><br>

		<div id="reply-area">
			<table border="1" align="center" style="color: white;">
                <thead>
                
                    <tr>
                        <th>댓글작성</th>
                        <% if(loginUser != null) { // 로그인이 되어 있을 경우 %>
                        <td>
                            <textarea id="replyContent" rows="3" cols="50" style="resize: none;"></textarea>
                        </td>
                        <td>
                            <button onclick="insertReply()">댓글등록</button>
                        </td>
                        <% }else { %>
                        <td>
                            <textarea rows="3" cols="50" style="resize: none;">로그인 후 이용가능한 서비스입니다.</textarea>
                        </td>
                        <td>
                            <button disabled>댓글등록</button>
                        </td>
                        <% } %>
                    </tr>
                    
                </thead>
                <tbody>
                   
                </tbody>

            </table>
            
            <script>
            	$(function(){
            		// 댓글조회
					selectReplyList();
            		
            		// setInterval(주기적으로 실행할함수이름, ms시간); 
            		setInterval(selectReplyList, 10000);
            	})
            	
            	
            	// ajax으로 댓글 작성용 함수
            	function insertReply(){
            		$.ajax({
            			url:"rinsert.bo",
            			data:{ // 모르겠으면 쿼리를 먼저 짜보라!
            				content:$("#replyContent").val(),
            				bno:<%= b.getBoardNo() %>
            			},
            			type:"post",
            			success:function(result){
            				if(result > 0){ // 댓글 작성 성공 == 갱신된 댓글 리스트 조회 + 댓글칸 초기화
            					selectReplyList();
            					$("#replyContent").val(""); // textarea 초기화
            				}
            			},
            			error:function(){
            				console.log("ajax 댓글 실패")
            			},
            			
            			
            		})
            		
            	}
            	
            	
            	
            	// ajax으로 해당 게시글에 딸린 댓글 목록 조회용 함수
            	function selectReplyList(){
            		$.ajax({
            			url:"rlist.bo",
            			data:{
            				bno:<%= b.getBoardNo() %>
            			},
            			success:function(list){
            				console.log(list);
            				
        					let value = "";
        					for(let i=0; i<list.length; i++){
        						value += "<tr>"
        									+"<td>" + list[i].replyWriter + "</td>"
        									+"<td>" + list[i].replyContent + "</td>"
        									+"<td>" + list[i].createDate + "</td>"
        								+"</tr>"
        					}
        					$("#reply-area tbody").html(value);
            				
            			},
            			error:function(){
            				console.log("ajax 댓글 실패")
            			},
            		})
            		
            	}
            
            </script>
		
		</div>
        
    </div>

</body>
</html>