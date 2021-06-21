# SpartaCodingClub_iOS_강의노트_2주차
<br>
<!-- 라면타이머 App -->
<p align="center">
    <img width="300px" src="https://user-images.githubusercontent.com/50114556/122678374-8f02a100-d221-11eb-8ad7-b50b970b0e6f.PNG">
    <img width="300px" src="https://user-images.githubusercontent.com/50114556/122678369-8a3ded00-d221-11eb-890a-dce5da7a97e4.PNG">
</p>
<br>

## 01. Swift 기본 문법 - 클래스, 구조체

- 조건문

    조건문은 말 그대로 조건이 주어지고, 그 조건에 해당되거나 해당되지 않을 때 어떤 걸 시행해야 하는지 알려주는 코드입니다.

    - 20 보다 작으면 청소년, 크면 성인이라고 알려주는 코드

    ```swift
    var age = 30

    if age > 20 {
        print("성인이에요")
    } else {
        print("청소년이에요")
    }
    ```

    - 조건이 여러 개일 경우 사용할 수 있는 if, else if, else

    ```swift
    var fruitName = "사과"

    if fruitName == "사과" {
        print("제가 좋아하는 사과네요!")
    } else if fruitName == "딸기" {
        print("딸기는 논산 딸기")
    } else if fruitName == "수박" {
        print("여름은 역시 수박!")
    } else {
        print("다른 과일들도 맛있죠!")
    }
    ```

    - switch는 if, else if, else 을 간편하게 줄인 거라고 볼 수 있어요!

    ```swift
    var fruitName = "사과"

    switch fruitName {
    case "사과":
        print("제가 좋아하는 사과네요!")
    case "딸기":
        print("딸기는 논산 딸기")
    case "수박":
        print("여름은 역시 수박!")
    default:
        print("다른 과일들도 맛있죠!")
    }
    ```

- 반복문

    반복문도 이름 그대로 어떤 동일한 작업을 계속 반복해서 해야 할 때 유용한 코드입니다.

    - 예를 들어 0부터 99까지 출력해야 하는 상황이라면

    ```swift
    print(0)
    print(1)
    print(2)
    ...
    print(99)
    ```

    이럴 때 사용하는 것

    - 0부터 **99까지** 출력해 주는 코드

    ```swift
    for i in 0..<100 {
        print(i)
    }

    //이거면 단 3줄 만에 출력할 수 있습니다!
    ```

    - 0부터 **100까지** 출력해 주는 코드

    ```swift
    for i in 0...100 {
        print(i)
    }

    ```

    - 이번에는 지난주에 배웠던 리스트와 함께 써볼까요?

    ```swift
    var people = ["철수","영희","민수","형준","기남","동희"]

    for person in people {
        print(person)
    }

    //Swift 는 참 편리합니다. 알아서 철수, 영희, 민수, 형준... 
    //순서대로 person 에 문자열 값을 넣어줍니다
    ```

    리스트와 반복문을 함께 사용하는 방법은 여러 가지가 있을 수 있습니다! 아래와 같이 작성해도 똑같은 결과를 출력해 줘요. 하지만 위의 코드가 좀 더 간결하기 때문에 사용하기 더 편리하겠죠?

    ```swift
    var people = ["철수","영희","민수","형준","기남","동희"]

    for i in 0..<people.count {
            var person = people[i] // people 리스트의 i 번째 요소 가져오기
        print(person)
    }

    //이렇게 쓸 수도 있지만, 편한 방법이 더 좋겠죠?
    ```
<br>

## 02. Swift 심화 문법 - 옵셔널

- 8) 옵셔널(Optional,  `?`)

    ```swift
    var someFruits = ["딸기", "사과", "망고", "수박", "복숭아"]
    print(someFruits.first) // Optional("딸기")

    someFruits = []
    print(someFruits.first) // nil
    ```

    Q. 옵셔널이란?

    A. 옵셔널은 '값이 채워져 있을 수도 있고, 비어 있을 수도 있다' 라는 뜻입니다. Swift는 어떤 변수의 값이 비어있다면 ``nil``이라고 표현합니다(다른 언어에서는 ``null`` 이라고 합니다). 그리고 Swift에서는 어떤 변수가 비어 있을 수도 있다면 명시적으로 해당 변수가  ``Optional`` 이라고 선언해 주어야 합니다.

    선언은 해당 타입에 물음표(`?`)를 붙여줍니다.

    ```swift
    var someValue: String? = "어떤 값"
    someValue = nil
    someValue = "다른 값"

    var anotherValue: String = "또 어떤 값"
    anotherValue = "또 다른 값"
    anotherValue = nil // error! String 으로 선언된 값은 nil 이 될 수 없습니다
    ```

    그래서 옵셔널 즉 물음표(`?`) 를 보면

    > 오 이 변수는 `nil` 일지도`?`

    라고 생각해봅시다.

    Q: 옵셔널을 쓰는 이유가 무엇일까요?

    A: 태초에는 **비어 있는 값**이라는 개념이 없었습니다. 그래서 C언어와 그 이전 언어에서는 `0`과 같은 값을 **비어 있는 값**이라고 약속하곤 했습니다. 그 뒤로 자바 정도의 언어에서는 `null` 이라는 값이 도입되었고, 이를 통해 해당 변수가 비어 있는지를 확인할 수 있었습니다. 하지만 여기서 문제가 발생합니다. 해당 변수가 `null` 인지 모르기 때문에 이를 확인하는 코드를 매번 작성해야 했어요. 이 때문에 **코드가 쓸데없이 길어지게** 되었습니다. 그래서 Swift 정도의 언어에서는 Optional 이라는 개념을 도입했습니다. 코드를 봤을 때 언어 단계에서 이 변수가 `nil(null)`  일 가능성이 있는지 미리 알고 시작합니다. `nil` 이 아니라고 확신하는 곳에는 굳이 값이 비어 있는지 **확인할 필요가 없어졌습니다!**

    옵셔널은 이런 특징들이 있습니다. 

    ```swift
    //옵셔널 체인(Optional Chaining): 어디에선가 한번 nil이면 그 뒤로 쭉 nil
    var someFruits = ["딸기", "사과", "망고", "수박", "복숭아"]
    print(someFruits.**first?.count**) // Optional(2)

    someFruits = []
    print(someFruits.**first?.count**) // nil

    //옵셔널 강제 해제: 옵셔널인 변수를 nil 이 될 리 없다고 확인시켜주는 느낌표 !
    var obviousFruit: String = someFruit.first**!
    print(obviousFruit) // 딸기**
    ```

    그래서 옵셔널 근처에서 느낌표(!) 를 보면

    > 이 변수는 `nil`이 아니야`!`

    라고 생각해봅시다. 

    - `!` 더 자세히 알아보기

        변수의 옵셔널 관련된 선언은 사실 3가지가 있습니다!

        ```swift
        //살짝만 살펴보고 이해가 안 된다 싶으면 너무 고민하지 말고 넘어가기!

        var value: Int = 3 
        var valueToBeSet: Int! = 4
        var valueCanBeNil: Int? = 5

        value = nil // 에러!
        valueToBeSet = nil // 가능
        valueCanBeNil = nil // 가능

        value = valueToBeSet // 가능
        value = valueCanBeNil // 불가능
        value = valueCanBeNil! // 가능
        ```

        변수 뒤에 `?` 대신 `!` 가 붙어서 선언된 친구들이 종종 있습니다. 

        사실  `!`는 (홍대와 합정 사이가 아니라) Optional과 Non-Optional 사이 어딘가입니다. 프로그래머 입장에서 처음부터 모든 변수에 값을 넣는 게 어려울 때도 있습니다. 하지만 변수를 선언한 직후 대부분은 값을 바로 넣기 때문에 `!`는 변수가 `nil` 일 확률이 매우 작은 경우에 사용하곤 합니다.

        그럼 처음부터 변수를 Optional 로 선언하면 되는 거 아니냐고요?

        프로그래머들 사이에서도 의견이 분분하지만.. **지금 당장은 값이 없지만 곧 값이 채워질 변수** 라고 생각해주세요!
<br>

## 03. Swift 심화 문법 - 클래스, 구조체

- 9) 구조체(Struct)와 클래스(Class)

    Swift 가 객체지향 프로그래밍(OOP; Object-Oriented Programming) 언어라고 했던 것 기억하나요?

    지금까지 우리는 크게 생각하지 않고 `.` 이라는 연산자를 쓰곤 했습니다. `a.b` 라고 한다면, `a`의 하위 속성인 `b`를 언급하는 것입니다. 혹은 `a.c()` 처럼 `a`에게 `c라는 함수`를 실행시키라고 명령하기도 했죠. 그 이유를 여기서 다뤄보도록 하겠습니다. 진지하게 다루면 무척이나 심오한 영역이 될 수도 있어서, 가벼운 마음으로 설명을 들어보고 재미없거나 어렵다면 섣불리(?) 포기하시기 바랍니다.
    <br>

    - 구조체(Struct)

    ```swift
    struct Work {
        var task: String
        var hoursToDo: Int
    }

    var firstWork = Work(task: "강의자료 작성하기", hoursToDo: 3)
    var secondWork = Work(task: "분리수거 하기", hoursToDo: 1)
    ```

    - 클래스(Class)

    ```swift
    class Student {
        var name: String
        var house: String

        init(name: String, house: String) {
            self.name = name
            self.house = house
        }
    }

    var joo = Student(name: "주정한", house: "슬리데린")
    var kim = Student(name: "김민주", house: "그리핀도르")
    ```

    - 자신 있게 공통점 알아보기
        1. 구조체와 클래스 모두 내부에 변수(프로퍼티)를 가질 수 있고 `.` 연산자를 통해 접근합니다.

        ```swift
        struct Work {
            var task: String
            var hoursToDo: Int
        }

        class Student {
            var name: String
            var house: String

            init(name: String, house: String) {
        				//클래스 내부에서 self 라는 키워드는 본인 스스로를 의미합니다.
        				//init의 매개변수로 받은 name 과 프로퍼티인 name 을 구별하기 위해서
        				//self라는 키워드를 사용해봤습니다. 
                self.name = name
                self.house = house
            }
        }
        ```

        2. 구조체와 클래스 모두 내부에 함수(메소드)를 가질 수 있고 `.` 연산자를 통해 접근합니다.

        ```swift
        **struct** Work {
            var task: String
            var hoursToDo: Int
            
            func alert() {
        				// 문자열 안에 \(변수) 로 해당 변수 값을 쉽게 끼워넣을 수 있습니다
        				print("\(task)가 앞으로 \(self.hoursToDo) 시간 더 해야 합니다.")
        				// 구조체(or 클래스) 내부의 함수에서는 **self** 라는 단어로 자신의 변수, 함수에 접근합니다.
        				// 하지만 모호하지 않은 경우엔 **self** 를 생략해도 됩니다. 
            }
        }

        var firstWork = Work(task: "강의자료 작성하기", hoursToDo: 3)
        firstWork.alert() // 강의자료 작성하기가 앞으로 3 시간 더 해야 합니다.

        **class** Student {
            var name: String
            var house: String

            init(name: String, house: String) {
                self.name = name
                self.house = house
            }
            
            func introduce() {
                print("\(house) 기숙사에 사는 \(name) 입니다")
            }
        }

        var joo = Student(name: "주정한", house: "슬리데린")
        joo.introduce() // 슬리데린 기숙사에 사는 주정한 입니다
        ```

    그리고 이 둘은 공통점뿐만 아니라 차이점도 갖고 있답니다!

    - 구조체의 특징

        ```swift
        struct Work {
            var task: String
            var hoursToDo: Int
        }

        //1. 구조체는 init 함수를 만들지 않아도 자동으로 만들어줍니다. 
        var firstWork = Work(task: "강의자료 작성하기", hoursToDo: 3)
        var secondWork = Work(task: "분리수거 하기", hoursToDo: 1)

        //2. 구조체를 대입하면 그 '값'을 복제합니다.
        var firstWorkCopy = firstWork

        //3. 원본 구조체 변수에 접근해서 값을 변경해볼까요?
        firstWork.hoursToDo -= 1

        //원본과 복사본 둘이 서로 다른 값을 가지는군요?
        print(firstWork) //  Work(task: "강의자료 작성하기", hoursToDo: 2)
        print(firstWorkCopy) // Work(task: "강의자료 작성하기", hoursToDo: 3)
        ```

    - 클래스의 특징

        ```swift
        class Student {
            var name: String
            var house: String

            init(name: String, house: String) {
                self.name = name
                self.house = house
            }
            
            func introduce() {
                print("\(house) 기숙사에 사는 \(name) 입니다")
            }
        }

        // 1. 클래스는 init 함수를 꼭 만들어 주어야 합니다.
        var joo = Student(name: "주정한", house: "슬리데린")

        // 2. 클래스를 대입하면 복제인간을 만드는 게 아니라 그냥 별명을 하나 새로 붙인다 정도
        var anotherJoo = joo
        joo.introduce() // 슬리데린 기숙사에 사는 주정한 입니다
        anotherJoo.introduce() // 슬리데린 기숙사에 사는 주정한 입니다

        joo.house = "레번클로" // 전학(?)
        joo.introduce() // 레번클로 기숙사에 사는 주정한 입니다
        anotherJoo.introduce() // 레번클로 기숙사에 사는 주정한 입니다
        ```