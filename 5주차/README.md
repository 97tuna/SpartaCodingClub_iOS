# SpartaCodingClub_iOS_강의노트_5주차

<p align="center">
    <img width="300px" src="https://user-images.githubusercontent.com/50114556/125057928-b47a2080-e0e4-11eb-8e8e-7d89362ef1b0.gif">
</p>

## **01. 5주차 오늘 배울 것**

- 1) 터치, 진동, 애니메이션

    유저에게 생동감 있는 경험을 만들어주는 인터렉션 중 터치, 진동, 애니메이션을 손가락 묶기 게임 앱에서 사용해보기

    - [코드 미리보기]
        - 터치

        ```swift
        import UIKit

        class FingerGameView: UIView {

            //터치 시작
            override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
                
            }

            //터치 이동
            override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
                
            }

            //터치 끝
            override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
                
            }

            //터치가 비정상적인 이유로 끝남
            override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
                
            }
        }
        ```

        - 진동

        ```swift
        // 가벼운 물리적 충돌을 묘사
        let impactLight = UIImpactFeedbackGenerator(style: .light)
        impactLight.impactOccurred()

        // 무거운 물리적 충돌을 묘사
        let impactHeavy = UIImpactFeedbackGenerator(style: .heavy)
        impactHeavy.impactOccurred()

        // 어떤 요소를 선택하거나 했을 때 사용
        let selection = UISelectionFeedbackGenerator()
        selection.selectionChanged()

        //notification 은 한 번만 선언해도 됨!
        let noti = UINotificationFeedbackGenerator()

        //액션의 결과에 따라 각각 성공, 에러, 주의를 위한 진동
        noti.notificationOccurred(.success) // 성공
        noti.notificationOccurred(.error)   // 에러
        noti.notificationOccurred(.warning) // 주의
        ```

        - 애니메이션

        ```swift
        UIView.animate(withDuration: 5) { // 5는 애니메이션이 움직일 시간 길이입니다.
        		// 애니메이션이 끝난 후 보였으면 하는 결과물 블록
            view.frame.height = 100
        }
        ```

- 2) 광고 넣기

    AdMob을 이용해 제작한 앱에 광고 넣어보기

    - [코드 미리보기]
        - 광고 준비하기

        ```swift
        import UIKit
        import Firebase
        import GoogleMobileAds
        import AppTrackingTransparency // 추가
        import AdSupport // 추가

        class FingerGameViewController: UIViewController {
            
            @IBOutlet weak var gameView: FingerGameView!
            @IBOutlet weak var secondsLabel: UILabel!
            
            var interstitial: GADInterstitialAdBeta? // 추가
            
            override func viewDidLoad() {
                super.viewDidLoad()
                
                gameView.controller = self
                requestIDFA()
            }
            
            //광고준비하기
            func requestIDFA() {
                ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in
                    let request = GADRequest()
                    GADInterstitialAdBeta.load(withAdUnitID: "ca-app-pub-3940256099942544/4411468910",
                                               request: request) { (ad, error) in
                        if error != nil {
                            return
                        }
                        
                        self.interstitial = ad
                    }
                })
            }
        ```

        - 게임 종료 시 광고 넣기

        ```swift
        func touchCountDidChange() {
            //게임 시작 로그
            Analytics.logEvent("Game Start", parameters: nil)
            
            //아직 타이머가 살아있으면 무효화하기
            timer?.invalidate()
            
            //5초 뒤에 타이머 설정
            timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: false, block: { (t) in
                for roundView in self.gameView.touchToRoundView.values {
                    // 초록편과 주황편으로 나눠줄 랜덤
                    var randomChoice = Bool.random()
                    
                    UIView.animate(withDuration: 1) {
                        if randomChoice {
                            //초록편
                            roundView.backgroundColor = UIColor(named: "green")
                        } else {
                            //주황편
                            roundView.backgroundColor = UIColor(named: "orange")
                        }
                        
                        //프레임을 변경하면 센터도 움직이니 센터를 미리 저장해둡시다
                        var roundViewCenter = roundView.center
                        
                        //프레임 사이즈를 120, 120으로 키우기
                        roundView.frame.size = CGSize(width: 120, height: 120)
                        
                        //저장해둔 센터로 옮겨줍니다
                        roundView.center = roundViewCenter
                        
                        //프레임 사이즈가 커지면, 반지름도 커지니 60으로 설정
                        roundView.layer.cornerRadius = 60
                    }
                }
                
                //게임 종료 로그 with 동그라미 개수
                Analytics.logEvent("Game End", parameters: ["touchCount": self.gameView.touchToRoundView.count])
                
        				//광고 짜자잔!
                self.interstitial?.present(fromRootViewController: self)
            })
            
            resetSecondsTimer()
        }
        ```

- 3) Firebase 사용하기

    Firebase를 이용해서 이용자 수를 확인하고 로그(log)를 넣어 사용자에 대한 기록을 더 자세히 알아보기

- 4) 앱스토어에 출시하기

    직접 만들어 본 앱을 앱스토어에 출시해보기

    - 원하는 사진을 이용해 App Icon을 설정하고 앱 이름 정해주기
        - 예시

            ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fe5be65e7-d02f-4218-9221-0ec48ff87216%2FUntitled.png?table=block&id=8a6f5309-69a2-4c09-bd22-9b161309aeac&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=1000&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fe5be65e7-d02f-4218-9221-0ec48ff87216%2FUntitled.png?table=block&id=8a6f5309-69a2-4c09-bd22-9b161309aeac&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=1000&userId=&cache=v2)

    - 아카이브를 통해 앱 출시하기

## 02. 네이티브 앱개발의 꽃, 인터렉션!

- 5) 인터렉션이란?

    유저에게 제공되는 화면 디자인을 보통 UI 디자인이라고 부릅니다. 그리고 유저가 그 화면을 눌러보고 드래그하는 등의 입력을 했을 때, 유저의 생동감 있는 경험을 위해 **인터렉션**이라는 것을 신경 써야 합니다.

    - 유저의 입력에는 여러 가지가 있겠죠? 키보드 입력이라든지, 화면을 클릭한다든지, 드래그를 한다든지, 아니면 두 손가락으로 화면을 확대해볼 수도 있을 겁니다. 그리고 예상했듯이, 현대의 스마트폰은 입력의 대부분이 화면을 터치하는 것입니다.

    - 그리고 화면을 터치하면, 그 화면이 반응을 해주어야 합니다. 예를 들어 우리가 '예약하기' 버튼을 눌렀다고 생각해볼까요? 버튼을 눌렀을 때 유저가 입력한 정보가 올바르지 않다면 유저에게 다시 확인해달라고 요청을 해야 합니다. 가장 쉽게 생각할 수 있는 방법으로는, 유저에게 알림창(alert)을 띄워줄 수 있겠죠.
    - 하지만 알림창 대신 올바르지 않은 텍스트 필드가 좌우로 살짝 떨리는 애니메이션을 보여준다면, 유저가 조금 더 직관적으로 해당 부분을 확인하게 될 겁니다.

    - 거기에 진동과 같은 피드백을 함께 제공한다면, 텍스트 필드가 좌우로 떨리는 것과 진동이 어우러져서 더욱 생동감을 줄 수 있겠죠!

    그래서 우리는 가장 대표적인 인터렉션 기능들이며 iOS 네이티브 앱 개발의 가장 큰 자랑인 **터치, 애니메이션, 진동**을 다뤄보겠습니다. 

- 6) 가장 쉬운 진동부터!

    진동 기능은 시뮬레이터에서 동작하지 않습니다! 진동 기능을 넣는다고 코드 자체가 잘못되는 것은 아니지만 확인할 수는 없습니다. 그래서 이 부분은 실제 아이폰에 빌드를 넣어서 확인해야 합니다!

    진동을 제공하는 건 원래는 무척 어려운 일이었습니다. 진동의 세기, 길이, 패턴 등을 맞추고 조절해야 했거든요. 하지만 iOS는 개발자들을 위해 정해진 상황을 위한 진동을 마련해놨습니다.

    - impact: 물리적 충돌을 묘사하기 위해 사용

        충돌 강도에 따라 스타일 지정 가능

    - selection: 화면에 어떤 요소를 선택하거나 했을 때 사용
    - notification: 어떤 일이나 액션에 대해 성공, 실패, 주의를 줄 때 사용

        성공, 실패, 주의에 따라 타입 지정 가능

    취향에 따라 사용하면 되지만, 개인적인 경험으로는 selection과 notification 을 주로 사용합니다. 

    ```swift
    // 가벼운 물리적 충돌을 묘사
    let impactLight = UIImpactFeedbackGenerator(style: .light)
    impactLight.impactOccurred()

    // 무거운 물리적 충돌을 묘사
    let impactHeavy = UIImpactFeedbackGenerator(style: .heavy)
    impactHeavy.impactOccurred()

    // 어떤 요소를 선택하거나 했을 때 사용
    let selection = UISelectionFeedbackGenerator()
    selection.selectionChanged()

    //notification 은 한 번만 선언해도 됨!
    let noti = UINotificationFeedbackGenerator()

    //액션의 결과에 따라 각각 성공, 에러, 주의를 위한 진동
    noti.notificationOccurred(.success) // 성공
    noti.notificationOccurred(.error)   // 에러
    noti.notificationOccurred(.warning) // 주의
    ```

## 03. 손가락 묶기 게임 만들기 1 - 세팅

- 7) 결과물 미리 보기

    > [https://s3-us-west-2.amazonaws.com/secure.notion-static.com/4795f5b0-e11c-4424-9f56-742f766cc1ca/RPReplay_Final1618496221.mp4](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/4795f5b0-e11c-4424-9f56-742f766cc1ca/RPReplay_Final1618496221.mp4)

- 8) 프로젝트 및 스토리보드 세팅

    1. 프로젝트 생성 - FingerGame

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fb560c13a-0751-4203-ba70-8f6aa87963bf%2FUntitled.png?table=block&id=ee41fc87-d827-4a4a-9eef-351f35d74202&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=6050&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fb560c13a-0751-4203-ba70-8f6aa87963bf%2FUntitled.png?table=block&id=ee41fc87-d827-4a4a-9eef-351f35d74202&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=6050&userId=&cache=v2)

    2. 스토리보드 작성하기

    [Color Hunt - Color Palettes for Designers and Artists](https://colorhunt.co)

    여기서 좋아하는 색깔 조합을 선택해서 진행해 보겠습니다. 

    저는 아래의 색깔 조합으로 할게요!

    [Color Hunt - Trendy Color Palettes](https://colorhunt.co/palette/264446)

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F3d62effd-72a6-4918-9b18-3bd6f70875f5%2Fcolor_set_1.jpg?table=block&id=0ea98ab7-4fa1-436d-a58b-3b141a12008e&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=3420&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F3d62effd-72a6-4918-9b18-3bd6f70875f5%2Fcolor_set_1.jpg?table=block&id=0ea98ab7-4fa1-436d-a58b-3b141a12008e&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=3420&userId=&cache=v2)

    3. Assets.xcassets 에 자주 쓰일 색깔 추가하기 - Color Set

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F3d62effd-72a6-4918-9b18-3bd6f70875f5%2Fcolor_set_1.jpg?table=block&id=0ea98ab7-4fa1-436d-a58b-3b141a12008e&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=3420&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F3d62effd-72a6-4918-9b18-3bd6f70875f5%2Fcolor_set_1.jpg?table=block&id=0ea98ab7-4fa1-436d-a58b-3b141a12008e&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=3420&userId=&cache=v2)

    Appearance → None

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F66ad4adf-39f2-418e-9602-0d60095f2872%2Fapprearance_1.jpg?table=block&id=d3c28f4b-6891-4655-aac9-868426254d60&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=1980&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F66ad4adf-39f2-418e-9602-0d60095f2872%2Fapprearance_1.jpg?table=block&id=d3c28f4b-6891-4655-aac9-868426254d60&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=1980&userId=&cache=v2)

    Universal 이라고 표시된 흰색 네모 클릭 후, 오른쪽 하단에 Show Color Panel 클릭

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Ff198c219-5dd3-4ca4-a788-87715d01ef47%2Fshow_color_panel_1.jpg?table=block&id=26ddeb4b-624e-450d-b260-1281f3f0d487&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=3490&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Ff198c219-5dd3-4ca4-a788-87715d01ef47%2Fshow_color_panel_1.jpg?table=block&id=26ddeb4b-624e-450d-b260-1281f3f0d487&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=3490&userId=&cache=v2)

    스포이드버튼 눌러서 원하는 색깔 선택하기

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fa1367de4-b388-42cb-881c-ebef5fb0b5e0%2FUntitled.png?table=block&id=cbd671de-3e67-4144-8f95-d433641e8cc5&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=2640&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fa1367de4-b388-42cb-881c-ebef5fb0b5e0%2FUntitled.png?table=block&id=cbd671de-3e67-4144-8f95-d433641e8cc5&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=2640&userId=&cache=v2)

    색깔 이름 정해주기

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F6c48b070-8848-40bb-bace-a5d2ee333287%2FUntitled.png?table=block&id=9203e069-17c5-4193-8bcc-946268505b08&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=5780&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F6c48b070-8848-40bb-bace-a5d2ee333287%2FUntitled.png?table=block&id=9203e069-17c5-4193-8bcc-946268505b08&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=5780&userId=&cache=v2)

    이후로는 storyboard 에서 Named Colors 에 표시됩니다! 훨씬 편하게 사용할 수 있겠죠?

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fe3b4244d-6525-457a-87f7-b7364fb973e7%2FUntitled.png?table=block&id=8be0f3fb-b624-46af-907e-3e7c4f1a46d7&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=4700&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fe3b4244d-6525-457a-87f7-b7364fb973e7%2FUntitled.png?table=block&id=8be0f3fb-b624-46af-907e-3e7c4f1a46d7&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=4700&userId=&cache=v2)

    4. 게임 화면 만들기

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F98a088ed-7ae7-40a4-ac31-7934cf391ca5%2FUntitled.png?table=block&id=18eb62d6-4ef6-4bbe-97cb-0364ec03a810&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=3020&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F98a088ed-7ae7-40a4-ac31-7934cf391ca5%2FUntitled.png?table=block&id=18eb62d6-4ef6-4bbe-97cb-0364ec03a810&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=3020&userId=&cache=v2)

    첫 번째 화면은 단순하게 제목과 '시작하기' 버튼을 만들어주고, 두 번째 화면은 X 버튼을 왼쪽 상단에 달아줍니다!

    5. 두 번째 화면에 게임을 다룰 뷰(UIView) 만들어주기

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F85cf79fe-42c4-450b-9cac-dae5ac1a4892%2FUntitled.png?table=block&id=c69cc518-2173-46ed-bb7f-361de96bb25c&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=670&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F85cf79fe-42c4-450b-9cac-dae5ac1a4892%2FUntitled.png?table=block&id=c69cc518-2173-46ed-bb7f-361de96bb25c&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=670&userId=&cache=v2)

    영역을 지정해 준 다음에는 Background Color 를 black 으로 설정해줍니다.

    6. 필요한 Swift 파일을 만들어주고 연결해주기

    - 첫 번째 화면 - FingerStartViewController
    - 두 번째 화면 - FingerGameViewController

    첫 번째 화면의 버튼은 두 번째 화면으로 연결해줍니다.

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F2e29de47-07b8-4cb3-ae42-e90b5bffcb17%2F_2021-04-04__8.44.23.png?table=block&id=9d8fbb1b-413b-4af2-922a-9ab35f1dd6fa&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=3330&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F2e29de47-07b8-4cb3-ae42-e90b5bffcb17%2F_2021-04-04__8.44.23.png?table=block&id=9d8fbb1b-413b-4af2-922a-9ab35f1dd6fa&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=3330&userId=&cache=v2)

    이제는 익숙하죠? `Ctrl` + 드래그 한 후 Action Segue → Show 선택하기!

    두 번째 화면의 Presentation Style 을 Automatic 에서 Full Screen 으로 바꿔줍니다!

    그리고 두 번째 화면의 버튼과 게임 영역 뷰를 연결해줍니다!

    ```swift
    import UIKit

    class FingerGameViewController: UIViewController {

        @IBOutlet weak var gameView: UIView! // 추가
        
        override func viewDidLoad() {
            super.viewDidLoad()
        }

        @IBAction func closeButtonClicked(_ sender: Any) { // 추가
            
        }
    }
    ```

## 04. 손가락 묶기 게임 만들기 2 - 터치

- 9) 터치란?

    유저가 터치를 하는 과정을 자세히 살펴보고 잠시 머릿속에 담아두도록 합시다!

    유저가 터치하는 과정은 크게 세 가지로 나뉩니다.
    화면에 터치 누르기 (시작) - 화면에 터치 움직이기 (중간) - 화면에서 터치 떼기 (끝)

    우리가 버튼에 @IBAction 을 연결할 때, touch up inside 라는 말을 본 적 있나요?

    이건 우리가 버튼에서 터치를 뗄 때 발생하는 이벤트와 연결해 달라고 하는 겁니다. 간단한 터치 이벤트 정도는 쉽고 편리하게 @IBAction 등으로 구현하면 되지만, 보다 복잡한 룰을 넣고 싶다면 UIView 에 있는 각각의 터치 이벤트를 구현해 주어야 합니다.

    터치 이벤트는 모두 4가지가 있습니다.

    UIView 를 상속받아서 뷰를 만들게 되면 아래 4가지 함수를 수정할 수 있습니다!

    ```swift
    //터치 시작
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }

    //터치 이동
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }

    //터치 끝
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }

    //터치가 비정상적인 이유로 끝남
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    ```

    touchesCancelled 는 생소할 수 있겠지만, 보통은 터치가 끝난 것과 비슷하게 처리하면 됩니다!

    아이폰은 한 번에 터치를 5개까지만 인식합니다! 만약 6번째 터치가 들어오면, 에러 상황으로 인식해서 touchesCancelled 이 호출됩니다.

- 10) UIView 상속받아서 터치 구현하기

    1. FingerGameView.swift 파일 만들고 클래스 만들기

    ```swift
    import UIKit

    class FingerGameView: UIView {

        //터치 시작
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            
        }

        //터치 이동
        override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
            
        }

        //터치 끝
        override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
            
        }

        //터치가 비정상적인 이유로 끝남
        override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
            
        }
    }
    ```

    게임 화면에 게임 영역을 나타내는 뷰도 FingerGameView 와 연결해줍니다!

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F6f18978d-2016-497f-b611-41b2e5c13b25%2FUntitled.png?table=block&id=e760706d-4903-47f2-bcad-169d6ccc6ec8&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=3100&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F6f18978d-2016-497f-b611-41b2e5c13b25%2FUntitled.png?table=block&id=e760706d-4903-47f2-bcad-169d6ccc6ec8&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=3100&userId=&cache=v2)

    2. 터치가 시작되면, 터치된 위치에 동그라미 뷰 만들어주기

    ```swift
    //터치와 뷰를 연결해 줄 dictionary
    var touchToRoundView: [UITouch: UIView] = [:] // 추가

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //터치는 생각해보면 동시에 여러 개가 가능합니다!(멀티터치)
        for touch in touches {
            
            //동그라미 뷰 만들기
            let view = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80)) // 사이즈 80, 80
            view.backgroundColor = UIColor(named: "red") // Assets.xcassets 에 정해둔 색깔
            view.layer.cornerRadius = 40 // 사이즈의 절반을 넣으면 동그라미가 됨
            view.center = touch.location(in: self) // 터치의 위치를 받아서 뷰의 센터 좌표로 넣기
            
            // 해당 터치에 동그라미 뷰 연결해주기
            touchToRoundView[touch] = view
            
            // 뷰에 동그라미 뷰 삽입하기
            self.addSubview(view)
        }
    }
    ```

    3. 멀티터치 활성화하기 - interaction → Multiple Touch 선택

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F5dfb3d5c-3010-4c2f-bf2d-4bf538c23163%2Fmultiple_touch_1.png?table=block&id=c5accd31-a4a8-421f-b490-b08f1ac3e53d&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=2930&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F5dfb3d5c-3010-4c2f-bf2d-4bf538c23163%2Fmultiple_touch_1.png?table=block&id=c5accd31-a4a8-421f-b490-b08f1ac3e53d&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=2930&userId=&cache=v2)

    4. 터치가 움직이면 동그라미 뷰 이동해주기

    ```swift
    //터치 이동
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            //터치에 해당하는 동그라미 뷰 가져오기
            let view = touchToRoundView[touch]
            //동그라미뷰의 위치 업데이트 하기
            view?.center = touch.location(in: self)
        }
    }
    ```

    5. 터치가 끝나거나 비정상적인 이유로 끝나면 뷰 없애주기 

    ```swift
    //터치 끝
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            //터치에 해당하는 동그라미 뷰 가져오기
            let view = touchToRoundView[touch]
            //동그라미 뷰 없애기
            view?.removeFromSuperview()
            //터치 - 동그라미 뷰 dictionary 에서 해당 뷰 삭제
            touchToRoundView.removeValue(forKey: touch)
        }
    }

    //터치가 비정상적인 이유로 끝남
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            //터치에 해당하는 동그라미뷰 가져오기
            let view = touchToRoundView[touch]
            //동그라미 뷰 없애기
            view?.removeFromSuperview()
            //터치 - 동그라미뷰 dictionary 에서 해당 뷰 삭제
            touchToRoundView.removeValue(forKey: touch)
        }
    }
    ```

    - 중간 결과물 보기

        > [https://s3-us-west-2.amazonaws.com/secure.notion-static.com/5e653b9e-2693-48e8-98c5-d472595dae24/RPReplay_Final1617540171.mp4](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/5e653b9e-2693-48e8-98c5-d472595dae24/RPReplay_Final1617540171.mp4)

    - 전체 코드 보기

        ```swift
        import UIKit

        class FingerGameView: UIView {
            
            var touchToRoundView: [UITouch: UIView] = [:]
            
            //터치 시작
            override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
                //터치는 생각해보면 동시에 여러 개가 가능합니다!(멀티터치)
                for touch in touches {
                    
                    //동그라미 뷰 만들기
                    let view = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80)) // 사이즈 80, 80
                    view.backgroundColor = UIColor(named: "red") // Assets.xcassets 에 정해둔 색깔
                    view.layer.cornerRadius = 40 // 사이즈의 절반을 넣으면 동그라미가 됨
                    view.center = touch.location(in: self) // 터치의 위치를 받아서 뷰의 센터 좌표로 넣기
                    
                    // 해당 터치에 동그라미 뷰 연결해주기
                    touchToRoundView[touch] = view
                    
                    // 뷰에 동그라미 뷰 삽입하기
                    self.addSubview(view)
                }
            }
            
            //터치 이동
            override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
                for touch in touches {
                    //터치에 해당하는 동그라미 뷰 가져오기
                    let view = touchToRoundView[touch]
                    //동그라미 뷰의 위치 업데이트 하기
                    view?.center = touch.location(in: self)
                }
            }
            
            //터치 끝
            override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
                for touch in touches {
                    //터치에 해당하는 동그라미 뷰 가져오기
                    let view = touchToRoundView[touch]
                    //동그라미 뷰 없애기
                    view?.removeFromSuperview()
                    //터치 - 동그라미 뷰 dictionary 에서 해당 뷰 삭제
                    touchToRoundView.removeValue(forKey: touch)
                }
            }
            
            //터치가 비정상적인 이유로 끝남
            override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
                for touch in touches {
                    //터치에 해당하는 동그라미 뷰 가져오기
                    let view = touchToRoundView[touch]
                    //동그라미 뷰 없애기
                    view?.removeFromSuperview()
                    //터치 - 동그라미 뷰 dictionary 에서 해당 뷰 삭제
                    touchToRoundView.removeValue(forKey: touch)
                }
            }
        }
        ```

## 05. 손가락 묶기 게임 만들기 3 - 게임 알고리즘

- 11) 랜덤하게 게임 결과 내기

    터치를 구현해봤으니, 이제 게임처럼 만들어 볼까요? 색상을 이용해서 동그라미 뷰들을 랜덤하게 편을 나눠줄 겁니다!

    1. 뷰와 컨트롤러 연결하기

    ```swift
    class FingerGameView: UIView {
        
        var touchToRoundView: [UITouch: UIView] = [:]
        weak var controller: FingerGameViewController? // 추가 
        
        //터치 시작
        ...
    ```

    ```swift
    import UIKit

    class FingerGameViewController: UIViewController {

        @IBOutlet weak var gameView: FingerGameView! // 클래스 변경
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            gameView.controller = self // gameView 의 컨트롤러에 연결해 줍니다
        }

        @IBAction func closeButtonClicked(_ sender: Any) {
            
        }
        
    }
    ```

    뷰에서 터치가 추가되거나 사라졌을 때 FingerGameViewController 에게 알려주어야 하니 연결해줍니다. 

    2. 컨트롤러에 게임 규칙 추가하기

    ```swift
    //타이머를 저장할 변수
    var timer: Timer?
    func touchCountDidChange() {
        //아직 타이머가 살아있으면 무효화하기
        timer?.invalidate()
        
        //5초 뒤에 타이머 설정
        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: false, block: { (t) in
            for roundView in self.gameView.touchToRoundView.values {
                // 초록편과 주황편으로 나눠줄 랜덤
                var randomChoice = Bool.random()
                
                if randomChoice {
                    //초록편
                    roundView.backgroundColor = UIColor(named: "green")
                } else {
                    //주황편
                    roundView.backgroundColor = UIColor(named: "orange")
                }
            }
        })
    }
    ```

    3. close 버튼을 누르면 다시 게임 시작 창으로 돌아가기

    ```swift
    @IBAction func closeButtonClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    ```

    - 중간결과 확인

        > [https://s3-us-west-2.amazonaws.com/secure.notion-static.com/4a8e592b-883b-42c4-95af-7eb2fab55dbd/RPReplay_Final1617542873.mp4](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/4a8e592b-883b-42c4-95af-7eb2fab55dbd/RPReplay_Final1617542873.mp4)

        앗 4명이서 플레이를 했는데 초록팀 3개와 주황팀 1개로 나뉘었습니다. 불공평한 거 아니냐고요? 원래 인생은 불공평합니다. 

## 06. 손가락 묶기 게임 만들기 4 -애니메이션 심화

- 12) 애니메이션이란?

    애니메이션은 화면에 더욱 생동감을 주는 요소입니다. 애니메이션 없이 화면이 뚝뚝 바뀌면 무언가 부자연스러운 느낌이 들곤 해요. 좀 더 자연스러운 화면 전환, 생동감 있는 화면을 원한다면 애니메이션을 넣어 볼게요!

    iOS 에서는 애니메이션을 무척이나 쉽고 간편하게 넣을 수 있습니다!

    ```swift
    UIView.animate(withDuration: 5) { // 5는 애니메이션이 움직일 시간 길이입니다.
    		// 애니메이션이 끝난 후 보였으면 하는 결과물 블록
        view.frame.height = 100
    }
    ```

    간단하게 애니메이션을 쓰는 법은 지난 주차에서 배웠었죠?
    조금만 더 깊게 알아봅시다. 

    애니메이션의 결과물 블록에 들어갈 수 있는 건 대표적으로

    - 뷰의 frame, bounds, center 등 뷰의 프레임 정보
    - 뷰의 backgroundColor, alpha 등의 뷰의 배경색 및 투명도
    - 뷰를 회전하거나 확대하는데 쓰이는 transform

    이 외에 애니메이션을 넣으려면 Timer 를 이용해서 바꿔주면 됩니다! 지난번 라면 타이머 만들기 할 때를 생각해 보면, 남은 초가 줄어드는 것도 큰 틀에서는 애니메이션이라고 할 수 있습니다. 

- 13) 게임 결과 화면에 애니메이션 넣기

    1. 결과가 나오면 색깔과 사이즈를 변경하는 애니메이션 넣기

    ```swift
    //5초 뒤에 타이머 설정
    timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: false, block: { (t) in
        for roundView in self.gameView.touchToRoundView.values {
            // 초록편과 주황편으로 나눠줄 랜덤
            var randomChoice = Bool.random()
            
            UIView.animate(withDuration: 1) {
                if randomChoice {
                    //초록편
                    roundView.backgroundColor = UIColor(named: "green")
                } else {
                    //주황편
                    roundView.backgroundColor = UIColor(named: "orange")
                }
                
                //프레임을 변경하면 센터도 움직이니 센터를 미리 저장해둡시다
                var roundViewCenter = roundView.center
                
                //프레임 사이즈를 120, 120으로 키우기
                roundView.frame.size = CGSize(width: 120, height: 120)
                
                //저장해둔 센터로 옮겨줍니다
                roundView.center = roundViewCenter
                
                //프레임 사이즈가 커지면, 반지름도 커지니 60으로 설정
                roundView.layer.cornerRadius = 60
            }
        }
    })
    ```

    2. 결과가 나오기 전에 뜨는 5초 초시계 넣기

    5,4,3,2,1 을 표현해 줄 라벨을 넣고, @IBOutlet 까지 연결해줍니다.

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Ff5dd859b-94b9-4fcc-a2dc-bbf2a719dd1e%2FUntitled.png?table=block&id=5c8bc8dd-e7b5-47b6-b00e-fe107321e8ec&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=480&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Ff5dd859b-94b9-4fcc-a2dc-bbf2a719dd1e%2FUntitled.png?table=block&id=5c8bc8dd-e7b5-47b6-b00e-fe107321e8ec&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=480&userId=&cache=v2)

    - 초시계 째깍째깍 코드

    ```swift
    //초가 줄어드는 타이머를 저장할 변수
    var secondsTimer: Timer?
    //남은 초
    var secondsLeft = 5

    func resetSecondsTimer() {
        //초시계 타이머가 아직 살아있으면 무효화
        secondsTimer?.invalidate()
        
        //게임뷰에 동그라미 뷰가 있으면 5초부터 시작
        if gameView.touchToRoundView.values.count > 0 {
            //5초로 초기화
            secondsLeft = 5
            secondsLabel.text = "5"
            
            secondsTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (t) in
                //1초 빼기
                self.secondsLeft -= 1
                //남은초 보여주기
                self.secondsLabel.text = "\(self.secondsLeft)"
                
                //시간이 다되면
                if self.secondsLeft == 0 {
                    //라벨 텍스트 안 보이게
                    self.secondsLabel.text = ""
                    //초시계 타이머 무효화
                    self.secondsTimer?.invalidate()
                }
            })
        // 없으면 라벨 텍스트 안 보이게
        } else {
            secondsLabel.text = ""
        }
    }
    ```

    - 초시계 째깍째깍은 터치가 변경되면 시작하기

    ```swift
    func touchCountDidChange() {
        ...이전은 생략...
        
        resetSecondsTimer()
    }
    ```

    3. 초가 바뀔 때마다 깜빡깜빡 거리게 하기

    ```swift
    func blinkTimerLabel() {
        self.secondsLabel.alpha = 1
        
        UIView.animate(withDuration: 0.5) {
            self.secondsLabel.alpha = 0
        }
    }
    ```

    ```swift
    func resetSecondsTimer() {
        //초시계 타이머가 아직 살아있으면 무효화
        secondsTimer?.invalidate()
        
        //게임뷰에 동그라미 뷰가 있으면 5초부터 시작
        if gameView.touchToRoundView.values.count > 0 {
            //5초로 초기화
            secondsLeft = 5
            secondsLabel.text = "5"
            //텍스트가 바뀌면 깜빡
            self.blinkTimerLabel()
            
            secondsTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (t) in
                //1초 빼기
                self.secondsLeft -= 1
                //남은초 보여주기
                self.secondsLabel.text = "\(self.secondsLeft)"
                //텍스트가 바뀌면 깜빡
                self.blinkTimerLabel()
                
                //시간이 다되면
                if self.secondsLeft == 0 {
                    //라벨 텍스트 안 보이게
                    self.secondsLabel.text = ""
                    //초시계 타이머 무효화
                    self.secondsTimer?.invalidate()
                }
            })
            // 없으면 라벨 텍스트 안 보이게
        } else {
            secondsLabel.text = ""
        }
    }
    ```

## 07. Firebase 로 사용자 숫자 확인하기

- 14) 프로젝트 설정

    1. firebase 가입하기

    [Firebase](https://firebase.google.com)

    2. 프로젝트 추가하기

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fd2ec06af-bc67-475c-a5eb-0ef46a2c4992%2FUntitled.png?table=block&id=c1eb9d09-b306-470b-aebb-b661bd8f4a50&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=6350&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fd2ec06af-bc67-475c-a5eb-0ef46a2c4992%2FUntitled.png?table=block&id=c1eb9d09-b306-470b-aebb-b661bd8f4a50&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=6350&userId=&cache=v2)

    3. 프로젝트 이름 정하기

    이름은 여러분이 하고 싶은 이름으로 해주세요!

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fc0a57399-47cc-46ad-9d5e-c15ceeffaa5a%2FUntitled.png?table=block&id=0ecc571f-9ddf-4336-a183-3c2f271ef6d4&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=6350&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fc0a57399-47cc-46ad-9d5e-c15ceeffaa5a%2FUntitled.png?table=block&id=0ecc571f-9ddf-4336-a183-3c2f271ef6d4&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=6350&userId=&cache=v2)

    4. 계속 버튼 누르기

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fcbe431a6-ca98-4a1b-a44b-9c674b8be1a3%2FUntitled.png?table=block&id=17825183-e72a-4da4-9e3a-273c2db1ae49&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=6350&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fcbe431a6-ca98-4a1b-a44b-9c674b8be1a3%2FUntitled.png?table=block&id=17825183-e72a-4da4-9e3a-273c2db1ae49&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=6350&userId=&cache=v2)

    5. Default Account For Firebase 선택하고 프로젝트 만들기 버튼 누르기

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fee99415f-093b-47ff-8d81-c6b39b8f481a%2FUntitled.png?table=block&id=7ade2a53-2403-42cf-86b9-c5ad594976c9&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=6350&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fee99415f-093b-47ff-8d81-c6b39b8f481a%2FUntitled.png?table=block&id=7ade2a53-2403-42cf-86b9-c5ad594976c9&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=6350&userId=&cache=v2)

    6. 톱니바퀴 버튼(설정) → 프로젝트 설정

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F69bded50-9a0c-4240-a1ae-c842aebedc5d%2FUntitled.png?table=block&id=46661780-9166-418d-a702-7a52b8b4af69&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=6350&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F69bded50-9a0c-4240-a1ae-c842aebedc5d%2FUntitled.png?table=block&id=46661780-9166-418d-a702-7a52b8b4af69&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=6350&userId=&cache=v2)

    7.  하단에 iOS 선택하기

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F71c53767-ee64-45d7-bbab-7c4b8d269293%2FUntitled.png?table=block&id=3360f8bc-f141-45c3-a0f9-0dd4bf9bb230&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=6350&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F71c53767-ee64-45d7-bbab-7c4b8d269293%2FUntitled.png?table=block&id=3360f8bc-f141-45c3-a0f9-0dd4bf9bb230&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=6350&userId=&cache=v2)

    8. 번들 ID 입력하기

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F7179212c-7dfb-4392-96de-bf96dc5fb95f%2FUntitled.png?table=block&id=e459c1fb-e752-443a-8c50-634cd8923662&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=5240&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F7179212c-7dfb-4392-96de-bf96dc5fb95f%2FUntitled.png?table=block&id=e459c1fb-e752-443a-8c50-634cd8923662&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=5240&userId=&cache=v2)

    9. GoogleService-Info.plist 를 다운로드해서 프로젝트에 드래그 앤 드롭 → Copy items if needed 선택

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F78868e98-8227-4f8b-beac-565cee5d60ba%2FUntitled.png?table=block&id=26d8ea2d-0252-4234-83cf-4289e3664250&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=5630&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F78868e98-8227-4f8b-beac-565cee5d60ba%2FUntitled.png?table=block&id=26d8ea2d-0252-4234-83cf-4289e3664250&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=5630&userId=&cache=v2)

    10. CocoaPods 설치하기

    터미널창을 열어주세요! (Spotlight 에서 Terminal 검색)

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F43e5f7fd-f01e-4cf2-8b56-a3de51029361%2FUntitled.png?table=block&id=ebbbeca2-0b51-4d18-993d-1eae4d9114d0&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=2730&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F43e5f7fd-f01e-4cf2-8b56-a3de51029361%2FUntitled.png?table=block&id=ebbbeca2-0b51-4d18-993d-1eae4d9114d0&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=2730&userId=&cache=v2)

    ```swift
    sudo gem install cocoapods
    ```

    11. 프로젝트 폴더로 이동

    `cd` 작성 후 한 칸 띄고 프로젝트 폴더를 Finder에서 찾아 드래그 앤 드롭

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F627bb184-f332-404b-ab6f-5eba1758bd5a%2FUntitled.png?table=block&id=736e3f47-ac42-4756-98fa-7bc6c5726714&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=2730&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F627bb184-f332-404b-ab6f-5eba1758bd5a%2FUntitled.png?table=block&id=736e3f47-ac42-4756-98fa-7bc6c5726714&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=2730&userId=&cache=v2)

    12. `pod init` 입력하기

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F79336600-b5ea-41a1-9dc2-36dfad3c4056%2FUntitled.png?table=block&id=a99448de-95db-4f1f-b755-d36086d1afa0&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=2730&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F79336600-b5ea-41a1-9dc2-36dfad3c4056%2FUntitled.png?table=block&id=a99448de-95db-4f1f-b755-d36086d1afa0&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=2730&userId=&cache=v2)

    13. `open Podfile` 입력하기

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F340e554b-8d0b-48e3-ae4e-2e4763967814%2FUntitled.png?table=block&id=237436ee-af05-405b-a314-c814cf8f68b3&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=2730&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F340e554b-8d0b-48e3-ae4e-2e4763967814%2FUntitled.png?table=block&id=237436ee-af05-405b-a314-c814cf8f68b3&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=2730&userId=&cache=v2)

    14. 텍스트 파일이 열리면 pod 'Firebase/Analytics' 추가하고 저장하기

    ```bash
    # Uncomment the next line to define a global platform for your project
    # platform :ios, '9.0'

    target 'FingerGame' do
      # Comment the next line if you don't want to use dynamic frameworks
      use_frameworks!

      # Pods for FingerGame
      pod 'Firebase/Analytics'

    end
    ```

    15. `pod install --repo-update` 입력하기

    - m1 칩이면

        ```bash
        arch -x86_64 pod install --repo-update
        ```

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fe37eef9a-e747-4880-86df-80d0f1e8754e%2FUntitled.png?table=block&id=42b6553a-1b32-4f6c-b493-267ddebb9622&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=2730&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fe37eef9a-e747-4880-86df-80d0f1e8754e%2FUntitled.png?table=block&id=42b6553a-1b32-4f6c-b493-267ddebb9622&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=2730&userId=&cache=v2)

    16. 앞으로는 프로젝트를 열 때 FingerGame.xcworkspace 로 열기

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F2acd40f2-e3b3-4852-8ac9-99cfad3e8c1f%2FUntitled.png?table=block&id=da9077fe-1838-4161-ad75-ac1b5f1237e2&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=4130&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F2acd40f2-e3b3-4852-8ac9-99cfad3e8c1f%2FUntitled.png?table=block&id=da9077fe-1838-4161-ad75-ac1b5f1237e2&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=4130&userId=&cache=v2)

    17. AppDelegate.swift 열기

    ```swift
    import UIKit
    import Firebase // 추가

    @main
    class AppDelegate: UIResponder, UIApplicationDelegate {

        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            // Override point for customization after application launch.
            FirebaseApp.configure() // 추가
            return true
        }

        // MARK: UISceneSession Lifecycle

        func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
            // Called when a new scene session is being created.
            // Use this method to select a configuration to create the new scene with.
            return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
        }

        func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
            // Called when the user discards a scene session.
            // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
            // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
        }

    }
    ```

- 15) 로그 넣기

    로그를 넣으면 사용자가 우리 앱을 어떻게 사용하는지 더 자세히 이해할 수 있습니다. 

    우리는 다음과 같은 상황에 대해 로그를 찍어볼 겁니다.

    - 유저가 게임을 시작할 때
    - 유저가 게임을 끝내서 편이 나눠졌을 때

    ```swift
    Analytics.logEvent("Log Name", parameters: ["key": value])
    ```

    ```swift
    func touchCountDidChange() {
        //게임 시작 로그
        Analytics.logEvent("Game Start", parameters: nil)
        
        //아직 타이머가 살아있으면 무효화하기
        timer?.invalidate()
        
        //5초 뒤에 타이머 설정
        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: false, block: { (t) in
            for roundView in self.gameView.touchToRoundView.values {
                // 초록편과 주황편으로 나눠줄 랜덤
                var randomChoice = Bool.random()
                
                UIView.animate(withDuration: 1) {
                    if randomChoice {
                        //초록편
                        roundView.backgroundColor = UIColor(named: "green")
                    } else {
                        //주황편
                        roundView.backgroundColor = UIColor(named: "orange")
                    }
                    
                    //프레임을 변경하면 센터도 움직이니 센터를 미리 저장해둡시다
                    var roundViewCenter = roundView.center
                    
                    //프레임 사이즈를 120, 120으로 키우기
                    roundView.frame.size = CGSize(width: 120, height: 120)
                    
                    //저장해둔 센터로 옮겨줍니다
                    roundView.center = roundViewCenter
                    
                    //프레임 사이즈가 커지면, 반지름도 커지니 60으로 설정
                    roundView.layer.cornerRadius = 60
                }
            }
            
            //게임 종료 로그 with 동그라미 개수
            Analytics.logEvent("Game End", parameters: ["touchCount": self.gameView.touchToRoundView.count])
        })
        
        resetSecondsTimer()
    }
    ```

## 08. 광고 넣기

- 16) 프로젝트 설정

    > [AdMob](https://apps.admob.com/signup?utm_medium=et&utm_source=internal&utm_campaign=2019-admob-gbl-helpcentre-sign-up-for-admob)

    회원가입 및 앱 설정은 위 사이트를 참고해 주세요!

    AdMob은 앱을 제작하고 테스트할 때 운영 중인 광고가 아니라 테스트 광고를 사용하도록 하고 있습니다. 일단 개발은 본 문서를 따라서 하고, 출시하기 직전에 본인의 애드몹 아이디로 변경해주세요!

    1. CocoaPods 업데이트

    ```bash
    # Uncomment the next line to define a global platform for your project
    # platform :ios, '9.0'

    target 'FingerGame' do
      # Comment the next line if you don't want to use dynamic frameworks
      use_frameworks!

      # Pods for FingerGame
      pod 'Firebase/Analytics'
      pod 'Firebase/AdMob'

    end
    ```

    2. `pod install` 입력하기

    - m1 칩이면

        ```bash
        arch -x86_64 pod install
        ```

    3. AppDelegate 수정하기

    ```swift
    import UIKit
    import Firebase
    import GoogleMobileAds // 추가

    @main
    class AppDelegate: UIResponder, UIApplicationDelegate {

        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            // Override point for customization after application launch.
            FirebaseApp.configure() // 추가
            
            GADMobileAds.sharedInstance().start(completionHandler: nil) //추가
            return true
        }
    ...
    ```

    4. Info.plist 에 추가하기

    ```swift
    <key>GADApplicationIdentifier</key>
    <string>ca-app-pub-3940256099942544~1458002511</string>
    <key>SKAdNetworkItems</key>
    <array>
        <dict>
            <key>SKAdNetworkIdentifier</key>
            <string>cstr6suwn9.skadnetwork</string>
        </dict>
    </array>
    <key>NSUserTrackingUsageDescription</key>
    <string>This identifier will be used to deliver personalized ads to you.</string>
    ```

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fbdc16916-edf6-40f1-b19b-e023244ed727%2FUntitled.png?table=block&id=87645020-77e9-4e16-b097-89954a275f72&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=3520&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fbdc16916-edf6-40f1-b19b-e023244ed727%2FUntitled.png?table=block&id=87645020-77e9-4e16-b097-89954a275f72&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=3520&userId=&cache=v2)

    - 애드몹에서 찾는법

        ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F01f90e52-ff0b-4a00-a1da-6499b11e4040%2FUntitled.png?table=block&id=7996b605-035f-4935-89ca-a730e826b2c1&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=5770&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F01f90e52-ff0b-4a00-a1da-6499b11e4040%2FUntitled.png?table=block&id=7996b605-035f-4935-89ca-a730e826b2c1&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=5770&userId=&cache=v2)

- 17) 게임이 끝나면 전면광고 띄우기

    1. 광고 준비하기

    ```swift
    import UIKit
    import Firebase
    import GoogleMobileAds
    import AppTrackingTransparency // 추가
    import AdSupport // 추가

    class FingerGameViewController: UIViewController {
        
        @IBOutlet weak var gameView: FingerGameView!
        @IBOutlet weak var secondsLabel: UILabel!
        
        var interstitial: GADInterstitialAdBeta? // 추가
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            gameView.controller = self
            requestIDFA()
        }
        
        //광고준비하기
        func requestIDFA() {
            ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in
                let request = GADRequest()
                GADInterstitialAdBeta.load(withAdUnitID: "ca-app-pub-3940256099942544/4411468910",
                                           request: request) { (ad, error) in
                    if error != nil {
                        return
                    }
                    
                    self.interstitial = ad
                }
            })
        }
    ```

    2. 게임이 끝나면 전면광고를 띄워주기

    ```swift
    func touchCountDidChange() {
        //게임 시작 로그
        Analytics.logEvent("Game Start", parameters: nil)
        
        //아직 타이머가 살아있으면 무효화하기
        timer?.invalidate()
        
        //5초 뒤에 타이머 설정
        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: false, block: { (t) in
            for roundView in self.gameView.touchToRoundView.values {
                // 초록편과 주황편으로 나눠줄 랜덤
                var randomChoice = Bool.random()
                
                UIView.animate(withDuration: 1) {
                    if randomChoice {
                        //초록편
                        roundView.backgroundColor = UIColor(named: "green")
                    } else {
                        //주황편
                        roundView.backgroundColor = UIColor(named: "orange")
                    }
                    
                    //프레임을 변경하면 센터도 움직이니 센터를 미리 저장해둡시다
                    var roundViewCenter = roundView.center
                    
                    //프레임 사이즈를 120, 120으로 키우기
                    roundView.frame.size = CGSize(width: 120, height: 120)
                    
                    //저장해둔 센터로 옮겨줍니다
                    roundView.center = roundViewCenter
                    
                    //프레임 사이즈가 커지면, 반지름도 커지니 60으로 설정
                    roundView.layer.cornerRadius = 60
                }
            }
            
            //게임 종료 로그 with 동그라미 개수
            Analytics.logEvent("Game End", parameters: ["touchCount": self.gameView.touchToRoundView.count])
            
    				//광고 짜자잔!
            self.interstitial?.present(fromRootViewController: self)
        })
        
        resetSecondsTimer()
    }
    ```

    실행해보면 절묘한 순간에 광고가 뜨는 걸 알 수 있습니다. 그리고 광고가 지속적으로 뜨면 유저에게 심한 불쾌감을 줄 수 있어요. 그러니 조심해서 넣도록 합시다! 예를 들면 5번에 한 번씩이라든지...?

## 09. 앱스토어에 출시하기

출시를 하려면...

앱스토어에 출시하는 일은... 무척이나 어렵고 고된 일입니다. 먼저 애플 개발자 등록을 해야 해요. 그리고 등록을 위해선 1년에 99달러를 결제해야 합니다. 일단은 이런 흐름으로 진행된다는 것을 먼저 확인하고, 개발자 등록을 진행하게 되면 다시 이 부분으로 와서 진행하시면 되겠습니다!

**앱에 아이콘 및 앱 이름을 넣는 건 개발자 등록과는 상관없습니다!**

- 18) Apple 의 App Store 심사 지침

    > [App Store 심사 지침](https://developer.apple.com/kr/app-store/review/guidelines/)

    애플은 스토어에 올라오는 앱을 꼼꼼하게 심사하는 걸로 유명합니다. 애플의 심사 조건을 통과하지 못하는 앱은 가차 없이 거절당하니, 미리미리 위의 심사 지침에 어긋남이 없는지 확인해봅시다. 경험 있는 iOS 개발자라면 심사 지침을 거의 꿰고 있습니다. 

- 19) 출시준비

    1. App Icon 넣기

    1536 X 1536 사이즈의 앱 아이콘을 준비합니다. 수업에서는 아래 사진을 이용할게요!

    [jon-tyson-rn21q4rmSE4-unsplash.jpg](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/7e2aa421-0ffb-4cb9-831b-c97f04aa3dd6/jon-tyson-rn21q4rmSE4-unsplash.jpg)

    [Developer Tool - App Icon Resizer](https://makeappicon.com)

    다운로드 받은 이미지를 위 사이트에 입력하고 이메일도 입력해줍니다. 금방 작성한 이메일로 해당 파일이 전해져 옵니다. (잘 안 쓰는 이메일을 쓰곤 합니다 😂)

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F7cbf4c12-927e-40a7-8ad4-f58c9a26dc61%2FUntitled.png?table=block&id=d376aab9-a644-4246-8f87-123c7720342e&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=2600&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F7cbf4c12-927e-40a7-8ad4-f58c9a26dc61%2FUntitled.png?table=block&id=d376aab9-a644-4246-8f87-123c7720342e&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=2600&userId=&cache=v2)

    다운받은 압축파일을 열어서 ios → AppIcon.appiconset 을 프로젝트에 넣어줍니다

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F35f04ae5-ff1d-4077-bb2d-017f3c721dbd%2FUntitled.png?table=block&id=92b4f069-f4f6-4748-9de7-7f78f6014604&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=6050&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F35f04ae5-ff1d-4077-bb2d-017f3c721dbd%2FUntitled.png?table=block&id=92b4f069-f4f6-4748-9de7-7f78f6014604&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=6050&userId=&cache=v2)

    2. Display Name 설정하기

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F8b569ca1-44f6-4693-99b2-34210739837e%2FUntitled.png?table=block&id=0fec98e2-2dbe-4689-9647-dfd991d7b6df&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=6050&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F8b569ca1-44f6-4693-99b2-34210739837e%2FUntitled.png?table=block&id=0fec98e2-2dbe-4689-9647-dfd991d7b6df&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=6050&userId=&cache=v2)

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fe5be65e7-d02f-4218-9221-0ec48ff87216%2FUntitled.png?table=block&id=3ffe6a0e-c7e8-4fd3-a7f5-5e2889628e74&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=1000&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fe5be65e7-d02f-4218-9221-0ec48ff87216%2FUntitled.png?table=block&id=3ffe6a0e-c7e8-4fd3-a7f5-5e2889628e74&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=1000&userId=&cache=v2)

    사진을 이용해 앱 아이콘을 설정했을 뿐인데, 조금 더 감성 넘치는 앱이 되었군요!

- 20) 아카이브

    1. Archive

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F8aa6c296-9ee2-4581-92b1-9e4e9afccb56%2FUntitled.png?table=block&id=dce0f54c-df5f-4a42-a54d-4e55260a3882&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=5550&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F8aa6c296-9ee2-4581-92b1-9e4e9afccb56%2FUntitled.png?table=block&id=dce0f54c-df5f-4a42-a54d-4e55260a3882&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=5550&userId=&cache=v2)

    2. 아카이브가 완료되면 Organizer 라는 창이 뜨고, 여기서 Distribute App 을 선택한 후 제출하면 됩니다. 

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F026b321b-6a80-4d01-a354-757b1d529bc5%2FUntitled.png?table=block&id=36f3e3b2-b0cc-4f30-bc8b-d56a114869a5&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=4540&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F026b321b-6a80-4d01-a354-757b1d529bc5%2FUntitled.png?table=block&id=36f3e3b2-b0cc-4f30-bc8b-d56a114869a5&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=4540&userId=&cache=v2)

    3. [https://appstoreconnect.apple.com/](https://appstoreconnect.apple.com/) 에 접속하고  `+` 버튼을 눌러 신규 앱을 작성합니다.

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F989697e9-8a80-434e-b588-56d34fc48ad9%2FUntitled.png?table=block&id=179ed502-39e7-43de-952d-4430e23aaa64&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=5550&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F989697e9-8a80-434e-b588-56d34fc48ad9%2FUntitled.png?table=block&id=179ed502-39e7-43de-952d-4430e23aaa64&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=5550&userId=&cache=v2)

    번들ID는 프로젝트의 번들ID와 같아야 합니다.
    그리고 SKU는 편의상 번들ID를 그대로 입력해줄게요!

    4. 앱스토어에서 보일 앱의 설명과 스크린샷을 최대한 자세히 추가해 줍니다.

    스크린샷은 6.5형 디스플레이(노치)와 5.5형 디스플레이(네모) 각각 1개 이상의 스크린샷이 들어가야 합니다.  

    자세한 규격을 보려면 [(링크)](https://help.apple.com/app-store-connect/#/devd274dd925)에서 확인해주세요!

    5. 빌드 선택 및 추가하기

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F85b05393-0ca6-4f74-b2f1-e3fcab83dbf0%2FUntitled.png?table=block&id=b7d0c6ea-9b59-4061-a714-a8a26a8aba05&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=5770&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F85b05393-0ca6-4f74-b2f1-e3fcab83dbf0%2FUntitled.png?table=block&id=b7d0c6ea-9b59-4061-a714-a8a26a8aba05&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=5770&userId=&cache=v2)

    6. 앱스토어에 모든 정보를 빠진 것 없이 입력하고 `저장` - `제출` 버튼을 눌러줍니다. 

    7. 심사를 두근두근 기다리면...! 출시!🥳

## 10. 5**주차 끝 & 숙제 설명**

5주 동안의 커리큘럼을 열심히 따라와 주신 여러분! 그럼 이제 마지막 숙제까지 완성해서 유종의 미를 거둬볼까요?

- 숙제 1

    위에서 배웠던 손가락 묶기 게임을 응용해 술래를 정해주는 앱을 만들어봅시다!

    - 설명
        - **술래 뽑기 앱 만들기**

            손가락 묶기 게임을 수정해서 술래 뽑기 앱으로 만들어봅시다!

            예를 들어 4명이 손가락을 올리면, 그중에 한 명의 술래를 골라서 술래만 색깔이 바뀌도록 해볼까요?

            예시에 제시된 규칙이 아니더라도, 다른 규칙을 응용해 앱을 만들어도 당연히 괜찮습니다! 자유롭게 응용해주세요!

- 숙제 2

    손 씻고 건강하기! 😷👋 5주간 함께 열심히 달려와 주셔서 감사합니다!🥳

    ![https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F6aef50a4-36d5-40b3-b633-a07ab3b0fbe4%2FUntitled.png?table=block&id=e65a0ec9-242f-438e-8680-0dc2e21b1ff8&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=6300&userId=&cache=v2](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F6aef50a4-36d5-40b3-b633-a07ab3b0fbe4%2FUntitled.png?table=block&id=e65a0ec9-242f-438e-8680-0dc2e21b1ff8&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=6300&userId=&cache=v2)

## HW. 5주차 답안 코드

- **[코드스니펫] 5주차 답안 코드**

    ```swift
    import UIKit
    import Firebase
    import GoogleMobileAds
    import AppTrackingTransparency // 추가
    import AdSupport // 추가

    class FingerGameViewController: UIViewController {

        @IBOutlet weak var gameView: FingerGameView!
        @IBOutlet weak var secondsLabel: UILabel!
        
        var secondsLeft = 5
        var interstitial: GADInterstitialAdBeta? // 추가
        var didOpenAd = true
        
        override func viewDidLoad() {
            super.viewDidLoad()

            gameView.controller = self
            requestIDFA()
        }
        
        //광고준비하기
        func requestIDFA() {
            ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in
                let request = GADRequest()
                //테스트 Unit ID
                GADInterstitialAdBeta.load(withAdUnitID: "ca-app-pub-3940256099942544/4411468910",
                                           request: request) { (ad, error) in
                    if error != nil {
                        return
                    }
                    
                    self.interstitial = ad
                }
            })
        }
        
        
        @IBAction func closeButtonClicked(_ sender: Any) {
            self.dismiss(animated: true, completion: nil)
        }
        
        var timer: Timer?
        func touchCountDidChange() {
            timer?.invalidate()
            
            Analytics.logEvent("GameStart", parameters: nil)
            
            timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { (t) in
                let roundViews = [UIView](self.gameView.touchToRoundView.values)
                
                // 터치 개수가 0이면 딱히 반응 안하기
                if roundViews.count == 0 {
                    return
                }
                
                
                //0부터 터치 개수 사이에 랜덤 값 고르기
                let randomChoice = Int.random(in: 0..<roundViews.count)
                
                for i in 0..<roundViews.count {
                    let roundView = roundViews[i]
                    
                    UIView.animate(withDuration: 1) {
                        //랜덤 값이면 반응하기
                        if i == randomChoice {
                            roundView.backgroundColor = UIColor(named: "green")
                            let center = roundView.center
                            roundView.frame.size = CGSize(width: 120, height: 120)
                            roundView.layer.cornerRadius = 60
                            roundView.center = center
                        }
                    }
                }
                
                Analytics.logEvent("GameEnd", parameters: ["touchCount": self.gameView.touchToRoundView.count])
                
                if self.didOpenAd == false {
                    self.interstitial?.present(fromRootViewController: self)
                    self.didOpenAd = true
                }
            }
            
            resetSecondsTimer()
        }
        
        var secondsTimer: Timer?
        func resetSecondsTimer() {
            secondsTimer?.invalidate()
            
            if gameView.touchToRoundView.count > 0 {
                
                self.secondsLeft = 5
                self.secondsLabel.text = "5"
                self.blinkSecondsLabel()
                
                secondsTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (t) in
                    self.secondsLeft -= 1
                    self.secondsLabel.text = "\(self.secondsLeft)"
                    self.blinkSecondsLabel()
                    
                    if self.secondsLeft == 0 {
                        self.secondsLabel.text = ""
                        self.blinkSecondsLabel()
                        self.secondsTimer?.invalidate()
                    }
                })
            } else {
                self.secondsLabel.text = ""
                self.blinkSecondsLabel()
            }
            
            
        }
        
        func blinkSecondsLabel() {
            self.secondsLabel.alpha = 1
            
            UIView.animate(withDuration: 0.5) {
                self.secondsLabel.alpha = 0
            }
        }
    }
    ```