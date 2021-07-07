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

 ## 03. API 서버와의 통신

- 7) 클라이언트와 서버

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F53e7af22-4a8d-459b-a20a-095853a4baf7%2FAPI_6.jpg?table=block&id=1814405e-cbee-434a-8ed6-5656b895a6f4&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=1700&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F53e7af22-4a8d-459b-a20a-095853a4baf7%2FAPI_6.jpg?table=block&id=1814405e-cbee-434a-8ed6-5656b895a6f4&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=1700&userId=&cache=v2)

    아이폰은 하나의 컴퓨터입니다. 외부로부터 데이터를 받아서 보여주고, 사용자의 입력을 받아서 외부로 데이터를 넘겨주는 일을 합니다. 이때 아이폰을 클라이언트라고 하고, 데이터를 주고받은 외부의 컴퓨터를 서버라고 표현합니다. 

    자, 우리가 식당에 방문했다고 합시다. 우리는 고객(client)이겠죠? 그리고 식당에서 일하는 분을 보통 종업원(server)라고 합니다. 우리는 메뉴에 있는 음식을 요청하고, 식당은 음식을 조리해서 우리에게 제공해 주죠! 이때 음식을 데이터라고 생각하면, 클라이언트와 서버와의 관계를 상상해 볼 수 있겠죠?

    API는 클라이언트가 서버에 데이터를 요청할 때 미리 정해져있는 방법을 말합니다. 서버의 주소라든지, 요청 방식이라든지, 응답 방식 등의 규칙들이 있습니다. 

    다시 식당에 대입해보면, 손님은 식당에 있는 메뉴만을 요청해야 합니다! 메뉴에도 없는 음식을 주문하면 식당은 음식을 제공해 주지 못할 겁니다. 이 요청 방식을 맞춰서 주문하는 것이 가장 핵심이라고 할 수 있죠!

- 8) Alamofire 와 SwiftyJSON 로 데이터 통신 해보기
    - Alamofire는 Swift를 위한 Swift로 쓰인 네트워크 라이브러리 입니다!

        쉽고 간결하며, 무척 다양한 기능을 제공합니다.

        ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F692b4b24-e17a-47ea-b2fa-d1c370baa077%2FUntitled.png?table=block&id=65adcbd3-2f1a-483c-a787-281d026e9583&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=1700&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F692b4b24-e17a-47ea-b2fa-d1c370baa077%2FUntitled.png?table=block&id=65adcbd3-2f1a-483c-a787-281d026e9583&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=1700&userId=&cache=v2)

        [Alamofire/Alamofire](https://github.com/Alamofire/Alamofire)

    - 서버의 결과로 받은 JSON 데이터를 Swift 에서 깔끔하게 사용할 수 있는 라이브러리인 SwiftyJSON 입니다!

        [SwiftyJSON/SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON)

        - SwiftyJSON 도 Swift Package Mangaer 에 추가해주기

            ```
            https://github.com/SwiftyJSON/SwiftyJSON.git
            ```

            ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F36b776fe-ac07-48e4-8203-d67184ca3531%2FUntitled.png?table=block&id=9e315559-52be-46d5-bcb4-5d83068a1eea&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=6050&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F36b776fe-ac07-48e4-8203-d67184ca3531%2FUntitled.png?table=block&id=9e315559-52be-46d5-bcb4-5d83068a1eea&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=6050&userId=&cache=v2)

    1. 프로젝트 설정에서 보안 설정 변경하기

    `Info.plist` 파일에 `App Transport Security Settings` 를 추가하고 `Allow Arbitrary Loads` 를 YES로 선택한 후 추가해줍니다. 

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F2b48582e-65d1-4bef-8ab5-55abf1f75885%2FUntitled.png?table=block&id=efc7288e-dac7-44ed-b8f8-6261ce927bc0&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=6050&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F2b48582e-65d1-4bef-8ab5-55abf1f75885%2FUntitled.png?table=block&id=efc7288e-dac7-44ed-b8f8-6261ce927bc0&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=6050&userId=&cache=v2)

    보안 설정을 왜 바꾸나요?

    애플은 iOS 9부터 무분별한 http 통신의 사용을 지양하고, 더 안전한 https 통신을 유도하기 위해 기본값으로 앱에서 http 통신을 막아뒀습니다. 하지만 여전히 http 통신을 사용하는 API 가 많고, 우리가 사용해 볼 API도 http 통신을 사용하기 때문에 보안 설정을 낮춰 줄게요!

    2. 데이터 가져오기(GET)

    API 주소(GET 요청) → [http://spartacodingclub.shop/review](http://spartacodingclub.shop/review)

    **어떤 기능을 수행하는 API일까요?
    웹페이지를** 보고, 생각해봅시다! [(링크)](http://spartacodingclub.shop/bookreview)

    크롬브라우져 JSONView 설치하기 ([링크](https://chrome.google.com/webstore/detail/jsonview/chklaanhfefbnpoihckbnefhakgolnmc))

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

    3. 데이터 보내기(post)

    API 주소(POST 요청) → [http://spartacodingclub.shop/review](http://spartacodingclub.shop/review) 

    보내줄 데이터와 그 키값입니다!
    title_give : 책 제목
    author_give: 저자 이름
    review_give: 리뷰 내용

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