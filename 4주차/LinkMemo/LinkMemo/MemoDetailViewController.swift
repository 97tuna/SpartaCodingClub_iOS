//
//  MemoDetailViewController.swift
//  LinkMemo
//
//  Created by LDH on 2021/07/08.
//

import UIKit
import SwiftyJSON

class MemoDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var commentTextView: UITextView!
    
    var memo: JSON!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //이미지 뷰에 이미지 넣기
        imageView.sd_setImage(with: URL(string: memo["image"].stringValue), completed: nil)
        
        //텍스트 데이터들 넣기
        contentTextView.text = memo["desc"].stringValue
        commentTextView.text = memo["comment"].stringValue
        
        //상단 네비게이션에 가운데 타이틀 값 넣기
        self.title = memo["title"].stringValue
    }
    
    @IBAction func linkButtonClicked(_ sender: Any) {
        //버튼 누르면 해당 url 로 보내주기
        UIApplication.shared.open(URL(string: memo["url"].stringValue)!, options: [:], completionHandler: nil)
    }
}
