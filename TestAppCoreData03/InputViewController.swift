//  InputViewController.swift
//  TestAppCoreData03

import UIKit

@objc protocol InputViewDelegate {
    func saveMemo(titleTextData:String, bodyTextData:String)
}

class InputViewController: UIViewController {
    
    @IBOutlet weak var ButtonSave: UIButton!
    @IBOutlet weak var TextViewBody: UITextView!
    @IBOutlet weak var InputTitle: UITextField!
    
    var delegate:InputViewDelegate! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // delegate 処理
        var rootView  = UIApplication.sharedApplication().keyWindow.rootViewController as MainViewController
        self.delegate = rootView
        
        // 保存ボタン
        ButtonSave.addTarget(self, action: "backToMain:", forControlEvents: .TouchUpInside)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - ボタンの動き

    /**
    このViewを閉じる
    */
    func backToMain(sender: AnyObject?) {
        
        self.delegate.saveMemo(InputTitle.text, bodyTextData: TextViewBody.text)
        self.dismissViewControllerAnimated(true, completion: nil);
    }
}
