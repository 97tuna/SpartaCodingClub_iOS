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
            
            let roundView = [UIView](self.gameView.touchToRoundView.values)
            
            // 터치가 0개이면 반응하지 않는다
            if roundView.count == 0 {
                return
            }
            
            let randomChoice = Int.random(in: 0..<roundView.count) // 랜덤 숫자 고르기
            
            for i in 0..<roundView.count {
                let roundView = roundView[i]
                
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
