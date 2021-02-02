Spring MVC2모델을 이용한 버거킹사이트를 만들어 보았습니다.
==========================================================

## - IDE : Eclipse enterpise 2020-03 + Spring
## - server : tomcat9
## - DB : oracle 11g
## - 프로젝트 제작기간 : 2020.11 ~ 2021.01 
## - 제작동기 : Spring MVC2모델을 공부하고자 코드 하나하나 파헤쳐보자라는 생각으로 시작하였습니다.


* 메인페이지
<img src="https://github.com/yoonjaesub/shopping_project/blob/main/img/index.PNG" width="800 " height="500">
#######[코드보기](/path/to/img.jpg)

```
메인페이지 이미지 배너를 사용하여 신제품 및 행사상품 마케팅에 도움이 될 수 있도록 하였습니다.
JQuery의 anumate()를 사용하였고 setInterval을 이용하여 3초마다 넘어갈수있도록 설정하였습니다.
```

* 로그인
<img src="https://github.com/yoonjaesub/shopping_project/blob/main/img/index.PNG" width="800 " height="500">
#######[코드보기](/path/to/img.jpg)

```
로그인페이지입니다. 해당 form에 input에 있는 파라미터들을
select문을 이용하여 검색 후 일치하면 로그인이 될 수 있도록 구현하였습니다.
```

* 회원가입
<img src="https://github.com/yoonjaesub/shopping_project/blob/main/img/index.PNG" width="800 " height="500">
<img src="https://github.com/yoonjaesub/shopping_project/blob/main/img/index.PNG" width="800 " height="500">
#######[코드보기](/path/to/img.jpg)

```
회원가입폼에 해당하는 input에 값들이 입력이 되어있지않으면
jQuery를 이용하여 데이터 검증을 할 수 있도록 구현하였고
다음주소 API를 이용하여 조금 더 쉽게 상세 주소 및 주소를 찾을 수 있도록 구현하였습니다.
```

* 회원정보수정
<img src="https://github.com/yoonjaesub/shopping_project/blob/main/img/index.PNG" width="800 " height="500">
#######[코드보기](/path/to/img.jpg)

```
Select문을 이용하여 session값에 해당하는 회원의 정보를 불러온 다음
보여줍니다. 
회원이 정보를 수정하고 수정버튼을 누를시 update문을 이용하여 데이터베이스에 회원의 정보를 업데이트합니다.
```

* 회원탈퇴
<img src="https://github.com/yoonjaesub/shopping_project/blob/main/img/index.PNG" width="800 " height="500">
#######[코드보기](/path/to/img.jpg)

```
회원정보수정 창에서 회원탈퇴 시 현재 사용자가 사용하고있는 비밀번호를 select문으로
조회하여 검증 후 일치할 시 delete문을 사용하여 회원테이블에 해당하는 회원에 컬럼들 모두 삭제합니다.
```

* 상품소개
<img src="https://github.com/yoonjaesub/shopping_project/blob/main/img/index.PNG" width="800 " height="500">
<img src="https://github.com/yoonjaesub/shopping_project/blob/main/img/index.PNG" width="800 " height="500">
#######[코드보기](/path/to/img.jpg)

```
현재 기업에서 판매하고있는 제품들을 소개하는 페이지입니다. 
Controller에서 @RequestParam을 이용하여 각 카테고리의 해당하는
코드를 select문을 이용하여 데이터베이스 내에 상품테이블에서 불러와 목록으로 표현했습니다.
```

* 상품상세보기
<img src="https://github.com/yoonjaesub/shopping_project/blob/main/img/index.PNG" width="800 " height="500">
#######[코드보기](/path/to/img.jpg)

```
메뉴목록에서 자신이 궁금한 메뉴를 클릭하면 해당하는 제품코드를 @RequestParam으로 받아와
Controller에서 Select문을 이용하여 검색해서 출력되도록 제작하였습니다.
```

* 매장소개
<img src="https://github.com/yoonjaesub/shopping_project/blob/main/img/index.PNG" width="800 " height="500">
#######[코드보기](/path/to/img.jpg)

```
매장소개페이지를 제작해보았습니다. KaKao 지도 API를 사용하였고 서울시 내에 있는
매장들을 마커를 통해 대략적인 위치를 마킹해놓았습니다.
```

* 브랜드스토리
<img src="https://github.com/yoonjaesub/shopping_project/blob/main/img/index.PNG" width="800 " height="500">
#######[코드보기](/path/to/img.jpg)

```
회사의 연혁들을 설명해놓은 페이지입니다.
JQuery의 hasClass를 이용하여 탭버튼을 구현해서 
회사(브랜드)소개와 연혁들을 번갈아가며 볼 수 있게 구현하였습니다.
```

* 딜리버리버튼 클릭시(비로그인)
<img src="https://github.com/yoonjaesub/shopping_project/blob/main/img/index.PNG" width="800 " height="500">
#######[코드보기](/path/to/img.jpg)

```
header부분에 딜리버리주문 버튼을 누를때 session을 이용하여 로그인이 안되어있으면
location.href를 이용해 로그인페이지로 넘어가게 구현했습니다.
```

* 딜리버리주문
![Alt text](/path/to/img.jpg width="800" height="500")

```
주문을 위한 상품목록을 볼 수 있는 페이지입니다.
```

* 메뉴 상세보기
<img src="https://github.com/yoonjaesub/shopping_project/blob/main/img/index.PNG" width="800 " height="500">
<img src="https://github.com/yoonjaesub/shopping_project/blob/main/img/index.PNG" width="800 " height="500">
<img src="https://github.com/yoonjaesub/shopping_project/blob/main/img/index.PNG" width="800 " height="500">
#######[코드보기](/path/to/img.jpg)


```
햄버거를 주력 상품으로 판매를 하다보니 
햄버거는 단품,세트,라지세트라는 옵션이 있어
radio버튼을 이용하여 소비자가 원하는 옵션 선택시
JQuery change()이벤트 메소드를 이용하여
form input에 소비자가 선택한 상품으로 value가 변환되어 
데이터베이스에 장바구니 테이블에 생성되도록 구현하였습니다.
```

* 장바구니
<img src="https://github.com/yoonjaesub/shopping_project/blob/main/img/index.PNG" width="800 " height="500">
#######[코드보기](/path/to/img.jpg)

```
소비자가 메뉴를 옵션까지 선택하면 해당하는 정보가 장바구니 테이블에 생성됩니다.
자신이 선택한 메뉴를 확인할 수 있고 만약 아닐 경우 삭제하고 다시 추가할 수 있도록 구현하였습니다.
```

* 주문정보입력
<img src="https://github.com/yoonjaesub/shopping_project/blob/main/img/index.PNG" width="800 " height="500">
<img src="https://github.com/yoonjaesub/shopping_project/blob/main/img/index.PNG" width="800 " height="500">
#######[코드보기](/path/to/img.jpg)

```
주소 및 연락처 등 기본사항은 지금 로그인한 사용자의 정보를 기본값으로 처리했습니다.
수정을 원하시는경우 해당하는 input창을 수정하시면 주문정보를 변경해서 주문할 수 있습니다.
결제하기 버튼을 누를 시 아임포트API와 연동되어 있는 카카오페이 결제창으로 결제 완료 시
주문완료이 되었다는 창과 함께 주문테이블로 생성 된 후 장바구니테이블에 남아있던 정보들은 삭제됩니다.
```



* 주문목록
<img src="https://github.com/yoonjaesub/shopping_project/blob/main/img/index.PNG" width="800 " height="500">
<img src="https://github.com/yoonjaesub/shopping_project/blob/main/img/index.PNG" width="800 " height="500">
#######[코드보기](/path/to/img.jpg)

```
주문목록에서는 데이터베이스에서 Select문으로 주문 정보들을
가져와서 사용자에게 보여줍니다. 
주문번호 클릭시 자신이 주문한 내역들을 상세하게 볼 수 있습니다.
```
