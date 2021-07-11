# SpartaCodingClub_iOS_강의노트

<br>
<p align="center">
    <img width="800px" src="https://user-images.githubusercontent.com/50114556/122389547-029b7880-cfac-11eb-8009-ced7dbee43df.png">
</p>
<br>

- 한이음이 블렌디드러닝을 목적으로 스파르타 iOS 앱개발 기초반 수강권을 주었다.
- 기초 지식을 많이 다루는 iOS 기초반 수강이기 때문에, 이번 기회에 기록으로 남겨두려고 한다.

## [1주차_과제](https://github.com/97tuna/SpartaCodingClub_iOS/tree/master/1%EC%A3%BC%EC%B0%A8)

<!-- 손전등 App -->
<p align="center">
    <img width="300px" src="https://user-images.githubusercontent.com/50114556/122678338-611d5c80-d221-11eb-8d83-125b94b8539e.PNG">
    <img width="300px" src="https://user-images.githubusercontent.com/50114556/122678334-5cf13f00-d221-11eb-9e4b-9b50b98339c7.PNG">
</p>
<br>

> 가장 기초적인 IBoutlet연결과 화면 색상 변경을 진행했다. (AutoLayout까지 알려주지 않았지만 적용해보았다)

## [2주차_과제](https://github.com/97tuna/SpartaCodingClub_iOS/tree/master/2%EC%A3%BC%EC%B0%A8)
<!-- 라면타이머 App -->
<p align="center">
    <img width="300px" src="https://user-images.githubusercontent.com/50114556/122678374-8f02a100-d221-11eb-8ad7-b50b970b0e6f.PNG">
    <img width="300px" src="https://user-images.githubusercontent.com/50114556/122678369-8a3ded00-d221-11eb-890a-dce5da7a97e4.PNG">
</p>
<br>

> 타이머를 사용해보고, segmentControl를 통해서 값 변경, 타이머의 시간이 줄어들 때 transitionFlipFromBottom 효과도 적용하였다. (AutoLayout 적용)

## [3주차_실습 & 과제](https://github.com/97tuna/SpartaCodingClub_iOS/tree/master/3%EC%A3%BC%EC%B0%A8)
<!-- 피보나치킨 App (실습)-->
<p align="center">
    <img width="300px" src="https://user-images.githubusercontent.com/50114556/123984930-0396c600-da00-11eb-98de-47df4d9e3f0b.PNG">
    <img width="300px" src="https://user-images.githubusercontent.com/50114556/123984913-ff6aa880-d9ff-11eb-985d-6c18ac780c94.PNG">
</p>
<br>

- 피보나치킨이란?
피보나치수열을 이용해서 각 인원수 별로 몇 마리의 치킨을 주문해야 적당한지 예측하는 방법입니다.

> Stepper를 사용하여 값을 변경하고, prepare함수를 사용하여 segue로 ChickenOutputViewController에 사람수를 전달하였다 .

<!-- 국민건강보험료 계산 App (과제)-->
<p align="center">
    <img width="300px" src="https://user-images.githubusercontent.com/50114556/124001761-e9fd7a80-da0f-11eb-95d4-db45c8b578fd.PNG">
    <img width="300px" src="https://user-images.githubusercontent.com/50114556/124001740-e7028a00-da0f-11eb-987a-90af25abd123.PNG">
</p>
<br>

> 3주차 과제로 입력창과 결과창이 구분되고, 피보나치킨앱과 구성이 유사한 국민건강보험료 계산 앱을 제작하였다.

## [4주차_실습 & 과제](https://github.com/97tuna/SpartaCodingClub_iOS/tree/master/4%EC%A3%BC%EC%B0%A8)
<!-- 피보나치킨 App (실습)-->
<p align="center">
    <img width="300px" src="https://user-images.githubusercontent.com/50114556/124816194-2f3b2280-dfa3-11eb-8552-5de7f52597fa.gif">
    <img width="300px" src="https://drive.google.com/uc?export=view&id=12SQ5Ntaqko1K7tLzBaf8dZ3QNibqypNR">
</p>
<p align="center">
    BookReviewApp(좌)ㅤㅤLinkMemoApp(우)
</p>
<br>

> Almofire을 사용하여 GET, POST방식 통신을 구현해보고, SwiftyJSON을 사용하여 값을 읽고 가공하였다. 또한 SDWebImage 라이브러리를 사용하여 URL이미지를 불러오는 기능을 구현해 보았다. 강의에서 처음으로 CollectionView를 구현해 보았다. NavigationController를 이용해서 실습을 진행하였다.

<!-- 고양이 사진 App (과제)-->
<p align="center">
    <img width="300px" src="https://user-images.githubusercontent.com/50114556/124878957-a6a29d80-e007-11eb-9dad-07fdbb505e24.gif">
</p>
<br>

> 4주차 실습과 동일하지만 SDWebImage를 사용하지 않고 내가 좋아하는 KingFisher를 사용하여 URL이미지를 불러오도록 하였다. 새로고침을 누를때 마다 새로운 고양이 사진 또는 GIF가 나타난다.

## [5주차_실습 & 과제](https://github.com/97tuna/SpartaCodingClub_iOS/tree/master/5%EC%A3%BC%EC%B0%A8)
<!-- FingerGame (실습)-->
<p align="center">
    <img width="300px" src="https://user-images.githubusercontent.com/50114556/125057928-b47a2080-e0e4-11eb-8e8e-7d89362ef1b0.gif">
</p>

> 5주차의 실습은 다양한 터치, 진동, 애니메이션을 적용하는 방법을 학습하였다. 손가락 묶기(편가르기 게임인 데덴찌등) 게임앱을 통해서 다양한 인터렉션을 구현하였다. iOS앱은 최대 5개의 터치를 식별할 수 있다.

> FireBase를 통해서 광고를 넣는 방법과 애널리틱스 사용법을 학습하였다. 마지막으로는 적용된 App을 AppStore에 등록하는 절차까지 진행 후 5주차의 iOS앱 기초반을 마무리 하였다.

<!-- TaggerGame (과제)-->
> TaggerGameApp을 과제로 제작하였다. 앞의 FingerGame에서 알고리즘을 변경하여 팀을 나누는것이 아닌 술래 단 1사람만 결정할 수 있도록 변경하였다.


## iOS 기초반 5주 회고
> 기초반 이었지만 내가 헷갈리고 있거나 어려운 부분을 다시 바로잡을 수 있는 좋은 기회가 되었다. 길다면 길고 짧다면 짧은 5주였지만 과제나 실습 주제가 재미있어서 금방금방 시간이 지나간 것 같다. 한이음에서 2회차 쿠폰을 또 주었는데 이제 뭘 들어야할지 고민해 보는 시간을 가져보기로 했다.

끝