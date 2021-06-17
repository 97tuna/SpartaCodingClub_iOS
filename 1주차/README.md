# SpartaCodingClub_iOS_강의노트_1주차
<br>
<!-- 손전등 App -->
<p align="center">
    <img width="300px" src="https://user-images.githubusercontent.com/50114556/122387300-b18a8500-cfa9-11eb-86dc-a0eb2125a5ca.png">
    <img width="300px" src="https://user-images.githubusercontent.com/50114556/122387308-b4857580-cfa9-11eb-995c-038fe6c7b5c5.png">
</p>
<br>

❗️ 개발자의 코드 관리

- 폴더와 파일이 어떤 역할을 하는지 한눈에 알아볼 수 있게 작성하기
- 다른 사람들과 협업할 때도 함께 정한 규칙대로 관리하기
- 파일/폴더 이름 짓기(naming) 기본 규칙
    - **폴더/파일이 어떤 내용인지 파악할 수 있게 적기**

        개발자는 이름짓기(naming)을 정말 중요하게 생각한다. 특히 웹 프로그래밍은 데이터를 서로 주고받는 과정입니다. 어떤 데이터(내용)을 담고 있는지 한 눈에 알 수 있어야 헷갈리지 않음! 중요한 내용인 만큼 앞으로 배울 내용에도 꾸준히 이름짓기(naming)에 대한 내용이 나옴.

          예) a →  무슨 폴더지? / homework → 숙제 폴더구나

    - 파일과 폴더 이름은 영어로 : 가끔 컴퓨터가 한글을 인식하지 못하는 경우가 있다.
    - 특수문자는  `-` 만 사용하기 : 다른 특수문자(띄어쓰기 포함)을 컴퓨터가 알아듣게 하려면 조금 수고롭다. 우리는 단어를 연결할 때, `-` 를 사용하겠습니다.

## Swift 기초 문법 - 리스트, 딕셔너리, 함수

- 자료형(Data Type) - 리스트(List)

    자료(Data)를 담는 형태(type) 입니다. 많은 자료형이 있지만, 가장 많이 쓰이는 두 가지 자료형을 배워보겠습니다.

    - 리스트(List): 순서를 지켜서 가지고 있는 형태입니다.

        ```swift
        // 변수 이름은 의미를 알 수 있게, 원하는 대로 짓기
        var sampleList: [Int] = []  // 정수형 리스트를 선언

        // 또는,

        var multiList = [1, 5, 3, 4] // 로 선언 가능

        // 대부분의 프로그래밍 언어는 index가 0 부터 시작합니다.
        print(multiList[1]) // 5 를 출력
        print(multiList[2]) // 3 를 출력

        // 리스트에 요소 넣기
        multiList.append(10)
        print(multiList) // [1, 5, 3, 4, 10] 를 출력

        // 리스트의 길이 구하기 - 반복문에서 유용하게 쓰여요!
        print(multiList.count); // 5를 출력
        ```

- 자료형(Data Type) - 딕셔너리(Dictionary)
    - 딕셔너리(Dictonary): 키(key)-값(value) 이 쌍을 이루고 있는 형태입니다. 사전이 표제어-의미 로 쌍을 이루는 걸 연상해보세요.

        ```swift
        var sampleDict: [String: String] = [:]  // 딕셔너리 선언. 변수 이름은 역시 아무렇게나 가능!

        // 또는,

        var wizard: [String: String] = ["name":"Harry Potter", "house":"Gryffindor"] // 로 선언 가능

        print(wizard["name"]) // "Harry Potter"를 출력
        print(wizard["house"]) // "Gryffindor"를 출력

        wizard["house"] = "Slytherin" // 딕셔너리에 키:밸류 넣기
        print(wizard) // ["name": "Harry Potter", "house": "Slytherin"]을 출력
        ```

- 기본 함수들
    - 사칙연산 외에도, Swift에서 기본적으로 제공하는 여러 함수들이 존재합니다.

        왠지 이건 있을 것 같은데?(예 - 특정 문자를 바꾸고 싶다 등) 싶으면 직접 만들지 말고 **구글에서 먼저 검색해보세요!**

        ex 1) '나눗셈의 나머지'를 구하고 싶은 경우

        ```swift
        var a = 20
        var b = 7

        print(a % b) // 6
        ```

        ex 2) 모든 알파벳을 대문자로 바꾸고 싶은 경우

        ```swift
        var myClub = "spartacodingclub"
        print(myClub) //"spartacodingclub"

        var upperCase = myClub.uppercased()
        print(upperCase) // SPARTACODINGCLUB
        ```

- 함수 - 내가 만들기
    - 기본 생김새

        ```swift
        // 만들기
        func 함수이름(필요한 변수들과 그 타입들) -> 반환할 변수타입 {
        	내릴 명령어들을 순차적으로 작성
          return 결과값
        }
        // 사용하기
        결과값 = 함수이름(필요한 변수들)

        // 반환할 변수타입이 없으면 '->' 부분을 생략!
        func 함수이름(필요한 변수들과 그 타입들) {
        	내릴 명령어들을 순차적으로 작성
        }
        //사용하기
        함수이름(필요한 변수들)
        ```

    - 직접 만들어 보기

        ex 1)

        ```swift
        // 두 숫자를 입력받으면 더한 결과를 돌려주는(return) 함수
        func sum(num1: Int, num2: Int) -> Int {
            print("num1: ", num1, ", num2: ", num2)
            return num1 + num2
        }

        var sumResult = sum(num1: 3, num2: 5) 
        print(sumResult) // 8

        sumResult = sum(num1: 4, num2: -1)
        print(sumResult) // 3
        ```

        ex 2)

        ```swift
        // 출생년도와 계산하고 싶은 연도를 입력받아 나이를 계산해 돌려주는(return) 함수
        func calculateAge(calYear: Int, birthYear: Int) -> Int {
            print("출생년도: ", birthYear, ", 계산하고 싶은 연도: ", calYear)
            return calYear - birthYear
        }

        let calAge = calculateAge(calYear: 2021, birthYear: 1980)
        print(calAge) // 41

        // 잠깐! 값을 입력하는 순서를 바꾸어도 원하는 값이 나오나요?
        print(calculateAge(calYear: 1980, birthYear: 2021)) // -41
        // 아니네요! 입력하는 순서도 맞춰줘야하는군요!
        ```

## 과제 : 스크린 손전등 앱 만들기

우리가 만든 스크린 손전등 앱의 **손전등 색깔**과 **앱아이콘**을 바꿔보세요!

기능: 켜기 버튼을 눌렀을때 다른 색깔로 손전등 불이 들어와야 합니다. 그리고 본인 입맛에 맞게 화면을 꾸며볼까요?

아래의 코드들은 혹시 위에 손전등을 만드는데 어려움이 있었던 분들을 위한 코드와 참고를 위한 코드입니다. 참고해서 숙제를 완성해보아요!

- **[코드스니펫] - 손전등 코드 스니펫**

    ```swift
    import UIKit

    class ViewController: UIViewController {

        @IBOutlet weak var imageView: UIImageView!
        @IBOutlet weak var label: UILabel!
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
        }

        
        @IBAction func onButtonDidClick(_ sender: Any) {
            view.backgroundColor = UIColor.white
            label.textColor = UIColor.black
            imageView.image = UIImage(systemName: "flashlight.on.fill")
        }
        
        @IBAction func offButtonClick(_ sender: Any) {
            view.backgroundColor = UIColor.black
            label.textColor = UIColor.white
            imageView.image = UIImage(systemName: "flashlight.off.fill")
        }
    }
    ```

- **[코드스니펫] - RGB 컬러를 UIColor 로 표현하기**

    ```swift
    //R: 100, G: 30, B: 200 일때
    UIColor(red: 100 / 255.0, green: 30 / 255.0, blue: 200 / 255.0, alpha: 1)
    ```

    [https://www.uicolor.io](https://www.uicolor.io/) 에서 손쉽게 코드를 얻을 수도 있습니다.