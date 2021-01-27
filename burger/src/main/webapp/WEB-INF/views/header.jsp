<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="co.kr.vo.MemberVO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,height=device-height, initial-scale=1.0">
    <title>버거킹</title>
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <script src="../resources/js/slider.js"></script>
    <link rel="stylesheet" href="../resources/css/common.css">
</head>
<body>
	<div id="wrap">
        <div id="hd">
            <div class="hd_wrap">
            	<nav class="tnb">
			        <ul>
				        <% 
							MemberVO member =  (MemberVO) session.getAttribute("member");				        
				        	if(member == null) {
				        %>
				        <li>
							<a href="../member/loginView">로그인</a>
						</li>
						<li>
							<a href="../member/register">회원가입</a>
						</li>
						<%
				        	} else {	
						%>
						<li>
							<a href="../member/updateView">회원정보수정</a>
						</li>
						<li>
							<a href="../member/logout">로그아웃</a>
						</li>
						<%
				        	}
						%>
						<li><a href="/">홈으로</a></li>
			        </ul>
	        	</nav>
                <a href="/" class="logo"><img src="../resources/img/main/logo_header.gif" alt="로고"></a>
                <nav class="gnb">
                    <ul class="main">
                        <li>
                            <span>메뉴소개</span>
                            <img src="../resources/img/main/menu_icon.gif" alt="메뉴아이콘">
                            <ul class="sub">
                                <li><a href="../product/prolist?cate=ss">스페셜&할인팩</a></li>
                                <li><a href="../product/prolist?cate=p">프리미엄</a></li>
                                <li><a href="../product/prolist?cate=w">와퍼</a></li>
                                <li><a href="../product/prolist?cate=jb">주니어&버거</a></li>
                                <li><a href="../product/prolist?cate=a">올데이킹&치킨버거</a></li>
                   	            <li><a href="../product/prolist?cate=s">사이드</a></li>
                                <li><a href="../product/prolist?cate=d">음료&디저트</a></li>
                                <li><a href="../product/prolist?cate=m">아침메뉴</a></li>
                            </ul>
                        </li>
                        <li>
                            <span>매장소개</span>
                            <img src="../resources/img/main/menu_icon.gif" alt="메뉴아이콘">
                            <ul class="sub">
                                <li><a href="../searchstore">매장찾기</a></li>
                            </ul>
                        </li>
                        <li>
                            <span>이벤트</span>
                            <img src="../resources/img/main/menu_icon.gif" alt="메뉴아이콘">
                            <ul class="sub">
                                <li><a href="#">이벤트</a></li>
                            </ul>
                        </li>
                        <li>
                            <span>브랜드스토리</span>
                            <img src="../resources/img/main/menu_icon.gif" alt="메뉴아이콘">
                            <ul class="sub">
                                <li><a href="../story">버거킹 스토리</a></li>
                                <li><a href="../why">WHY 버거킹</a></li>
                                <li><a href="#">버거킹 NEWS</a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
                <button class="dil_btn">
                    <span>딜리버리주문</span>
                </button>
                 <%if(member == null) { %>
                <script>
                	$(function(){
                		$(".dil_btn").click(function(){
                			alert("로그인 후 이용하실 수 있습니다.");
                			location.href = "../member/loginView"
                		});
                	});
                </script>
                <% } else { %>
                <script>
                	$(function(){
                		$(".dil_btn").click(function(){
                			location.href = "../cart/prolist?cate=ss"
                		});
                	});
                </script>	
                <% } %>
                <!-- <script>
                	$(function(){
                		$(".dil_btn").click(function(){
                			location.href = "../cart/prolist?cate=ss"
                		});
                	});
                </script> -->
            </div>
        </div>