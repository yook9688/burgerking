<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
		$(document).ready(function(){
			var form = $("form[name=updateForm]");
			var title = $("input[name=title]");
			var content = $("textarea[name=content]");
			$(".update_btn").on("click", function(){
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
				if(title != "" && content != "") {
					form.submit();
				}
			});
			$(".cancel_btn").on("click", function(){
				event.preventDefault();
				location.href = "/board/readView?bno=${update.bno}"
					   + "&page=${scri.page}"
					   + "&perPageNum=${scri.perPageNum}"
					   + "&searchType=${scri.searchType}"
					   + "&keyword=${scri.keyword}";
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
			   - 
			  <a href="/board/writeView">글작성</a>
			</nav>
			<hr />
			
			<section id="container">
				<form name="updateForm" role="form" method="post" action="/board/update">
					<input type="hidden" name="bno" value="${update.bno}" readonly="readonly"/>
					<table>
						<tbody>
							<tr>
								<td>
									<label for="title">제목</label><input type="text" id="title" name="title" value="${update.title}"/>
								</td>
							</tr>	
							<tr>
								<td>
									<label for="content">내용</label><textarea id="content" name="content"><c:out value="${update.content}" /></textarea>
								</td>
							</tr>
							<tr>
								<td>
									<label for="writer">작성자</label><input type="text" id="writer" name="writer" value="${update.writer}" readonly="readonly"/>
								</td>
							</tr>
							<tr>
								<td>
									<label for="regdate">작성날짜</label>
									<fmt:formatDate value="${update.regdate}" pattern="yyyy-MM-dd"/>					
								</td>
							</tr>		
						</tbody>			
					</table>
					<div>
						<input type="button" class="update_btn" value="저장" />
						<input type="button" class="cancel_btn" value="취소" />
					</div>
				</form>
			</section>
			<hr />
		</div>
	</body>
</html>