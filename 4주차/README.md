# SpartaCodingClub_iOS_강의노트_1주차

<p align="center">
    <img width="300px" src="https://user-images.githubusercontent.com/50114556/124816194-2f3b2280-dfa3-11eb-8552-5de7f52597fa.gif">
    <img width="300px" src="https://drive.google.com/uc?export=view&id=12SQ5Ntaqko1K7tLzBaf8dZ3QNibqypNR">
</p>
<p align="center">
    BookReviewApp(좌)ㅤㅤLinkMemoApp(우)
</p>
<br>

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

## 04. 테이블뷰로 API 실습 1 - 모두의 책리뷰 앱 GET 적용하기!

앞에서 배운 API의 GET 과 POST 방법을 모두의 책리뷰 앱을 이용해 적용해볼게요! 천천히 함께 해볼까요?

- 9) 테이블뷰(UITableView) 동적인(dynamic) 방법

    정적인(static) 방법과 차이가 무엇일까요?

    정적인 방법은 Storyboard 에 그린 섹션과 로우 그대로 보여줍니다. 하지만 우리는 서버에서 데이터를 받아서 그 개수만큼, 그 데이터대로 보여줘야겠죠? 이렇게 동적으로 생성한다고 해서 동적인(dynamic) 방법이라고 합니다. 

    - 스토리보드 세팅

        1. BookReview 프로젝트의 Main.storyboard 에 아래처럼 그려주기

        (UINavigationController)

        ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F7bf0a458-4c60-4057-9485-ddf89d29a9ee%2Fbookreview_1.jpg?table=block&id=8d0bac34-9224-48ae-bff3-fd1412656225&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=4540&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F7bf0a458-4c60-4057-9485-ddf89d29a9ee%2Fbookreview_1.jpg?table=block&id=8d0bac34-9224-48ae-bff3-fd1412656225&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=4540&userId=&cache=v2)

        Navigation Controller 에 `entry point` 주는 거 잊지 마세요!

        2. 테이블뷰 셀스타일 Subtitle 로 변경하기

        ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F9beba73d-454a-4993-b3b7-c7e899c3fc12%2Fsubtitle_1.jpg?table=block&id=c0c2eb92-990a-478c-8e7c-73a4faa20900&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=3500&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F9beba73d-454a-4993-b3b7-c7e899c3fc12%2Fsubtitle_1.jpg?table=block&id=c0c2eb92-990a-478c-8e7c-73a4faa20900&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=3500&userId=&cache=v2)

        3. `ReviewTableViewController` 클래스 파일 생성하기

        ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F4b263496-3c1e-4550-91a8-67fa15ce0825%2FClass_1.jpg?table=block&id=5a062b0c-3dad-4bcf-a4bd-6882a46b2cda&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=2980&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F4b263496-3c1e-4550-91a8-67fa15ce0825%2FClass_1.jpg?table=block&id=5a062b0c-3dad-4bcf-a4bd-6882a46b2cda&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=2980&userId=&cache=v2)

        4. 스토리보드에 테이블뷰컨트롤러에 `ReviewTableViewController` 연결해주기

        ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fd9e58d1a-4576-467c-9d97-b1ae58f13e35%2FUntitled.png?table=block&id=f5ff1cb0-8ccf-45a4-a181-3dd486564d3b&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=3580&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fd9e58d1a-4576-467c-9d97-b1ae58f13e35%2FUntitled.png?table=block&id=f5ff1cb0-8ccf-45a4-a181-3dd486564d3b&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=3580&userId=&cache=v2)

        스토리보드 세팅 완료입니다!

    1. 먼저 Cell 의 identifier 에 `ReviewCell` 이라고 등록해 주기

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F177e6ba8-f59d-460d-a92a-c4246b946719%2FUntitled.png?table=block&id=5ac8de04-12cf-474d-ad24-81d8ed6fb66d&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=3420&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F177e6ba8-f59d-460d-a92a-c4246b946719%2FUntitled.png?table=block&id=5ac8de04-12cf-474d-ad24-81d8ed6fb66d&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=3420&userId=&cache=v2)

    2. `ReviewTableViewController` 에 결과값을 받아줄 변수 넣어주기

    ```swift
    import UIKit
    import Alamofire  // 추가
    import SwiftyJSON // 추가

    class ReviewTableViewController: UITableViewController {

        private var reviews: [JSON] = []
    		
    		...
    		
    		override func viewDidLoad() {
    		...
    ```

    3. 화면이 뜨기 직전에 API 서버에 데이터 요청하기

    ```swift
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
                //화면이 뜨려고 하기 직전에 요청하기
        AF.request("http://spartacodingclub.shop/review").responseJSON { (response) in
                        //요청에 실패하면 nil 이 들어올 수 있으므로!
            if var value = response.value {
                self.reviews = JSON(value)["reviews"].arrayValue
                                
                                //테이블뷰 새로고침
                self.tableView.reloadData()
            }
        }
    }
    ```

    4. 테이블뷰에 데이터 연결하기

    ```swift
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //row 의 개수는 받아온 데이터의 개수
        return reviews.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "ReviewCell", for: indexPath)
        // 위에서 identifier를 ReviewCell이라고 등록한 셀 값을 가져옵니다

        var review = reviews[indexPath.row]
        
        cell.textLabel?.text = "\(review["author"].stringValue) - \(review["title"].stringValue)"
        cell.detailTextLabel?.text = "\(review["review"].stringValue)"
        
        return cell
    }
    ```

    - 전체 코드

        ```swift
        import UIKit
        import Alamofire
        import SwiftyJSON

        class ReviewTableViewController: UITableViewController {

            private var reviews: [JSON] = []
            
            override func viewDidLoad() {
                super.viewDidLoad()

                // Uncomment the following line to preserve selection between presentations
                // self.clearsSelectionOnViewWillAppear = false

                // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
                // self.navigationItem.rightBarButtonItem = self.editButtonItem
            }
            
            override func viewWillAppear(_ animated: Bool) {
                super.viewWillAppear(animated)
                
        				//화면이 뜨려고 하기 직전에 요청하기
                AF.request("http://spartacodingclub.shop/review").responseJSON { (response) in
        						//요청에 실패하면 nil 이 들어올 수 있으므로!
                    if var value = response.value {
                        self.reviews = JSON(value)["reviews"].arrayValue
        								
        								//테이블뷰 새로고침
                        self.tableView.reloadData()
                    }
                }
            }

            // MARK: - Table view data source
            
            override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        				//row 의 개수는 받아온 데이터의 개수
                return reviews.count
            }

            
            override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                var cell = tableView.dequeueReusableCell(withIdentifier: "ReviewCell", for: indexPath)
                
                var review = reviews[indexPath.row]
                
                cell.textLabel?.text = "\(review["author"].stringValue) - \(review["title"].stringValue)"
                cell.detailTextLabel?.text = "\(review["review"].stringValue)"

                return cell
            }
        }
        ```

## 05. 테이블뷰로 API 실습 2 - 모두의 책리뷰 앱 POST 적용하기!

- 10) 입력창 만들어서 데이터 보내기

    데이터를 가져오는 걸 해봤으면 보내는 것도 해봐야겠죠?

    - 스토리보드 세팅

        1. 테이블뷰 컨트롤러의 `Navigation Item` 에 `Bar Button Item` 추가하기

        ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F14e3023b-ae46-4052-b98f-82f04c271021%2FUntitled.png?table=block&id=926bd2c4-1ccd-47f4-8cca-ed6903a764c7&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=3170&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F14e3023b-ae46-4052-b98f-82f04c271021%2FUntitled.png?table=block&id=926bd2c4-1ccd-47f4-8cca-ed6903a764c7&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=3170&userId=&cache=v2)

        2. 테이블뷰 오른쪽 상단에 드래그해서 넣기

        ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F197755a9-42ce-4e33-9b50-54c9fa0557b9%2F_2021-04-01__12.16.58.png?table=block&id=ef8d2eb7-6832-4c9f-87ae-416a7e40a138&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=2760&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F197755a9-42ce-4e33-9b50-54c9fa0557b9%2F_2021-04-01__12.16.58.png?table=block&id=ef8d2eb7-6832-4c9f-87ae-416a7e40a138&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=2760&userId=&cache=v2)

        3. System Item → Add 선택하기

        ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F56804681-7605-4b5a-9337-d0685cb94d2b%2FUntitled.png?table=block&id=32dd7207-3421-4138-869e-5009fc2a237a&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=1550&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F56804681-7605-4b5a-9337-d0685cb94d2b%2FUntitled.png?table=block&id=32dd7207-3421-4138-869e-5009fc2a237a&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=1550&userId=&cache=v2)

        4. 유저로부터 데이터를 입력받을 TextField가 있는 UIViewController 추가하고 그려주기

        ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fe0853922-2cdd-4179-8655-af9ff6022be4%2FUntitled.png?table=block&id=b0f8a311-59ad-4c1e-8a2d-c0b69616972c&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=3800&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fe0853922-2cdd-4179-8655-af9ff6022be4%2FUntitled.png?table=block&id=b0f8a311-59ad-4c1e-8a2d-c0b69616972c&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=3800&userId=&cache=v2)

        5. ⭐**[중요]** `+` 버튼이랑 새로 만든 화면이랑 연결하기(`Ctrl` + 드래그 → show)

        ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F5a429f4d-c214-4739-8cad-afcbf3d89418%2F_2021-04-01__12.21.56.png?table=block&id=1fd9b0b7-7196-4134-b0d7-0feb821def56&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=3830&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F5a429f4d-c214-4739-8cad-afcbf3d89418%2F_2021-04-01__12.21.56.png?table=block&id=1fd9b0b7-7196-4134-b0d7-0feb821def56&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=3830&userId=&cache=v2)

        6. 입력받는 화면에도 Bar Button 넣고, System Item → Done

        ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F34efaea4-fbde-4ca7-83ab-785014779c91%2FUntitled.png?table=block&id=3077110d-093e-4c3d-b8aa-3c3ee9c509d4&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=3270&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F34efaea4-fbde-4ca7-83ab-785014779c91%2FUntitled.png?table=block&id=3077110d-093e-4c3d-b8aa-3c3ee9c509d4&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=3270&userId=&cache=v2)

        7. 입력받는 화면을 위한 ReviewWriteViewController를 만들기

        ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Feb43118f-7123-455f-b0a0-176928bf29b9%2FUntitled.png?table=block&id=fe524b2d-9c75-446a-8832-a45025fba8a7&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=2970&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Feb43118f-7123-455f-b0a0-176928bf29b9%2FUntitled.png?table=block&id=fe524b2d-9c75-446a-8832-a45025fba8a7&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=2970&userId=&cache=v2)

        8. 스토리보드와 ReviewWriteViewController 연결하기

          입력받는 화면에 `ReviewWriteViewController` 연결하고 @IBOutlet, @IBAction 연결하기

        ```swift
        import UIKit

        class ReviewWriteViewController: UIViewController {

            @IBOutlet weak var titleTextField: UITextField!
            @IBOutlet weak var authorTextField: UITextField!
            @IBOutlet weak var reviewTextField: UITextField!
            
            override func viewDidLoad() {
                super.viewDidLoad()

                // Do any additional setup after loading the view.
            }
            
            @IBAction func doneButtonClicked(_ sender: Any) {
                
            }
        }
        ```

        스토리보드 세팅 완료!

    유저가 Done 버튼을 누르면 텍스트 필드에서 입력값을 가져온 후 서버로 보내줍니다!

    ```swift
    @IBAction func doneButtonClicked(_ sender: Any) {
        var title = titleTextField.text ?? ""
        var author = authorTextField.text ?? ""
        var review = reviewTextField.text ?? ""
        
        //텍스트 필드 셋중에 하나라도 입력이 안되면
        if title.count == 0 || author.count == 0 || review.count == 0 {
            var alert = UIAlertController(title: "책리뷰", message: "모두 입력해주세요!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
            //경고창 띄워주기
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        var parameters = [
            "title_give": title,
            "author_give": author,
            "review_give": review
        ]

        AF.request("http://spartacodingclub.shop/review", method: .post, parameters: parameters).responseJSON { (response) in
            
            if var value = response.value {
                var json = JSON(response.value!)
                print(json)
                
                //입력 화면을 사라지게 하고, 테이블뷰로 돌아가기
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    ```

    - 전체코드

        ```swift
        import UIKit
        import Alamofire
        import SwiftyJSON

        class ReviewWriteViewController: UIViewController {
            
            @IBOutlet weak var titleTextField: UITextField!
            @IBOutlet weak var authorTextField: UITextField!
            @IBOutlet weak var reviewTextField: UITextField!
            
            override func viewDidLoad() {
                super.viewDidLoad()
                
                // Do any additional setup after loading the view.
            }
            
            @IBAction func doneButtonClicked(_ sender: Any) {
                var title = titleTextField.text ?? ""
                var author = authorTextField.text ?? ""
                var review = reviewTextField.text ?? ""
                
                //텍스트 필드 셋중에 하나라도 입력이 안되면
                if title.count == 0 || author.count == 0 || review.count == 0 {
                    var alert = UIAlertController(title: "책리뷰", message: "모두 입력해주세요!", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
                    //경고창 띄워주기
                    self.present(alert, animated: true, completion: nil)
                    return
                }
                
                var parameters = [
                    "title_give": title,
                    "author_give": author,
                    "review_give": review
                ]
                
                AF.request("http://spartacodingclub.shop/review", method: .post, parameters: parameters).responseJSON { (response) in
                    
                    if var value = response.value {
                        var json = JSON(response.value!)
                        print(json)
                        
                        //입력 화면을 사라지게 하고, 테이블뷰로 돌아가기
                        self.navigationController?.popViewController(animated: true)
                    }
                }
            }
        }
        ```

- 11) 테이블뷰 셀 꾸미기

    테이블의 셀도 내가 원하는 대로 커스터마이즈 할 수 있습니다!

    1. Table View Cell 의 style 을 Custom 으로 바꾸고 원하는 대로 cell 그리기

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fc53ce5df-9819-4280-a493-43e6e1d19a3a%2FUntitled.png?table=block&id=3a6ae0a1-f932-48ee-8a58-e2b9fda27149&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=3570&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fc53ce5df-9819-4280-a493-43e6e1d19a3a%2FUntitled.png?table=block&id=3a6ae0a1-f932-48ee-8a58-e2b9fda27149&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=3570&userId=&cache=v2)

    2. Table View Cell 을 위한 클래스 만들기

      여기서는 편의상 이름을 ReviewCell 로 하겠습니다!

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F4e250f5d-e5bb-49cd-8fdd-d98ab9017ed4%2FUntitled.png?table=block&id=0c0f8206-7aba-4ec3-8141-2df1bc955a43&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=2980&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F4e250f5d-e5bb-49cd-8fdd-d98ab9017ed4%2FUntitled.png?table=block&id=0c0f8206-7aba-4ec3-8141-2df1bc955a43&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=2980&userId=&cache=v2)

    3. 테이블뷰 셀을 ReviewCell 로 연결하고 @IBOulet 연결하기

    Assistant Editor를 켰는데 ReviewCell.Swift로 이동하지 않아요!

    이럴 경우에는 오토매틱을 클릭한 후 ReviewCell.swift를 선택해 주세요!

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F2c1e0e1e-1d9d-4741-817b-4871c5eaaed8%2FUntitled.png?table=block&id=12b6a60f-3067-4e39-a54a-748f5c7aa24a&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=3410&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F2c1e0e1e-1d9d-4741-817b-4871c5eaaed8%2FUntitled.png?table=block&id=12b6a60f-3067-4e39-a54a-748f5c7aa24a&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=3410&userId=&cache=v2)

    ```swift
    import UIKit

    class ReviewCell: UITableViewCell {

        @IBOutlet weak var titleLabel: UILabel!
        @IBOutlet weak var authorLabel: UILabel!
        @IBOutlet weak var reviewLabel: UILabel!
        
        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

            // Configure the view for the selected state
        }

    }

    ```

    4. ReviewTableViewController 수정하기

    ```swift
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    		//identifier 만 맞춰주면 됩니다!
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewCell", for: indexPath)
        
        var review = reviews[indexPath.row]
        //ReviewCell 안에 있는 변수 접근하려면 cell을 ReviewCell 로 캐스팅
        if var reviewCell = cell as? ReviewCell {
            reviewCell.titleLabel.text = review["title"].stringValue
            reviewCell.authorLabel.text = review["author"].stringValue
            reviewCell.reviewLabel.text = review["review"].stringValue
        }
        
        return cell
    }
    ```

    5. (셀 높이를 바꾼 경우만) Row Height에 셀 높이 값 넣어주기

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F62cbcbab-fba8-49a8-a51f-f2549ab947ce%2FUntitled.png?table=block&id=386aec6f-d57e-4f3f-9c93-a29e906fc0e9&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=3020&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F62cbcbab-fba8-49a8-a51f-f2549ab947ce%2FUntitled.png?table=block&id=386aec6f-d57e-4f3f-9c93-a29e906fc0e9&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=3020&userId=&cache=v2)

## 06. 컬렉션뷰 사용해보기

- 12) 컬렉션뷰란?

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F8b5f989b-917a-4c6f-bcf5-d7ed352875a1%2FIMG_9350.png?table=block&id=b452b548-4eca-4633-99ea-ff221ecff67d&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=580&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F8b5f989b-917a-4c6f-bcf5-d7ed352875a1%2FIMG_9350.png?table=block&id=b452b548-4eca-4633-99ea-ff221ecff67d&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=580&userId=&cache=v2)

    [사진 출처] 인스타그램

    컬렉션뷰는 이렇게 한 줄에 여러 칸이 들어가는 뷰를 말합니다. 테이블뷰는 한 줄에 뷰가 하나 들어갔었죠? 이처럼 한 줄에 여러 칸이 들어가다 보니 사진 같은 데이터를 한눈에 보여줄 수 있는 장점이 있습니다!

- 13) 프로젝트 세팅하기

    [memo.zip](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/75bf8212-9773-4ffb-b1e9-78439139780b/memo.zip)

    다운받아서 Assets.xcassets 에 넣습니다

    1. 프로젝트 이름을 LinkMemo 로 설정하기

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F19388c86-52a3-468d-a170-db2844724527%2FUntitled.png?table=block&id=1cb07fd0-3680-4269-9c8d-7be15b3f20da&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=6050&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F19388c86-52a3-468d-a170-db2844724527%2FUntitled.png?table=block&id=1cb07fd0-3680-4269-9c8d-7be15b3f20da&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=6050&userId=&cache=v2)

    2. Main.storyboard 에 Navigation Controller 를 넣어주고, 과감하게 오른쪽 테이블뷰 지우기

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F2f6a7c9b-c456-4c6d-8f60-fa83b2e7d51b%2FUntitled.png?table=block&id=f00ef5ca-04fe-4309-af88-d3a97accce6d&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=3530&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F2f6a7c9b-c456-4c6d-8f60-fa83b2e7d51b%2FUntitled.png?table=block&id=f00ef5ca-04fe-4309-af88-d3a97accce6d&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=3530&userId=&cache=v2)

    3. CollectionView Controller 를 추가하기

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F8e3c864f-d58b-4be1-a39f-ee29856efc0a%2FUntitled.png?table=block&id=ed0529d1-de58-4553-92e3-7a419abc7d08&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=3170&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F8e3c864f-d58b-4be1-a39f-ee29856efc0a%2FUntitled.png?table=block&id=ed0529d1-de58-4553-92e3-7a419abc7d08&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=3170&userId=&cache=v2)

    4. ⭐**[중요]** 내비게이션 컨트롤러와 컬렉션뷰 컨트롤러 연결해주기

      Relationship Segue → root view controller

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F1172ef6f-8ab6-42fe-a726-30b67fc9a740%2F_2021-04-01__2.21.19.png?table=block&id=243f8619-c010-43eb-a31d-3c19a9424496&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=960&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F1172ef6f-8ab6-42fe-a726-30b67fc9a740%2F_2021-04-01__2.21.19.png?table=block&id=243f8619-c010-43eb-a31d-3c19a9424496&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=960&userId=&cache=v2)

    5. Collection View Cell 의 identifier 를 `MemoCell` 으로 설정하기

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fc53baa88-f96f-4722-9abf-6aa55da355aa%2FUntitled.png?table=block&id=1451a3fd-fb49-4477-9070-5170c0eca8ab&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=2800&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fc53baa88-f96f-4722-9abf-6aa55da355aa%2FUntitled.png?table=block&id=1451a3fd-fb49-4477-9070-5170c0eca8ab&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=2800&userId=&cache=v2)

    6. Collection View Cell 에 이미지뷰를 넣고 컨스트레인트 설정하기

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Ffdaa5dd6-8147-4646-8779-ad4187579c36%2FUntitled.png?table=block&id=e320246b-6c59-4a48-b637-eba146bd4099&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=6000&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Ffdaa5dd6-8147-4646-8779-ad4187579c36%2FUntitled.png?table=block&id=e320246b-6c59-4a48-b637-eba146bd4099&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=6000&userId=&cache=v2)

    7. `MemoCollectionViewController` 클래스 생성하기

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F1f898a87-e404-41c0-8b17-cc3921431249%2FUntitled.png?table=block&id=cf888b68-54fd-4778-b655-1855cd5b0452&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=2960&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F1f898a87-e404-41c0-8b17-cc3921431249%2FUntitled.png?table=block&id=cf888b68-54fd-4778-b655-1855cd5b0452&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=2960&userId=&cache=v2)

    8. `MemoCell` 만들어주기

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F4756a203-2874-4bf6-9346-933d88689435%2FUntitled.png?table=block&id=9a934c3e-8679-498a-b83b-347c8606b234&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=2970&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F4756a203-2874-4bf6-9346-933d88689435%2FUntitled.png?table=block&id=9a934c3e-8679-498a-b83b-347c8606b234&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=2970&userId=&cache=v2)

    9. `MemoCollectionViewController` 와 `MemoCell` 를 각각 스토리보드와 연결하기

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F938e4ee7-abda-4f93-9bf3-d60250bea201%2FUntitled.png?table=block&id=24f4fa3c-de18-48d8-b247-7c16fe0e85a7&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=2880&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F938e4ee7-abda-4f93-9bf3-d60250bea201%2FUntitled.png?table=block&id=24f4fa3c-de18-48d8-b247-7c16fe0e85a7&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=2880&userId=&cache=v2)

    10. `MemoCell` 에 imageView를 @IBOutlet 으로 연결하기

    11. Info.plist 에 `App Transport Security Settings` 추가하고, `Allow Arbitrary Loads` Yes로 설정하기

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fc0d9041f-fe2a-4259-88b1-3319a216de08%2FUntitled.png?table=block&id=7f8cb4fe-c11a-494f-9315-ff78dcbfbdeb&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=2350&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fc0d9041f-fe2a-4259-88b1-3319a216de08%2FUntitled.png?table=block&id=7f8cb4fe-c11a-494f-9315-ff78dcbfbdeb&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=2350&userId=&cache=v2)

    12. 프로젝트에 라이브러리 추가

    - Alamofire

    ```swift
    https://github.com/Alamofire/Alamofire.git
    ```

    - SwiftyJSON

    ```swift
    https://github.com/SwiftyJSON/SwiftyJSON.git
    ```

    - SDWebImage ← 웹에 있는 이미지를 이미지뷰에 간편하게 넣어주는 라이브러리입니다

    SDWebImage는 웹에 있는 이미지를 이미지뷰에 간편하게 넣어주는 라이브러리입니다. SDWebImage에 여러 세부 기능이 있지만, 우리는 SDWebImage 만 가져오도록 하겠습니다!

    ```swift
    https://github.com/SDWebImage/SDWebImage.git
    ```

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fa06932ff-53c0-4e38-ace8-5f62df4238ba%2FUntitled.png?table=block&id=6bd4475d-d884-42c5-8c8a-cb2b9ae3eab4&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=2940&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fa06932ff-53c0-4e38-ace8-5f62df4238ba%2FUntitled.png?table=block&id=6bd4475d-d884-42c5-8c8a-cb2b9ae3eab4&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=2940&userId=&cache=v2)

## 07. 컬렉션뷰로 API 실습 - 모두의 링크 메모장 앱!

- 14) API 연결 - 메모 가져오기!

    API 주소(GET 요청) → [http://spartacodingclub.shop/post](http://spartacodingclub.shop/post) 

    **어떤 기능을 수행하는 API일까요?
    웹페이지를** 보고, 생각해봅시다! [(링크)](http://spartacodingclub.shop)

    1. API 서버에서 데이터 가져오기

    ```swift
    import UIKit
    import Alamofire
    import SwiftyJSON
    import SDWebImage

    class MemoCollectionViewController: UICollectionViewController {
        //받아온 데이터를 담을 변수를 생성
        private var memos: [JSON] = []
        
        override func viewDidLoad() {
            super.viewDidLoad()
            //...
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            AF.request("http://spartacodingclub.shop/post").responseJSON { (response) in
                if var value = response.value {
                    var json = JSON(value)
                    self.memos = json["articles"].arrayValue
                    //컬렉션뷰 새로고침
                    self.collectionView.reloadData()
                }
            }
        }
    }
    ```

    2. 데이터와 컬렉션뷰 셀과 연결해주기

    ```swift
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 가져온 데이터 개수
        return memos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // identifier 를 MemoCell 로 했었죠!
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemoCell", for: indexPath)

        var memo = memos[indexPath.item]
        
    		// MemoCell 안에 있는 변수에 접근하려면 캐스팅!
        if var memoCell = cell as? MemoCell {
    				//SDWebImage 는 이렇게 쓰는겁니다!
            memoCell.imageView.sd_setImage(with: URL(string: memo["image"].stringValue), completed: nil)
        }

        return cell
    }
    ```

    3. 중간 결과 확인하기

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F5f12a572-7d32-4d20-9775-4f6431afc86e%2FUntitled.png?table=block&id=caa6ea6c-ddd6-4a14-bd76-7b810445f4d3&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=580&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F5f12a572-7d32-4d20-9775-4f6431afc86e%2FUntitled.png?table=block&id=caa6ea6c-ddd6-4a14-bd76-7b810445f4d3&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=580&userId=&cache=v2)

    앗 사이즈가 제각각이죠? ㅜㅜ
    셀 사이즈를 설정해주지 않아서 그렇습니다!

    4. Collection View 의 Estimate Size 를 None 으로 설정해주고 Min Spacing 을 모두 0으로 설정해주기

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fc6b188d3-2b89-4db0-a9ec-52978533fdce%2FUntitled.png?table=block&id=f7fb3241-b069-4f6a-8002-3eadb5e26493&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=2750&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fc6b188d3-2b89-4db0-a9ec-52978533fdce%2FUntitled.png?table=block&id=f7fb3241-b069-4f6a-8002-3eadb5e26493&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=2750&userId=&cache=v2)

    5. `MemoCollectionViewController` 클래스 선언부에 `UICollectionViewDelegateFlowLayout` 를 추가해주기

    ```swift
    class MemoCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    ```

    6. `MemoCollectionViewController` 안에 적당한 위치에 컬렉션뷰 셀 사이즈를 정하는 코드 삽입!

    ```swift
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    		// 컬렉션 뷰 한 줄에 3개가 딱 맞게 정사각형으로 들어가게!
        var width = self.collectionView.bounds.width / 3
        return CGSize(width: width, height: width)
    }
    ```

    7. 또 중간 결과 확인하기

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F9eeb5504-a5bb-47fb-860c-ca7f6b9f52ab%2FUntitled.png?table=block&id=17819d70-faf8-4310-94a8-34c0f4d67f54&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=670&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F9eeb5504-a5bb-47fb-860c-ca7f6b9f52ab%2FUntitled.png?table=block&id=17819d70-faf8-4310-94a8-34c0f4d67f54&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=670&userId=&cache=v2)

    8. 저는 여백이 없게 만들고 싶은데... Cell 의 ImageView 로 가서 Content Mode → Aspect Fill 로!

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F75641c5a-9f95-4e41-aeef-2a43357c2c49%2FUntitled.png?table=block&id=3fd0bb3f-1060-4aa3-9da0-9b31293d05d2&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=2890&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F75641c5a-9f95-4e41-aeef-2a43357c2c49%2FUntitled.png?table=block&id=3fd0bb3f-1060-4aa3-9da0-9b31293d05d2&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=2890&userId=&cache=v2)

    - 실행 결과 확인

        크 감동...! 완벽하게 들어간 걸 볼 수 있어요!

        ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F5de6a804-617f-48bb-a4be-adfa55ebba32%2FUntitled.png?table=block&id=1155e0b5-1542-40dd-9a55-97dc55376049&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=670&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F5de6a804-617f-48bb-a4be-adfa55ebba32%2FUntitled.png?table=block&id=1155e0b5-1542-40dd-9a55-97dc55376049&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=670&userId=&cache=v2)

- 15) 컬렉션뷰 셀을 선택했을 때 화면 만들기

    1. 상세 페이지를 보여줄 화면 만들기

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F2fdc102d-143e-4832-9a56-14578091a143%2FUntitled.png?table=block&id=7491f81a-6fd5-4da2-89a4-90f2a663c30e&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=2970&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F2fdc102d-143e-4832-9a56-14578091a143%2FUntitled.png?table=block&id=7491f81a-6fd5-4da2-89a4-90f2a663c30e&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=2970&userId=&cache=v2)

    2. 상세페이지 화면을 위한 `MemoDetailViewController` 만들기

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F5475482c-05e5-41cf-ba56-78549265ed45%2FUntitled.png?table=block&id=1a76a7e5-15f7-4e3e-8fe2-11b3b4825e32&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=2980&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F5475482c-05e5-41cf-ba56-78549265ed45%2FUntitled.png?table=block&id=1a76a7e5-15f7-4e3e-8fe2-11b3b4825e32&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=2980&userId=&cache=v2)

    3. 스토리보드 연결하고 @IBOutlet, @IBAction 연결하기

    ```swift
    import UIKit

    class MemoDetailViewController: UIViewController {

        @IBOutlet weak var imageView: UIImageView!
        @IBOutlet weak var linkButton: UIButton!
        @IBOutlet weak var contentTextView: UITextView!
        @IBOutlet weak var commentTextView: UITextView!
        
        override func viewDidLoad() {
            super.viewDidLoad()

            // Do any additional setup after loading the view.
        }
        
        @IBAction func linkButtonClicked(_ sender: Any) {
            
        }
    }
    ```

    4. ⭐**[중요]** 컬렉션뷰랑 `MemoDetailViewController` 연결해주기

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F89285191-baaf-413f-9828-a131e4e1e4a3%2F_2021-04-01__3.30.26.png?table=block&id=091bd2c3-348f-49d7-acb5-d7504d6f0410&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=3220&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F89285191-baaf-413f-9828-a131e4e1e4a3%2F_2021-04-01__3.30.26.png?table=block&id=091bd2c3-348f-49d7-acb5-d7504d6f0410&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=3220&userId=&cache=v2)

    5. 가운데 Segue 에 identifier 로 `gotoDetailPage` 넣기 

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fae8e0e03-b906-4a6d-99ea-5539755f2b58%2FgotoDetailPage_1.png?table=block&id=4b62c591-8d70-415f-97a1-ada700a026ee&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=4320&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fae8e0e03-b906-4a6d-99ea-5539755f2b58%2FgotoDetailPage_1.png?table=block&id=4b62c591-8d70-415f-97a1-ada700a026ee&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=4320&userId=&cache=v2)

    MemoDetailViewController 에 오른쪽 상단에 BarButton 을 넣어줍시다!

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F034b9de5-b0de-414e-b8ae-4cec6f254f2d%2FUntitled.png?table=block&id=983c3328-cdc9-4fe4-b683-129f82290c7b&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=1640&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F034b9de5-b0de-414e-b8ae-4cec6f254f2d%2FUntitled.png?table=block&id=983c3328-cdc9-4fe4-b683-129f82290c7b&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=1640&userId=&cache=v2)

    버튼이미지에는 link 라는 system icon 을 사용했습니다.

    6. `MemoDetailViewController` 에 메모를 담을 변수 만들기

    ```swift
    import UIKit
    import SwiftyJSON // 추가

    class MemoDetailViewController: UIViewController {

        @IBOutlet weak var imageView: UIImageView!
        @IBOutlet weak var contentTextView: UITextView!
        @IBOutlet weak var commentTextView: UITextView!
        
        var memo: JSON! // 추가
        
        override func viewDidLoad() {
            super.viewDidLoad()

            // Do any additional setup after loading the view.
        }
        
        @IBAction func linkButtonClicked(_ sender: Any) {
            
        }
    }
    ```

    7. 컬렉션뷰에서 셀을 클릭했을 때 화면 넘기기

    ```swift
    var selectedMemo: JSON!

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedMemo = memos[indexPath.item]
        performSegue(withIdentifier: "gotoDetailPage", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoDetailPage" {
            if var controller = segue.destination as? MemoDetailViewController {
                controller.memo = selectedMemo
            }
        }
    }
    ```

    8. `MemoDetailViewController` 나머지 구현하기

    ```swift
    import UIKit
    import SwiftyJSON

    class MemoDetailViewController: UIViewController {

        @IBOutlet weak var imageView: UIImageView!
        @IBOutlet weak var contentTextView: UITextView!
        @IBOutlet weak var commentTextView: UITextView!
        
        var memo: JSON!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            //이미지 뷰에 이미지 넣기
            imageView.sd_setImage(with: URL(string: memo["image"].stringValue), completed: nil)
            
            //텍스트 데이터들 넣기
            contentTextView.text = memo["desc"].stringValue
            commentTextView.text = memo["comment"].stringValue
            
            //상단 네비게이션에 가운데 타이틀 값 넣기
            self.title = memo["title"].stringValue
        }
        
        @IBAction func linkButtonClicked(_ sender: Any) {
            //버튼 누르면 해당 url 로 보내주기
            UIApplication.shared.open(URL(string: memo["url"].stringValue)!, options: [:], completionHandler: nil)
        }
    }
    ```

## 08. Quiz_API 연결 - 메모 작성하기!

- 16) ✍️**Quiz_**API 연결 - 메모 작성하기!
    - Q. 퀴즈설명: 이번엔 메모를 작성해볼까요?

        API 주소(POST 요청) → [http://spartacodingclub.shop/post](http://spartacodingclub.shop/post) 

        보내줄 데이터와 그 키값입니다!
        url_give: 메모에 저장할 사이트 URL
        comment_give: 코멘트

        화면은 이렇게 만들어봅시다!

        ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F93e532d1-826e-4d83-b679-230638878c24%2FUntitled.png?table=block&id=5bc4973f-4849-41fa-9ec9-13452bc57bf3&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=770&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F93e532d1-826e-4d83-b679-230638878c24%2FUntitled.png?table=block&id=5bc4973f-4849-41fa-9ec9-13452bc57bf3&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=770&userId=&cache=v2)

    - A. 함께하기(완성본)

        텍스트 필드의 테두리는 어떻게 만드나 고민을 많이 했을겁니다!

        ```swift
        @IBOutlet weak var urlTextField: UITextField!
        @IBOutlet weak var commentTextField: UITextField!

        override func viewDidLoad() {
            super.viewDidLoad()
        		
        		// 코너 라운드를 먹여줍시다
            urlTextField.layer.cornerRadius = 10
        		// 테두리 두께는 1
            urlTextField.layer.borderWidth = 1
        		// 테두리 컬러는 회색으로
            urlTextField.layer.borderColor = UIColor.gray.cgColor

        		// 텍스트 필드에 텍스트의 왼쪽 여백은 이렇게 넣습니다
            urlTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
            urlTextField.leftViewMode = .always
            
            commentTextField.layer.cornerRadius = 10
            commentTextField.layer.borderWidth = 1
            commentTextField.layer.borderColor = UIColor.gray.cgColor
            commentTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
            commentTextField.leftViewMode = .always
        }
        ```

        그리고 데이터를 보내주면 완성이죠!

        ```swift
        @IBAction func doneButtonClicked(_ sender: Any) {
            //url 과 코멘트를 가져옵시다
            var url = urlTextField.text ?? ""
            var comment = commentTextField.text ?? ""
            
            //둘중에 하나라도 비어있으면 alert!
            if url.count == 0 || comment.count == 0 {
                var alert = UIAlertController(title: "링크 메모장", message: "모두 입력해주세요!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
                //경고창 띄워주기
                self.present(alert, animated: true, completion: nil)
                return
            }
            
            
            //서버에 데이터 보내기
            
            var parameters = [
                "url_give": url,
                "comment_give": comment,
            ]
            
            AF.request("http://spartacodingclub.shop/post", method: .post, parameters: parameters).responseJSON { (response) in
                
                if var value = response.value {
                    var json = JSON(response.value!)
                    print(json)
                    
                    //입력 화면을 사라지게 하고, 테이블뷰로 돌아가기
                    self.navigationController?.popViewController(animated: true)
                }
            }
        }
        ```

        - 웹버전을 보고 싶다면?

            [스파르타코딩클럽 | 나홀로 메모장](http://spartacodingclub.shop)

## 09. 4**주차 끝 & 숙제 설명**

`2. 라이브러리 추가하기` 에서 썼던 API는 랜덤하게 고양이 사진 URL 을 가져오는 API 입니다!

데이터를 받아서 화면에 고양이를 띄우는 앱을 만들어봅시다

여러분의 상상력에 도움이 되고자 최소한 요정도는... 하면서 화면 공개합니다!

![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fe0100df6-9587-401a-b288-00357bb652f8%2FUntitled.png?table=block&id=a04f9b8d-8470-4a0c-bb0c-37b1940cbc44&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=960&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fe0100df6-9587-401a-b288-00357bb652f8%2FUntitled.png?table=block&id=a04f9b8d-8470-4a0c-bb0c-37b1940cbc44&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=960&userId=&cache=v2)

API 주소는 다음과 같습니다!

```swift
https://api.thecatapi.com/v1/images/search
```

API 를 호출했을 때의 예시는 다음과 같은데, 이건 특이하게 **리스트의 형태**로 결과값을 주죠?!

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

다들 다양한 랜덤고양이 앱을 만들어주시길 기대하고 있겠습니다!

그리고 거기서 나온 고양이 중에 가장 마음에 드는 친구가 나왔을때 스크린샷 찍어서... 앱 아이콘으로 만들면...!

## HW. 4주차 숙제 답안

- **[코드스니펫] 4주차 숙제 답안**

    ```swift
    import UIKit
    import Alamofire
    import SwiftyJSON
    import SDWebImage

    class ViewController: UIViewController {

        @IBOutlet weak var imageView: UIImageView!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            refreshCat()
        }
        
        @IBAction func refreshButtonClicked(_ sender: Any) {
            refreshCat()
        }

        
        func refreshCat() {
            AF.request("https://api.thecatapi.com/v1/images/search").responseJSON { (response) in
                if var value = response.value {
                    var json = JSON(value)
                    var cat = json.arrayValue[0]
                    var catImageUrl = cat["url"].stringValue
                    self.imageView.sd_setImage(with: URL(string: catImageUrl)!, completed: nil)
                }
            }
        }

    }
    ```