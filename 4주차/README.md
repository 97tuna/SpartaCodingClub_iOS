# SpartaCodingClub_iOS_강의노트_1주차

## **01. 4주차 오늘 배울 것**

- 1) 라이브러리 추가하는 법

    라이브러리를 이용해서 보다 쉽게 코드 작성해보기

    - 라이브러리: 다른 프로그래머들이 작성해놓은 코드의 묶음을 의미하며, 이를 이용하면 보다 쉽게 코드를 작성할 수 있습니다.
    - 라이브러리 이용하기

        : 사용할 라이브러리를 import 하고, 코드를 작성해 사용합니다.

        ```swift
        import UIKit
        import Alamofire

        class ViewController: UIViewController {

            override func viewDidLoad() {
                super.viewDidLoad()
                
                AF.request("https://api.thecatapi.com/v1/images/search").responseString { (resp) in
                    print(resp.value ?? "")
                }
            }
        }
        ```

- 2) API 서버와 통신하는 법

    데이터를 주고받을 때 규칙을 의미하는 API를 이용해 서버와 통신해보기

    - API: 클라이언트가 서버에 데이터를 요청할 때 미리 정해져있는 방법을 말합니다. 
    ex) 서버의 주소, 요청 방식, 응답 방식 등
    - GET 방식: 서버에서 데이터를 가져오는 방법을 이야기합니다.
        - [코드 미리보기]

            ```swift
            import UIKit
            import Alamofire
            import SwiftyJSON

            class ViewController: UIViewController {
                
                override func viewDidLoad() {
                    super.viewDidLoad()
                    
                    AF.request("http://spartacodingclub.shop/review").responseJSON { (response) in
                        var json = JSON(response.value!)
                        print(json["reviews"][0])
                    }
                }
            }
            ```

    - POST 방식: 서버에 데이터를 보내는 방법을 이야기합니다.
        - [코드 미리보기]

            ```swift
            var parameters = [
                "title_give": "너무나도 쉬운 iOS 개발",
                "author_give": "주정한",
                "review_give": "재밌어요!"
            ]

            AF.request("http://spartacodingclub.shop/review", method: .post, parameters: parameters).responseJSON { (response) in
                var json = JSON(response.value!)
                print(json)
            }
            ```

    - 예시에서는 Alamofire 라이브러리와 데이터를 Json 형식으로 바꿔주는 SwiftyJSON 를 이용해 서버와 통신해보겠습니다!

- 3) UITableView(dynamic)와 UICollectionView

    서버에서 데이터를 가져오는 경우 유용한 UITableView(dynamic)과 여러 개의 사진들을 동시에 보여줄 때 유용한 UICollectionView 에 대해 알아보기

    - UITableView(dynamic): 사용자가 미리 지정한 섹션과 로우가 아닌, 서버에서 데이터를 받은 값대로 섹션과 로우를 생성하는 방법입니다.
    - UICollectionView: 한 줄에 하나의 뷰가 들어가는 테이블뷰와 다르게, 한 줄에 여러 칸이 들어가는 뷰를 말합니다.
        - 예시

            ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F8b5f989b-917a-4c6f-bcf5-d7ed352875a1%2FIMG_9350.png?table=block&id=f6ad5cc9-5d8a-4d79-a422-92dc0285cf2c&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=580&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F8b5f989b-917a-4c6f-bcf5-d7ed352875a1%2FIMG_9350.png?table=block&id=f6ad5cc9-5d8a-4d79-a422-92dc0285cf2c&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=580&userId=&cache=v2)

            [사진 출처] 인스타그램

## 02. 라이브러리 추가하기

- 4) 라이브러리(Library)란?

    라이브러리는 선지자(?)들이 우리를 위해 남겨 놓은 소중한 유산입니다. 다른 프로그래머들이 만들었던 코드들의 묶음을 `라이브러리` 라고 하며, 우리는 이 라이브러리를 이용해서 훨씬 간편하게 프로젝트를 진행해 볼 겁니다. 

    iOS 동네에서는 `프레임워크`, `패키지` 라고 불리기도 합니다!

- 5) 라이브러리 추가하기

    1. 프로젝트 만들기

    4주 차 폴더인 week04 폴더에 `BookReview` 라는 프로젝트를 만들어줍니다.

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F4061fd83-1c3d-447a-99ac-0029f0bd4448%2FUntitled.png?table=block&id=50e8069f-c529-4ed9-a4f8-0aa4a0ca34b1&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=6050&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F4061fd83-1c3d-447a-99ac-0029f0bd4448%2FUntitled.png?table=block&id=50e8069f-c529-4ed9-a4f8-0aa4a0ca34b1&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=6050&userId=&cache=v2)

    2. File → Swift Packages → Add Package Dependencies... 선택하기

    선택하면 아래와 같은 화면이 나옵니다!

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fff15fbf9-b50a-4c83-947e-38c9d89ed606%2FUntitled.png?table=block&id=caf986ef-5d50-41b1-9f75-d91fb57272b0&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=6050&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fff15fbf9-b50a-4c83-947e-38c9d89ed606%2FUntitled.png?table=block&id=caf986ef-5d50-41b1-9f75-d91fb57272b0&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=6050&userId=&cache=v2)

    3. 다음 URL을 복붙해주고 Next → Next → Finish

    ```swift
    https://github.com/Alamofire/Alamofire.git
    ```

    오잉 쉽죠?

- 6) 라이브러리 사용하기

    0. 라이브러리 사용법 읽기

    [Alamofire/Alamofire](https://github.com/Alamofire/Alamofire/blob/master/Documentation/Usage.md#introduction)

    1. 라이브러리를 사용할 곳으로 이동

    2. import UIKit 밑에 import `패키지명` 작성

    ```swift
    import UIKit
    import Alamofire //Alamofire 패키지를 쓰겠다는 선언!

    class ViewController: UIViewController {

        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
        }
    }
    ```

    3. 패키지 사용하기!

    ```swift
    import UIKit
    import Alamofire

    class ViewController: UIViewController {

        override func viewDidLoad() {
            super.viewDidLoad()
            
            AF.request("https://api.thecatapi.com/v1/images/search").responseString { (resp) in
                print(resp.value ?? "")
            }
        }
    }
    ```

    - 결과 확인하기

        ```swift
        [
            {
                "breeds": [],
                "id": "MTc3MjU5NQ",
                "url": "https://cdn2.thecatapi.com/images/MTc3MjU5NQ.png",
                "width": 571,
                "height": 407
            }
        ]
        ```

    라이브러리를 이용했을 때와 이용하지 않았을 때 코드의 차이점을 한 번 볼까요?

    - Alamofire를 이용했을 때 code

    ```swift
    AF.request("https://api.thecatapi.com/v1/images/search").responseString { (resp) in
        print(resp.value ?? "")
    }
    ```

    - Alamofire를 이용하지 않았을 때 code

    ```swift
    var request = URLRequest(url: URL(string: "https://api.thecatapi.com/v1/images/search")!)
    var task = URLSession(configuration: .default).dataTask(with: request) { (data, response, error) in
        
        DispatchQueue.main.async {
            print(String(data: data!, encoding: .utf8) ?? "")
        }
    }

    task.resume()
    ```

    라이브러리를 사용하니까 더 직관적이고 코드도 짧아졌죠?

- [참고]

    iOS 에는 라이브러리를 추가하는 방식이 3가지가 있습니다. iOS 생태계가 발전해나가면서 각각의 장점을 가진 라이브러리 관리 방법이 생겼습니다. 

    - Swift Package Manager: 별도의 프로그램 없이 Swift 에서 가장 쉽게 적용할 수 있는 방식!
    - Cocoapods: 역사와 전통을 자랑하는 방식입니다. 라이브러리들이 가장 많이 지원하는 방식입니다.
    - Carthage: 중앙화된 저장소로 운영되는 Cocoapods와는 달리 분산된 저장소를 지원하는 방식입니다.

    요즘 트렌드는 Swift Package Manager 로 옮겨가고 있는 추세지만, 아직 많은 라이브러리들이 Cocoapods만을 지원하는 경우가 있습니다. 

    필요한 경우 아래 사이트에 접속 후 따라 하면 쉽게 적용할 수 있습니다.

    [CocoaPods.org](https://cocoapods.org)