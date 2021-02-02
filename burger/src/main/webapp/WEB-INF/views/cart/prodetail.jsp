<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../order_header.jsp"/>
<style>
/* 콘텐츠 */
#content {clear: both; width: 100%; height: 100%; }
.con_wrap {width: 100%; height: 100%; min-height: 800px; padding: 0 0 45px 0;}
.content_box {width: 100%; height: 100%; }
.product_box {width: 100%; height: 400px; background-color: #000;}
.product_bg {width: 1440px; height: 400px; margin: 0 auto; background:url("/resources/img/menu_detail/bg_prd_detailintro.4e4e1753.png") no-repeat;}
.product_intro {max-width: 1144px; height: 400px; padding: 0 20px; margin: 0 auto; position: relative;}
.description_box {width: 600px; height: 150px;}
.description_box p {margin: 20px 0; font-size: 20px; color:#fff;}
.img_box {position: absolute; right: 0; bottom: 10%;}
.product_name {color:#fff; font-size:50px; margin: 0; line-height: 200px;}
.product_btn_box {width: 100%; height: 88px; background:url("/resources/img/menu_detail/bg_menu_subinfoWrap.23f3cf83.png");}
.product_btn_box div {max-width: 1144px; padding: 0 20px; margin: 0 auto; line-height: 88px;}
.product_add_form {display: inline-block; float:right; width: 500px; text-align: center;}
.product_add_form select {margin: 0 20px; width: 200px; height: 40px; font-size: 20px;}
.product_btn {color:#fff; font-size:24px; font-weight: bold; border: 0; background: transparent; cursor: pointer;}
.addCart_btn {color:#fff; font-size:24px; font-weight: bold; border: 0; background: transparent; margin-top: 29px; float: right; cursor: pointer;}
.product_option_box {max-width: 1144px;; height: 250px; margin: 40px auto;}
.option {display:inline-block; width: 343px; height: 250px; margin:0 17.5px; }
.option input {display: none;} 
.option input:checked + label {border: 3px dashed #000;}
.option label {display:block; width: 100%; height: 100%; text-align: center; font-size:25px; line-height: 70px; box-sizing: border-box; cursor: pointer;}
.option label span {text-align: center;}



</style>
<script>
	$(document).ready(function(){
		$(".product_btn").on("click", function(){
			window.history.back();
		});
		$(".addCart_btn").on("click", function(){
			$(".product_add_form").submit();	
		});
		
		var ls_price = $(".ls_price").text();
		var s_price = $(".s_price").text();
		var n_price = $(".n_price").text();
		var pName = $("#pName").val();
		$(".option_ls").on("change", function(){
			$(".option_s").removeAttr("checked");
			$(".option_n").removeAttr("checked");
			$(".option_ls").attr("checked",true);
			$("#drink1").val("콜라L");
			$("#side1").val("프렌치프라이L");
			$("#price").val(ls_price);
			$("#pName").val(pName+" 라지세트");
			$("#p_option").val("라지세트");
		});
			
		$(".option_s").on("change", function(){
			$(".option_ls").removeAttr("checked");
			$(".option_n").removeAttr("checked");
			$(".option_s").attr("checked",true);
			$("#drink1").val("콜라R");
			$("#side1").val("프렌치프라이R");
			$("#price").val(s_price);
			$("#pName").val(pName+" 세트");
			$("#p_option").val("세트");
		});
		$(".option_n").on("change", function(){
			$(".option_ls").removeAttr("checked");
			$(".option_s").removeAttr("checked");
			$(".option_n").attr("checked",true);
			$("#drink1").val("없음");
			$("#side1").val("없음");
			$("#price").val(n_price);
			$("#pName").val(pName);
			$("#p_option").val("단품");
		});
	});
</script>
<%
	request.setCharacterEncoding("utf-8");
	String cate = request.getParameter("cate");
	System.out.println(cate);
	String cate_tit= "";
	switch(cate) {
		case "ss" : 
			cate_tit = "스페셜&할인팩";
			break;
		case "p" : 
			cate_tit = "프리미엄";
			break;
		case "w" : 
			cate_tit = "와퍼";
			break;
		case "jb" : 
			cate_tit = "주니어&버거";
			break;
		case "a" : 
			cate_tit = "올데이킹&치킨버거";
			break;
		case "s" : 
			cate_tit = "사이드";
			break;
		case "d" : 
			cate_tit = "음료&디저트";
			break;
		case "m" : 
			cate_tit = "아침메뉴";
			break;
		}	
%>
        <div id="content">
            <div class="site_locate">
                <div class="locate_box">
                    <a href="/">Home</a>
                    <a href="prolist?cate=${product.pCategory }">딜리버리</a>
                    <a href="prolist?cate=${product.pCategory }"><%=cate_tit %></a>
                    <span>${product.pName}</span>
                </div>
            </div>
            <div class="con_wrap">
                <div class="content_box">
                    <div class="product_box">
                    	<div class="product_bg">
	                    	<div class="product_intro">
	                    		<div class="img_box">
	                    			<img src="../resources/${product.pUrl}" alt="${product.pName}사진" />
	                    		</div>
	                    		<h2 class="product_name">${product.pName}</h2>
	                    		<div class="description_box">
	                    		<p>${product.pDescription}</p>
	                    		</div>
	                    	</div>               
                    	</div>
                    	<div class="product_btn_box">
                    		<div>

                   				<button class="product_btn" type="button">← 메뉴 목록으로 돌아가기 </button>
                   				<button class="addCart_btn" type="button">장바구니에 담기</button>
                    			
<% if(cate.equals("ss")) { %>
							<form action="../cart/addCart2" class="product_add_form" method="post">
                    			<input type="hidden" name="pCode" value="${product.pCode}" />
                    			<select name="drink1" id="drink1" required>
	                    			<option value="콜라R" selected>콜라R</option>
	                    			<option value="사이다R" >사이다R</option>
	                    			<option value="환타R">환타R</option>
	                    			<option value="아이스아메리카노R">아이스아메리카노R</option>
                    			</select>
                    			<select name="drink2" id="drink2" required>
	                    			<option value="콜라R" selected>콜라R</option>
	                    			<option value="사이다R">사이다R</option>
	                    			<option value="환타R">환타R</option>
	                    			<option value="아이스아메리카노R">아이스아메리카노R</option>
                    			</select>
                    			<input type="hidden" name="side1" id="side1" value="프렌치프라이L" />
                    			<input type="hidden" name="side2" id="side2" value="너겟킹4조각" />
                    			<input type="hidden" name="price" id="price" value="${product.price}" />
                    			<input type="hidden" name="pName" id="pName" value="${product.pName}"/>
                    			<input type="hidden" name="p_option" id="p_option" value="할인팩"/>
                   			</form>		
<% } else { %>         			
							<form action="../cart/addCart1" class="product_add_form" method="post">
                    			<input type="hidden" name="pCode" value="${product.pCode}" />
                    			<select name="drink1" id="drink1" required>
                    				<option value="없음" selected>없음</option>
                    				<option value="콜라L">콜라L</option>
                    				<option value="사이다L">사이다L</option>
                    				<option value="환타L">환타L</option>
                    				<option value="아이스아메리카노L">아이스아메리카노L</option>
	                    			<option value="콜라R">콜라R</option>
	                    			<option value="콜라R">사이다R</option>
	                    			<option value="콜라R">환타R</option>
	                    			<option value="콜라R">아이스아메리카노R</option>
                    			</select>
                    			<input type="hidden" name="side1" id="side1" value="없음" />
                    			<input type="hidden" name="price" id="price" value="${product.price}" />
                    			<input type="hidden" name="pName" id="pName" value="${product.pName}"/>
                    			<input type="hidden" name="p_option" id="p_option" value=""/>
                    			
                  			</form>	
<% } %>        				
                    		</div>
                   		</div>
<% if(cate.equals("ss")) { %>                    		
<% } else { %>      		
                  		<div class="product_option_box">
               				<div class="option">
               					<input class="option_ls" id="option_ls" type="radio" name="p_option" value="라지세트"  />
               					<label for="option_ls">
	               					${product.pName}<br>프렌치프라이L+콜라L<br />
	               					<span class="ls_price">${product.price+2200}</span> ￦
               					</label>
            					</div>
               				<div class="option">
               					<input class="option_s" id="option_s" type="radio" name="p_option" value="세트"  />
               					<label for="option_s">
	               					${product.pName}<br>프렌치프라이R+콜라R<br />
	               					<span class="s_price">${product.price+1500}</span> ￦
								</label>
               				</div>
               				<div class="option">
               					<input class="option_n" id="option_n" type="radio" name="p_option" value="단품"/>
               					<label for="option_n">
	               					${product.pName}<br>단품<br />
	               					<span class="n_price">${product.price}</span> ￦
               					</label>
           					</div>
                  		</div>
<% } %>           		
                 		<script>
                 		
                 		</script>
                    </div>
                </div>
            </div>
        </div>
<jsp:include page="../sitemap.jsp"/>
<jsp:include page="../footer.jsp"/>