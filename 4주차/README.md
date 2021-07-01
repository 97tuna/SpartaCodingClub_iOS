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