//
//  MemoWriteViewController.swift
//  LinkMemo
//
//  Created by LDH on 2021/07/08.
//

import UIKit
import SwiftyJSON
import Alamofire

class MemoWriteViewController: UIViewController {

    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var commentTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

            // 코너 라운드를 먹여줍시다
        urlTextField.layer.cornerRadius = 10
            // 테두리 두께는 1
        urlTextField.layer.borderWidth = 1
            // 테두리 컬러는 회색으로
        urlTextField.layer.borderColor = UIColor.gray.cgColor

            // 텍스트 필드에 텍스트의 왼쪽 여백은 이렇게 넣습니다
        urlTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        urlTextField.leftViewMode = .always
        
        commentTextField.layer.cornerRadius = 10
        commentTextField.layer.borderWidth = 1
        commentTextField.layer.borderColor = UIColor.gray.cgColor
        commentTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        commentTextField.leftViewMode = .always
    }
    

    @IBAction func doneButtonClicked(_ sender: Any) {
        var url = urlTextField.text ?? ""
        var comment = commentTextField.text ?? ""
        
        if url.count == 0 || comment.count == 0 {
            var alert = UIAlertController(title: "링크 메모장", message: "모두 입력해 주세요", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
            
            //경고창 띄워주기
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        var parameter = [
            "url_give": url,
            "comment_give": comment
        ]
        
        AF.request("http://spartacodingclub.shop/post", method: .post, parameters: parameter).responseJSON {
            if var value = $0.value {
                var json = JSON(value)
                print(json)
                
                self.navigationController?.popViewController(animated: true)
            }
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
