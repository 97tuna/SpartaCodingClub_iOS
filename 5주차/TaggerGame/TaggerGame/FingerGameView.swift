//
//  FingerGameView.swift
//  FingerGame
//
//  Created by LDH on 2021/07/09.
//

import UIKit

class FingerGameView: UIView {
    
    // MARK: weak -> 약하게 연결해놓았다.
    weak var controller: FingerGameViewController?
    
    // Dictinaty 하나 만들기
    var touchToRoundView: [UITouch: UIView] = [:]

    // MARK: 터치가 여러개 들어옴.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let view = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
            // 센터로 잡아주면 x, y가 알아서 잡힘
            view.center = touch.location(in: self)
            view.backgroundColor = UIColor(named: "red")
            view.layer.cornerRadius = 40 // 80의 절반인 40으로 하면 동그라미로 만들 수 있음.
            
            self.touchToRoundView[touch] = view
            self.addSubview(view)
            
            self.controller?.touchCountDidChange()
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            var view = self.touchToRoundView[touch]
            view?.center = touch.location(in: self)
        }
    }
    
    // MARK: 터치가 정상적으로 끝난 경우
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            var view = self.touchToRoundView[touch]
            view?.removeFromSuperview()
            self.touchToRoundView.removeValue(forKey: touch)
            
            self.controller?.touchCountDidChange()
        }
    }
    
    // MARK: 터치가 비정상적으로 끝난 경우
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            var view = self.touchToRoundView[touch]
            view?.removeFromSuperview()
            self.touchToRoundView.removeValue(forKey: touch)
            
            self.controller?.touchCountDidChange()
        }
    }
}
