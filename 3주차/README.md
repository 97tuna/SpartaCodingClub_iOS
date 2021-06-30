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
<br>

## 02. iOS에서 뷰의 위치를 다루는 법 1 - 프레임

- 4) 프레임(frame) 이란?

    화면에서 뷰의 크기와 위치는 "프레임"이라는 요소로 결정합니다.  처음 등장하는 용어라 멈칫하게 되나요? 하지만 걱정하지 않아도 됩니다. 여러분들은 지금까지 알게 모르게 프레임을 써왔습니다! 

    - 프레임에 대해 알아보기

        ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fece72695-38f3-4e7f-873a-41811390183e%2Fframe_2.jpg?table=block&id=c620708f-cc81-475d-86c5-3b358d69c4b7&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=2880&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fece72695-38f3-4e7f-873a-41811390183e%2Fframe_2.jpg?table=block&id=c620708f-cc81-475d-86c5-3b358d69c4b7&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=2880&userId=&cache=v2)

        프레임(Frame)은 위치 좌표(X, Y)와 사이즈(너비, 높이)로 이루어진 사각형입니다. 이 사각형으로 뷰의 위치와 사이즈를 결정합니다. 

        우리가 추가한 이미지뷰는 상위뷰의 좌표계에서 x 좌표는 20, y 좌표는 44, 너비는 237, 높이는 235 로 되어있네요!

        갑자기 상위뷰라든지 좌표계라든지 하는 말에 놀랄 필요 없습니다! 같이 천천히 알아가 볼게요!

        1. 상위뷰(superview)와 하위뷰(subview)

        화면에 보이는 모든 뷰는 다른 뷰를 포함할 수도, 또 다른 뷰에 포함될 수도 있습니다. A라는 뷰가 B라는 뷰를 포함할 때, A는 상위뷰(superview), B는 하위뷰(subview)라고 합니다. 즉 서로의 관계에 따른 이름인 셈입니다! 만약 C라는 뷰가 B에 포함된다면, B는 A에게는 하위뷰지만, C에게는 상위뷰가 됩니다!

        > 사실 생각해보면, 부모-자식 관계와 비슷합니다.

        그래서 이 관계를 그림으로 나타내보면 아래의 그림과 같이 됩니다. 

        ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fadfc504b-9f24-4280-a3a2-5f6d6249282f%2F_3.jpg?table=block&id=f25a5059-678e-4589-9722-dae217fb9f51&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=1600&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fadfc504b-9f24-4280-a3a2-5f6d6249282f%2F_3.jpg?table=block&id=f25a5059-678e-4589-9722-dae217fb9f51&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=1600&userId=&cache=v2)

        뭔가 가계도 같지 않나요? 이 구조를 위아래 뒤집어서 보면 나무 같다고 해서 **트리 구조**라고 합니다. 

        2. 좌표계

        좌표계에 대한 설명은 아래 그림을 보면 더 빠르게 이해할 수 있어요! 그럼 같이 살펴볼까요?

        ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F01a0bce0-1e26-4f19-929c-2e4ed69582fe%2F_4.png?table=block&id=e869cb34-6b16-408f-99f5-bf29bc5f2054&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=1590&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F01a0bce0-1e26-4f19-929c-2e4ed69582fe%2F_4.png?table=block&id=e869cb34-6b16-408f-99f5-bf29bc5f2054&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=1590&userId=&cache=v2)

        왼쪽 상단은 (0, 0), 즉 원점을 의미합니다. 뭔가 익숙한 모양이죠? 우리가 어렸을 때 배웠던 수학 좌표계와 비슷하게 생겼지만 다른 점이 있습니다. 바로 Y 축이 아래로 갈수록 값이 커진다는 점이 다르죠! 

    - 프레임 움직여보기
        - 버튼을 누르면 frame 의 위치가 바뀌도록 써보기

            ```swift
            import UIKit

            class ViewController: UIViewController {

                @IBOutlet weak var imageView: UIImageView!
                
                override func viewDidLoad() {
                    super.viewDidLoad()
                    // Do any additional setup after loading the view.
                }

                @IBAction func moveButtonClicked(_ sender: Any) {
                    self.imageView.frame = CGRect(x: 20, y: 200, width: 237, height: 235)
            			//아래로 156 포인트 움직일겁니다!
                }
                
            }
            ```

        - 애니메이션도 살짝 써볼까요?

            ```swift
            import UIKit

            class ViewController: UIViewController {

                @IBOutlet weak var imageView: UIImageView!
                
                override func viewDidLoad() {
                    super.viewDidLoad()
                    // Do any additional setup after loading the view.
                }

                @IBAction func moveButtonClicked(_ sender: Any) {
                    UIView.animate(withDuration: 0.5) {
                        self.imageView.frame = CGRect(x: 20, y: 200, width: 237, height: 235)
                    }
                }
                
            }
            ```

        iOS의 꽃은 바로 애니메이션입니다.

## 03. iOS에서 뷰의 위치를 다루는 법 2 - 컨스트레인트

- 5) 컨스트레인트(constraint) 란?

    혹시 다른 화면 사이즈에서 앱을 띄워보셨나요? 그럼 뷰들의 위치가 이상했을 겁니다!

    프레임은 결과적으로 화면에서의 위치와 사이즈를 결정합니다. 그런데 화면 사이즈가 제각각이라면 프레임은 어떻게 넣어야 할까요?

    - 컨스트레인트에 대해 알아보기

        ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F0b262438-e0b6-47b4-b4dd-d6835321a83c%2FUntitled.png?table=block&id=9b2fa30c-c7eb-40af-b03c-b0f0754a8297&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=6310&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F0b262438-e0b6-47b4-b4dd-d6835321a83c%2FUntitled.png?table=block&id=9b2fa30c-c7eb-40af-b03c-b0f0754a8297&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=6310&userId=&cache=v2)

        뷰의 위치와 사이즈에 대한 규칙을 컨스트레인트로 정하면, 화면 사이즈가 달라지더라도 설정했던 규칙으로 프레임을 정할 수 있습니다. 

    - 자주 쓰이는 컨스트레인트 알아보기

        1. 가운데 정렬

        ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F742733ea-db0d-46e3-874a-ddc657871e69%2F_1.jpg?table=block&id=fe66d34e-7b60-447e-b1ef-434f9dcf363d&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=2040&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F742733ea-db0d-46e3-874a-ddc657871e69%2F_1.jpg?table=block&id=fe66d34e-7b60-447e-b1ef-434f9dcf363d&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=2040&userId=&cache=v2)

        해당 뷰의 가로로(Horizontally) 세로로(Vertically) 가운데 정렬을 해줍니다. 

        2. 너비, 높이

        ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fd51eb5b0-71a6-4efc-ba01-1b8fa72dbd5a%2F_1.jpg?table=block&id=5708f76d-0416-4a46-83b0-5bccd7a2df54&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=2460&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fd51eb5b0-71a6-4efc-ba01-1b8fa72dbd5a%2F_1.jpg?table=block&id=5708f76d-0416-4a46-83b0-5bccd7a2df54&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=2460&userId=&cache=v2)

        해당 뷰의 너비와 높이를 결정해 줍니다.

        3. 위, 아래, 왼쪽, 오른쪽 여백

        ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F9aad055a-5d6c-406c-8577-103887f8c008%2F_1.jpg?table=block&id=9277c5d7-06d0-4662-89a9-f7192e9ea903&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=2530&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F9aad055a-5d6c-406c-8577-103887f8c008%2F_1.jpg?table=block&id=9277c5d7-06d0-4662-89a9-f7192e9ea903&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=2530&userId=&cache=v2)

        원하는 대로 여백을 결정해 줍니다.

    - 컨스트레인트와 프레임

        **컨스트레인트는 프레임을 결정하는 룰이다**는 말 기억하나요? 그리고 프레임은 결과적으로 화면에서 어떻게 보이는지를 결정하지요! 

        가로축의 컨스트레인트 2개와 세로축의 컨스트레인트 2개 총 4개가 모여야 프레임을 결정할 수 있습니다. 그러니까...

        이렇게 생각합시다! 

        > 우리가 컨스트레인트를 '잘' 설정해두면 앱이 화면에 맞게 프레임을 바꿔준다!

        사실 이부분은 약간의 경험이 중요한 부분입니다.

## 04. 여러 화면 다뤄보기

- 6) 화면(UIViewController) 추가하기

    iOS 에서 화면의 기본 단위는 뷰컨트롤러(UIViewController)입니다. 이름을 보면 느낌이 오죠? 뷰를 컨트롤하는 더 큰 개념이라고 생각하면 됩니다. 

    PPT에 비유해보면, 슬라이드 한 장 한 장은 뷰컨트롤러, 한 슬라이드 내에 있는 텍스트나 이미지 등은 각각 뷰라고 볼 수 있겠네요!

    1.  스토리보드에 화면 추가하기  

        View Controller 를 검색해서 추가합니다. 

        ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F4ec45f0e-71e7-4f53-b406-7c720cef896f%2FUntitled.png?table=block&id=578bd4ef-a49a-4d07-9811-b81347c15d20&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=3170&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F4ec45f0e-71e7-4f53-b406-7c720cef896f%2FUntitled.png?table=block&id=578bd4ef-a49a-4d07-9811-b81347c15d20&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=3170&userId=&cache=v2)

    2.  화면에 라벨과 버튼 하나씩 추가하기

        ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F112f4d97-0c60-424c-adb8-114ff810a2a6%2FUntitled.png?table=block&id=baa33676-536e-477e-b899-40a6a31915ad&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=7610&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F112f4d97-0c60-424c-adb8-114ff810a2a6%2FUntitled.png?table=block&id=baa33676-536e-477e-b899-40a6a31915ad&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=7610&userId=&cache=v2)

    3.  두 번째 화면 만들기

        ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F9c571a39-e9fe-4763-9118-54ee2c0b04a0%2FUntitled.png?table=block&id=27413c5d-e3e3-44cd-8a0a-d37919b5b3f8&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=7610&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F9c571a39-e9fe-4763-9118-54ee2c0b04a0%2FUntitled.png?table=block&id=27413c5d-e3e3-44cd-8a0a-d37919b5b3f8&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=7610&userId=&cache=v2)

    4.  ⭐**[중요]** 컨트롤(`^`) 버튼을 누른 채로 '두 번째 화면으로 가기' 버튼과 두 번째 화면 연결하기

        ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fcb2f6cae-4bcf-43f2-99a1-48f96cab4f68%2F_2021-03-28__4.43.12.png?table=block&id=864129a9-a67e-4743-b723-f0ade76b42c9&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=860&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fcb2f6cae-4bcf-43f2-99a1-48f96cab4f68%2F_2021-03-28__4.43.12.png?table=block&id=864129a9-a67e-4743-b723-f0ade76b42c9&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=860&userId=&cache=v2)

    5.  Present Modally 를 선택

        ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F0ea4326b-ce50-4ee5-9c10-5c3b8c229304%2Fpresent_modally_1.jpg?table=block&id=0d559cda-7dcd-4d43-ac84-1cf1fc0a78bf&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=860&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F0ea4326b-ce50-4ee5-9c10-5c3b8c229304%2Fpresent_modally_1.jpg?table=block&id=0d559cda-7dcd-4d43-ac84-1cf1fc0a78bf&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=860&userId=&cache=v2)

    6.  Storyboard Entry Point 를 '첫 번째 화면'으로 드래그해서 이동

        ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F03e173fa-74b6-4cac-b4cc-122e8039c90a%2F_1.jpg?table=block&id=3fe07b12-fb40-46c4-9a06-ecbef9a29ef9&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=4720&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F03e173fa-74b6-4cac-b4cc-122e8039c90a%2F_1.jpg?table=block&id=3fe07b12-fb40-46c4-9a06-ecbef9a29ef9&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=4720&userId=&cache=v2)

    - 실행화면

        ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F17999657-f106-4baf-9fc0-4cda8905e4ab%2FUntitled.png?table=block&id=fe09dcf5-bed4-4b6f-8fc9-697aa30700a0&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=3690&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F17999657-f106-4baf-9fc0-4cda8905e4ab%2FUntitled.png?table=block&id=fe09dcf5-bed4-4b6f-8fc9-697aa30700a0&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=3690&userId=&cache=v2)
    
- 7) 화면 표시 방법(Presentation Style)

    화면이 표시되는 방법에는 여러 가지가 있습니다. 

    - 자동(Automatic)
    - 전체 화면(Full Screen)

        ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F64a0f8ef-ce7c-4df8-99f6-2102f96475d3%2FUntitled.png?table=block&id=e184b283-7b8a-427d-b663-0e4b851ce028&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=4070&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F64a0f8ef-ce7c-4df8-99f6-2102f96475d3%2FUntitled.png?table=block&id=e184b283-7b8a-427d-b663-0e4b851ce028&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=4070&userId=&cache=v2)

    - 페이지 시트(Page Sheet)

        ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F0ae16996-ce77-42bd-8519-fe2cb497c388%2FUntitled.png?table=block&id=7a83f7fb-fa98-4b61-ace5-b36aeabf1b8a&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=3870&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F0ae16996-ce77-42bd-8519-fe2cb497c388%2FUntitled.png?table=block&id=7a83f7fb-fa98-4b61-ace5-b36aeabf1b8a&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=3870&userId=&cache=v2)

    - 그 외 여러가지 : 아이패드와 맥을 지원하거나 특정한 상황을 위해 그 외 여러 가지 표시 방법들이 있으나, 여기서는 다루지 않을 예정입니다!

    자동은 iOS가 해당 문맥에 따라 자동으로 화면 표시 방법을 정합니다. 보통은 Page Sheet 으로 보여집니다. 

- 8) 화면 전환 방법(Transition Style)

    이 부분은 각자 한 번씩 해보면서 본인이 만들고 싶은 앱에 이런 화면 전환을 써야겠다는 생각을 해봅시다!

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F69b68901-3a25-449b-9e38-0b3e52c93d7e%2FUntitled.png?table=block&id=76bd585a-efa5-47e3-933f-6cae64040112&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=1980&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F69b68901-3a25-449b-9e38-0b3e52c93d7e%2FUntitled.png?table=block&id=76bd585a-efa5-47e3-933f-6cae64040112&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=1980&userId=&cache=v2)

    - Cover Vertical
    - Flip Horizontal
    - Cross Dissolve
    - Partial Curl

## 05. 내비게이션과 테이블뷰

- 9) 내비게이션 컨트롤러(UINavigationController)

    내비게이션 컨트롤러는 화면 전환을 관리해 주는 UIViewController 의 일종입니다. 각각의 화면을 내비게이션 컨트롤러에 포커 카드처럼 한 장씩 쌓아 올리는 구조(Stack)를 가지고 있죠! 맨 위에 있는 화면 한 장만 보여주고, 왼쪽 상단에 백 버튼을 누르면 맨 위에 있는 화면이 지워지고 그 밑에 있는 화면이 보입니다. 

    백문이 불여일견! 일단 해봅시다!

    1. 스토리보드에 내비게이션 컨트롤러 추가하기

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fbcbab469-cb90-4689-87b5-e0a03e10ecb3%2FUntitled.png?table=block&id=9c492488-b1c5-4ed9-adcb-d59a7ca8378a&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=3170&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fbcbab469-cb90-4689-87b5-e0a03e10ecb3%2FUntitled.png?table=block&id=9c492488-b1c5-4ed9-adcb-d59a7ca8378a&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=3170&userId=&cache=v2)

    2. 내비게이션 컨트롤러 추가 후 화면

    오! 분명 하나만 추가했는데 화면이 두 개로 늘었죠?

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fbc9d73ca-4488-40a2-8685-5f28bb635da8%2FUntitled.png?table=block&id=c4791fae-dfc7-4099-8918-761cc265972c&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=3120&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fbc9d73ca-4488-40a2-8685-5f28bb635da8%2FUntitled.png?table=block&id=c4791fae-dfc7-4099-8918-761cc265972c&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=3120&userId=&cache=v2)

    내비게이션 컨트롤러를 추가하면 자동으로 테이블뷰 컨트롤러(UITableViewController)를 추가해줍니다. 다 이유가 있습니다!

    3. 테이블뷰의 컨텐츠를 static 으로 변경하기

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Ff73f81f0-e653-405a-b115-d20bc6d11501%2FUntitled.png?table=block&id=cbf9e11a-c85a-4095-93b5-d439e9a082a9&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=3900&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Ff73f81f0-e653-405a-b115-d20bc6d11501%2FUntitled.png?table=block&id=cbf9e11a-c85a-4095-93b5-d439e9a082a9&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=3900&userId=&cache=v2)

                                                                그럼 이런 화면이 됩니다!👇

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F24ea41cc-aca6-40ed-a811-705ae6f65037%2FUntitled.png?table=block&id=07d7af32-b418-412b-8e19-6338f5fd3902&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=1410&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F24ea41cc-aca6-40ed-a811-705ae6f65037%2FUntitled.png?table=block&id=07d7af32-b418-412b-8e19-6338f5fd3902&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=1410&userId=&cache=v2)

    이 화면 어디서 많이 보지 않았나요?

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F228daabf-861b-4906-a20d-983c38c59d61%2Fiphone__1.png?table=block&id=51451f19-10ca-4678-9f2d-7aea9869b385&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=8190&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F228daabf-861b-4906-a20d-983c38c59d61%2Fiphone__1.png?table=block&id=51451f19-10ca-4678-9f2d-7aea9869b385&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=8190&userId=&cache=v2)

    바로 아이폰에서 가장 많이 쓰이는 이런 화면입니다. 

    4. 'Root View Controller' 을 `더블클릭`해서 제목 입력하기

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fff743189-05eb-4f7c-9b0d-7fed2312f8d6%2FUntitled.png?table=block&id=8e99cde7-7245-4e44-9299-4d447b9748eb&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=1490&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fff743189-05eb-4f7c-9b0d-7fed2312f8d6%2FUntitled.png?table=block&id=8e99cde7-7245-4e44-9299-4d447b9748eb&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=1490&userId=&cache=v2)

    5. 섹션(section)과 로우(row)에 대해서 잠깐 알아보기

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F848f651c-4c9d-4176-9808-f4c77c53a900%2Fiphone__2.jpg?table=block&id=b12851b2-45c9-45af-9d06-a8b355cd9baf&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=8190&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F848f651c-4c9d-4176-9808-f4c77c53a900%2Fiphone__2.jpg?table=block&id=b12851b2-45c9-45af-9d06-a8b355cd9baf&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=8190&userId=&cache=v2)

    한 줄 한 줄을 `로우`라고 하고 `로우`를 삼삼오오 묶어놓은 걸 `섹션` 이라고 합니다! 그리고 한 로우에 해당하는 뷰는 `테이블뷰 셀` 이라고 합니다. 

    6. 로우 개수를 1개로 줄이기

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F649863b1-816a-4af0-b3ac-41cfdf8e6a65%2FUntitled.png?table=block&id=4969e765-5a5d-4ff8-9a1f-bcc2e288303a&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=5280&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F649863b1-816a-4af0-b3ac-41cfdf8e6a65%2FUntitled.png?table=block&id=4969e765-5a5d-4ff8-9a1f-bcc2e288303a&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=5280&userId=&cache=v2)

    7. 테이블뷰 셀의 Style 을 Basic 으로, Accessory를 Discloser Indicator로 선택하기

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fcb3e770a-c698-40e8-8c5b-6f64f4d1ce63%2FUntitled.png?table=block&id=114c6a67-7812-4023-a176-e730f8628861&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=5310&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fcb3e770a-c698-40e8-8c5b-6f64f4d1ce63%2FUntitled.png?table=block&id=114c6a67-7812-4023-a176-e730f8628861&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=5310&userId=&cache=v2)

    8. Title 을 `더블클릭`해서 이름 변경해주기

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F99aede5e-73bd-410f-b4e1-234e3b6f1555%2FUntitled.png?table=block&id=15b140cd-71c2-4151-838b-1b894c42b3b1&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=2130&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F99aede5e-73bd-410f-b4e1-234e3b6f1555%2FUntitled.png?table=block&id=15b140cd-71c2-4151-838b-1b894c42b3b1&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=2130&userId=&cache=v2)

    9. ⭐**[중요]** 컨트롤(`^`)을 누르고 테이블뷰 셀 드래그해서 연결하기 → Selection Segue → Show

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fc651e9a2-6aaf-4ee3-abe2-5d59124a5512%2F_2021-03-28__11.42.08.png?table=block&id=5335b01b-adb8-4953-88f2-6dc2235ea3ed&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=4070&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fc651e9a2-6aaf-4ee3-abe2-5d59124a5512%2F_2021-03-28__11.42.08.png?table=block&id=5335b01b-adb8-4953-88f2-6dc2235ea3ed&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=4070&userId=&cache=v2)

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F258084fb-6bfd-4941-9658-3e2be6a2883c%2FUntitled.png?table=block&id=2a3ad915-3f11-4448-b555-0a70dbe3efe5&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=3990&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F258084fb-6bfd-4941-9658-3e2be6a2883c%2FUntitled.png?table=block&id=2a3ad915-3f11-4448-b555-0a70dbe3efe5&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=3990&userId=&cache=v2)

    10. 스토리보드 진입점(Storyboard Entry Point)을 내비게이션 컨트롤러로 옮겨서 첫 화면이 되도록 만들기

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fd4b2f41e-2302-43ef-ac93-9347779a578f%2F_1.jpg?table=block&id=1eb75251-ded8-447f-8c95-f87d600410fa&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=2560&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fd4b2f41e-2302-43ef-ac93-9347779a578f%2F_1.jpg?table=block&id=1eb75251-ded8-447f-8c95-f87d600410fa&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=2560&userId=&cache=v2)

    - 실행화면 확인해보기

        ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F20675bd0-5c16-4799-a5ab-bd432786238d%2FUntitled.png?table=block&id=94985bea-7a76-4358-894a-37c118bfab8b&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=5480&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F20675bd0-5c16-4799-a5ab-bd432786238d%2FUntitled.png?table=block&id=94985bea-7a76-4358-894a-37c118bfab8b&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=5480&userId=&cache=v2)

## 06. Swift 문법 - 상속

- 10) 상속(inheritance)

    상속은 우리가 코드를 덜 쓰게 해주는 무척이나 고마운 기능입니다!

    우리가 중국집을 운영한다고 생각해봅시다!

    메뉴에 짜장면도 있고 간짜장도 있고 삼선짜장도 있습니다. 모두 짜장을 이용한 음식이기 때문에 만드는 방법의 대부분은 같을 겁니다. 각 메뉴의 특징이 들어가는 일부분만 다르겠죠. 짜장면 소스를 만드는 데 간짜장은 그 자리에서 짜장에 양파를 더 넣고 볶아서 만들고, 삼선짜장은 간짜장 소스에 해물을 넣고 볶아서 만듭니다.  

    그럼 이 요리들에 대한 레시피를 적을 때 어떻게 적어야 할까요? 짜장면을 만드는 방법은 일단 자세하게 적어줍니다. 그러면 간짜장 레시피를 적을 때는 '짜장면을 만드는데, 짜장 소스에 양파를 더 넣고 볶는다' 라고 간단하게 적을 수 있지 않을까요? 물론 간짜장을 만드는 방법을 짜장면 만드는 방법처럼 자세하게 적어줄 수도 있지만, 무척이나 귀찮은 일이 될 겁니다. 

    Swift에서도 그런 귀찮음을 줄이기 위해서 `상속`이란 기능을 넣었습니다. 아래 코드를 한 번 볼까요?

    ```swift
    import UIKit

    class ViewController: UIViewController { //: UIViewController를 상속받습니다.

        @IBOutlet weak var imageView: UIImageView!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
        }

        @IBAction func moveButtonClicked(_ sender: Any) {
            UIView.animate(withDuration: 0.5) {
                self.imageView.frame = CGRect(x: 20, y: 200, width: 237, height: 235)
            }
        }
        
    }
    ```

    UIViewController 를 상속받아서 클래스를 만들면, 그 클래스는 기본적으로 UIViewController 가 동작하는 방법 그대로 동작합니다. 그 상태에서 아주 약간의 코드를 수정해 우리가 원하는 대로 동작하게 만듭니다. 모든 코드를 다 작성하는 것보다 훨씬 간단하겠죠?

    앞의 짜장면 예시로 잠깐 돌아가 볼까요?
    <br>
    `짜장면`이라는 클래스가 있습니다. `간짜장`이라는 클래스는 `짜장면` 클래스를 상속받아서 만들어진다면, `짜장면`은 `간짜장`의 상위 클래스(Super Class)이고, `간짜장`은 `짜장면`의 하위 클래스(Sub Class)라고 합니다. 
    <br>
    상속에는 몇 가지 규칙이 있습니다.

    1. 구조체(struct) 말고 클래스(class)끼리만 상속이 가능합니다!

    2. 상위 클래스의 함수를 수정하는 것을 `override` 라고 하고, 해당 함수 앞에 `override` 라고 써야 합니다.

    ```swift
    import UIKit

    class ViewController: UIViewController {

        @IBOutlet weak var imageView: UIImageView!
        
        override func viewDidLoad() { // override를 앞에 붙여야합니다. 
            super.viewDidLoad() // 상위클래스의 viewDidLoad 함수를 호출한다는 의미
            
            self.view.backgroundColor = UIColor.blue // 배경화면이 파란색이 되게 수정!
        }

        @IBAction func moveButtonClicked(_ sender: Any) {
            UIView.animate(withDuration: 0.5) {
                self.imageView.frame = CGRect(x: 20, y: 200, width: 237, height: 235)
            }
        }
        
    }
    ```

    3. 한 클래스는 하나의 클래스만 상속이 가능합니다. ~~짜장면이면서 짬뽕일 수 없다는 얘깁니다.~~ 

    - 그럼 짬짜면은요...?

        ```swift
        class 짬짜면 { // 반반 나눠 담는 그릇을 만든다고 생각해야죠
        		var jjajang = 짜장면()
        		var jjampong = 짬뽕()
        }
        ```

        짬짜면은 짬뽕이랑 짜장면 둘 다를 분리된 한 그릇에 담는 것입니다. 따로 만들어서 같은 곳에 담았을 뿐이죠!

        둘 다 상속받았다면... 그건 짜장면과 짬뽕이 섞여있는... 끔찍한 혼종...
<br>
    지금까지 배운 UIButton, UIImageView, UILabel, UISwitch 등등은 모두 UIView 를 상속받습니다. 마찬가지로 UITableViewController, UINavigationController 도 UIViewController 를 상속받아서 만들어져 있습니다! 

## 07. Swift 문법 - 클로져

- 11) 클로져(closure)

    가끔 함수를 쓰다 보면 함수에 `->` 라는게 들어있는 변수를 넣어달라고 합니다. 

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F9af30910-b048-4d4b-9e11-fd5fc0fc395e%2FUntitled.png?table=block&id=84f18d82-ab9d-4e88-a65f-f20d27d1037b&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=2130&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F9af30910-b048-4d4b-9e11-fd5fc0fc395e%2FUntitled.png?table=block&id=84f18d82-ab9d-4e88-a65f-f20d27d1037b&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=2130&userId=&cache=v2)

    이걸 클로져 라고 부르는데, 다른 함수를 해당 함수에 변수로 집어넣는 방법입니다.

    애니메이션을 생각해보면, Swift는 어떻게 움직여야 하는지 모르고 있기 때문에 우리가 규칙을 넣어야 했습니다. 지금까지는 `imageView` 의 `frame` 을 바꾸었죠. 그리고 바뀌는 그 룰을 함수의 형태로 집어넣고 있었습니다. 

    그래서 종종 애니메이션이라든지 네트워크 통신에서 결과물을 어떻게 처리할지 등의 규칙을 클로져 라는 방식으로 집어넣게 되어있습니다. 

    너무 어렵게 생각하지 말고, 함수를 작성하는데 저런 변수가 나오면 자신 있게 엔터키를 눌러줍시다!

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F30e4c40a-dab4-4f3c-87c8-c31ad330b534%2FUntitled.png?table=block&id=897150c4-aa20-41e4-97d8-c695bedf95be&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=1970&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F30e4c40a-dab4-4f3c-87c8-c31ad330b534%2FUntitled.png?table=block&id=897150c4-aa20-41e4-97d8-c695bedf95be&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=1970&userId=&cache=v2)

    Xcode는 굉장히 직관적으로 code 부분을 작성해야 한다고 보여줍니다. 그러면 우리는 살포시 저 안에 코드를 넣으면 되겠죠?
