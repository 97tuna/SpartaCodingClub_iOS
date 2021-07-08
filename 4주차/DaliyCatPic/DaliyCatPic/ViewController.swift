//
//  ViewController.swift
//  DaliyCatPic
//
//  Created by LDH on 2021/07/08.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setImage()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func refreshButtonClicked(_ sender: Any) {
        setImage()
    }
    
    func setImage() {
        AF.request("https://api.thecatapi.com/v1/images/search").responseJSON {
            if let json = $0.value {
                let data = JSON(json)
                let image = data.arrayValue[0]["url"]
                print("\(image)")
                self.imageView.kf.setImage(with: URL(string: image.stringValue))
            }
        }
    }
}

