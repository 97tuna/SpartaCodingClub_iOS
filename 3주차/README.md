# SpartaCodingClub_iOS_강의노트_3주차

## **01. 3주차 오늘 배울 것**

- 1) 뷰의 frame 과 constraint

    위치를 지정할 때 좌표의 역할을 하는 프레임과 화면 크기가 달라져도 동일한 위치를 지정할 수 있는 컨스트레인트 알아보기

    - 프레임(frame)

        : 위치 좌표(X, Y)와 사이즈(너비, 높이)로 이루어진 사각형으로, 프레임을 통해 뷰의 위치와 사이즈를 결정합니다. 

    - 컨스트레인트(constraint)

        : 특정 규칙을 통해 화면 크기가 달라지더라도 뷰의 위치와 사이즈가 일관되게 보이도록 도와줍니다.  

- 2) 여러 화면을 넘나드는 방법

    화면이 여러 개일 때 각 화면을 넘나들 수 있게 도와주는 UIViewController 에 대해 알아보고 예시를 통해 적용해보기

    - 뷰컨트롤러(UIViewController): iOS에서 화면의 기본 단위이며, 뷰를 컨트롤하는 개념입니다.
    - 뷰컨트롤러의 한 종류인 네비게이션 컨트롤러와 테이블뷰 컨트롤러를 이용해 아래 사진처럼 화면을 여러 개 설정하고, 버튼을 클릭했을 때 화면을 이동하도록 연습해볼 겁니다.
        ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F20675bd0-5c16-4799-a5ab-bd432786238d%2FUntitled.png?table=block&id=718eb824-ec78-4bd0-a65b-fa89c83d168b&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=2880&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F20675bd0-5c16-4799-a5ab-bd432786238d%2FUntitled.png?table=block&id=718eb824-ec78-4bd0-a65b-fa89c83d168b&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=2880&userId=&cache=v2)

- 3) Swift - 상속과 클로져

    코드를 작성할 때 보다 편하게 해주는 기능인 상속과 클로져에 대해 알아보기

    - 상속: A를 상속받았을 때, 따로 코드를 작성하지 않아도 A가 동작하는 원리를 사용할 수 있도록 해주는 기능입니다. 예를 들어 UIViewController를 상속받게 되면, 기본적으로 UIViewController가 동작하는 원리를 코드로 다시 작성하지 않아도 사용할 수 있습니다.
    - 클로져: 작성한 함수를 다른 함수의 변수로 사용할 수 있도록 해주는 기능입니다.