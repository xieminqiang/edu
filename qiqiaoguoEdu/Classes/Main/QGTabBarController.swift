//
//  QGTabBarController.swift
//  qiqiaoguoEdu
//
//  Created by xieminqiang on 2017/11/21.
//  Copyright © 2017年 xieminqiang. All rights reserved.
//

import UIKit

class QGTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        //首页
        let homeVC = QGHomeViewController()
        self.addChildViewController(childerVC: homeVC, title: "首页", normalImg: "home_page", selectedImg: "home_page_choose")
        //消息
        let MessageVC = QGMessageViewController()
        self.addChildViewController(childerVC: MessageVC, title: "消息", normalImg: "message_default", selectedImg: "message_choose")
        
        //我
        let myShowVC = QGMeViewController()
        self.addChildViewController(childerVC: myShowVC, title: "我", normalImg: "me_icon", selectedImg: "me_icon_choose")
   
        
        self.selectedIndex = 0
        
        
        
       
    }

    //添加子控制器
    func addChildViewController(childerVC:UIViewController,title:NSString,normalImg:NSString,selectedImg:NSString)  {
        
        self.tabBarItem.title = title as String
        let color = UIColor.red
        self.tabBar.tintColor = color
        self.tabBar.backgroundColor = UIColor.white
        childerVC.title = title as String
        
        var norImg = UIImage(named:normalImg as String)
        norImg = norImg?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        var selImg = UIImage(named:selectedImg as String)
        selImg = selImg?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        let tabItem = UITabBarItem(title: title as String, image: norImg,selectedImage: selImg)
        
        let naVc = QGNavigationController()
        
        naVc.tabBarItem = tabItem
        
        naVc.addChildViewController(childerVC)
        
        self.addChildViewController(naVc)
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
