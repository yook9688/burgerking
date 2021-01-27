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
.list_btn {border-radius: 8px; background:#000; color:#fff; border: 0;}
</style>
<script>	
	$(document).ready(function(){
		var form = $("form[name=readForm]");
		
		
		//수정
		$(".update_btn").on("click", function(){
			form.attr("action", "/board/updateView");
			form.attr("method", "post");
			form.submit();
		});
		
		//삭제
		$(".delete_btn").on("click", function(){
			
			var deleteYN = confirm("삭제하시겠습니가?");
			if(deleteYN == true){
			form.attr("action", "/board/delete");
			form.attr("method", "post");
			form.submit();
			}
		});
		
		// 목록
		$(".list_btn").on("click", function(){

		location.href = "/board/list?page=${scri.page}"
		+"&perPageNum=${scri.perPageNum}"
		+"&searchType=${scri.searchType}&keyword=${scri.keyword}";
		})
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
						<form name="readForm" role="form" method="post">
							<input type="hidden" id="bno" name="bno" value="${read.bno}" />
							<input type="hidden" id="page" name="page" value="${scri.page}"> 
							<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
							<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
							<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}">
						</form>
						<div class="notice_box">
							<div class="notice_tit_box">
								<h1>${read.title}</h1>
								<span class="notice_regdate">${read.regdate}</span>
								<span class="notice_hit" >조회수 | ${read.hit}</span>
							</div>
							<div class="notice_content">
								<p>${read.content}</p>
							</div>
						</div>			
						<div class="btn_box">
							<!-- <input type="submit" class="update_btn" value="수정"/>
							<input type="submit" class="delete_btn" value="삭제"/> --> <!-- 관리자페이지로 넘길것 -->
							<input type="submit" class="list_btn" value="목록"/>						
						</div>
					</div>
				</div>
			</div>
<jsp:include page="../sitemap.jsp"></jsp:include>
<jsp:include page="../footer.jsp"></jsp:include>