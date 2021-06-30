//
//  outputHealthInsurancePrice.swift
//  HealthInsurancePrice
//
//  Created by LDH on 2021/07/01.
//

import UIKit

class outputHealthInsurancePrice: UIViewController {
    
    var earnPrice: Int = 0
    let numberFormatter = NumberFormatter()
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var calPriceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        numberFormatter.numberStyle = .decimal
        let Price = numberFormatter.string(from: NSNumber(value: earnPrice))
        self.textLabel.text = "\(Price!)원을\n벌고 있다면..."
        self.calPriceLabel.text = "보험료로 \(calculation())원을\n내고있을 것이야..."
    }

    func calculation() -> String {
        var calPrice = Double(earnPrice) * 0.0343
        numberFormatter.numberStyle = .decimal
        let Price = numberFormatter.string(from: NSNumber(value: round(calPrice)))
        return Price!
        
    }
    
}

