//
//  ViewController.swift
//  FibonaChicken
//
//  Created by LDH on 2021/06/29.
//

import UIKit

class ChickenInputViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var resetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetButton.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }
    
    @IBAction func textFieldChange(_ sender: Any) {
        var text = textField.text ?? "1"
        stepper.value = Double(text) ?? 1
    }
    
    @IBAction func stepperValueChange(_ sender: Any) {
        textField.text = String(Int(stepper.value))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if var output = segue.destination as? ChickenOutputViewController {
            output.numberOfPeople = Int(stepper.value)
        }
    }
}

