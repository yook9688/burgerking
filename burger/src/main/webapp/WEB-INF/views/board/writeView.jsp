
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
	$(document).ready(function(){
		var form = $("form[name=writeForm]");
		var title = $("input[name=title]");
		var content = $("textarea[name=content]");
		var writer = $("input[name=writer]");
		$(".write_btn").on("click", function(){
			if(title.val() == "" || title.val() == null ) {
				alert("제목을 입력하세요.");
				title.focus();
				return false
			}
			if(content.val() == "" || content.val() == null ) {
				alert("내용을 입력하세요.");
				content.focus();
				return false
			}
			if(writer.val() == "" || writer.val() == null ) {
				alert("작성자를 입력하세요.");
				writer.focus();
				return false
			}
			if(title != "" && content != "" && writer != "") {
				form.submit();
			}
		});
	});
</script>
<html>
	<head>
	 	<title>게시판</title>
	</head>
	<body>
	
		<div id="root">
			<header>
				<h1> 게시판</h1>
			</header>
			<hr />
			 
			<nav>
			  <a href="/board/list">홈</a>
			   | 
			  <a href="/board/writeView">글작성</a>
			   | 
		    <a href="/member/loginView">로그인</a>
			</nav>
			<hr />
			
			<section id="container">
				<form name="writeForm" role="form" method="post" action="/board/write">
					<table>
						<tbody>
							<c:if test="${member.userId != null}">
								<tr>
									<td>
										<label for="title">제목</label><input type="text" id="title" name="title" />
									</td>
								</tr>	
								<tr>
									<td>
										<label for="content">내용</label><textarea id="content" name="content" ></textarea>
									</td>
								</tr>
								<tr>
									<td>
										<label for="writer">작성자</label><input type="text" id="writer" name="writer" />
									</td>
								<tr>
									<td>						
										<button type="button" class="write_btn">작성</button>
									</td>
								</tr>
							</c:if>	
							<c:if test="${member.userId == null}">
								<h4>로그인 후 작성하실 수 있습니다.</h4>
							</c:if>		
						</tbody>			
					</table>
				</form>
			</section>
			<hr />
		</div>
	</body>
</html>