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