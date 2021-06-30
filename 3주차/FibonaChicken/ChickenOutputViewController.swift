//
//  ChickenOutputViewController.swift
//  FibonaChicken
//
//  Created by LDH on 2021/06/30.
//

import UIKit

class ChickenOutputViewController: UIViewController {
    @IBOutlet weak var peopleLabel: UILabel!
    @IBOutlet weak var chickenLabel: UILabel!
    
    var numberOfPeople: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.peopleLabel.text = "\(numberOfPeople)명이서\n먹는다면..."
        self.chickenLabel.text = "\(calculateChicken())마리를 시키거라"
    }
    
    func calculateChicken() -> Int {
        return chicken(x: numberOfPeople)
    }

    func chicken(x: Int) -> Int {
        if x == 0 {
            return 0
        }
        
        if x == 1 {
            return 1
        }
        
        var a = 1
        var b = 1
        
        while true {
            var c = a + b
            if c > x {
                return a + chicken(x: x - b)
            } else if c == x {
                return b
            }
            
            a = b
            b = c
        }
    }
}
