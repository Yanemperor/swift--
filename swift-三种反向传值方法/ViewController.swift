//
//  ViewController.swift
//  swift-三种反向传值方法
//
//  Created by zzl on 2017/2/7.
//  Copyright © 2017年 Zhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MyDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = ""
        initUI()
        // Do any additional setup after loading the view.
    }
    
    func initUI() -> Void {
        view.addSubview(self.tableView)
        view.addSubview(self.text)
        //接受通知
        let NotifMycation = NSNotification.Name(rawValue:"MyNSNotification")
        NotificationCenter.default.addObserver(self, selector: #selector(upDataChange(notif:)), name: NotifMycation, object: nil)
    }
    
    deinit {
        //移除通知
        NotificationCenter.default.removeObserver(self)
    }
    
    
    func upDataChange(notif: NSNotification) {
        guard let text: String = notif.object as! String? else { return }
        self.text.text = text
    }
    // MARK: - View(页面处理)
    
    
    // MARK: - XXXDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = titleArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let vc = NotificationViewController()
            self.present(vc, animated: true, completion: nil)
        }else if indexPath.row == 1 {
            let vc = DelegateViewController()
            vc.delegate = self
            self.present(vc, animated: true, completion: nil)
        }else if indexPath.row == 2 {
            let vc = BlockViewController()
            vc.getBlock{ (value) in
                self.text.text = value
            }
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    func didDelegateText(text: String) {
        self.text.text = text
    }
    
    // MARK: - 对外接口
    
    
    // MARK: - private methods(内部接口)
    
    
    // MARK: - loading
    
    
    // MARK: - 懒加载
    fileprivate lazy var tableView: UITableView = {
        let temp: UITableView = UITableView.init(frame: self.view.bounds, style: .plain)
        temp.delegate = self
        temp.dataSource = self
        temp.tableFooterView = UIView.init(frame: CGRect.zero)
        temp.rowHeight = 40
        temp.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        return temp
    }()
    
    var titleArray: Array = ["通知","代理","闭包"]
    
    fileprivate lazy var text: UILabel = {
        let temp: UILabel = UILabel.init(frame: .init(x: 20, y: 500, width: self.view.bounds.width - 40, height: 30))
        temp.backgroundColor = UIColor.lightGray
        temp.text = "第一次"
        temp.textColor = UIColor.blue
        temp.font = UIFont.systemFont(ofSize: 20)
        return temp
    }()



}

