//
//  inputHealthInsurancePrice.swift
//  HealthInsurancePrice
//
//  Created by LDH on 2021/07/01.
//

import UIKit

class inputHealthInsurancePrice: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var calButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calButton.layer.cornerRadius = 10
    }
    
    @IBAction func textFieldChange(_ sender: Any) {
        var text = textField.text ?? "0"
        stepper.value = Double(text) ?? 10000
    }
    
    @IBAction func stepperValueChange(_ sender: Any) {
        textField.text = String(Int(stepper.value))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if var output = segue.destination as? outputHealthInsurancePrice {
            output.earnPrice = Int(stepper.value)
        }
    }
}

