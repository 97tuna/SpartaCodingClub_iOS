//
//  ViewController.swift
//  flashLightApp
//
//  Created by LDH on 2021/06/13.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .black
        titleLabel.textColor = .white
    }

    @IBAction func onButton(_ sender: Any) {
        view.backgroundColor = .systemTeal
        titleLabel.textColor = .black
        imageView.image = UIImage(systemName: "flashlight.on.fill")
    }
    
    @IBAction func offButton(_ sender: Any) {
        view.backgroundColor = .black
        titleLabel.textColor = .white
        imageView.image = UIImage(systemName: "flashlight.off.fill")
    }
}

