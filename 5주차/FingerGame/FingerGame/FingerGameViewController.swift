//
//  FingerGameViewController.swift
//  FingerGame
//
//  Created by LDH on 2021/07/09.
//

import UIKit
import FirebaseAnalytics

class FingerGameViewController: UIViewController {

    @IBOutlet weak var gameView: FingerGameView!
    @IBOutlet weak var secondLabel: UILabel!
    
    // 초를 담아주는 변수
    var secondLeft = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()

        gameView.controller = self
        self.secondLabel.text = ""
    }
    

    @IBAction func closeButtonClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    var timer: Timer?
    func touchCountDidChange() {
        timer?.invalidate()
        
        Analytics.logEvent("GameStart", parameters: nil)
        
        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { (t) in
            // 빨간색 동그라미를 리스트로 만들어서 하나씩 할거다
            for roundView in self.gameView.touchToRoundView.values {
                var randomChoice = Bool.random()
                UIView.animate(withDuration: 1) {
                    if randomChoice {
                        roundView.backgroundColor = UIColor(named: "green")
                    } else {
                        roundView.backgroundColor = UIColor(named: "orange")
                    }
                
                    //프레임을 변경하면 센터도 움직이니 센터를 미리 저장, 안하면 아래로 커져서 중앙이 안맞음
                    let roundViewCenter = roundView.center
                    
                    //프레임 사이즈를 120, 120으로 키우기
                    roundView.frame.size = CGSize(width: 120, height: 120)
                    roundView.center = roundViewCenter
                    roundView.layer.cornerRadius = 60
                }
            }
            //게임 종료 로그 with 동그라미 개수
            Analytics.logEvent("GameEnd", parameters: ["touchCount": self.gameView.touchToRoundView.count])
        }
        resetSecondsTimer()
    }
    
    var secondsTimer: Timer?
    func resetSecondsTimer() {
        secondsTimer?.invalidate()
        
        if gameView.touchToRoundView.count > 0 {
            
            self.secondLeft = 5
            self.secondLabel.text = "5"
            
            secondsTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (t) in
                self.secondLeft -= 1
                self.secondLabel.text = "\(self.secondLeft)"
                self.blinkTimerLabel()
                
                if self.secondLeft == 0 {
                    self.secondLabel.text = ""
                    self.blinkTimerLabel()
                    self.secondsTimer?.invalidate()
                }
            })
        } else {
            self.secondLabel.text = ""
            self.blinkTimerLabel()
        }
    }
    
    func blinkTimerLabel() {
        self.secondLabel.alpha = 1
        
        UIView.animate(withDuration: 0.5) {
            self.secondLabel.alpha = 0
        }
    }
}
