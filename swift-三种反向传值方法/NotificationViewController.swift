//
//  NotificationViewController.swift
//  swift-三种反向传值方法
//
//  Created by zzl on 2017/2/7.
//  Copyright © 2017年 Zhou. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = ""
        initUI()
        // Do any additional setup after loading the view.
    }
    
    func initUI() -> Void {
        view.backgroundColor = UIColor.white
        view.addSubview(self.textField)
        view.addSubview(self.button)
    }
    

    
    // MARK: - View(页面处理)
    
    
    // MARK: - XXXDelegate
    
    
    // MARK: - 对外接口
    
    
    // MARK: - private methods(内部接口)
    let NotifMycation = NSNotification.Name(rawValue:"MyNSNotification")
    func tempbuttonAction() {
        //这个方法可以传一个值
        NotificationCenter.default.post(name: NotifMycation, object: self.textField.text)
        //这个方法可传一个字典
//        NotificationCenter.default.post(name: NotifMycation, object: nil, userInfo: ["" : ""])
       self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - loading
    
    
    // MARK: - 懒加载
    fileprivate lazy var textField: UITextField = {
        let temp: UITextField = UITextField.init(frame: .init(x: 20, y: 100, width: self.view.bounds.width - 40, height: 30))
        temp.backgroundColor = UIColor.lightGray
        temp.borderStyle = .roundedRect
        return temp
    }()
    
    fileprivate lazy var button: UIButton = {
        let temp = UIButton.init(frame: CGRect.init(x: 0, y: 464, width: 100, height: 100))
        temp.backgroundColor = UIColor.orange
        temp.addTarget(self, action: #selector(tempbuttonAction), for: .touchUpInside)
        return temp
    }()

    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
