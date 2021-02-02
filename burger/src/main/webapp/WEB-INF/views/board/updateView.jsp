<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../header.jsp"></jsp:include>
<style>
#content {clear: both; width: 100%; height: 100%; }
.con_wrap {width: 100%; height: 100%; padding: 50px 0 45px 0;}
.content_box {max-width: 1144px; height: 100%; margin: 0 auto; padding: 0 20px;}
.notice_box {width: 100%; height: 100%; border-bottom: 3px solid #000; padding-right:40px;}
.notice_tit_box {width: 100%; border-top: 3px solid #000; border-bottom: 3px solid #ccc; padding: 20px; background: #fafafa; }
.notice_tit_box h1 { font-size: 30px; margin: 0; margin-bottom: 20px; }
.notice_tit_box span {font-size:20px; color:#888; }
.notice_hit {display:inline-block; float: right;}
.notice_content {width: 100%; font-size: 20px; line-height: 1.5; padding: 20px;}
.btn_box {width: 400px; height: 100px; margin: auto; text-align: center;}
.btn_box input { width: 300px; height: 50px; font-size: 25px; margin-top: 25px;}
.update_btn {border-radius: 8px; background:#000; color:#fff; border: 0;}
</style>
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
			$(".list_btn").on("click", function(){
				history.back();	
			});
		});
	
</script>
			<div id="content">
            	<div class="site_locate">
	                <div class="locate_box">
	                    <a href="../">Home</a>
	                    <span>고객센터</span>
	                    <a href="../board/list">공지사항</a>
	                </div>
	            </div>
	            <div class="con_wrap">
	                <div class="content_box">
						<form action="/board/update" name="updateForm" role="form" method="post" >
							<div class="notice_box">
								<div class="notice_tit_box">
									<input type="text" name="title" value="${update.title}" />
									<span class="notice_regdate">${update.regdate}</span>
									<span class="notice_hit" >조회수 | ${update.hit}</span>
								</div>
								<div class="notice_content">
									<textarea id="content" name="content" ><c:out value="${update.content}" /></textarea>
								</div>
							</div>			
							<div class="btn_box">
								<input type="submit" class="update_btn" value="수정"/>
								<input type="button" class="list_btn" value="이전으로"/>						
							</div>
						</form>
					</div>
				</div>
			</div>
<jsp:include page="../sitemap.jsp"></jsp:include>
<jsp:include page="../footer.jsp"></jsp:include>