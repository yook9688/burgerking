<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../header.jsp"></jsp:include>
<style>
#content {clear: both; width: 100%; height: 100%; }
.con_wrap {width: 100%; height: 100%; padding: 50px 0 45px 0;}
.content_box {max-width: 1144px; height: 100%; margin: 0 auto; padding: 0 20px;}
.subtit_wrap {max-width: 1144px; margin: 0 20px;}
.subtit_wrap p {display: inline-block; font-size: 40px; font-weight: bold; margin: 0 0 15px 0; }
.subtit_wrap ul {float: right; width: auto; margin-top: 10px;}
.subtit_wrap ul li {float: left; width: fit-content; margin: 0  15px;}
.subtit_wrap ul li a {font-size: 18px; color: #2e2e2e; }
.premenu_cate_box {font-size: 20px; text-align: center;}
.notice_table {width: 100%; border-top: 3px solid #000; border-bottom: 3px solid #000 ;}
.notice_table tr {padding: 0; height: 50px; font-size: 20px;}
.notice_table thead tr {height: 50px; border-bottom: 3px solid #999; box-sizing: border-box;}
.notice_bno {width: 10%; text-align: center;}
.notice_tit {width: 60%;}
.notice_date {width: 20%; text-align: center;}
.notice_hit {width: 10%; text-align: center;}
.search_box {width: 800px; height: 70px; margin: 30px auto; position: relative;}
.search_box select {width: 150px; height: 40px; font-size: 20px; }
.search_box input {width: 500px; height: 40px; margin: 0 20px; font-size: 25px; border: 0; background: url("../resources/img/common/input_back.png") repeat-x 0 100%;}
.search_btn {width:54px; height: 54px; border:0; background: url("../resources/img/common/notice_search_btn.png") no-repeat; position: absolute; right: 20px; top: -10px; cursor: pointer;}
.page_num_box {width:400px; height: 70px; margin: 0 auto; font-size: 25px;}
.page_num_box ul {width: 100%; height: 100%; margin: 0 auto; text-align: center;}
.page_num_box ul li {width: auto; float: left; margin: 20px 10px; text-align: center;}

</style>
<script>
	$(function(){
	  $('.search_btn').click(function() {
	    self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
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
                    <div class="subtit_wrap">
                        <p>고객센터</p>
                        <ul>
                            <li class="menu_tit_list"><a class="menu_tit" href="../board/list" >공지사항</a></li>
                            <li class="menu_tit_list"><a class="menu_tit" href="#" >버거킹앱 이용안내</a></li>
                            <li class="menu_tit_list"><a class="menu_tit" href="#" >FAQ</a></li>
                            <li class="menu_tit_list"><a class="menu_tit" href="#" >문의</a></li>
                            <li class="menu_tit_list"><a class="menu_tit" href="#" >가맹점모집</a></li>
                            <li class="menu_tit_list"><a class="menu_tit" href="#" >인재채용</a></li>
                        </ul>
                    </div>
                    <div class="premenu_cate_box">
						<h2>공지사항</h2>
					</div>
					<form role="form" method="get">
						<table class="notice_table">
							<thead>
								<tr>
									<th class ="notice_bno">NO.</th>
									<th class="notice_tit">제목</th>
									<th class="notice_date">날짜</th>
									<th class="notice_hit">조회수</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list}" var = "list">
								<tr>
									<td class="notice_bno"><c:out value="${list.bno}" /></td>
									<td class="notice_tit"><a href="/board/readView?bno=${list.bno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}"><c:out value="${list.title}" /></a></td>
									<td class="notice_date"><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd"/></td>
									<td class="notice_hit"><c:out value="${list.hit}" /></td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="search_box">
						    <select name="searchType" >
						      <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
						      <option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
						    </select>
						    <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>
						    <button class="search_btn" type="button"></button>
						</div>
						<div class="page_num_box">
							<ul>
								<c:if test="${pageMaker.prev}">
									<li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
								</c:if>
								<c:forEach begin="${pageMaker.startPage}"
									end="${pageMaker.endPage}" var="idx">
									<li><a href="list${pageMaker.makeSearch(idx)}">${idx}</a></li>
								</c:forEach>
								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li><a href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
								</c:if>
							</ul>
						</div>
					</form>
				 </div>
            </div>
        </div>
<jsp:include page="../sitemap.jsp"></jsp:include>
<jsp:include page="../footer.jsp"></jsp:include>