#Spring MVC2모델을 이용하여 버거킹사이트를 제작했습니다.

## - IDE : Eclipse enterpise 2020-03 + Spring
## - server : tomcat9
## - DB : oracle 11g
## - 프로젝트 제작기간 : 2020.11 ~ 2021.01 


## 메인페이지
<img src="https://github.com/yook9688/burgerking/blob/main/readme_img/index.JPG" width="1000" height="600">

##### [소스코드 보기](https://github.com/yook9688/burgerking/blob/main/burger/src/main/webapp/WEB-INF/views/index.jsp)
```
JQuery의 anumate()와 setInterval()을 이용하여 3초마다 넘어갈 수 있는 슬라이드 배너를 제작하였습니다.
```

* * *

## 로그인
<img src="https://github.com/yook9688/burgerking/blob/main/readme_img/login.JPG" width="1000" height="600">

##### [소스코드 보기](https://github.com/yook9688/burgerking/blob/main/burger/src/main/webapp/WEB-INF/views/member/login.jsp)
```
View에서 입력한 ID와 PW를 Controller -> Service -> DAO에 Inject한 SqlSession을 이용하여 MemberMapper로 연결되어
Select문을 실행하게 되고 ID와 PW가 일치하면 해당하는 회원에 정보를 MemberVO에 저장해주고 
세션을 이용하여 해당 회원 정보를 세션으로 설정하도록 구현했습니다. 
불일치 시 "로그인에 실패하였습니다!"라는 메세지와 함께 로그인페이지로 돌아갑니다.
```

* * *

## 회원가입
<img src="https://github.com/yook9688/burgerking/blob/main/readme_img/join1.JPG" width="1000" height="600">
- 회원가입 폼
<img src="https://github.com/yook9688/burgerking/blob/main/readme_img/join2.JPG" width="1000" height="600">
- 주소 API

##### [소스코드 보기](https://github.com/yook9688/burgerking/blob/main/burger/src/main/webapp/WEB-INF/views/member/register.jsp)
```
회원이 사용하고자 하는 회원ID를 입력 후 ID중복체크 버튼을 누르면 ajax를 이용해 아이디값을 Controller에 idchk로 보내어
아이디 중복 체크를 합니다. select count문을 사용하여 중복이 되면 1이 리턴이 되므로 그 값을 이용하여 아이디 중복체크를 검사합니다.
회원이 입력창에 입력을 하지않고 회원가입 버튼을 누를시 JQuery를 이용하여 입력창 들을 검사해 누락된 곳이 있으면 focus()를 이용하여 이동되도록 했습니다.
주소를 찾을 때 더 쉽고 정확하기 찾기 위하여 다음 지도 API를 이용하여 지번주소와 도로명주소를 입력할 수 있도록 구현하였습니다.
```

* * *

## 회원정보수정
<img src="https://github.com/yook9688/burgerking/blob/main/readme_img/member_update.JPG" width="1000" height="600">

##### [소스코드 보기](https://github.com/yook9688/burgerking/blob/main/burger/src/main/webapp/WEB-INF/views/member/updateView.jsp)
```
Session에 저장되어 있는 현재 회원의 정보를 불러와 수정할 수 있도록 구현하였습니다.
수정 시 Update문을 이용, Where절에 현재 해당하는 아이디를 세션을 통해 변수로 넣어 수정 될 수 있도록 했습니다. 
```

* * *

## 회원탈퇴
<img src="https://github.com/yook9688/burgerking/blob/main/readme_img/member_delete.JPG" width="1000" height="600">

##### [소스코드 보기](https://github.com/yook9688/burgerking/blob/main/burger/src/main/webapp/WEB-INF/views/member/deleteView.jsp)
```
회원탈퇴는 세션에 있는 회원의 비밀번호와 입력창에 비밀번호가 일치한지 Controller에서 비교한 뒤 if문을 사용하여 서로 일치하면
service.delete()를 실행해 회원정보를 데이터베이스에서 삭제합니다. 
```

* * *

## 상품소개
<img src="https://github.com/yook9688/burgerking/blob/main/readme_img/product1.JPG" width="1000" height="600">
* 상품목록1
<img src="https://github.com/yook9688/burgerking/blob/main/readme_img/product2.JPG" width="1000" height="600">
* 상품목록2

##### [소스코드 보기](https://github.com/yook9688/burgerking/blob/main/burger/src/main/webapp/WEB-INF/views/product/prolist.jsp)
```
현재 기업에서 판매하고있는 제품들을 소개하는 페이지입니다. @RequestParam을 이용하여 각 카테고리의 해당하는
변수를 select문을 이용하여 불러온 뒤 model로 저장한 후 c:foreach문을 이용하여 목록으로 나열될 수 있도록 구현 했습니다.
```
* * *

## 상품상세보기
<img src="https://github.com/yook9688/burgerking/blob/main/readme_img/product_detail.JPG" width="1000" height="600">

##### [소스코드 보기](https://github.com/yook9688/burgerking/blob/main/burger/src/main/webapp/WEB-INF/views/product/prodetail.jsp)
```
사용자가 선택한 제품의 제품코드를 a태그의 URL parameter로 넣어놓고 controller에서 @RequestParam으로 받아와
ProductMapper에 Select문을 이용하여 검색해서 출력되도록 제작하였습니다.
```

* * *

## 매장소개
<img src="https://github.com/yook9688/burgerking/blob/main/readme_img/search_store.JPG" width="1000" height="600">

##### [소스코드 보기](https://github.com/yook9688/burgerking/blob/main/burger/src/main/webapp/WEB-INF/views/searchstore.jsp)
```
KaKao 지도 API를 이용하여 서울시 내에 있는 버거킹 매장들의 위치를 마킹하여 조금 더 보기 쉽게 만들었습니다.
```

* * *

## 브랜드스토리
<img src="https://github.com/yook9688/burgerking/blob/main/readme_img/company1.JPG" width="1000" height="600">
* 회사소개
<img src="https://github.com/yook9688/burgerking/blob/main/readme_img/company2.JPG" width="1000" height="600">
* 회사연혁

##### [소스코드 보기](https://github.com/yook9688/burgerking/blob/main/burger/src/main/webapp/WEB-INF/views/story.jsp)
```
회사의 소개 및 연혁 등 회사 정보들을 설명해놓은 페이지입니다.
JQuery의 hasClass를 이용하여 탭버튼을 구현해서 
회사(브랜드)소개와 연혁들을 번갈아가며 볼 수 있게 구현하였습니다.
```

* * *

## 딜리버리버튼 클릭시(비로그인)
<img src="https://github.com/yook9688/burgerking/blob/main/readme_img/dilivery(not_login).JPG" width="1000" height="600">

```
header부분에 딜리버리주문 버튼을 누를때 session을 이용하여 session값이 null로 되어있을 시
location.href를 이용해 로그인페이지로 이동되어 로그인 후 사용할 수 있도록 구현하였습니다.
```

* * *

## 딜리버리주문
<img src="https://github.com/yook9688/burgerking/blob/main/readme_img/dilivery(login).JPG" width="1000" height="600">

##### [소스코드 보기](https://github.com/yook9688/burgerking/blob/main/burger/src/main/webapp/WEB-INF/views/cart/prolist.jsp)
```
주문을 위한 제품들은 상품테이블에 있는 데이터들을 Select문으로 가져와 Controller에서 model.addAtrribute로 저장하여
c:foreach문으로 나열하였습니다.
```

* * *

## 메뉴 상세보기
<img src="https://github.com/yook9688/burgerking/blob/main/readme_img/dilivery_detail1.JPG" width="1000" height="600">
 * 할인팩
<img src="https://github.com/yook9688/burgerking/blob/main/readme_img/dli.JPG" width="1000" height="600">
 * 상품 옵션 선택 전 (기본값)
<img src="https://github.com/yook9688/burgerking/blob/main/readme_img/dilivery_detail2.JPG" width="1000" height="600">
 * 상품 옵션 선택 후

##### [소스코드 보기](https://github.com/yook9688/burgerking/blob/main/burger/src/main/webapp/WEB-INF/views/cart/prodetail.jsp)
```
햄버거를 주력 상품으로 판매를 하다보니 단품,세트,라지세트라는 옵션이 있어
input:radio과 lable을 이용하여 소비자가 원하는 옵션 선택시
JQuery change() 메소드를 이용하여
form input에 소비자가 선택한 상품으로 value가 변환되어 장바구니 담기버튼 클릭 시 
데이터베이스에 장바구니 테이블에 생성되고 상품목록 페이지로 이동하도록 구현하였습니다.
```

* * *

## 장바구니
<img src="https://github.com/yook9688/burgerking/blob/main/readme_img/cart.JPG" width="1000" height="600">

##### [소스코드 보기](https://github.com/yook9688/burgerking/blob/main/burger/src/main/webapp/WEB-INF/views/cart/cartlist.jsp)
```
사용자가 선택한 제품들을 장바구니테이블에서 select문으로 조회하여 c:foreach문으로 출력하였습니다.
각 제품의 삭제 버튼이 있는데 클릭 시 상품에 해당하는 장바구니상품번호가 delete문에 where절에 들어가
해당되는 상품만 데이터베이스에서 삭제될 수 있도록 구현하였습니다.
```

* * *

## 주문정보입력
<img src="https://github.com/yook9688/burgerking/blob/main/readme_img/order_info.JPG" width="1000" height="600">
* 주문정보입력
<img src="https://github.com/yook9688/burgerking/blob/main/readme_img/payment.JPG" width="1000" height="600">
* 결제창
<img src="https://github.com/yook9688/burgerking/blob/main/readme_img/payment_complete.JPG" width="1000" height="600">
* 결제완료 후

##### [소스코드 보기](https://github.com/yook9688/burgerking/blob/main/burger/src/main/webapp/WEB-INF/views/order/orderView.jsp)
```
주소 및 연락처 등 기본사항은 지금 로그인한 사용자의 정보를 Session에서 가져와 기본값으로 처리했습니다.
수정을 원하시는경우 해당하는 input창을 수정하시면 주문정보를 변경해서 주문할 수 있습니다.
결제하기 버튼을 누를 시 아임포트API와 연동되어 있는 카카오페이 결제창으로 결제 완료 시
주문완료이 되었다는 창과 함께 주문테이블로 생성 된 후 장바구니테이블에 남아있던 정보들은 삭제됩니다.
```

* * *

## 주문목록
<img src="https://github.com/yook9688/burgerking/blob/main/readme_img/order_list.JPG" width="1000" height="600">
* 주문목록
<img src="https://github.com/yook9688/burgerking/blob/main/readme_img/order_listDetail.JPG" width="1000" height="600">
* 주문상세보기

##### [소스코드 보기](https://github.com/yook9688/burgerking/blob/main/burger/src/main/webapp/WEB-INF/views/order/orderlist.jsp) - 주문목록
##### [소스코드 보기](https://github.com/yook9688/burgerking/blob/main/burger/src/main/webapp/WEB-INF/views/order/orderdetail.jsp) - 주문상세보기
```
주문목록에서는 데이터베이스에서 Select문으로 주문 정보들을
가져와서 사용자에게 보여줍니다. 
주문번호 클릭시 자신이 주문한 내역들을 상세하게 볼 수 있습니다.
```
