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