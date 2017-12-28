//
//  QGViewController.swift
//  qiqiaoguoEdu
//
//  Created by xieminqiang on 2017/11/21.
//  Copyright © 2017年 xieminqiang. All rights reserved.
//

import UIKit
import RxSwift
class QGViewController: UIViewController {
    lazy var navBar = WRCustomNavigationBar.CustomNavigationBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = QGAPPBackgroundColor
        navigationController?.navigationBar.isHidden = true
        automaticallyAdjustsScrollViewInsets = false
        setupNavBar()
        
    }
    fileprivate func setupNavBar()
    {
        
        view.addSubview(navBar)
        
        // 设置自定义导航栏背景颜色
       // navBar.backgroundColor = UIColor.red
        
        // 设置自定义导航栏标题颜色
        navBar.titleLabelColor = QGColor_333333
          navBar.wr_setBackgroundAlpha(alpha: 0)
        // 设置自定义导航栏左右按钮字体颜色
         navBar.wr_setTintColor(color:  QGColor_333333!)
        
        if self.navigationController?.childViewControllers.count != 1 {
            navBar.wr_setLeftButton(image: UIImage.init(named: "icon_classification_back")!)
           
        }
    }
    @objc fileprivate func back()
    {
        _ = navigationController?.popViewController(animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
