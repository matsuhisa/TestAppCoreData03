//  MainViewController.swift
//  TestAppCoreData03

import UIKit

class MainViewController: UITableViewController, InputViewDelegate {
    
    var myToolbar: UIToolbar!

    override func viewDidLoad() {
        super.viewDidLoad()

        // ツールバーのサイズを決める.
        myToolbar = UIToolbar(frame: CGRectMake(0, self.view.bounds.size.height - 44, self.view.bounds.size.width, 44.0))
        
        // ツールバーの位置を決める.
        myToolbar.layer.position = CGPoint(x: self.view.bounds.width/2, y: self.view.bounds.height-20.0)
        
        // ボタン１を生成する.
        let myUIBarButtonGreen: UIBarButtonItem = UIBarButtonItem(title: "追加", style:.Bordered, target: self, action: "onClickOpenInputView:")
        myUIBarButtonGreen.tag = 1
        
        // ボタン２を生成する.
        let myUIBarButtonBlue: UIBarButtonItem = UIBarButtonItem(title: "並び替え", style:.Bordered, target: self, action: "onClickSortButton:")
        myUIBarButtonBlue.tag = 2

        
        // ボタンをツールバーに入れる.
        myToolbar.items = [myUIBarButtonGreen, myUIBarButtonBlue]
        
        // ツールバーの色を決める.
        //myToolbar.barStyle = .BlackTranslucent
        //myToolbar.tintColor = UIColor.whiteColor()
        //myToolbar.backgroundColor = UIColor.blackColor()
        
        self.view.addSubview(myToolbar)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - InputViewからの処理
    /**
    InputViewから値を受けとり処理する
    */
    func saveMemo(titleTextData:String, bodyTextData:String) {
        println("------------")
        println(titleTextData)
        println(bodyTextData)
        println("------------")
    }
    
    // MARK: - モーダルウィンドウの呼び出し
    /**
    UIToolsで入力画面のモーダルウィンドウを呼び出します
    */
    func onClickOpenInputView(sender: UIBarButtonItem) {
        // UIViewを特定
        var inputView:InputViewController = self.storyboard!.instantiateViewControllerWithIdentifier("InputView") as InputViewController

        // 透過などが有効になるように設定
        inputView.modalPresentationStyle = UIModalPresentationStyle.OverFullScreen
        
        // モーダルウィンドウを呼び出します
        self.presentViewController(inputView as UIViewController, animated: true, completion:nil)
    }
    
    // MARK: - データの並び替え
    /**
    */
    func onClickSortButton(sender: UIBarButtonItem) {
        var alert = UIAlertController(title: "並び替え", message: "", preferredStyle: .ActionSheet)
        
        alert.addAction(UIAlertAction(title: "修正順", style: .Default) {
            action in NSLog("修正順")
        })
        
        alert.addAction( UIAlertAction(title: "作成順", style: .Default) {
            action in NSLog("作成順")
        })
        
        alert.addAction( UIAlertAction(title: "キャンセル", style: .Cancel) {
            action in NSLog("キャンセル")
        })
        
        presentViewController(alert, animated: true, completion: nil)
    }
}
